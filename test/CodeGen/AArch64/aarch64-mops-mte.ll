; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py

; RUN: llc %s -o - -mtriple=aarch64-arm-none-eabi -O0 -global-isel=1 -global-isel-abort=1 -mattr=+mops,+mte  | FileCheck %s --check-prefix=GISel-O0
; RUN: llc %s -o - -mtriple=aarch64-arm-none-eabi     -global-isel=1 -global-isel-abort=1 -mattr=+mops,+mte  | FileCheck %s --check-prefix=GISel
; RUN: llc %s -o - -mtriple=aarch64-arm-none-eabi -O2 -mattr=+mops,+mte  | FileCheck %s --check-prefix=SDAG

declare i8* @llvm.aarch64.mops.memset.tag(i8*, i8, i64)

define i8* @memset_tagged_0_zeroval(i8* %dst, i64 %size) {
; GISel-O0-LABEL: memset_tagged_0_zeroval:
; GISel-O0:       // %bb.0: // %entry
; GISel-O0-NEXT:    mov x8, xzr
; GISel-O0-NEXT:    setgp [x0]!, x8!, x8
; GISel-O0-NEXT:    setgm [x0]!, x8!, x8
; GISel-O0-NEXT:    setge [x0]!, x8!, x8
; GISel-O0-NEXT:    ret
;
; GISel-LABEL: memset_tagged_0_zeroval:
; GISel:       // %bb.0: // %entry
; GISel-NEXT:    mov x8, xzr
; GISel-NEXT:    setgp [x0]!, x8!, xzr
; GISel-NEXT:    setgm [x0]!, x8!, xzr
; GISel-NEXT:    setge [x0]!, x8!, xzr
; GISel-NEXT:    ret
;
; SDAG-LABEL: memset_tagged_0_zeroval:
; SDAG:       // %bb.0: // %entry
; SDAG-NEXT:    mov x8, xzr
; SDAG-NEXT:    setgp [x0]!, x8!, xzr
; SDAG-NEXT:    setgm [x0]!, x8!, xzr
; SDAG-NEXT:    setge [x0]!, x8!, xzr
; SDAG-NEXT:    ret
entry:
  %r = tail call i8* @llvm.aarch64.mops.memset.tag(i8* %dst, i8 0, i64 0)
  ret i8* %r
}

define i8* @memset_tagged_1_zeroval(i8* %dst, i64 %size) {
; GISel-O0-LABEL: memset_tagged_1_zeroval:
; GISel-O0:       // %bb.0: // %entry
; GISel-O0-NEXT:    mov x9, xzr
; GISel-O0-NEXT:    mov w8, #1
; GISel-O0-NEXT:    // kill: def $x8 killed $w8
; GISel-O0-NEXT:    setgp [x0]!, x8!, x9
; GISel-O0-NEXT:    setgm [x0]!, x8!, x9
; GISel-O0-NEXT:    setge [x0]!, x8!, x9
; GISel-O0-NEXT:    ret
;
; GISel-LABEL: memset_tagged_1_zeroval:
; GISel:       // %bb.0: // %entry
; GISel-NEXT:    mov w8, #1
; GISel-NEXT:    setgp [x0]!, x8!, xzr
; GISel-NEXT:    setgm [x0]!, x8!, xzr
; GISel-NEXT:    setge [x0]!, x8!, xzr
; GISel-NEXT:    ret
;
; SDAG-LABEL: memset_tagged_1_zeroval:
; SDAG:       // %bb.0: // %entry
; SDAG-NEXT:    mov w8, #1
; SDAG-NEXT:    setgp [x0]!, x8!, xzr
; SDAG-NEXT:    setgm [x0]!, x8!, xzr
; SDAG-NEXT:    setge [x0]!, x8!, xzr
; SDAG-NEXT:    ret
entry:
  %r = tail call i8* @llvm.aarch64.mops.memset.tag(i8* %dst, i8 0, i64 1)
  ret i8* %r
}

define i8* @memset_tagged_10_zeroval(i8* %dst, i64 %size) {
; GISel-O0-LABEL: memset_tagged_10_zeroval:
; GISel-O0:       // %bb.0: // %entry
; GISel-O0-NEXT:    mov x9, xzr
; GISel-O0-NEXT:    mov w8, #10
; GISel-O0-NEXT:    // kill: def $x8 killed $w8
; GISel-O0-NEXT:    setgp [x0]!, x8!, x9
; GISel-O0-NEXT:    setgm [x0]!, x8!, x9
; GISel-O0-NEXT:    setge [x0]!, x8!, x9
; GISel-O0-NEXT:    ret
;
; GISel-LABEL: memset_tagged_10_zeroval:
; GISel:       // %bb.0: // %entry
; GISel-NEXT:    mov w8, #10
; GISel-NEXT:    setgp [x0]!, x8!, xzr
; GISel-NEXT:    setgm [x0]!, x8!, xzr
; GISel-NEXT:    setge [x0]!, x8!, xzr
; GISel-NEXT:    ret
;
; SDAG-LABEL: memset_tagged_10_zeroval:
; SDAG:       // %bb.0: // %entry
; SDAG-NEXT:    mov w8, #10
; SDAG-NEXT:    setgp [x0]!, x8!, xzr
; SDAG-NEXT:    setgm [x0]!, x8!, xzr
; SDAG-NEXT:    setge [x0]!, x8!, xzr
; SDAG-NEXT:    ret
entry:
  %r = tail call i8* @llvm.aarch64.mops.memset.tag(i8* %dst, i8 0, i64 10)
  ret i8* %r
}

define i8* @memset_tagged_10000_zeroval(i8* %dst, i64 %size) {
; GISel-O0-LABEL: memset_tagged_10000_zeroval:
; GISel-O0:       // %bb.0: // %entry
; GISel-O0-NEXT:    mov x9, xzr
; GISel-O0-NEXT:    mov w8, #10000
; GISel-O0-NEXT:    // kill: def $x8 killed $w8
; GISel-O0-NEXT:    setgp [x0]!, x8!, x9
; GISel-O0-NEXT:    setgm [x0]!, x8!, x9
; GISel-O0-NEXT:    setge [x0]!, x8!, x9
; GISel-O0-NEXT:    ret
;
; GISel-LABEL: memset_tagged_10000_zeroval:
; GISel:       // %bb.0: // %entry
; GISel-NEXT:    mov w8, #10000
; GISel-NEXT:    setgp [x0]!, x8!, xzr
; GISel-NEXT:    setgm [x0]!, x8!, xzr
; GISel-NEXT:    setge [x0]!, x8!, xzr
; GISel-NEXT:    ret
;
; SDAG-LABEL: memset_tagged_10000_zeroval:
; SDAG:       // %bb.0: // %entry
; SDAG-NEXT:    mov w8, #10000
; SDAG-NEXT:    setgp [x0]!, x8!, xzr
; SDAG-NEXT:    setgm [x0]!, x8!, xzr
; SDAG-NEXT:    setge [x0]!, x8!, xzr
; SDAG-NEXT:    ret
entry:
  %r = tail call i8* @llvm.aarch64.mops.memset.tag(i8* %dst, i8 0, i64 10000)
  ret i8* %r
}

define i8* @memset_tagged_size_zeroval(i8* %dst, i64 %size) {
; GISel-O0-LABEL: memset_tagged_size_zeroval:
; GISel-O0:       // %bb.0: // %entry
; GISel-O0-NEXT:    mov x8, xzr
; GISel-O0-NEXT:    setgp [x0]!, x1!, x8
; GISel-O0-NEXT:    setgm [x0]!, x1!, x8
; GISel-O0-NEXT:    setge [x0]!, x1!, x8
; GISel-O0-NEXT:    ret
;
; GISel-LABEL: memset_tagged_size_zeroval:
; GISel:       // %bb.0: // %entry
; GISel-NEXT:    setgp [x0]!, x1!, xzr
; GISel-NEXT:    setgm [x0]!, x1!, xzr
; GISel-NEXT:    setge [x0]!, x1!, xzr
; GISel-NEXT:    ret
;
; SDAG-LABEL: memset_tagged_size_zeroval:
; SDAG:       // %bb.0: // %entry
; SDAG-NEXT:    setgp [x0]!, x1!, xzr
; SDAG-NEXT:    setgm [x0]!, x1!, xzr
; SDAG-NEXT:    setge [x0]!, x1!, xzr
; SDAG-NEXT:    ret
entry:
  %r = tail call i8* @llvm.aarch64.mops.memset.tag(i8* %dst, i8 0, i64 %size)
  ret i8* %r
}

define i8* @memset_tagged_0(i8* %dst, i64 %size, i32 %value) {
; GISel-O0-LABEL: memset_tagged_0:
; GISel-O0:       // %bb.0: // %entry
; GISel-O0-NEXT:    // implicit-def: $x9
; GISel-O0-NEXT:    mov w9, w2
; GISel-O0-NEXT:    mov x8, xzr
; GISel-O0-NEXT:    setgp [x0]!, x8!, x9
; GISel-O0-NEXT:    setgm [x0]!, x8!, x9
; GISel-O0-NEXT:    setge [x0]!, x8!, x9
; GISel-O0-NEXT:    ret
;
; GISel-LABEL: memset_tagged_0:
; GISel:       // %bb.0: // %entry
; GISel-NEXT:    mov x8, xzr
; GISel-NEXT:    // kill: def $w2 killed $w2 def $x2
; GISel-NEXT:    setgp [x0]!, x8!, x2
; GISel-NEXT:    setgm [x0]!, x8!, x2
; GISel-NEXT:    setge [x0]!, x8!, x2
; GISel-NEXT:    ret
;
; SDAG-LABEL: memset_tagged_0:
; SDAG:       // %bb.0: // %entry
; SDAG-NEXT:    mov x8, xzr
; SDAG-NEXT:    // kill: def $w2 killed $w2 def $x2
; SDAG-NEXT:    setgp [x0]!, x8!, x2
; SDAG-NEXT:    setgm [x0]!, x8!, x2
; SDAG-NEXT:    setge [x0]!, x8!, x2
; SDAG-NEXT:    ret
entry:
  %value_trunc = trunc i32 %value to i8
  %r = tail call i8* @llvm.aarch64.mops.memset.tag(i8* %dst, i8 %value_trunc, i64 0)
  ret i8* %r
}

define i8* @memset_tagged_1(i8* %dst, i64 %size, i32 %value) {
; GISel-O0-LABEL: memset_tagged_1:
; GISel-O0:       // %bb.0: // %entry
; GISel-O0-NEXT:    // implicit-def: $x9
; GISel-O0-NEXT:    mov w9, w2
; GISel-O0-NEXT:    mov w8, #1
; GISel-O0-NEXT:    // kill: def $x8 killed $w8
; GISel-O0-NEXT:    setgp [x0]!, x8!, x9
; GISel-O0-NEXT:    setgm [x0]!, x8!, x9
; GISel-O0-NEXT:    setge [x0]!, x8!, x9
; GISel-O0-NEXT:    ret
;
; GISel-LABEL: memset_tagged_1:
; GISel:       // %bb.0: // %entry
; GISel-NEXT:    mov w8, #1
; GISel-NEXT:    // kill: def $w2 killed $w2 def $x2
; GISel-NEXT:    setgp [x0]!, x8!, x2
; GISel-NEXT:    setgm [x0]!, x8!, x2
; GISel-NEXT:    setge [x0]!, x8!, x2
; GISel-NEXT:    ret
;
; SDAG-LABEL: memset_tagged_1:
; SDAG:       // %bb.0: // %entry
; SDAG-NEXT:    mov w8, #1
; SDAG-NEXT:    // kill: def $w2 killed $w2 def $x2
; SDAG-NEXT:    setgp [x0]!, x8!, x2
; SDAG-NEXT:    setgm [x0]!, x8!, x2
; SDAG-NEXT:    setge [x0]!, x8!, x2
; SDAG-NEXT:    ret
entry:
  %value_trunc = trunc i32 %value to i8
  %r = tail call i8* @llvm.aarch64.mops.memset.tag(i8* %dst, i8 %value_trunc, i64 1)
  ret i8* %r
}

define i8* @memset_tagged_10(i8* %dst, i64 %size, i32 %value) {
; GISel-O0-LABEL: memset_tagged_10:
; GISel-O0:       // %bb.0: // %entry
; GISel-O0-NEXT:    // implicit-def: $x9
; GISel-O0-NEXT:    mov w9, w2
; GISel-O0-NEXT:    mov w8, #10
; GISel-O0-NEXT:    // kill: def $x8 killed $w8
; GISel-O0-NEXT:    setgp [x0]!, x8!, x9
; GISel-O0-NEXT:    setgm [x0]!, x8!, x9
; GISel-O0-NEXT:    setge [x0]!, x8!, x9
; GISel-O0-NEXT:    ret
;
; GISel-LABEL: memset_tagged_10:
; GISel:       // %bb.0: // %entry
; GISel-NEXT:    mov w8, #10
; GISel-NEXT:    // kill: def $w2 killed $w2 def $x2
; GISel-NEXT:    setgp [x0]!, x8!, x2
; GISel-NEXT:    setgm [x0]!, x8!, x2
; GISel-NEXT:    setge [x0]!, x8!, x2
; GISel-NEXT:    ret
;
; SDAG-LABEL: memset_tagged_10:
; SDAG:       // %bb.0: // %entry
; SDAG-NEXT:    mov w8, #10
; SDAG-NEXT:    // kill: def $w2 killed $w2 def $x2
; SDAG-NEXT:    setgp [x0]!, x8!, x2
; SDAG-NEXT:    setgm [x0]!, x8!, x2
; SDAG-NEXT:    setge [x0]!, x8!, x2
; SDAG-NEXT:    ret
entry:
  %value_trunc = trunc i32 %value to i8
  %r = tail call i8* @llvm.aarch64.mops.memset.tag(i8* %dst, i8 %value_trunc, i64 10)
  ret i8* %r
}

define i8* @memset_tagged_10000(i8* %dst, i64 %size, i32 %value) {
; GISel-O0-LABEL: memset_tagged_10000:
; GISel-O0:       // %bb.0: // %entry
; GISel-O0-NEXT:    // implicit-def: $x9
; GISel-O0-NEXT:    mov w9, w2
; GISel-O0-NEXT:    mov w8, #10000
; GISel-O0-NEXT:    // kill: def $x8 killed $w8
; GISel-O0-NEXT:    setgp [x0]!, x8!, x9
; GISel-O0-NEXT:    setgm [x0]!, x8!, x9
; GISel-O0-NEXT:    setge [x0]!, x8!, x9
; GISel-O0-NEXT:    ret
;
; GISel-LABEL: memset_tagged_10000:
; GISel:       // %bb.0: // %entry
; GISel-NEXT:    mov w8, #10000
; GISel-NEXT:    // kill: def $w2 killed $w2 def $x2
; GISel-NEXT:    setgp [x0]!, x8!, x2
; GISel-NEXT:    setgm [x0]!, x8!, x2
; GISel-NEXT:    setge [x0]!, x8!, x2
; GISel-NEXT:    ret
;
; SDAG-LABEL: memset_tagged_10000:
; SDAG:       // %bb.0: // %entry
; SDAG-NEXT:    mov w8, #10000
; SDAG-NEXT:    // kill: def $w2 killed $w2 def $x2
; SDAG-NEXT:    setgp [x0]!, x8!, x2
; SDAG-NEXT:    setgm [x0]!, x8!, x2
; SDAG-NEXT:    setge [x0]!, x8!, x2
; SDAG-NEXT:    ret
entry:
  %value_trunc = trunc i32 %value to i8
  %r = tail call i8* @llvm.aarch64.mops.memset.tag(i8* %dst, i8 %value_trunc, i64 10000)
  ret i8* %r
}

define i8* @memset_tagged_size(i8* %dst, i64 %size, i32 %value) {
; GISel-O0-LABEL: memset_tagged_size:
; GISel-O0:       // %bb.0: // %entry
; GISel-O0-NEXT:    // implicit-def: $x8
; GISel-O0-NEXT:    mov w8, w2
; GISel-O0-NEXT:    setgp [x0]!, x1!, x8
; GISel-O0-NEXT:    setgm [x0]!, x1!, x8
; GISel-O0-NEXT:    setge [x0]!, x1!, x8
; GISel-O0-NEXT:    ret
;
; GISel-LABEL: memset_tagged_size:
; GISel:       // %bb.0: // %entry
; GISel-NEXT:    // kill: def $w2 killed $w2 def $x2
; GISel-NEXT:    setgp [x0]!, x1!, x2
; GISel-NEXT:    setgm [x0]!, x1!, x2
; GISel-NEXT:    setge [x0]!, x1!, x2
; GISel-NEXT:    ret
;
; SDAG-LABEL: memset_tagged_size:
; SDAG:       // %bb.0: // %entry
; SDAG-NEXT:    // kill: def $w2 killed $w2 def $x2
; SDAG-NEXT:    setgp [x0]!, x1!, x2
; SDAG-NEXT:    setgm [x0]!, x1!, x2
; SDAG-NEXT:    setge [x0]!, x1!, x2
; SDAG-NEXT:    ret
entry:
  %value_trunc = trunc i32 %value to i8
  %r = tail call i8* @llvm.aarch64.mops.memset.tag(i8* %dst, i8 %value_trunc, i64 %size)
  ret i8* %r
}

define i8* @memset_tagged_size_aligned(i8* %dst, i64 %size, i32 %value) {
; GISel-O0-LABEL: memset_tagged_size_aligned:
; GISel-O0:       // %bb.0: // %entry
; GISel-O0-NEXT:    // implicit-def: $x8
; GISel-O0-NEXT:    mov w8, w2
; GISel-O0-NEXT:    setgp [x0]!, x1!, x8
; GISel-O0-NEXT:    setgm [x0]!, x1!, x8
; GISel-O0-NEXT:    setge [x0]!, x1!, x8
; GISel-O0-NEXT:    ret
;
; GISel-LABEL: memset_tagged_size_aligned:
; GISel:       // %bb.0: // %entry
; GISel-NEXT:    // kill: def $w2 killed $w2 def $x2
; GISel-NEXT:    setgp [x0]!, x1!, x2
; GISel-NEXT:    setgm [x0]!, x1!, x2
; GISel-NEXT:    setge [x0]!, x1!, x2
; GISel-NEXT:    ret
;
; SDAG-LABEL: memset_tagged_size_aligned:
; SDAG:       // %bb.0: // %entry
; SDAG-NEXT:    // kill: def $w2 killed $w2 def $x2
; SDAG-NEXT:    setgp [x0]!, x1!, x2
; SDAG-NEXT:    setgm [x0]!, x1!, x2
; SDAG-NEXT:    setge [x0]!, x1!, x2
; SDAG-NEXT:    ret
entry:
  %value_trunc = trunc i32 %value to i8
  %r = tail call i8* @llvm.aarch64.mops.memset.tag(i8* align 16 %dst, i8 %value_trunc, i64 %size)
  ret i8* %r
}
