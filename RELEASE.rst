Release
=======

For this team's purposes, the job is not done until the package gets into
Debian Testing. This is a rigorous QA process the details of which can be read
about elsewhere. The short version for us, is to run::

  dev/rust-excuses.mk refresh all

which will generate a nice pretty graph of packages trying to enter Debian
Testing, along with their dependencies, and sometimes a colour representing the
reason why it's being held back. (The colours could be more sophisticated,
please help with improving the script. White does not always mean there is no
problem; the excuses page is the authoritative source on the matter.)

Generally, you should look at the bottom-most packages in this diagram, and
deal with their issues first. More details for each package can be found at:

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
