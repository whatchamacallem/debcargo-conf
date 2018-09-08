Instructions
============

To get set up, run::

  apt update && apt build-dep cargo && apt install cargo dh-cargo
  cargo install debcargo # eventually will be replaced by "apt install debcargo"

Then for each new package:

**To package a new crate, or to update an existing crate:**

| $ ``./new-package.sh <rust-crate-name>``, or
| $ ``./update.sh <rust-crate-name>``
|

and follow its instructions.

Note that new-package.sh is just a symlink to update.sh, to help newcomers.

**To package an older version of a crate:**

To maintain an old version of a crate alongside the latest one, first make sure
the latest version is packaged by doing all of the above, then run:

| $ ``./new-package.sh <rust-crate-name> <old-version>``, or
| $ ``./update.sh <rust-crate-name> <old-version>``
|

and follow its instructions. To save time, you can first copy anything relevant
from ``src/<rust-crate-name>`` to ``src/<rust-crate-name>-<old-version>``, then
adapt it as needed.

**To prepare a release:**

| $ ``./release.sh <rust-crate-name>``, or
| $ ``./release.sh <rust-crate-name> <old-version>`` as appropriate
|

This prepares the necessary Debian files in ``build/``, and creates a git
branch to manage the packaging until it is accepted in Debian itself. You need
to run additional commands after this - more specific instructions are given to
you about this, by the script after you run it.


DD instructions
===============

To set up a suitable build environment for ``./release.sh``::

  $ sudo apt-get install devscripts reprepro debootstrap sbuild
  $ sudo sbuild-createchroot --include=eatmydata,ccache,gnupg,dh-cargo,cargo,lintian \
      --chroot-prefix debcargo-unstable unstable \
      /srv/chroot/debcargo-unstable-amd64-sbuild http://deb.debian.org/debian


General packaging tips
======================

Dependencies on clippy
----------------------

Patch away dependencies on "clippy" unless it is a "real" dependency. Usually
crates only use clippy to lint themselves and it is not a "real" dependency
in the sense that they actually import clippy's code for what they do.

If you want to be sure, `rg clippy` and check that all the usages of it are
inside `cfg_attr` declarations. If so, then just get rid of it.

Architecture-specific crates
----------------------------

See simd and redox-syscall for examples on how to deal with these.

If this is unclear, ask on IRC.

ITPs
----

Don't file ITPs for library crates, but do file them for binary crates.

For now (updated 2018-09) we have several hundred crates to upload. Submitting
ITPs for these is unnecessary since we're the only ones uploading and there is
no chance of conflict. It would only be spam for the bug tracker. Please
instead co-ordinate uploads on the #debian-rust IRC channel.


TODO
====

Maybe use ``--copyright-guess-harder``.
