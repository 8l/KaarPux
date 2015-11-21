#!/usr/bin/perl -w
#
# KaarPux: http://kaarpux.kaarposoft.dk
#
# Copyright (C) 2014-2015: Henrik Kaare Poulsen
#
# License: http://kaarpux.kaarposoft.dk/license.html
#

use strict;
use warnings FATAL => 'all';
use Getopt::Long;
use Pod::Usage;
use Time::Piece;

# ============================================================

my $help=0;
my $man=0;
my $debug=0;

my $version;
my $versionu;
my $revision_range;
my $date;

my @major_changes = ();
my @fix_changes = ();
my @add_changes = ();
my @upd_changes = ();
my @minor_changes = ();
my @doc_changes = ();

# ============================================================

sub getVersion {
	my $v = `git tag --sort="v:refname" | cut -c2- | tail -1`  or die("Could not find most recent version\n");
	my @vv = split('\.', $v);
	$vv[$#vv]++;
	return join('.', @vv);
}

# ============================================================

sub getRevisionRange {
	my $v = `git tag --sort="v:refname" | cut -c2- | tail -1` or die("Could not find most recent version\n");
	chomp $v;
	return "v$v..";
}

# ============================================================

sub getDate {
	return lc localtime->strftime('%Y-%b-%d');
}

# ============================================================

sub parseArgs {
	GetOptions(
		"help|?" => \$help,
		"man" => \$man,
		"debug" => \$debug,
		);
	pod2usage(-exitstatus => 0, -verbose => 1) if $help;
	pod2usage(-exitstatus => 0, -verbose => 2) if $man;

	$version = ($#ARGV < 0) ? getVersion() : $ARGV[0];
	print STDERR "version: $version\n";

	if ($#ARGV < 1)  {
		$revision_range = getRevisionRange();
	} else {
		shift @ARGV;
		$revision_range = join(' ', @ARGV);
	}
	print STDERR "revision range: $revision_range\n";

	$versionu = $version;
	$versionu =~ s/\./_/g;

	$date = getDate();
}

# ============================================================

sub readLog {
	my  $cmd='git log --pretty="%H%n%B" --reverse -z ' . $revision_range;
	print "Excuting [$cmd]\n" if $debug;
	my @lines = `$cmd` or die("Executing [$cmd] failed\n");
	my $token = shift @lines; chomp $token;
	while (length $token > 30) {
		my $hash = $token;
		print "H $hash\n" if $debug;
		my $subject = shift @lines; chomp $subject;
		print "S $subject\n" if $debug;
		my $body_aref = [];
		$token = shift @lines; chomp $token;
		while (! ($token =~ /^\000/ )) {
			push @$body_aref, $token;
			$token = shift @lines; chomp $token;
		}
		print "B " . scalar(@$body_aref) . "\n" if $debug;
		my %commit = (
			'hash' => $hash,
			'subject' => $subject,
			'body' => $body_aref,
		);
		if ($subject =~ /^DOC/) {
			push @doc_changes, \%commit;
		} elsif (@$body_aref>0) {
			push @major_changes, \%commit;
		} elsif ($subject =~ /^FIX/) {
			push @fix_changes, \%commit;
		} elsif ($subject =~ /^ADD/) {
			push @add_changes, \%commit;
		} elsif ($subject =~ /^UPD/) {
			push @upd_changes, \%commit;
		} else {
			push @minor_changes, \%commit;
		}
		$token = substr $token, 1;
	}
	if ($debug) {
		print scalar(@major_changes) . " major changes\n" if $debug;
		print scalar(@minor_changes) . " minor changes\n" if $debug;
		print scalar(@doc_changes) . " documentation changes\n" if $debug;
	}
}

# ============================================================

sub printSections {
	my ($id, $title, $changes) = @_;
	print <<EOF;

<!-- ============================================================ -->

<section id="$id">
<title>$title</title>
EOF

	foreach my $change (@$changes) {
		my $h = $change->{'hash'};
		my $h8 = substr $h, 0, 8;
		my $s = $change->{'subject'};
		my $b = join "\n", @{$change->{'body'}};
		$b =~ s/^\n//;
		print <<EOF;

	<section>
	<title>$s</title>
	<para>
		Commit <ulink url="http://sourceforge.net/p/kaarpux/code/ci/$h/">$h8</ulink>
	</para>
	<para>
$b
	</para>
	</section>
EOF
	}

	print <<EOF;

</section>
EOF
}


# ============================================================

sub printList {
	my ($id, $title, $changes) = @_;
	print <<EOF;

<!-- ============================================================ -->

<section id="$id">
<title>$title</title>

<itemizedlist>
EOF

	foreach my $change (@$changes) {
		my $h = $change->{'hash'};
		my $h8 = substr $h, 0, 8;
		my $s = $change->{'subject'};
		print <<EOF;

	<listitem><para>
		$s
	</para><para>
		(Commit <ulink url="http://sourceforge.net/p/kaarpux/code/ci/$h/">$h8</ulink>)
	</para></listitem>
EOF
	}

	print <<EOF;

</itemizedlist>

</section>
EOF
}


# ============================================================

sub printAll {
	print <<EOF;
<!--
	KaarPux: http://kaarpux.kaarposoft.dk

	Copyright (C) 2015: Henrik Kaare Poulsen

	License: http://kaarpux.kaarposoft.dk/license.html
-->

<section id="changes_${versionu}">
<title>Changes in KaarPux version ${version}</title>

<!-- ============================================================ -->

<para>
	&kx; version <systemitem>${version}</systemitem> released on <systemitem>$date</systemitem>
</para>

<para>
	TODO: summary
</para>

EOF
	print "<!--\n";
	print "\t" . scalar(@major_changes) . " major changes\n";
	print "\t" . scalar(@fix_changes) . " bug fixes\n";
	print "\t" . scalar(@add_changes) . " packages added\n";
	print "\t" . scalar(@upd_changes) . " packages updated\n";
	print "\t" . scalar(@minor_changes) . " minor changes\n";
	print "\t" . scalar(@doc_changes) . " documentation changes\n";
	print "-->\n\n";

	printSections("changes_${versionu}_major", "Major Changes", \@major_changes);
	printList("changes_${versionu}_bugs", "Bugs fixed", \@fix_changes);
	printList("changes_${versionu}_add", "Packages added", \@add_changes);
	printList("changes_${versionu}_upd", "Packages updated", \@upd_changes);
	printList("changes_${versionu}_minor", "Minor Changes", \@minor_changes);
	printList("changes_${versionu}_doc", "Documentation Changes", \@doc_changes);

	print <<EOF;

<!-- ============================================================ -->

</section>
EOF

}

# ============================================================

parseArgs;
readLog;
printAll;

# ============================================================

__END__

=head1 NAME

kx_changelog - generate KaarPux changelog from git

=head1 SYNOPSIS

B<kx_changelog> [F<version> [F<revision_range>]]

B<kx_changelog> --help | --man

=head1 DESCRIPTION

B<kx_changelog> will create a B<DocBook> snippet
which can be used as a first approximation for a changelog
entry on the L<http://kaarpux.kaarposoft.dk> website.

B<kx_changelog> should be run from a B<git> repository directory.

If no F<revision_range> is given, B<kx_changelog> will look
for the most recent B<RELEASE> checkin in B<git>.

If no F<version> is given, B<kx_changelog> will try to
increase the patch level by one.

=head1 OPTIONS

=over 8

=item B<--help>

Print help message and exit.

=item B<--man>

Print manual page and exit.

=item B<--debug>

Show debug messages while processing.

=item F<version>

The version number of the new release

=item F<revision_range>

Will be passed on to B<git log>.
Typically it would be "F<sha1>..",
where F<sha1> is the commit id for the previous release.

=back

=head1 AUTHOR

KaarPo v/Henrik Kaare Poulsen

=head1 SEE

L<http://kaarpux.kaarposoft.dk>

=cut

