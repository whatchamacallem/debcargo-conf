Release
=======

For this team's purposes, the job is not done until the package gets into
Debian Testing. This is a rigorous QA process the details of which can be read
about elsewhere. 

Install graphviz and pypy3, then run::

  dev/rust-excuses.mk refresh all

which will generate a nice pretty graph of packages trying to enter Debian
Testing, along with their dependencies, and sometimes a colour representing the
reason why it's being held back. (The colours could be more sophisticated,
please help with improving the script. White does not always mean there is no
problem; the excuses page is the authoritative source on the matter.)

Generally, you should look at the bottom-most packages in this diagram, and
deal with their issues first.

You can also visit the permanent rust transition tracker here:

  https://release.debian.org/transitions/html/rust.html

This page also gives you an overview about architectures being broken for a package.
Ideally, all rust crates on this site should migrate to testing eventually.
 More details for each package can be found at:

  https://qa.debian.org/excuses.php?package=rust-$crate

or by clicking the relevant "Excuse" link on this team's `QA page`_.

.. _QA page: https://qa.debian.org/developer.php?login=pkg-rust-maintainers@lists.alioth.debian.org

It should be fairly self-explanatory on how to deal with each of the issues
mentioned on that page. Ask in #debian-rust or #debian-release or #debian-devel
if you get stuck, whichever channel seems most suitable.

Once you have dealt with all of the excuses, wait a day or so. If the excuses
page then says "Will attempt migration (Any information below is purely
informational)" and it remains in this state for more than 2 days, it means
that we have failed "Migration phase 2", whose specific failure reasons are not
mentioned in the excuses for `technical reasons`_.

.. _technical reasons: https://release.debian.org/doc/britney/short-intro-to-migrations.html#migration-phase-2-installability-regression-testing

However the reason is basically that there are other crates already in Debian
Testing that depend on the old version of the $crate you were looking at, i.e.
the one in Debian Testing not Debian Unstable. To view a summary of this, run::

  dev/list-rdeps.sh $crate

It will also give you some follow-up instructions to fix the problem.


Source-only re-upload
=====================

Two aspects of Debian infrastructure policy, run by two different teams,
interact badly when it comes to the Debian Rust Team:

1. Uploads with new binary packages have to be done as binary (not source-only)
   uploads, into the FTP team's NEW queue.
2. Uploads that are valid candidates for Debian Testing have to be source-only
   uploads, to be considered by the Release team's migration script.

For your convenience, ``./release.sh`` can do these quickly. After a
binary-upload is accepted from the NEW queue, and you merge the relevant
pending branch, do a source-only re-upload by simply running::

  RERELEASE=1 ./release.sh <rust-crate-name> [<old-version>]


Remove an obsolete package
==========================

::

  $ reportbug ftp.debian.org
  [..]
  What sort of request is this?
  [..]
   6 ROM       Package removal - Request Of Maintainer.
  [..]
  Choose the request type: 6
  [..]
  Is the removal to be done in a suite other than "unstable"? Don't select anything for "unstable"
  [..]
  Choose the suite: # input nothing here, i.e. "unstable"
  Please enter the reason for removal: obsolete package, prevents others from migrating to testing
  Is this removal request for specific architectures? [y|N|?]? n
  [..]
  # An editor will spawn, probably nano. add
  #   X-Debbugs-Cc: pkg-rust-maintainers@alioth-lists.debian.net
  # to the header, and then add the following text to the body:

  Hi, please remove this package on all architectures. It is an old rust library
  that is preventing newer ones from migrating to testing. Nothing else in the
  archive depends on it these days.

  # then save and exit, and proceed with submitting the report.
