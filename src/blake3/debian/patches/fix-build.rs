Description: debianize

Last-Update: 2020-12-18

Index: rust-blake3-1.2.0/build.rs
===================================================================
--- rust-blake3-1.2.0.orig/build.rs
+++ rust-blake3-1.2.0/build.rs
@@ -146,6 +146,7 @@ fn build_sse2_sse41_avx2_assembly() {
     println!("cargo:rustc-cfg=blake3_sse2_ffi");
     println!("cargo:rustc-cfg=blake3_sse41_ffi");
     println!("cargo:rustc-cfg=blake3_avx2_ffi");
+    println!("dh-cargo:deb-built-using=blake3_sse2_sse41_avx2_assembly=0={}", env::var("CARGO_MANIFEST_DIR").unwrap());
     let mut build = new_build();
     if is_windows_msvc() {
         build.file("c/blake3_sse2_x86-64_windows_msvc.asm");
@@ -170,6 +171,7 @@ fn build_avx512_c_intrinsics() {
     // This is required on 32-bit x86 targets, since the assembly
     // implementation doesn't support those.
     println!("cargo:rustc-cfg=blake3_avx512_ffi");
+    println!("dh-cargo:deb-built-using=blake3_avx512_intrinsics=0={}", env::var("CARGO_MANIFEST_DIR").unwrap());
     let mut build = new_build();
     build.file("c/blake3_avx512.c");
     if is_windows_msvc() {
@@ -190,6 +192,7 @@ fn build_avx512_assembly() {
     // only supports x86_64.
     assert!(is_x86_64());
     println!("cargo:rustc-cfg=blake3_avx512_ffi");
+    println!("dh-cargo:deb-built-using=blake3_avx512_assembly=0={}", env::var("CARGO_MANIFEST_DIR").unwrap());
     let mut build = new_build();
     if is_windows_msvc() {
         build.file("c/blake3_avx512_x86-64_windows_msvc.asm");
@@ -223,6 +226,7 @@ fn build_neon_c_intrinsics() {
         build.flag("-mfloat-abi=hard");
     }
     build.compile("blake3_neon");
+    println!("dh-cargo:deb-built-using=blake3_neon=0={}", env::var("CARGO_MANIFEST_DIR").unwrap());
 }
 
 fn main() -> Result<(), Box<dyn std::error::Error>> {
