=================
Crates to package
=================

Eventual goals
==============

Binary crates worth packaging (please add if you know more):

- xsv - Command line program for manipulating CSV files
- process_viewer - Process viewer GUI in rust (GTK)
- cargo-edit - Cargo editing subcommands (add, rm, upgrade)
- exa - Modern replacement for ls
- tmux-hints - Find matches (e.g. urls) and navigate them by keyboard
- grcov - collects and aggregates code coverage information for multiple source files.
- rural - User-friendly command-line HTTP tool
- brewstillery - Brewer's, vinter's and distiller's calculator (GTK).
- jql - JSON Query Language CLI tool.
- recode_rs -  CLI tool converting between the character encodings.
- rusty-tags - Create ctags files for cargo project.
- rustfmt - rust coding style
- bingrep - Grep through binaries from various OSs and architectures.

To see lists of interesting binary crates, you can run something like::

  $ apt-get install koji-client
  $ koji -p fedora search package 'rust-*' | cut -b6- | dev/filter-binary-crates.sh

Current output (on 2018-07-08) is:

- aho-corasick
- docopt
- exa
- cpp_demangle
- permutate
- cbindgen
- rustdoc-stripper
- difference
- pretty-git-prompt
- peg
- varlink
- varlink-cli

Sccache is also helpful for reducing the build-time of things like firefox and thunderbird

- sccache https://github.com/mozilla/sccache

There are also more binaries here:

https://github.com/rust-unofficial/awesome-rust

Immediate goals
===============

The lists below are calculated using some combinations of running::

  tests/sh/cargo-tree-deb-rec <binary-crate>

from the ``debcargo.git`` repository.


Remove old libraries
--------------------

Should file a RM request to ftpmasters for these old crates:

- syntex-* were uploaded by mistake, only rustfmt 0.10 (obsolete version) depends on them
- crossbeam-utils-0.2, no longer needed


Ready for upload (Request For Sponsor)
--------------------------------------

When adding a package here, and it involves updating an existing package in a
semver-incompatible way, please check the reverse dependencies by running::

    $ aptitude search '~Dlibrust-$cratename'

and try to verify that they won't be broken by your update. If they are, then:

1. Document it below ("Delayed/problematic")
2. File an issue upstream to report that they should update to the new library
3. Write a patch if you can get that working, and document it also below.

These packages (RFS) are prepared in the master branch and can be uploaded
because all required dependencies are available in main::

    gdk-sys
    gdk-pixbuf
    pcre2
    sniffglue (update, bugfix - need better changelog)
    encoding-rs (update)
    cmake (update)
    discard (update)
    cfg-if (update)
    backtrace-sys (update)
    serde (update)
    byteorder (update)
    encoding-rs (update)
    block-padding (update)
    quickcheck (update)
    syn (update)
    serde-json (update)
    simd (update)
    smallvec (update)
    spin (update)
    tar (update)

Delayed/problematic::

    flate2 (update) -- waiting on crc32fast in NEW
    md5 (update) -- affects uuid
    tokio-executor (update), tokio-timer (update)
        latest versions needs crossbeam-utils 0.6, see below
    crossbeam-utils (update 0.5 → 0.6)
        too much other stuff depends on crossbeam-utils 0.5, so that is now in NEW
        this can be updated to 0.6 when crossbeam-utils-0.5 passes NEW
    grep
        pcre2 feature depends on grep-pcre2 -> pcre2 -> pcre2-sys
    gcc-0.3.54 -- don't need this, completely obsoleted by cc.
        patch dependents to use cc instead.
    winutil -- dependency of hostname <- resolv-conf <- trust-dns-resolver
        doesn't build on linux

    parking_lot (blocked by lock_api)
    indicatif (blocked by parking_lot)
    statistical (blocked by num & co)
    hyperfine (blocked by indicatif & statistical)


Unblocking testing migrations
-----------------------------

Packages that are unblocked by uploads in NEW::

    cc (cmake, nix, ctrlc, os-pipe, sha2-asm, most *-sys crates)
        rayon (NEW)
    rand (jobserver, tempfile)
        stdweb
            stdweb-internal-macros (TODO)
    clap (ripgrep, structopt)
        yaml-rust (NEW)
        text-wrap
            hyphenation
                hyphenation_commons (NEW)

Unblocking crate updates
------------------------

Updates that require updates of other packages::

    env_logger (update to 0.5.13)
    ignore (update to 0.4.4)


All-features transitive dependencies of ripgrep
-----------------------------------------------

These are NOT needed to build ripgrep (we only test that `cargo build` works
with default features) but *are* needed for ripgrep to enter testing. They are
all of the transitive build-dependencies of *all the features* of ripgrep.

Top-level page: https://qa.debian.org/excuses.php?package=rust-ripgrep

- hyphenation, needed by
    https://qa.debian.org/excuses.php?package=rust-textwrap
    pocket-resources
    hyphenation-commons
      - still using a ton of old libraries like serde 0.8 with a bigger tree underneath
      - https://github.com/tapeinosyne/hyphenation/issues/12
    unicode-segmentation
- yaml-rust, needed by
    https://qa.debian.org/excuses.php?package=rust-clap
    also linked-hash-map as a dependency of this

dependencies of ripgrep 0.10
----------------------------

ripgrep needs ignore => crossbeam-channel (NEW)

dependencies of mdbook/exa
--------------------------

tldr: zoneinfo_compiler needs datetime
datetime needs iso8601 (in NEW)
We will need to update some versions of the dep. Besides that, we should be good.

To regenerate the below list; run something like::

    for c in <CRATES>; do \
      debcargo.git/tests/sh/cargo-tree-deb-rec $c; done \
    | sed -e 's/ v/ /g' \
    | dev/filter-semver.sh \
    | awk '!x[$0]++' \
    | dev/filter-in-debian.sh \
    | sed -nre 's/(.*) 0$/\1/gp'

Results as of 2018-08-03::

    winapi 0.2
    pad 0.1
    num-traits 0.1
    nom 1
    locale 0.2 - pending
    kernel32-sys 0.2
    iso8601 0.1 - blocked by https://github.com/badboy/iso8601/pull/19
    datetime 0.4 - blocked by iso8601
    byteorder 0.4
    zoneinfo_compiled 0.4 - blocked by datetime
    utf8-ranges 0.1
    users 0.5
    thread-id 2 - pending
    thread_local 0.2
    regex-syntax 0.3
    memchr 0.1
    aho-corasick 0.5
    regex 0.1
    log 0.3
    libgit2-sys 0.6
    lazy_static 0.2
    libssh2-sys 0.2
    curl-sys 0.4
    bitflags 0.9
    git2 0.6
    env_logger 0.3
    ansi_term 0.8
    exa 0.8
    ws2_32-sys 0.2
    slab 0.3
    miow 0.2
    lazycell 0.6
    iovec 0.1
    mio 0.6
    bytes 0.4
    ws 0.7
    traitobject 0.1
    unsafe-any 0.4
    unicode-xid 0.0
    unicase 1
    typemap 0.3
    typeable 0.1
    backtrace-sys 0.1
    backtrace 0.3
    error-chain 0.12
    toml-query 0.7
    new_debug_unreachable 1
    mac 0.1
    futf 0.1
    tendril 0.4
    synom 0.11
    proc-macro2 0.3
    quote 0.5
    syn 0.13
    quote 0.3
    syn 0.11
    strum_macros 0.9
    strum 0.9
    phf_shared 0.7
    phf_generator 0.7
    string_cache_codegen 0.4
    precomputed-hash 0.1
    string_cache 0.7
    sequence_trie 0.3
    safemem 0.2
    plugin 0.2
    phf_codegen 0.7
    phf 0.7
    modifier 0.1
    mime 0.2
    mime_guess 1
    base64 0.6
    hyper 0.10
    iron 0.6
    mount 0.4
    staticfile 0.5
    slab 0.1
    pulldown-cmark 0.1
    pest 1
    pest_derive 1
    open 1
    bitflags 0.4
    nix 0.5
    miow 0.1
    bytes 0.3
    mio 0.5
    inotify 0.3
    fsevent-sys 0.1
    bitflags 0.7
    fsevent 0.2
    filetime 0.1
    notify 4
    markup5ever 0.7
    maplit 1
    html5ever 0.22
    handlebars 0.32
    rust-stemmers 1
    elasticlunr-rs 2
    ammonia 1
    mdbook 0.2

dependencies of sniffglue
-------------------------

Status as of 2018-10-16::

    digest 0.8 -- NEW
    block-buffer 0.7 -- NEW
    tls-parser 0.6 -- NEW
    sha2 0.7 -- blocked by block-buffer, digest
