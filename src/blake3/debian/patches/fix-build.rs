Description: debianize

Last-Update: 2020-12-18

--- rust-blake3-0.3.7.orig/build.rs
+++ rust-blake3-0.3.7/build.rs
@@ -134,6 +134,7 @@ fn build_sse2_sse41_avx2_assembly() {
     println!("cargo:rustc-cfg=blake3_sse2_ffi");
     println!("cargo:rustc-cfg=blake3_sse41_ffi");
     println!("cargo:rustc-cfg=blake3_avx2_ffi");
+    println!("dh-cargo:deb-built-using=blake3_sse2_sse41_avx2_assembly=0={}", env::var("CARGO_MANIFEST_DIR").unwrap());
     let mut build = new_build();
     if is_windows_msvc() {
         build.file("c/blake3_sse2_x86-64_windows_msvc.asm");
@@ -178,6 +179,7 @@ fn build_avx512_assembly() {
     // only supports x86_64.
     assert!(is_x86_64());
     println!("cargo:rustc-cfg=blake3_avx512_ffi");
+    println!("dh-cargo:deb-built-using=blake3_avx512_assembly=0={}", env::var("CARGO_MANIFEST_DIR").unwrap());
     let mut build = new_build();
     if is_windows_msvc() {
         build.file("c/blake3_avx512_x86-64_windows_msvc.asm");
