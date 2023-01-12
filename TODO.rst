===============
Immediate goals
===============

See end of this document for "eventual goals".


Remove old libraries
====================

Should file a RM request to ftpmasters for these old crates:

No old crates, yay !


Unblocking testing migrations
=============================

Run ``dev/rust-excuses.mk refresh all`` to see these in a nice graph.

Run ``dev/rust-regressions.sh`` to analyse autopkgtest regressions.

From the excuses graph, find the lowest crates i.e. those with no arrows going
outwards to other crates. Then run ``dev/list-rdeps.sh @ $lowest_crotes`` to
see which of its rdeps are broken, and need to be fixed.


New packages
============

Use ``dev/list-remaining-deps.sh`` to help you figure out what's missing.

rustfmt-nightly
---------------

* rustc-ap-syntax
  * rustc-ap-rustc_data_structures (prepared)
    * rustc-ap-graphviz (needs nightly)
    * rustc-ap-rustc-cratesio-shim (needs nightly)
  * rustc-ap-rustc-errors (depends on the rest of the list here)
  * rustc-ap-rustc-target
  * rustc-ap-serialize (to be uploaded, dep issue?!)
  * rustc-ap-syntax-pos
  * rustc-ap-serialize (fails because of usage of nightly feature)

bat update
----------

syntect is in debian 
Needs syntect => onig => onig-sys => bindgen 0.55 (for librust-bindgen-0.51+runtime-dev)
Disabling syntect in bat causes:
error[E0433]: failed to resolve: use of undeclared type or module `syntect`
 --> src/terminal.rs:4:5


bingrep
-------

* hexplay
* metagoblin

tokei
-----

needs handlebars
which needs pest
which needs ucd-trie

librsvg
-------

see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=907629

[ ] alga
[ ] c_vec
[x] criterion
[ ] downcast-rs
[ ] handlebars
[ ] itertools-num
[ ] matrixmultiply
[ ] nalgebra
[ ] num-traits-0.1.43
[ ] pest_derive
[ ] quote-0.3.15
[ ] rand-0.4.2
[ ] rawpointer
[ ] syn-0.11.11
[ ] synom
[ ] unicode-xid-0.0.4
[x] clap v4
[ ] GTK related packages


bench
-----

* packageable

rustup (#1026333)
------

* rustup (not available as a crate)
 * git-testament (NEW)
 * xz2 (NEW)
 * download (private crate) (needs patched out reqwest features) 
 
 
tokio/futures/hyper with async/await
------------------------------------

*dependency tree*

* futures 0.3.4
   * futures-executor 0.3.4
   * futures-util 0.3.4
      * futures-task 0.3.4
      * futures-channel 0.3.4
         * futures-core 0.3.4
         * future-sink 0.3.4
      * futures-io 0.3.4
      * futures-macro 0.3.4
      * pin-utils 0.1.0-alpha.4
      * proc-macro-nested 0.1.3

* tokio-macros 0.2.3

* tokio 0.2.10
   * bytes 0.5.3 (outdated)
   * futures-core 0.3.4 (see above)
   * pin-project-lite 0.1.1
   * tokio-macros 0.2.3

* tokio-tls 0.3.0
   * tokio 0.2.10 (+ subset of dependencies)

* tokio-util 0.2.0
   * tokio 0.2.10 (+ subset of dependencies)
   * futures-sink 0.3.4 (see above)

* hyper 0.13.1
   * futures-* 0.3.4 (see above)
   * h2 0.2.1
      * futures-* 0.3.4 (see above)
      * http 0.2.0
         * bytes 0.5.3 (needed for tokio anyway)
      * tokio 0.2.10 (see above)
      * tokio-util 0.2.0 (see above)
   * http-body 0.3.4
      * http 0.2.0 (+ deps)
   * pin-project 0.4.7
      * pin-project-internal 0.4.7
   * tokio 0.2.10 (see above)
   * tower-service 0.3.0
   * want 0.3.0
   * mio 0.6.21
   * iovec 0.1.4

*rdeps outside of tokio/futures/hyper*

* bcder (recently packaged, not yet compatible with bytes 0.5)
* bufstream (dead upstream, no rdeps)
* bzip2 (no upstream support yet, no rdeps for future/tokio features)
* flate2 (no upstream support (yet), no rdeps for future/tokio features)
* gstreamer-* (new upstream version is compatible, updated, no non-gstreamer rdeps, needs glib update, which triggers:
   * atk
   * cairo-rs
   * gdk
   * gdk-pixbuf
   * gio
   * gtk
   * pangocairo
   * pango
   * and their respective sys crates
* mio-extras (no rdeps, compatible)
* mio-named-pipes (no rdeps except tokio-process, compatible)
* mio-uds (rdeps: signal-hook, tokio-uds, tokio-signal)
* pcap (no rdeps, can be dropped)
* reqwest (updated, needs updated hyper-tls, new wasm-bindgen-futures, updated web-sys/js-sys/webasm)
* signal-hook (updated version not yet released, single rdep "tokio-signal" got merged into tokio and only uses signal-hook-registry now -> patched to remove dependency)
* string (relaxed dep on bytes)
* want (updated)

*old crates to be removed*

* futures-cpupool (no rdeps outside of futures/tokio/hyper, merged into futures-executor)
* tokio-async-await (merged into tokio-macros)
* tokio-buf (dropped upstream, rdeps no longer need it after updating)
* tokio-codec (merged into tokio-util)
* tokio-core (only 1 rdep: pcap, can be dropped after pcap was dropped, merged into tokio)
* tokio-current-thread (merged into tokio)
* tokio-executor (merged into tokio)
* tokio-fs (merged into tokio)
* tokio-io (merged into tokio, see above for rdeps bufstream, bzip2, flate2)
* tokio-process (merged into tokio)
* tokio-reactor (renamed to tokio-net, merged into tokio, see above for rdep signal-hook)
* tokio-signal (merged into tokio)
* tokio-sync (merged into tokio)
* tokio-tcp (merged into tokio)
* tokio-threadpool (merged into tokio)
* tokio-timer (merged into tokio)
* tokio-uds (merged into tokio)
* tokio-udp (merged into tokio)

*incompatible rdeps with no further rdeps, dead upstream, to be removed*

* pcap (replaced by pcap-sys)
* bufstream: https://github.com/alexcrichton/bufstream/issues/13

*NEW, installable as-is*

* pin-utils (NEW)
* proc-macro-nested (NEW)
* futures-sink
* futures-task
* futures-io
* futures-macro
* tokio-macros
* pin-project-lite
* tower-service (NEW)
* pin-project-internal + pin-project
* paste-impl (NEW) + paste
* webasm-bindgen-futures

*NEW, with dependency within transition*

* futures-channel (after futures-core/futures-sink)
* futures-util (after futures-channel, proc-macro-nested, pin-utils)
* futures-executor (after futures-core, futures-task, futures-util)
* tokio-tls (after tokio)
* tokio-util (after tokio, bytes, futures-core, futures-sink, pin-project-lite)


clap v2 dependency list 
-----------------------
structopt used clap v2
dotenv is unmaintained and superseded by dotenvy which uses clap v3; 
hexyl uses clapv4
sniffglue, git-absorb, sha1collision, gcov, libslirp and cargo-binutils depend on structopt
rav1e uses also clap4


GTK stack dependency tree
-------------------------

* ???
 * gobject-sys
  * glib-sys
    * system-deps

cxx depedency tree
-----------------

* cxx (level 2)
 * cxx-build (level 1)
 * cxx-gen (level 1)
 * cxxbridge-macros (level 1)
 * cxxbridge-flags (level 1)
 * link-cplusplus (level 1)

matrix-sdk dependency tree
--------------------------

* matrix-sdk
 * ruma
  * ruma-appservice-api
  * ruma-state-res
  * ruma-signatures
  * ruma-push-gateway-api
  * ruma-identity-service-api
  * ruma-federation-api
  * ruma-client
  * ruma-client-api
  * ruma-common
   * ruma-macros
   * ruma-identifiers-valiadation

fractal (#900928)
-------

* gspell
   * gspell-sys
* gstreamer-editing-services
* gstreamer-player
* matrix-sdk (WIP)
* comrak
* sourceview4
* ashpd crates

obfuscate
---------

* libadwaita

podcasts (#965044)
--------

* gstreamer-player
* mpris-player (broken)

gping (#975495)
-------

* Ready for upload

lfs (#1006367)
-------

* argh
 * argh-derive
* termimad
 * coloor
 * minimad (merged)

cargo debstatus (#1026852)
------

* postgres (merged)

bottom
-------

* no missing deps, waiting on upstream to drop heim
* TODO: file ITP

macchina
------
* ansi-to-tui (merged)
* color-to-tui (merged)
* libmacchina
 * sqlite
  * sqlite-sys (merged)
   * sqlite-src (merged)
   
shortwave (#951166)
-------

* libadwaita
* mdns (merged)
* libshumate
* asnyc-std-resolver (NEW)
* mpris-player ( deprecated, fails to build against newer dbus)

popsicle (#1007982)
------

* dbus-udisks (NEW)
* srmv
 * genawaiter (merged)
* sys-mount (needs rustc 1.65)
* pwd (upstream license issues :( )
* iso9660 (broken)
* i18n-embed-fl
 * i18n-embed
  * i18n-embed-impl (NEW)

==============
Eventual goals
==============

Binary crates worth packaging (please add if you know more):


- asus-ctl - control asus laptops (https://gitlab.com/asus-linux/asusctl)
- bench - simple benchmarking
- bingrep - Grep through binaries from various OSs and architectures.
- bottom - Cross-platform monitoring tool (https://github.com/ClementTsang/bottom)
- cargo-deb - Create Debian packages from Cargo projects
- cargo-debstatus - Print the status of crate’s dependencies in Debian
- cargo-download - Download sources of a crate
- cargo-edit - Cargo editing subcommands (add, rm, upgrade)
- diskonaut - interactive disk usage tui tool
- hg - Rust implement of hg
- jql - JSON Query Language CLI tool.
- macchina - fetch CLI tool (https://github.com/Macchina-CLI/macchina)
- meli - terminal mail client (https://meli.delivery/)
- recode_rs - CLI tool converting between the character encodings.
- resvg - SVG renderer (in Debian; packaged separately, but doesn’t build anymore)
- rural - User-friendly command-line HTTP tool
- rust-analyzer - modular rust compiler frontend with LSP
- rustfmt-nightly - rust coding style
- rustup - installing and managing multiple rust toolchains
- tmux-hints - Find matches (e.g. urls) and navigate them by keyboard
- viu - Command-line image viewer
- xsv - Command line program for manipulating CSV files
- zola - static site generator (https://www.getzola.org/)

GUI GTK-based programs:

- authenticator - 2FA program (GTK/libadwaita, https://gitlab.gnome.org/World/Authenticator)
- amberol - simple music player (GTK/libadwaita, https://gitlab.gnome.org/World/Amberol)
- brewstillery - Brewer's, vinter's and distiller's calculator (GTK).
- decoder - qr code reader (GTK/libadwaita, https://apps.gnome.org/app/com.belmoussaoui.Decoder/)
- fractal - Matrix messaging client (GTK, https://wiki.gnome.org/Apps/Fractal)
- fragments - bittorrent client (GTK/libadwaita, https://apps.gnome.org/de/app/de.haeckerfelix.Fragments/)
- health - health tracking app (GTK/libadwaita, https://apps.gnome.org/de/app/dev.Cogitri.Health/)
- kooha - screen recorder (GTK/libadwaita, https://github.com/SeaDve/Kooha)
- mousai - song recognition (GTK/libadwaita, https://apps.gnome.org/de/app/io.github.seadve.Mousai/)
- obfuscate - censor private information (GTK/libadwaita, https://apps.gnome.org/de/app/com.belmoussaoui.Obfuscate/)
- pika-backup - backup program (GTK/libadwaita, https://apps.gnome.org/de/app/org.gnome.World.PikaBackup/)
- podcasts - Podcasts app (GTK, https://wiki.gnome.org/Apps/Podcasts)
- popsicle - USB flasher (GTK, https://github.com/pop-os/popsicle)
- shortwave - Internet radio client (GTK, https://gitlab.gnome.org/World/Shortwave)
- spot - spotify client (GTK/libadwaita, https://github.com/xou816/spot)
- system-76-power - manage power profiles (https://github.com/pop-os/system76-power)
- video-trimmer - Trim videos (GTK/libadwaita, https://gitlab.gnome.org/YaLTeR/video-trimmer)

To see lists of interesting binary crates, you can run something like::

  $ apt-get install koji-client
  $ koji -p fedora search package 'rust-*' | cut -b6- | dev/filter-binary-crates.sh

Current output (on 2020-01-17), minus stuff already in Debian, is:

  afterburn
  alloc-no-stdlib
  alloc-stdlib
  askalono-cli
  brotli
  brotli-decompressor
  cargo-c
  comrak
  coreos-installer
  ffsend
  heatseeker
  jql
  lsd
  multipart
  open
  permutate
  pretty-git-prompt
  qrcode
  skim
  starship
  varlink-cli
  varlink_generator

koji-client seems to be not available in testing/unstable (2022-12-25).

Sccache is also helpful for reducing the build-time of things like firefox and thunderbird

- sccache https://github.com/mozilla/sccache

In debian :)

There are also more binaries here:

https://github.com/rust-unofficial/awesome-rust
