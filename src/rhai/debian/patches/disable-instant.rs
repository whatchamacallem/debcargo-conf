Description: Disable dependency instant
 which is unmaintained with outstanding bug, as reported in #1072807
Last-Update: 2024-06-20
---
This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
--- a/Cargo.toml
+++ b/Cargo.toml
@@ -242,4 +242,4 @@
-stdweb = [
-    "getrandom/js",
-    "instant/stdweb",
-]
+#stdweb = [
+#    "getrandom/js",
+#    "instant/stdweb",
+#]
@@ -251,7 +251,7 @@
-wasm-bindgen = [
-    "getrandom/js",
-    "instant/wasm-bindgen",
-]
-
-[target."cfg(target_family = \"wasm\")".dependencies.instant]
-version = "0.1.10"
+#wasm-bindgen = [
+#    "getrandom/js",
+#    "instant/wasm-bindgen",
+#]
+#
+#[target."cfg(target_family = \"wasm\")".dependencies.instant]
+#version = "0.1.10"
