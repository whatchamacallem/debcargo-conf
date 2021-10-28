2021-10-28
==========

semver_suffix is broken in debcargo 2.4.4.

There is a fix in debcargo.git master. To use it, first build it then run::

  $ DEBCARGO=$PWD/../debcargo/target/debug/debcargo ./update.sh <args>

or some variation of it, depending on your paths.
