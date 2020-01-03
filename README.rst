Instructions
============

To get set up, run::

  apt update && apt install debcargo

Then for each new package:

To package a new crate, or to update an existing crate
------------------------------------------------------

::

  ./new-package.sh <rust-crate-name>  # or
  ./update.sh      <rust-crate-name>

and follow its instructions.

Note that ``new-package.sh`` is just a symlink to ``update.sh``, to help newcomers.

To package an older version of a crate
--------------------------------------

To maintain an old version of a crate alongside the latest one, first make sure
the latest version is packaged by doing all of the above, then run::

  ./new-package.sh <rust-crate-name> <old-version>  # or
  ./update.sh      <rust-crate-name> <old-version>

and follow its instructions. To save time, you can first copy anything relevant
from ``src/<rust-crate-name>`` to ``src/<rust-crate-name>-<old-version>``, then
adapt it as needed.

To prepare a release
--------------------

::

  ./release.sh <rust-crate-name>                     # or
  ./release.sh <rust-crate-name> <old-version>       # as appropriate
  DISTRO=experimental ./release.sh <rust-crate-name> # to target another distro

This prepares the necessary Debian files in ``build/``, and creates a git
branch to manage the packaging until it is accepted in Debian itself. You need
to run additional commands after this - more specific instructions are given to
you about this, by the script after you run it.

Holding packages at old versions
--------------------------------

If you need to keep the latest version in Debian at an older version than is
released on crates.io, e.g. to upload an important bugfix without being blocked
on having to package all the dependencies of the newest version, you can::

  REALVER=<old-version> ./update.sh  <rust-crate-name>  # then
  REALVER=<old-version> ./release.sh <rust-crate-name>

Repackaging the existing revision
---------------------------------

In order to build a package A already in ``debcargo-conf/src``
in the exact version which is present here, do the following::

  $ ./repackage.sh A
  $ cd build
  $ ./build.sh A

If this package is already in the archive and you want to recreate that
exactly, you will need to use the exact same version of debcargo that was
used previously. This version is mentioned in ``debian/changelog``.


Repository structure
====================

`pending-*` branches are managed by `./release.sh`, so please don't manage them
yourself as you will interfere with the working of that script. The intention
is that they should only differ from the master branch by 1 commit, i.e. the
`dch -r` commit created by `./release.sh`.

If you want to create separate non-master branches, that is fine - just don't
call them `pending-*` and don't run `./release.sh` on those branches. If you
want to test your crate, instead run::

  cd build && [SOURCEONLY=1] ./build.sh <rust-crate-name> [<old-version>]

omitting or not omitting the stuff in [] as needed.


Build environment
=================

To set up a suitable build environment for ``./build.sh``::

  $ sudo apt-get install devscripts reprepro debootstrap sbuild dh-cargo
  $ sudo sbuild-createchroot --include=eatmydata,ccache,gnupg,dh-cargo,cargo,lintian,perl-openssl-defaults \
      --chroot-prefix debcargo-unstable unstable \
      /srv/chroot/debcargo-unstable-amd64-sbuild http://deb.debian.org/debian

Normally, ``./build.sh`` will fail early if not all the build dependencies are
available in your local apt cache. If you are packaging a large dependency tree
however, to avoid many round-trips through NEW it is possible to bypass this
check and build all the packages together. Suppose package B depends on package
A, then you can run something like::

  $ export IGNORE_MISSING_BUILD_DEPS=1
  $ ./release.sh A
  $ ( cd build && ./build.sh A )
  # push pending and checkout master
  $ ./release.sh B
  $ ( cd build && ./build.sh B librust-A*.deb )

The extra arguments after ``./build.sh B <args>`` is extra deb files to pass to
sbuild to use as dependencies. In this case, ``librust-A*.deb`` should have
been built by the previous step.

After everything is built successfully, you can ``dput`` all of them and then
push all the ``pending-*`` branches as normal.


General packaging tips
======================

Dependencies on clippy
----------------------

Patch away dependencies on "clippy" unless it is a "real" dependency. Usually
crates only use clippy to lint themselves and it is not a "real" dependency
in the sense that they actually import clippy's code for what they do.

If you want to be sure, `rg clippy` and check that all the usages of it are
inside `cfg_attr` declarations. If so, then just get rid of it.

OS-specific crates
------------------

See redox-syscall for examples on how to deal with these.

If this is unclear, ask on IRC.

Architecture-specific crates
----------------------------

This is a bit harder. Usually there are two options:

1. The crate should build a dummy/no-op version of itself "out-of-the-box"
   on the architectures it doesn't work on.
2. Dependent crates should depend on it with a platform-specific dependency,
   see https://doc.rust-lang.org/cargo/reference/specifying-dependencies.html#platform-specific-dependencies

(1) involves less burden for others, both for dependent crates and for us
packagers, since we don't have to override d/rules to ignore test failures on
non-working architectures. You should communicate to upstream that this is
the preferred approach.

In the case of (2), the crate should document exactly what conditional should
be used, and keep this documentation up-to-date. This allows us to easily
determine if dependent crates are using the correct conditional. You will then
have to override d/rules for this crate, see src/simd for an example.

You should file a bug upstream if the crate does neither (1) nor document the
conditions for (2), e.g. https://github.com/hsivonen/simd/issues/25

(Actually the above applies even for "OS-specific crates" but then (2) is
obvious so documentation is less necessary, and dependent crates all do it
correctly already.)

Changed orig tarballs
---------------------

Sometimes the orig.tar generated by debcargo might change e.g. if you are using
a newer version of debcargo and one of the dependencies relating to generating
the tarball was updated and its behaviour changed - compression settings,
tarball archive ordering, etc. This will cause your upload to get REJECTED by
the Debian FTP archive for having a different orig.tar. In this case, set
REUSE_EXISTING_ORIG_TARBALL=1 when running ``./release.sh``.

ITPs
----

Don't file ITPs for library crates, but do file them for binary crates.

For now (updated 2018-09) we have several hundred crates to upload. Submitting
ITPs for these is unnecessary since we're the only ones uploading and there is
no chance of conflict. It would only be spam for the bug tracker. Please
instead co-ordinate uploads on the #debian-rust IRC channel.

Testing
-------

For now, testsuites aren't executed for library.
However, for binary, it is strongly recommended to run the testsuites.
See ripgrep as example.

Binary-crate has "required-features"
------------------------------------

See ``src/dotenv`` for an example on dealing with this.

Binary-crate has conflicting name
---------------------------------

See ``src/fd-find`` for an example on dealing with this.

Updating the dependencies
-------------------------

In some cases, libraries/programs are forcing an old version of a library as
dependencies. In order to limit the number of duplicated libraries in the
archive, please try to evaluate if a newer version of the dependencies could be
used.

To achieve that, after ./update.sh, try::

  $ cd build/<package>/
  $ rm -rf .pc # sometimes this is necessary due to minor debcargo bug
  $ quilt push -a
  $ quilt new relax-dep.diff
  $ quilt edit Cargo.toml
  $ quilt refresh
  $ cargo build # check that it works. if it does, then
  $ cp -R patches ../../src/<package>/debian

Suppose you want to change the dependency from 0.3 to 0.5. If the crate builds
with no further source changes, then we would change the required version in
``Cargo.toml`` from ``0.3`` to ``>= 0.3, < 0.6`` or something like that. Then
the convention is to put all these changes into a single patch called
``relax-dep-versions.patch``.

OTOH, if the cargo build fails, and you can fix it up by editing the source
code in a minor way to use the new crate API, then: for each crate that needs
to be updated, you should instead name the patch ``update-dep-<crate>.patch``
and add both the ``Cargo.toml`` and the source code changes to it. Use
``quilt rename`` if that helps you.
