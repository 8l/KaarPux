/*
------------------------------------------------------------
Test driver for at-spi2 enabled applications
------------------------------------------------------------

KaarPux: http://kaarpux.kaarposoft.dk

Copyright (C) 2013-2014: Henrik Kaare Poulsen

License: http://kaarpux.kaarposoft.dk/license.html

------------------------------------------------------------

kx_gui_test reads simple commands from stdin to interact with GUI applications
using at-spi2.

at-spi is the Assistive Technology Service Provider Interface:
http://en.wikipedia.org/wiki/Assistive_Technology_Service_Provider_Interface

at-spi2 is the at-spi interface over dbus:
http://www.linuxfoundation.org/collaborate/workgroups/accessibility/atk/at-spi/at-spi_on_d-bus

kx_gui_test uses libatspi from GNOME:
https://developer.gnome.org/libatspi/stable/index.html

A similar, but more complete, and much more complex application:
Linux Desktop Testing Project http://ldtp.freedesktop.org/

------------------------------------------------------------

kx_gui_test uses simple blocking libatspi calls.
To wait for things to happen, it uses simple g_usleep.
libatspi has interfaces for registering event listeners,
but we do not use those, in order to keep things simple.

------------------------------------------------------------

Compilation:
cc -g -Wall $(pkg-config --cflags --libs glib-2.0 gobject-2.0 atspi-2) kx_gui_test.c -o kx_gui_test

------------------------------------------------------------

Commands are read from stdin.
In general, each command will emit one of the following on stdout:
OK xxx: The command succeded
FAIL xxx: The command failed due to a problem with the application
ERROR xxx: The command failed due to a system problem
WARN xxx: The command failed due to a system problem which could probably be ignored
Upon end-of-file on stdin, kx_gui_test will exit with zero exit code.
If run in scripted mode (ie. stdin is NOT a tty):
	Upon FAIL or ERROR, kx_gui_test will exit immediatly with non-zero exit code.
If run in interactive mode (ie. stdin IS a tty):
	Upon FAIL or ERROR, kx_gui_test will try to continue.
	However, all bets are off:
	kx_gui_test may segfault or malfunction, or your microwave owen may blow up.

------------------------------------------------------------

kx_gui_test maintains a "current gui object".
Initially this object is initialized to the desktop.
Most commands will work on the tree of gui objects starting from
the "current gui object".
The FIND and AWAIT commands will set the "current gui object"
to the object found.
The commands DESKTOP and APPLICATION will reset the "current gui object"
(see below).

------------------------------------------------------------

Each command is a single line, with arguments separated by spaces, e.g.
FIND application yelp

Blank lines and lines starting with # are ignored

at-spi object names are UTF-8 and may contain spaces.
Before matching names, the at-spi object names are stripped of
all characters not in [a-zA-z0-9].
Thus, to match "Search & Replace ..." use
FIND menu SearchReplace 7

at-spi roles may contain spaces. Those are stripped before matching.
Thus, to match a "menu item" role use
FINE menuitem xxxx 7

A gui object name or role may be specified as _ (underscore)
which will match any name or role repectively, e.g.
FIND menubar _ 7

------------------------------------------------------------

Commands:

SPAWN application-window-name command [arguments...]
	1) Verify the no top-level window with role application
		has the name application-window-name
	2) Spawn "command [arguments...]" async in the background
	3) Wait for a top-level window with role application
		and the name application-window-name to appear

FIND role [name [dept]]
	Traverse the tree of gui-objects to the dept specified;
	searching for a gui object witht the specified role and name.

AWAIT role [name [dept]]
	As find, but if the gui object is not found,
	wait for it to appear.

AWAY
	As await, but wait until the gui object is no longer found.

DO action
	Excute the action on the current gui object.

TEXT txt...
	Focus on the current gui object
	Emit txt... as if it came from the keyboard
	Emit the keycode for <return>

VERIFYTEXT txt
	Verify that the current gui object
	contains the specified text

ALTF4
	Send <ALT>+<F4> to the current gui object
	(intended to close the application)

SLEEP seconds
	Sleep for the specified number of seconds

DESKTOP
	Reset the current gui object to the desktop.

APPLICATION
	Reset the current gui object to the application window of the
	last command SPAWN'ed;
	or to the desktop if no command has been SPAWN'ed.

CHILDREN depth
	Show the tree of gui objects, down to the depth specified.
	
ACTIONS
	Show the possible actions on the current gui object.

 ------------------------------------------------------------
*/

#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include <unistd.h>
#include <glib.h>
#include <atspi/atspi.h>


// ============================================================
// PARAMETERS
// ============================================================

static gboolean debug = FALSE;

/*	When waiting for gui objects to appear or disappear
	wait for kxgt_wait_milliseconds and check again
	then wait for twice as long and check again
	and so on repeatedly
	for no longer than about kxgt_wait_milliseconds_max

	On a slow or loaded machine, you may try to
	increase kxgt_wait_milliseconds_max to avoid timeout, or
	increase kxgt_wait_milliseconds to reduce load
*/

static gulong kxgt_wait_milliseconds = 100 * 1000;
static gulong kxgt_wait_milliseconds_max = 20 * 1000 * 1000;


// ============================================================
// GLOBALS
// ============================================================

static gboolean scripted = TRUE;

static AtspiAccessible* kxgt_global_desktop;
static AtspiAccessible* kxgt_global_application;
static AtspiAccessible* kxgt_global_current;


// ============================================================
// PRINT UTILITIES
// ============================================================

static void kxgt_fprint(FILE *f, const char* tag, const char *message, va_list argptr) {
	if (debug) {
		GTimeVal t;
		g_get_current_time(&t);
		fprintf(f, "%ld.%06ld ", t.tv_sec, t.tv_usec);
	}
	fputs(tag, f);
	fputs(" ", f);
	vfprintf(f, message, argptr);
	if (debug) fflush(f);
}

// ------------------------------------------------------------
static void kxgt_fprint_n(FILE *f, const char* tag, const char *message, va_list argptr) {
	kxgt_fprint(f, tag, message, argptr);
	fputs("\n", f);
}

// ------------------------------------------------------------
static void kxgt_info(const char *message, ...) {
	va_list argptr;
	va_start(argptr, message);
	kxgt_fprint_n(stdout, "INFO", message, argptr);
	va_end(argptr); 
}

// ------------------------------------------------------------
static void kxgt_ok(const char *message, ...) {
	va_list argptr;
	va_start(argptr, message);
	kxgt_fprint_n(stdout, "OK  ", message, argptr);
	va_end(argptr); 
}

// ------------------------------------------------------------
static void kxgt_fail_exit(int rc, const char *message, ...) {
	va_list argptr;
	va_start(argptr, message);
	kxgt_fprint_n(stdout, "FAIL", message, argptr);
	va_end(argptr); 
	if (scripted) exit(rc);
}

// ------------------------------------------------------------
static void kxgt_pass(const char *message, ...) {
	va_list argptr;
	va_start(argptr, message);
	kxgt_fprint_n(stdout, "PASS", message, argptr);
	va_end(argptr); 
}

// ------------------------------------------------------------
static void kxgt_error_exit(int rc, const char *message, ...) {
	va_list argptr;
	va_start(argptr, message);
	kxgt_fprint_n(stdout, "ERROR", message, argptr);
	va_end(argptr); 
	if (scripted) exit(rc);
}

// ------------------------------------------------------------
static void kxgt_gerror_warn(GError* error, const char *message, ...) {
	va_list argptr;
	va_start(argptr, message);
	kxgt_fprint(stdout, "WARN", message, argptr);
	va_end(argptr);
	fprintf(stdout, " %d: [%s]\n", error->code, error->message);
}

// ------------------------------------------------------------
static void kxgt_gerror_exit(GError* error, const char *message, ...) {
	va_list argptr;
	va_start(argptr, message);
	kxgt_fprint(stdout, "ERROR", message, argptr);
	va_end(argptr);
	gint code = error->code; 
	fprintf(stdout, " %d: [%s]\n", code, error->message);
	if (!code) { code = 1; }
	if (scripted) exit(code);
}

// ------------------------------------------------------------
static void kxgt_gfail_exit(GError* error, const char *message, ...) {
	va_list argptr;
	va_start(argptr, message);
	kxgt_fprint(stdout, "FAIL", message, argptr);
	va_end(argptr);
	gint code = error->code; 
	fprintf(stdout, " %d: [%s]\n", code, error->message);
	if (!code) { code = 1; }
	if (scripted) exit(code);
}

// ------------------------------------------------------------
static void kxgt_dump_pair (const gchar *key, const gchar *value) {
	g_print (" [%s]=[%s] ", key, value);
}


// ============================================================
// ROLE UTILITIES
// ============================================================

static gchar* kxgt_strip_blanks(gchar* str) {
	gchar* result = g_malloc(strlen(str)+1);
	gchar* from = str;
	gchar* to = result;
	while (1) {
		while (g_ascii_isspace(*from)) { from++; }
		*to = *from;
		if (*from=='\0') { break; }
		from++; to++;
	}
	return result;
}

// ------------------------------------------------------------
/*	Unfortunatly, there is no atspi_rolename_to_role function
	This is a poor mans implementation of such a function
	It could be made a bit more efficient (on multiple calls)
	using a hash table.
	However, atspi_role_get_name is deprecated anyway.
	So we may soon have to find a better solution
*/
static AtspiRole kxgt_str_to_role(gchar* role) {
	AtspiRole r;
	if (!g_strcmp0(role, "_")) { return ATSPI_ROLE_INVALID; }
	for (r=ATSPI_ROLE_INVALID; r<ATSPI_ROLE_LAST_DEFINED; r++) {
		gchar* n = atspi_role_get_name(r);
		gchar* n2 = kxgt_strip_blanks(n);
		gboolean f = g_strcmp0(n2, role);
		g_free(n); g_free(n2);
		if (!f) { return r; }
	}
	kxgt_error_exit(1, "No such role [%s]", role);
	return ATSPI_ROLE_INVALID;
}


// ============================================================
// TREE PRINTING
// ============================================================

static void kxgt_print_accessible(AtspiAccessible* acc) {
	AtspiRole r = atspi_accessible_get_role(acc, NULL);
	// Skip over errors such as The name :1.0 was not provided by any .service files
	if (r==ATSPI_ROLE_INVALID) { 
		if (debug) { kxgt_info("Skipping over invalid accessible"); }
		return;
	}
	gchar *name = atspi_accessible_get_name(acc, NULL);
	gchar *role = atspi_accessible_get_role_name(acc, NULL);
	gchar *description = atspi_accessible_get_description(acc, NULL);
	printf("name=[%s] role=[%s] description=[%s]", name, role, description);
	g_free(name); g_free(role); g_free(description);
	GHashTable *ght=atspi_accessible_get_attributes(acc, NULL);
	if (ght!=NULL) {
		g_hash_table_foreach (ght, (GHFunc)kxgt_dump_pair, NULL);
		g_hash_table_unref(ght);
	}

	AtspiText* txt = atspi_accessible_get_text(acc);
	if (txt!=NULL) { 
		GError *error = NULL;
		gchar *s = atspi_text_get_text(txt, 0, 1024, &error);
		if (error==NULL) { 
			printf(" text=[%s]", s);
			g_free(s);
		}
	}

	printf("\n");
}

// ------------------------------------------------------------
static int kxgt_print_children2(AtspiAccessible* acc, gint depth, gint indent) {
	gint j; for (j=0; j<indent; j++)  { printf(". "); }
	kxgt_print_accessible(acc);
	if (indent>=depth) { return 1; }
        gint n=1;
	gint i;
	for (i=0; i<atspi_accessible_get_child_count(acc, NULL); i++) {
		AtspiAccessible* a=atspi_accessible_get_child_at_index(acc,i,NULL);
		n += kxgt_print_children2(a, depth, indent+1);
		g_object_unref(a);
	}
	return n;
}

// ------------------------------------------------------------
static void kxgt_print_children(AtspiAccessible* acc, gint depth) {
	gint n=kxgt_print_children2(acc, depth, 0);
	kxgt_info("Found [%d] children until depth [%d]", n, depth);
}


// ============================================================
// ACTION UTILITIES
// ============================================================

static void kxgt_print_actions(AtspiAccessible* acc) {
	AtspiAction* action=atspi_accessible_get_action(acc);
	if (action==NULL) {
		kxgt_info("No actions");
		return;
	}
	GError *error = NULL;
	gint n = atspi_action_get_n_actions(action, &error);
	if (error!=NULL) { kxgt_gerror_exit(error, "kxgt_print_actions/atspi_action_get_n_actions"); return; }
	gint i;
	for (i=0; i<n; i++) {
		gchar* a = atspi_action_get_name(action, i, &error);
		if (error!=NULL) { kxgt_gerror_exit(error, "kxgt_print_actions/atspi_action_get_name"); return; }
		puts(a);
	}
	kxgt_info("Found [%d] actions", n);
}


// ============================================================
// FIND / WAIT
// ============================================================

static gint kxgt_cmp_name(gchar* utf8_name, gchar* ascii_name) {
	const gchar *end = utf8_name;
	g_utf8_validate(utf8_name, -1, &end);
	gchar *stripped = g_malloc(end-utf8_name+1);
	gchar *from = utf8_name;
	gchar *to = stripped;
	while (from<end) {
		if (g_ascii_isalnum(*from)) {
			*to++ = *from;
		}
		from=g_utf8_next_char(from);
	}
	*to='\0';
	//printf("kxgt_cmp_name [%s] [%s]\n", utf8_name, stripped);
	gint ret = g_strcmp0(stripped, ascii_name);
	g_free(stripped);
	return ret;
}

// ------------------------------------------------------------
/*	We might have used atspi_accessible_get_collection.
	However, it seems that it is not implemented for 
	most gui components,
	so it is not worth the extra complexity.

	We might also have used functions like
	atspi_register_device_event_listener
	but then we would need a main loop.
	Again, not worth the extra complexity.
*/
static AtspiAccessible* kxgt_find_depth2(AtspiAccessible* root, AtspiRole role, gchar* name, gchar *description, gint depth) {
	GError *error=NULL;
	gint n=atspi_accessible_get_child_count(root, &error);
	if (error!=NULL) { kxgt_gerror_warn(error, "kxgt_find_depth/atspi_accessible_get_child_count failed"); return NULL; }
	gint i;
	for (i=0; i<n; i++) {
		AtspiAccessible* a=atspi_accessible_get_child_at_index(root, i, &error);
		if (a==NULL) { continue; }  // might happen if child is being deleted
		if (error!=NULL) { kxgt_gerror_warn(error, "kxgt_find_depth/atspi_accessible_get_child_at_index"); return NULL; }
		AtspiRole r;
		if (role==ATSPI_ROLE_INVALID) {
			r = ATSPI_ROLE_INVALID;
		} else {
			r = atspi_accessible_get_role(a, NULL);
		}
		if (role==r) {
			gboolean match=!g_strcmp0(name, "_");
			if (!match) {
				gchar *n = atspi_accessible_get_name(a, &error);
				if (error!=NULL) { kxgt_gerror_warn(error, "kxgt_find_depth/atspi_accessible_get_name"); return NULL; }
				match = !kxgt_cmp_name(n, name);
				g_free(n);
			}
			if (match) {
				match=!g_strcmp0(description, "_");
				if (!match) {
					gchar *d = atspi_accessible_get_description(a, &error);
					if (error!=NULL) { kxgt_gerror_warn(error, "kxgt_find_depth/atspi_accessible_get_description"); return NULL; }
					match = !kxgt_cmp_name(d, description);
					g_free(d);
				}
			}
			if (match) { return a; }
		}
		
		if (depth>1) {
			AtspiAccessible* a2 = kxgt_find_depth2(a, role, name, description, depth-1);
			if (a2!=NULL)  { g_object_unref(a); return a2; }
		}
		g_object_unref(a);
	}
	return NULL;
}

// ------------------------------------------------------------
static AtspiAccessible* kxgt_find_depth(AtspiAccessible* root, AtspiRole role, gchar* name, gchar* description, gint depth) {
	gchar* r = atspi_role_get_name(role);
	if (debug) kxgt_info("Looking for role=[%s] name=[%s]", r,  name);
	AtspiAccessible* a = kxgt_find_depth2(root, role, name, description, depth);
	if (debug) {
		if (a==NULL) { kxgt_info("Did not find role=[%s] name=[%s]", r,  name); }
		else { kxgt_info("Found role=[%s] name=[%s]", r,  name); }
	}
	g_free(r);
	return a;
}

// ------------------------------------------------------------
static AtspiAccessible* kxgt_await_depth(AtspiAccessible* root, AtspiRole role, gchar* name, gint depth) {
	if (debug) kxgt_info("Waiting for [%s]", name);
	gulong ms = kxgt_wait_milliseconds;
	AtspiAccessible* a = NULL;
	while ( (a==NULL) && (ms<kxgt_wait_milliseconds_max/2) ) {
		g_usleep(ms);
		a = kxgt_find_depth2(root, role, name, "_", depth);
		if (debug) {
			if (a==NULL) { kxgt_info("Still waiting for [%s]", name); }
			else { kxgt_info("Found [%s]", name); }
		}
		ms *= 2;
	}
	return a;
}

// ------------------------------------------------------------
static gboolean kxgt_away_depth(AtspiAccessible* root, AtspiRole role, gchar* name, gint depth) {
	if (debug) kxgt_info("Waiting for [%s] to go away", name);
	gulong ms = kxgt_wait_milliseconds;
	AtspiAccessible* a = NULL;
	do {
		g_usleep(ms);
		a = kxgt_find_depth2(root, role, name, "_", depth);
		if (debug) {
			if (a!=NULL) { kxgt_info("Still waiting for [%s] to go away", name); }
			else { kxgt_info("Object [%s] went away", name); }
		}
		ms *= 2;
	} while ( (a!=NULL) && (ms<kxgt_wait_milliseconds_max/2) );
	return (a==NULL);
}


// ============================================================
// MAIN PROCESSING
// ============================================================

static gchar**  kxgt_split(gchar gline[], gint max_tokens) {
	GRegex * regex = g_regex_new("\\s+", 0, 0, NULL);
	gchar** parts;
	parts=g_regex_split_full(regex, gline, -1, 0, 0, max_tokens, NULL);
	g_regex_unref(regex);
	return parts;
}
	
// ------------------------------------------------------------
static gint kxgt_get_depth(gchar* str) {
	gint d=atoi(str);
	if (d<1) { d=1; }
	return d;
}

// ------------------------------------------------------------
static gboolean kxgt_check_n_args(gchar** parts, int n) {
	int i=1;
	while (parts[i]!=NULL) { i++; }
	i--;
	if (i<n) {
		kxgt_error_exit(1, "Too few arguments for [%s]: Found [%d], expected at least [%d]", parts[0], i, n);
		return FALSE;
	}
	return TRUE;
}

// ------------------------------------------------------------
static void kxgt_spawn(gchar* app, gchar* cmd) {
	if (debug) { kxgt_info("kxgt_spawn [%s]: [%s]", app, cmd); }
	AtspiAccessible* a = kxgt_find_depth(kxgt_global_desktop, ATSPI_ROLE_APPLICATION, app, "_", 1);
	if (a!=NULL) { kxgt_fail_exit(1, "Window with name [%s] already found", app); return; }
	GError *error = NULL;
	gboolean f = g_spawn_command_line_async(cmd, &error);
	if (!f) { kxgt_gfail_exit(error, "Could not spawn [%s]:", cmd); return; }
	g_usleep(10*kxgt_wait_milliseconds);
	a = kxgt_await_depth(kxgt_global_desktop, ATSPI_ROLE_APPLICATION, app, 1);
	if (a==NULL) { kxgt_fail_exit(1, "Window with name [%s] did not appear", app); return; }
	g_object_unref(kxgt_global_application); kxgt_global_application = a;
	g_object_unref(kxgt_global_current); kxgt_global_current = kxgt_global_application; g_object_ref(kxgt_global_current);
	kxgt_ok("Found [%s]", app);
}

// ------------------------------------------------------------
static void kxgt_find(gchar** parts) {
	if (!kxgt_check_n_args(parts, 3)) return;
	AtspiRole role = kxgt_str_to_role(parts[1]);
	gchar* name = parts[2];
	int depth = kxgt_get_depth(parts[3]);
	AtspiAccessible* a = kxgt_find_depth(kxgt_global_current, role, name, "_", depth);
	if (a==NULL) {
		kxgt_fail_exit(1, "Did not find role=[%s] name=[%s]", parts[1],  name);  return;
	} else {
		kxgt_ok("Found role=[%s] name=[%s]", parts[1],  name); 
		g_object_unref(kxgt_global_current); kxgt_global_current=a;
	}
}

// ------------------------------------------------------------
static void kxgt_await(gchar** parts) {
	if (!kxgt_check_n_args(parts, 3)) return;
	AtspiRole role = kxgt_str_to_role(parts[1]);
	gchar* name = parts[2];
	int depth = kxgt_get_depth(parts[3]);
	AtspiAccessible* a = kxgt_await_depth(kxgt_global_current, role, name, depth);
	if (a==NULL) {
		kxgt_fail_exit(1, "Did not find role=[%s] name=[%s]", atspi_role_get_name(role),  name);  return;
	} else {
		kxgt_ok("Found role=[%s] name=[%s]", atspi_role_get_name(role),  name); 
		g_object_unref(kxgt_global_current); kxgt_global_current=a;
	}
}

// ------------------------------------------------------------
static void kxgt_away(gchar** parts) {
	if (!kxgt_check_n_args(parts, 3)) return;
	AtspiRole role = kxgt_str_to_role(parts[1]);
	gchar* name = parts[2];
	int depth = kxgt_get_depth(parts[3]);
	gboolean f = kxgt_away_depth(kxgt_global_current, role, name, depth);
	if (!f) {
		kxgt_fail_exit(1, "Object role=[%s] name=[%s] did not go away", parts[1],  name);  return;
	} else {
		kxgt_ok("Object role=[%s] name=[%s] went away", parts[1],  name); 
	}
}

// ------------------------------------------------------------
static void kxgt_description(gchar** parts) {
	if (!kxgt_check_n_args(parts, 3)) return;
	AtspiRole role = kxgt_str_to_role(parts[1]);
	gchar* description = parts[2];
	int depth = kxgt_get_depth(parts[3]);
	AtspiAccessible* a = kxgt_find_depth(kxgt_global_current, role, "_", description, depth);
	if (a==NULL) {
		kxgt_fail_exit(1, "Did not find role=[%s] description=[%s]", parts[1],  description); return; 
	} else {
		kxgt_ok("Found role=[%s] description=[%s]", parts[1],  description); 
		g_object_unref(kxgt_global_current); kxgt_global_current=a;
	}
}


// ------------------------------------------------------------
static void kxgt_do_default(AtspiAccessible* acc) {

	AtspiAction* action=atspi_accessible_get_action(acc);
	if (action==NULL) {
		kxgt_fail_exit(1, "Object has no actions"); return;
	}
	GError *error = NULL;
	gint n = atspi_action_get_n_actions(action, &error);
	if (error!=NULL) { kxgt_gerror_exit(error, "kxgt_do_action/atspi_action_get_n_actions"); return; }
	if (n!=1) kxgt_fail_exit(1, "Object has [%d] actions; expected 1", n);

	if (debug) { kxgt_info("Executing default action"); }
	atspi_action_do_action(action, 0, &error);
	if (error!=NULL) { kxgt_gerror_exit(error, "kxgt_do_default/atspi_action_do_action"); return; }
	kxgt_ok("Executed default action");
}

// ------------------------------------------------------------
static void kxgt_do_action(AtspiAccessible* acc, gchar* action_name) {

	if (debug) { kxgt_info("Looking for action [%s]", action_name); }

	AtspiAction* action=atspi_accessible_get_action(acc);
	if (action==NULL) {
		kxgt_fail_exit(1, "Object has no actions"); return;
	}
	GError *error = NULL;
	gint n = atspi_action_get_n_actions(action, &error);
	if (error!=NULL) { kxgt_gerror_exit(error, "kxgt_do_action/atspi_action_get_n_actions"); return; }
	gint i;
	if (debug) { kxgt_info("Found [%d] actions", n); }
	for (i=0; i<n; i++) {
		gchar* a = atspi_action_get_name(action, i, &error);
		if (error!=NULL) { kxgt_gerror_exit(error, "kxgt_do_action/atspi_action_get_name"); return; }
		if (!g_strcmp0(action_name, a)) {
			if (debug) { kxgt_info("Executing action [%s]", action_name); }
			atspi_action_do_action(action, i, &error);
			if (error!=NULL) { kxgt_gerror_exit(error, "kxgt_do_action/atspi_action_do_action"); return; }
			g_free(a);
			kxgt_ok("Executed [%s]", action_name);
			return;
		}
		g_free(a);
	}
	kxgt_fail_exit(1, "Object has no action named[%s]", action_name);
}

// ------------------------------------------------------------
static void kxgt_text(AtspiAccessible* acc, gchar* str) {
	AtspiComponent * cmp = atspi_accessible_get_component(acc);
	if (cmp==NULL) { kxgt_fail_exit(1, "No AtspiComponent"); return; }
	GError *error = NULL;
	atspi_component_grab_focus(cmp, &error);
	if (error!=NULL) { kxgt_gerror_exit(error, "kxgt_text/atspi_component_grab_focus"); return; }
	atspi_generate_keyboard_event(0, str, ATSPI_KEY_STRING, &error);
	if (error!=NULL) { kxgt_gerror_exit(error, "kxgt_text/atspi_generate_keyboard_event (string)"); return; }
	atspi_generate_keyboard_event(0xff0d, NULL, ATSPI_KEY_SYM, &error);
	if (error!=NULL) { kxgt_gerror_exit(error, "kxgt_text/atspi_generate_keyboard_event (<return>)"); return; }

/*	NOTE: This does not work

	AtspiEditableText* txt = atspi_accessible_get_editable_text(acc);
	if (txt==NULL) { kxgt_fail_exit(1, "No AtspiEditableText"); }
	atspi_editable_text_insert_text(txt, 0, str, 1024, &error);
	if (error!=NULL) { kxgt_gerror_exit(error, "kxgt_text/atspi_editable_text_insert_text"); }
*/

	kxgt_ok("Text [%s] inserted", str);
}

// ------------------------------------------------------------
static void kxgt_alt_f4(AtspiAccessible* acc) {
	AtspiComponent * cmp = atspi_accessible_get_component(acc);
	if (cmp==NULL) { kxgt_fail_exit(1, "No AtspiComponent"); return; }
	GError *error = NULL;
	atspi_component_grab_focus(cmp, &error);
	if (error!=NULL) { kxgt_gerror_exit(error, "kxgt_alt_f4/atspi_component_grab_focus"); return; }
	g_usleep(100*1000);
	atspi_generate_keyboard_event(0x40, NULL, ATSPI_KEY_PRESS, &error);
	if (error!=NULL) { kxgt_gerror_exit(error, "kxgt_alt_f4/atspi_generate_keyboard_event (hold <ALT>)"); return; }
	g_usleep(100*1000);
	atspi_generate_keyboard_event(0x46, NULL, ATSPI_KEY_PRESSRELEASE, &error);
	if (error!=NULL) { kxgt_gerror_exit(error, "kxgt_alt_f4/atspi_generate_keyboard_event (press <F4>)"); return; }
	g_usleep(100*1000);
	atspi_generate_keyboard_event(0x40, NULL, ATSPI_KEY_RELEASE, &error);
	if (error!=NULL) { kxgt_gerror_exit(error, "kxgt_alt_f4/atspi_generate_keyboard_event (release <ALT>)"); return; }
	kxgt_ok("ALT-F4 send");
}

// ------------------------------------------------------------
static void kxgt_focus(AtspiAccessible* acc) {
	AtspiComponent * cmp = atspi_accessible_get_component(acc);
	if (cmp==NULL) { kxgt_fail_exit(1, "No AtspiComponent"); return; }
	GError *error = NULL;
	atspi_component_grab_focus(cmp, &error);
	if (error!=NULL) { kxgt_gerror_exit(error, "kxgt_focus/atspi_component_grab_focus"); return; }
	kxgt_ok("Grabbed focus");
}

// ------------------------------------------------------------
static void kxgt_verify_text(AtspiAccessible* acc, gchar* str) {

	AtspiText* txt = atspi_accessible_get_text(acc);
	if (txt==NULL) { kxgt_fail_exit(1, "No AtspiText interface"); return; }
	GError *error = NULL;
	gchar *s = atspi_text_get_text(txt, 0, 1024, &error);
	if (error!=NULL) { kxgt_gerror_exit(error, "kxgt_verify_text/atspi_generate_keyboard_event (<return>)"); return; }
	if (!g_utf8_collate(str, s)) {
		kxgt_ok("Found text [%s]", s);
	} else {
		kxgt_fail_exit(1, "Did not find text [%s] but [%s]", str, s); return;
	}
	g_free(s);
}

// ------------------------------------------------------------
static void kxgt_sleep(gchar* str) {
	gint d=atoi(str);
	if (d<1) { d=1; }
	if (debug) { kxgt_info("Sleeping [%d] seconds", d); }
	int i;
	for (i=0; i<d; i++) { g_usleep(1000*1000); }
	kxgt_ok("Slept [%d] seconds", d);
}

// ------------------------------------------------------------
static void kxgt_process() {
	if (debug) { kxgt_info("kx_gui_test processing stdin"); }
	char line[LINE_MAX];
	while (fgets(line, LINE_MAX, stdin) != NULL) {
		g_strstrip(line);
		gchar* gline = (gchar*) line;
		gchar** parts = kxgt_split(gline, -1);
		if (parts[0]==NULL) { g_strfreev(parts); continue; }
		if (parts[0][0]=='#') { g_strfreev(parts); continue; }
		gchar* cmd = g_ascii_strup(parts[0], -1);
		if (!g_strcmp0(cmd, "CHILDREN")) {
			if (!kxgt_check_n_args(parts, 1)) continue;
			int depth = kxgt_get_depth(parts[1]);
			kxgt_print_children(kxgt_global_current, depth);
		} else if (!g_strcmp0(cmd, "ACTIONS")) {
			kxgt_print_actions(kxgt_global_current);
		} else if (!g_strcmp0(cmd, "FIND")) {
			kxgt_find(parts);
		} else if (!g_strcmp0(cmd, "AWAIT")) {
			kxgt_await(parts);
		} else if (!g_strcmp0(cmd, "AWAY")) {
			kxgt_away(parts);
		} else if (!g_strcmp0(cmd, "DESCRIPTION")) {
			kxgt_description(parts);
		} else if (!g_strcmp0(cmd, "DO")) {
			if (kxgt_check_n_args(parts, 0)) { kxgt_do_default(kxgt_global_current); continue; };
			if (!kxgt_check_n_args(parts, 1)) continue;
			kxgt_do_action(kxgt_global_current, parts[1]);
		} else if (!g_strcmp0(cmd, "TEXT")) {
			if (!kxgt_check_n_args(parts, 1)) continue;
			g_strfreev(parts);
			parts=kxgt_split(gline, 2);
			kxgt_text(kxgt_global_current, parts[1]);
		} else if (!g_strcmp0(cmd, "ALTF4")) {
			if (!kxgt_check_n_args(parts, 0)) continue;
			kxgt_alt_f4(kxgt_global_current);
		} else if (!g_strcmp0(cmd, "FOCUS")) {
			if (!kxgt_check_n_args(parts, 0)) continue;
			kxgt_focus(kxgt_global_current);
		} else if (!g_strcmp0(cmd, "SLEEP")) {
			if (!kxgt_check_n_args(parts, 1)) continue;
			kxgt_sleep(parts[1]);
		} else if (!g_strcmp0(cmd, "VERIFYTEXT")) {
			if (!kxgt_check_n_args(parts, 1)) continue;
			kxgt_verify_text(kxgt_global_current, parts[1]);
		} else if (!g_strcmp0(cmd, "DESKTOP")) {
			g_object_unref(kxgt_global_application); kxgt_global_application = kxgt_global_desktop; g_object_ref(kxgt_global_application);
			g_object_unref(kxgt_global_current); kxgt_global_current = kxgt_global_desktop; g_object_ref(kxgt_global_current);
		} else if (!g_strcmp0(cmd, "APPLICATION")) {
			g_object_unref(kxgt_global_current); kxgt_global_current = kxgt_global_application; g_object_ref(kxgt_global_current); 
		} else if (!g_strcmp0(cmd, "SPAWN")) {
			if (!kxgt_check_n_args(parts, 2)) continue;
			g_strfreev(parts);
			parts=kxgt_split(gline, 3);
			kxgt_spawn(parts[1], parts[2]);
		} else {
			kxgt_error_exit(1, "unknown kx_gui_test command [%s]", parts[0]);
		}
		g_free(cmd);
		g_strfreev(parts);
	}
	if (debug) { kxgt_info("kx_gui_test processing complete"); }
}

// ------------------------------------------------------------
int main(int argc, char **argv) {

	if (debug) { kxgt_info("kx_gui_test starting"); }

	scripted = !isatty(0);

	if (scripted) { 
		kxgt_ok("scripted");
	} else {
		kxgt_ok("interactive");
	}

	if (debug) { kxgt_info("calling atspi_init"); }
	int rc;
	rc = atspi_init();
	if (debug) { kxgt_info("atspi_init returned [%d]", rc); }
	if (rc) {
		kxgt_error_exit(rc, "atspi_init failed [%d]", rc);
		return rc;
	} else {
		kxgt_ok("atspi_init");
	}

	if (debug) { kxgt_info("atspi_get_desktop"); }
	kxgt_global_desktop = atspi_get_desktop(0);
	if (kxgt_global_desktop==NULL) {
		kxgt_error_exit(rc, "atspi_get_desktop failed");
	} else {
		kxgt_ok("atspi_get_desktop");
	}
	kxgt_global_application = kxgt_global_desktop; g_object_ref(kxgt_global_application);
	kxgt_global_current = kxgt_global_application; g_object_ref(kxgt_global_current);

	kxgt_process();

	g_object_unref(kxgt_global_desktop);
	g_object_unref(kxgt_global_application);
	g_object_unref(kxgt_global_current);

	if (debug) { kxgt_info("calling atspi_exit"); }
	rc = atspi_exit();
	if (debug) { kxgt_info("atspi_exit returned [%d]", rc); }
	if (rc) {
		kxgt_error_exit(rc, "atspi_exit failed [%d]", rc);
		return rc;
	} else {
		kxgt_ok("atspi_exit");
	}

	if (scripted) kxgt_pass("Test passed");

return 0;
}
