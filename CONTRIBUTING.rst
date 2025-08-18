==========
Sponsoring
==========

Expectations
============

To accept a new package in the Debian archive, we need the following:

1. Clean copyright file
2. Except with very good reasons, it should generate only one Debian package please use ``collapse_features = true`` in debcargo.toml to ensure that
3. No lintian warning except ``initial-upload-closes-no-bugs`` (for libraries) and ``distribution-and-changes-mismatch`` as it will be replaced before upload
4. autopkgtest should be green (or skipped)
5. New binaries should have an open ITP
6. The maintainer should be on IRC: #debian-rust on OFTC
7. If the crate needs dependencies not available yet in Debian, document them in the RFS file
8. If you are asking for sponsoring on an existing key crate, please make sure it isn't breaking a lot of things. If it does, please identify the necessary steps
9. Patience


Ready for upload (Request For Sponsor)
======================================

If you do not have upload rights, simply ``touch src/$crate/debian/RFS`` in
your crate's directory, commit and push it, and a DD or DM will get around to
it at some point. It is also a good idea to send an RFS to the Debian Rust
Team's mailing list to briefly explain that you are looking for a sponsor and
why you want this specific package to be added to Debian. If other details need
to be addressed such as missing dependencies, they can be added as a note to the
RFS file. See above for more details.

Please join the IRC channel #debian-rust on OFTC to be available to answer
to questions. Please monitor the RFS file as the sponsors can use it to
communicate with the maintainer.

If you haven't seen activity for 2 or 3 weeks, feel free to ping sylvestre on the
IRC #debian-rust channel.

If your update breaks semver compatibility, please first check the reverse
dependencies by running::

    $ aptitude search '~Dlibrust-$cratename'

and try to verify that they won't be broken by your update, by building them.
If they are broken, then:

1. Document the problem in ``debian/BLOCK``.
2. File an issue upstream to report that they should update to the new library
3. Write a patch if you can get that working, and document it.


Review list
===========

To list all packages under RFS, run ``dev/list-rfs.sh``.
