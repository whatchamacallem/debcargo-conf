==========
Sponsoring
==========


Ready for upload (Request For Sponsor)
======================================

If you do not have upload rights, simply ``touch src/$crate/debian/RFS`` in
your crate's directory, commit and push it, and a DD or DM will get around to
it at some point.

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
