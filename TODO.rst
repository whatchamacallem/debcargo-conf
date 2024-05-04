===============
Immediate goals
===============

See end of this document for "eventual goals".


Remove old libraries
====================

Should file a RM request to ftpmasters for these old crates:

- wayland-commons after the 0.30 wayland stack is uploaded


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

note: (stable) rustfmt is shipped as part of src:rustc nowadays..

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

* metagoblin

tokei
-----

needs handlebars
which needs pest
which needs ucd-trie

librsvg
-------

see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=907629  



bench
-----

* packageable

cargo-deb
----------------

* should be packagable


clap v2 dependency list 
-----------------------
structopt used clap v2
dotenv is unmaintained and superseded by dotenvy which uses clap v3; 
hexyl uses clapv4
sniffglue, git-absorb, sha1collision, gcov, libslirp and cargo-binutils depend on structopt
rav1e uses also clap4


GTK stack dependency tree
-------------------------

Since every gtk-rs release is versioned and a lot of crates are affected updating it is a lot of work and only be done if neccessary.
I made this convienient dependency tree to illustrate how to update. You should start at the top and update all sys-crates first.
Then update the regular crates, also from top to bottom. For convinience pass the debs along like this: `./build.sh gstreamer-sys *.deb`.

**Never update just one single package or just some part of this stack! Check if it can be bumped safely!**


sys crate overview
 

* glib-sys
* gobject-sys, cairo-sys-rs, graphene-sys, gdk4-wayland-sys -> need glib-sys
* gio-sys, gstreamer-sys, pango-sys -> need gobject-sys
* pangocairo-sys -> needs cairo-sys-rs and pango-sys
* gdk-pixbuf-sys  -> needs gio-sys
* gdk4-sys -> needs gdkx11-sys
* gdk4-x11-sys -> needs gdk-4-sys
* gsk4-sys -> needs gdk-x11-sys
* gtk4-sys -> needs gsk-4-sys
* libadwaita-sys, libshumate-sys -> need gtk4-sys

* gstreamer-sys -> needs gio-sys
* gstreamer-audio-sys -> gstreamer-sys
* gstreamer-video-sys -> gstreamer-sys
* gstreamer-pbutils-sys -> gstreamer-audio-sys
* gstreamer-play-sys -> gstreamer-video-sys


Non-sys crate overview

* glib -> glib-macros, glib-sys, gobject-sys, gio-sys

* gio -> glib, gio-sys
* graphene-rs -> glib, graphene-sys
* cairo-rs -> freetype-rs, cairo-rs-sys, glib

* pangocairo -> glib, cairo-rs, pango, pangocairo-sys
* pango -> glib, gio, pango-sys
* gdk-pixbuf -> gio, glib,  gdk-pixbuf-sys

* gdk4 -> cairo-rs, gio, glib, pango, gdk-pixbuf, gdk4-sys
* gdk4-x11 -> gdk4
* gsk -> gdk4
* gdk4-x11 -> gdk4
* gdk4-wayland -> gdk4
* gtk4 -> cairo-rs, gdk4, gdk-pixbuf, gtk4-sys, gtk4-macros, graphene-rs

* gstreamer -> glib
* gstreamer-base -> gstreamer
* gstreamer-video -> gstreamer-base
* gstreamer-audio -> gstreamer-audio
* gstreamer-play -> gstreamer-video
  
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
* ???
* matrix-sdk (WIP)
* sourceview5


podcasts (#965044)
--------
 * can be packaged


lfs (#1006367)
-------

* termimad
 * minimad (merged)



macchina
------
* color-to-tui (merged)
* libmacchina
 * sqlite
  * sqlite-sys (merged)
   * sqlite-src (merged)
   
shortwave (#951166)
-------

* waiting for upstream to switch to mpris-server

popsicle (#1007982)
------

* srmv
 * genawaiter (merged)
* sys-mount (needs rustc 1.65)
* pwd (upstream license issues :(  )
* iso9660 (broken)


==============
Eventual goals
==============

Binary crates worth packaging (please add if you know more):


- asus-ctl - control asus laptops (https://gitlab.com/asus-linux/asusctl)
- bench - simple benchmarking
- bingrep - Grep through binaries from various OSs and architectures.
- cargo-deb - Create Debian packages from Cargo projects
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
- tmux-hints - Find matches (e.g. urls) and navigate them by keyboard
- viu - Command-line image viewer
- xsv - Command line program for manipulating CSV files
- zola - static site generator (https://www.getzola.org/)

GUI GTK-based programs:

- authenticator - 2FA program (GTK/libadwaita, https://gitlab.gnome.org/World/Authenticator)
- brewstillery - Brewer's, vinter's and distiller's calculator (GTK).
- decoder - qr code reader (GTK/libadwaita, https://apps.gnome.org/app/com.belmoussaoui.Decoder/)
- fractal - Matrix messaging client (GTK, https://wiki.gnome.org/Apps/Fractal)
- fragments - bittorrent client (GTK/libadwaita, https://apps.gnome.org/de/app/de.haeckerfelix.Fragments/)
- health - health tracking app (GTK/libadwaita, https://apps.gnome.org/de/app/dev.Cogitri.Health/)
- kooha - screen recorder (GTK/libadwaita, https://github.com/SeaDve/Kooha)
- mousai - song recognition (GTK/libadwaita, https://apps.gnome.org/de/app/io.github.seadve.Mousai/)
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
