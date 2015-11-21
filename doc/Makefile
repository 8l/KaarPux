# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2015: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

# ============================================================
# Makefile for KaarPux documentation
# ============================================================

include Makefile.sphinx

.PHONY: all html cve changelog man apache

all: html

html: changelog cve packages man apache

KXMASTER=./..
TMPDIR=$(BUILDDIR)/tmp

CHANGELOG_FILES=$(shell ls --reverse changes*.rst)
CHANGELOG_NAMES=$(subst .rst,,$(CHANGELOG_FILES))

SILENT=@

ALLSPHINXOPTS   = -d $(TMPDIR)/doctrees $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) .

changelog:
	@ echo "creating $(TMPDIR)/kaarpux_changelog.rst"
	$(SILENT) mkdir -p $(TMPDIR)
	$(SILENT) cp kaarpux_changelog.txt $(TMPDIR)/kaarpux_changelog.rst
	$(SILENT) for C in $(CHANGELOG_NAMES); do \
		echo "   $$C" >> $(TMPDIR)/kaarpux_changelog.rst; \
	done

$(TMPDIR)/cve.rst: $(KXMASTER)/libexec/kx_doc_cve $(KXMASTER)/cve_list.txt
	@ echo "creating CVE list"
	$(SILENT) $(KXMASTER)/libexec/kx_doc_cve $(KXMASTER) $(TMPDIR)

cve: $(TMPDIR)/cve.rst

$(TMPDIR)/man.stamp: $(KXMASTER)/doc/man.txt $(KXMASTER)/man/kx_*.rst
	@ echo "creating manpages"
	$(SILENT) mkdir -p $(TMPDIR)
	$(SILENT) rm -rf $(TMPDIR)/man
	$(SILENT) mkdir -p $(TMPDIR)/man
	$(SILENT) cp $(KXMASTER)/man/kx_*.rst $(TMPDIR)/man
	$(SILENT) cp $(KXMASTER)/doc/man.txt $(TMPDIR)/man/index.rst
	$(SILENT) ls -1 $(KXMASTER)/man/kx_*.rst | sed -e 's:^./../man/\(.*\).rst$$:   \1:' >> $(TMPDIR)/man/index.rst

man: $(TMPDIR)/man.stamp

$(TMPDIR)/packages.stamp: $(KXMASTER)/libexec/kx_doc_packages $(KXMASTER)/packages/* $(KXMASTER)/packages/*/*.yaml
	@ echo "creating package documentation"
	$(SILENT) mkdir -p $(TMPDIR)
	$(SILENT) rm -rf $(TMPDIR)/packages
	$(SILENT) mkdir -p $(TMPDIR)/packages
	$(SILENT) $(KXMASTER)/libexec/kx_doc_packages $(KXMASTER)/packages $(TMPDIR)
	$(SILENT) touch $@

packages: $(TMPDIR)/packages.stamp

apache: $(BUILDDIR)/html/.htaccess $(BUILDDIR)/html/404.html

$(BUILDDIR)/html/.htaccess: $(KXMASTER)/doc/_templates/.htaccess
	@ echo "creating .htaccess"
	$(SILENT) mkdir -p $(BUILDDIR)/html/
	$(SILENT) sed 's|@|http://kaarpux.kaarposoft.dk|' $? > $@

$(BUILDDIR)/html/404.html: $(KXMASTER)/doc/_templates/404.html
	@ echo "copying 404"
	$(SILENT) mkdir -p $(BUILDDIR)/html/
	$(SILENT) cp $? $@

