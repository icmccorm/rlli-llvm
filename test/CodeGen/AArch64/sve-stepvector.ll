; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=aarch64-linux-gnu -mattr=+sve < %s | FileCheck %s --check-prefixes=CHECK

; LEGAL INTEGER TYPES

define <vscale x 2 x i64> @stepvector_nxv2i64() {
; CHECK-LABEL: stepvector_nxv2i64:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z0.d, #0, #1
; CHECK-NEXT:    ret
entry:
  %0 = call <vscale x 2 x i64> @llvm.experimental.stepvector.nxv2i64()
  ret <vscale x 2 x i64> %0
}

define <vscale x 4 x i32> @stepvector_nxv4i32() {
; CHECK-LABEL: stepvector_nxv4i32:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z0.s, #0, #1
; CHECK-NEXT:    ret
entry:
  %0 = call <vscale x 4 x i32> @llvm.experimental.stepvector.nxv4i32()
  ret <vscale x 4 x i32> %0
}

define <vscale x 8 x i16> @stepvector_nxv8i16() {
; CHECK-LABEL: stepvector_nxv8i16:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z0.h, #0, #1
; CHECK-NEXT:    ret
entry:
  %0 = call <vscale x 8 x i16> @llvm.experimental.stepvector.nxv8i16()
  ret <vscale x 8 x i16> %0
}

define <vscale x 16 x i8> @stepvector_nxv16i8() {
; CHECK-LABEL: stepvector_nxv16i8:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z0.b, #0, #1
; CHECK-NEXT:    ret
entry:
  %0 = call <vscale x 16 x i8> @llvm.experimental.stepvector.nxv16i8()
  ret <vscale x 16 x i8> %0
}

; ILLEGAL INTEGER TYPES

define <vscale x 6 x i64> @stepvector_nxv6i64() {
; CHECK-LABEL: stepvector_nxv6i64:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z0.d, #0, #1
; CHECK-NEXT:    mov z1.d, z0.d
; CHECK-NEXT:    mov z2.d, z0.d
; CHECK-NEXT:    incd z1.d
; CHECK-NEXT:    incd z2.d, all, mul #2
; CHECK-NEXT:    ret
entry:
  %0 = call <vscale x 6 x i64> @llvm.experimental.stepvector.nxv6i64()
  ret <vscale x 6 x i64> %0
}

define <vscale x 4 x i64> @stepvector_nxv4i64() {
; CHECK-LABEL: stepvector_nxv4i64:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z0.d, #0, #1
; CHECK-NEXT:    mov z1.d, z0.d
; CHECK-NEXT:    incd z1.d
; CHECK-NEXT:    ret
entry:
  %0 = call <vscale x 4 x i64> @llvm.experimental.stepvector.nxv4i64()
  ret <vscale x 4 x i64> %0
}

define <vscale x 16 x i32> @stepvector_nxv16i32() {
; CHECK-LABEL: stepvector_nxv16i32:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z0.s, #0, #1
; CHECK-NEXT:    mov z1.d, z0.d
; CHECK-NEXT:    mov z2.d, z0.d
; CHECK-NEXT:    incw z1.s
; CHECK-NEXT:    incw z2.s, all, mul #2
; CHECK-NEXT:    mov z3.d, z1.d
; CHECK-NEXT:    incw z3.s, all, mul #2
; CHECK-NEXT:    ret
entry:
  %0 = call <vscale x 16 x i32> @llvm.experimental.stepvector.nxv16i32()
  ret <vscale x 16 x i32> %0
}

define <vscale x 3 x i32> @stepvector_nxv3i32() {
; CHECK-LABEL: stepvector_nxv3i32:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z0.s, #0, #1
; CHECK-NEXT:    ret
entry:
  %0 = call <vscale x 3 x i32> @llvm.experimental.stepvector.nxv3i32()
  ret <vscale x 3 x i32> %0
}

define <vscale x 2 x i32> @stepvector_nxv2i32() {
; CHECK-LABEL: stepvector_nxv2i32:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z0.d, #0, #1
; CHECK-NEXT:    ret
entry:
  %0 = call <vscale x 2 x i32> @llvm.experimental.stepvector.nxv2i32()
  ret <vscale x 2 x i32> %0
}

define <vscale x 4 x i16> @stepvector_nxv4i16() {
; CHECK-LABEL: stepvector_nxv4i16:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z0.s, #0, #1
; CHECK-NEXT:    ret
entry:
  %0 = call <vscale x 4 x i16> @llvm.experimental.stepvector.nxv4i16()
  ret <vscale x 4 x i16> %0
}

define <vscale x 8 x i8> @stepvector_nxv8i8() {
; CHECK-LABEL: stepvector_nxv8i8:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z0.h, #0, #1
; CHECK-NEXT:    ret
entry:
  %0 = call <vscale x 8 x i8> @llvm.experimental.stepvector.nxv8i8()
  ret <vscale x 8 x i8> %0
}

define <vscale x 8 x i8> @add_stepvector_nxv8i8() {
; CHECK-LABEL: add_stepvector_nxv8i8:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z0.h, #0, #2
; CHECK-NEXT:    ret
entry:
  %0 = call <vscale x 8 x i8> @llvm.experimental.stepvector.nxv8i8()
  %1 = call <vscale x 8 x i8> @llvm.experimental.stepvector.nxv8i8()
  %2 = add <vscale x 8 x i8> %0, %1
  ret <vscale x 8 x i8> %2
}

define <vscale x 8 x i8> @add_stepvector_nxv8i8_1(<vscale x 8 x i8> %p) {
; CHECK-LABEL: add_stepvector_nxv8i8_1:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z1.h, #0, #2
; CHECK-NEXT:    add z0.h, z0.h, z1.h
; CHECK-NEXT:    ret
entry:
  %0 = call <vscale x 8 x i8> @llvm.experimental.stepvector.nxv8i8()
  %1 = add <vscale x 8 x i8> %p, %0
  %2 = call <vscale x 8 x i8> @llvm.experimental.stepvector.nxv8i8()
  %3 = add <vscale x 8 x i8> %1, %2
  ret <vscale x 8 x i8> %3
}

define <vscale x 8 x i8> @add_stepvector_nxv8i8_2() {
; CHECK-LABEL: add_stepvector_nxv8i8_2:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z0.h, #2, #1
; CHECK-NEXT:    ret
entry:
  %0 = insertelement <vscale x 8 x i8> poison, i8 2, i32 0
  %1 = shufflevector <vscale x 8 x i8> %0, <vscale x 8 x i8> poison, <vscale x 8 x i32> zeroinitializer
  %2 = call <vscale x 8 x i8> @llvm.experimental.stepvector.nxv8i8()
  %3 = add <vscale x 8 x i8> %2, %1
  ret <vscale x 8 x i8> %3
}

define <vscale x 8 x i8> @add_stepvector_nxv8i8_2_commutative() {
; CHECK-LABEL: add_stepvector_nxv8i8_2_commutative:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z0.h, #2, #1
; CHECK-NEXT:    ret
entry:
  %0 = insertelement <vscale x 8 x i8> poison, i8 2, i32 0
  %1 = shufflevector <vscale x 8 x i8> %0, <vscale x 8 x i8> poison, <vscale x 8 x i32> zeroinitializer
  %2 = call <vscale x 8 x i8> @llvm.experimental.stepvector.nxv8i8()
  %3 = add <vscale x 8 x i8> %1, %2
  ret <vscale x 8 x i8> %3
}

define <vscale x 8 x i16> @add_stepvector_nxv8i16_1(i16 %data) {
; CHECK-LABEL: add_stepvector_nxv8i16_1:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z0.h, w0, #1
; CHECK-NEXT:    ret
entry:
  %0 = insertelement <vscale x 8 x i16> poison, i16 %data, i32 0
  %1 = shufflevector <vscale x 8 x i16> %0, <vscale x 8 x i16> poison, <vscale x 8 x i32> zeroinitializer
  %2 = call <vscale x 8 x i16> @llvm.experimental.stepvector.nxv8i16()
  %3 = add <vscale x 8 x i16> %2, %1
  ret <vscale x 8 x i16> %3
}

define <vscale x 4 x i32> @add_stepvector_nxv4i32_1(i32 %data) {
; CHECK-LABEL: add_stepvector_nxv4i32_1:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z0.s, w0, #1
; CHECK-NEXT:    ret
entry:
  %0 = insertelement <vscale x 4 x i32> poison, i32 %data, i32 0
  %1 = shufflevector <vscale x 4 x i32> %0, <vscale x 4 x i32> poison, <vscale x 4 x i32> zeroinitializer
  %2 = call <vscale x 4 x i32> @llvm.experimental.stepvector.nxv4i32()
  %3 = add <vscale x 4 x i32> %2, %1
  ret <vscale x 4 x i32> %3
}

define <vscale x 4 x i32> @multiple_use_stepvector_nxv4i32_1(i32 %data) {
; CHECK-LABEL: multiple_use_stepvector_nxv4i32_1:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    mov z0.s, w0
; CHECK-NEXT:    index z1.s, w0, #1
; CHECK-NEXT:    mul z0.s, p0/m, z0.s, z1.s
; CHECK-NEXT:    sub z0.s, z0.s, z1.s
; CHECK-NEXT:    ret
entry:
  %0 = insertelement <vscale x 4 x i32> poison, i32 %data, i32 0
  %1 = shufflevector <vscale x 4 x i32> %0, <vscale x 4 x i32> poison, <vscale x 4 x i32> zeroinitializer
  %2 = call <vscale x 4 x i32> @llvm.experimental.stepvector.nxv4i32()
  %3 = add <vscale x 4 x i32> %2, %1
  %4 = mul <vscale x 4 x i32> %1, %3
  %5 = sub <vscale x 4 x i32> %4, %3
  ret <vscale x 4 x i32> %5
}

define <vscale x 2 x i64> @add_stepvector_nxv2i64_1(i64 %data) {
; CHECK-LABEL: add_stepvector_nxv2i64_1:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z0.d, x0, #1
; CHECK-NEXT:    ret
entry:
  %0 = insertelement <vscale x 2 x i64> poison, i64 %data, i32 0
  %1 = shufflevector <vscale x 2 x i64> %0, <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer
  %2 = call <vscale x 2 x i64> @llvm.experimental.stepvector.nxv2i64()
  %3 = add <vscale x 2 x i64> %1, %2
  ret <vscale x 2 x i64> %3
}

define <vscale x 2 x i64> @multiple_use_stepvector_nxv2i64_1(i64 %data) {
; CHECK-LABEL: multiple_use_stepvector_nxv2i64_1:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z0.d, #0, #1
; CHECK-NEXT:    mov z1.d, x0
; CHECK-NEXT:    add z1.d, z0.d, z1.d
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    mul z0.d, p0/m, z0.d, z1.d
; CHECK-NEXT:    ret
entry:
  %0 = insertelement <vscale x 2 x i64> poison, i64 %data, i32 0
  %1 = shufflevector <vscale x 2 x i64> %0, <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer
  %2 = call <vscale x 2 x i64> @llvm.experimental.stepvector.nxv2i64()
  %3 = add <vscale x 2 x i64> %1, %2
  %4 = mul <vscale x 2 x i64> %3, %2
  ret <vscale x 2 x i64> %4
}

define <vscale x 8 x i8> @mul_stepvector_nxv8i8() {
; CHECK-LABEL: mul_stepvector_nxv8i8:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z0.h, #0, #2
; CHECK-NEXT:    ret
entry:
  %0 = insertelement <vscale x 8 x i8> poison, i8 2, i32 0
  %1 = shufflevector <vscale x 8 x i8> %0, <vscale x 8 x i8> poison, <vscale x 8 x i32> zeroinitializer
  %2 = call <vscale x 8 x i8> @llvm.experimental.stepvector.nxv8i8()
  %3 = mul <vscale x 8 x i8> %2, %1
  ret <vscale x 8 x i8> %3
}

define <vscale x 2 x i64> @mul_stepvector_nxv2i64() {
; CHECK-LABEL: mul_stepvector_nxv2i64:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    mov w8, #2222
; CHECK-NEXT:    index z0.d, #0, x8
; CHECK-NEXT:    ret
entry:
  %0 = insertelement <vscale x 2 x i64> poison, i64 2222, i32 0
  %1 = shufflevector <vscale x 2 x i64> %0, <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer
  %2 = call <vscale x 2 x i64> @llvm.experimental.stepvector.nxv2i64()
  %3 = mul <vscale x 2 x i64> %2, %1
  ret <vscale x 2 x i64> %3
}

define <vscale x 2 x i64> @mul_stepvector_bigconst_nxv2i64() {
; CHECK-LABEL: mul_stepvector_bigconst_nxv2i64:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    mov x8, #146028888064
; CHECK-NEXT:    index z0.d, #0, x8
; CHECK-NEXT:    ret
entry:
  %0 = insertelement <vscale x 2 x i64> poison, i64 146028888064, i32 0
  %1 = shufflevector <vscale x 2 x i64> %0, <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer
  %2 = call <vscale x 2 x i64> @llvm.experimental.stepvector.nxv2i64()
  %3 = mul <vscale x 2 x i64> %2, %1
  ret <vscale x 2 x i64> %3
}

define <vscale x 2 x i64> @mul_add_stepvector_nxv2i64(i64 %x) {
; CHECK-LABEL: mul_add_stepvector_nxv2i64:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    mov w8, #2222
; CHECK-NEXT:    index z0.d, x0, x8
; CHECK-NEXT:    ret
entry:
  %0 = insertelement <vscale x 2 x i64> poison, i64 2222, i32 0
  %1 = shufflevector <vscale x 2 x i64> %0, <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer
  %2 = call <vscale x 2 x i64> @llvm.experimental.stepvector.nxv2i64()
  %3 = mul <vscale x 2 x i64> %2, %1
  %4 = insertelement <vscale x 2 x i64> poison, i64 %x, i32 0
  %5 = shufflevector <vscale x 2 x i64> %4, <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer
  %6 = add <vscale x 2 x i64> %3, %5
  ret <vscale x 2 x i64> %6
}

define <vscale x 2 x i64> @mul_add_stepvector_nxv2i64_commutative(i64 %x, i64 %y) {
; CHECK-LABEL: mul_add_stepvector_nxv2i64_commutative:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z0.d, x0, x1
; CHECK-NEXT:    ret
entry:
  %0 = insertelement <vscale x 2 x i64> poison, i64 %y, i32 0
  %1 = shufflevector <vscale x 2 x i64> %0, <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer
  %2 = call <vscale x 2 x i64> @llvm.experimental.stepvector.nxv2i64()
  %3 = mul <vscale x 2 x i64> %1, %2
  %4 = insertelement <vscale x 2 x i64> poison, i64 %x, i32 0
  %5 = shufflevector <vscale x 2 x i64> %4, <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer
  %6 = add <vscale x 2 x i64> %5, %3
  ret <vscale x 2 x i64> %6
}

define <vscale x 2 x i64> @mul_add_stepvector_bigconst_nxv2i64(i64 %x) {
; CHECK-LABEL: mul_add_stepvector_bigconst_nxv2i64:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    mov x8, #146028888064
; CHECK-NEXT:    index z0.d, x0, x8
; CHECK-NEXT:    ret
entry:
  %0 = insertelement <vscale x 2 x i64> poison, i64 146028888064, i32 0
  %1 = shufflevector <vscale x 2 x i64> %0, <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer
  %2 = call <vscale x 2 x i64> @llvm.experimental.stepvector.nxv2i64()
  %3 = mul <vscale x 2 x i64> %2, %1
  %4 = insertelement <vscale x 2 x i64> poison, i64 %x, i32 0
  %5 = shufflevector <vscale x 2 x i64> %4, <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer
  %6 = add <vscale x 2 x i64> %3, %5
  ret <vscale x 2 x i64> %6
}

define <vscale x 2 x i64> @mul_mul_add_stepvector_nxv2i64(i64 %x, i64 %y) {
; CHECK-LABEL: mul_mul_add_stepvector_nxv2i64:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    add x8, x0, x0, lsl #1
; CHECK-NEXT:    index z0.d, x1, x8
; CHECK-NEXT:    ret
entry:
  %xmul = mul i64 %x, 3
  %0 = insertelement <vscale x 2 x i64> poison, i64 %xmul, i32 0
  %1 = shufflevector <vscale x 2 x i64> %0, <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer
  %2 = call <vscale x 2 x i64> @llvm.experimental.stepvector.nxv2i64()
  %3 = mul <vscale x 2 x i64> %2, %1
  %4 = insertelement <vscale x 2 x i64> poison, i64 %y, i32 0
  %5 = shufflevector <vscale x 2 x i64> %4, <vscale x 2 x i64> poison, <vscale x 2 x i32> zeroinitializer
  %6 = add <vscale x 2 x i64> %3, %5
  ret <vscale x 2 x i64> %6
}

define <vscale x 8 x i8> @shl_stepvector_nxv8i8() {
; CHECK-LABEL: shl_stepvector_nxv8i8:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z0.h, #0, #4
; CHECK-NEXT:    ret
entry:
  %0 = insertelement <vscale x 8 x i8> poison, i8 2, i32 0
  %1 = shufflevector <vscale x 8 x i8> %0, <vscale x 8 x i8> poison, <vscale x 8 x i32> zeroinitializer
  %2 = call <vscale x 8 x i8> @llvm.experimental.stepvector.nxv8i8()
  %3 = shl <vscale x 8 x i8> %2, %1
  ret <vscale x 8 x i8> %3
}

define <vscale x 8 x i16> @sub_multiple_use_stepvector_nxv8i16() {
; CHECK-LABEL: sub_multiple_use_stepvector_nxv8i16:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z0.h, #0, #1
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    mov z1.d, z0.d
; CHECK-NEXT:    subr z1.h, z1.h, #2 // =0x2
; CHECK-NEXT:    lsl z0.h, p0/m, z0.h, z1.h
; CHECK-NEXT:    ret
entry:
  %0 = insertelement <vscale x 8 x i16> poison, i16 2, i32 0
  %1 = shufflevector <vscale x 8 x i16> %0, <vscale x 8 x i16> poison, <vscale x 8 x i32> zeroinitializer
  %2 = call <vscale x 8 x i16> @llvm.experimental.stepvector.nxv8i16()
  %3 = sub <vscale x 8 x i16> %1, %2
  %4 = shl <vscale x 8 x i16> %2, %3
  ret <vscale x 8 x i16> %4
}

define <vscale x 8 x i16> @sub_stepvector_nxv8i16() {
; CHECK-LABEL: sub_stepvector_nxv8i16:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z0.h, #2, #-1
; CHECK-NEXT:    ret
entry:
  %0 = insertelement <vscale x 8 x i16> poison, i16 2, i32 0
  %1 = shufflevector <vscale x 8 x i16> %0, <vscale x 8 x i16> poison, <vscale x 8 x i32> zeroinitializer
  %2 = call <vscale x 8 x i16> @llvm.experimental.stepvector.nxv8i16()
  %3 = sub <vscale x 8 x i16> %1, %2
  ret <vscale x 8 x i16> %3
}

define <vscale x 8 x i8> @promote_sub_stepvector_nxv8i8() {
; CHECK-LABEL: promote_sub_stepvector_nxv8i8:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    index z0.h, #2, #-1
; CHECK-NEXT:    ret
entry:
  %0 = insertelement <vscale x 8 x i8> poison, i8 2, i32 0
  %1 = shufflevector <vscale x 8 x i8> %0, <vscale x 8 x i8> poison, <vscale x 8 x i32> zeroinitializer
  %2 = call <vscale x 8 x i8> @llvm.experimental.stepvector.nxv8i8()
  %3 = sub <vscale x 8 x i8> %1, %2
  ret <vscale x 8 x i8> %3
}

define <vscale x 16 x i32> @split_sub_stepvector_nxv16i32() {
; CHECK-LABEL: split_sub_stepvector_nxv16i32:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    cntw x8
; CHECK-NEXT:    cnth x9
; CHECK-NEXT:    neg x8, x8
; CHECK-NEXT:    neg x9, x9
; CHECK-NEXT:    index z0.s, #0, #-1
; CHECK-NEXT:    mov z1.s, w8
; CHECK-NEXT:    mov z3.s, w9
; CHECK-NEXT:    add z1.s, z0.s, z1.s
; CHECK-NEXT:    add z2.s, z0.s, z3.s
; CHECK-NEXT:    add z3.s, z1.s, z3.s
; CHECK-NEXT:    ret
entry:
  %0 = call <vscale x 16 x i32> @llvm.experimental.stepvector.nxv16i32()
  %1 = sub <vscale x 16 x i32> zeroinitializer, %0
  ret <vscale x 16 x i32> %1
}

declare <vscale x 2 x i64> @llvm.experimental.stepvector.nxv2i64()
declare <vscale x 4 x i32> @llvm.experimental.stepvector.nxv4i32()
declare <vscale x 8 x i16> @llvm.experimental.stepvector.nxv8i16()
declare <vscale x 16 x i8> @llvm.experimental.stepvector.nxv16i8()

declare <vscale x 6 x i64> @llvm.experimental.stepvector.nxv6i64()
declare <vscale x 4 x i64> @llvm.experimental.stepvector.nxv4i64()
declare <vscale x 16 x i32> @llvm.experimental.stepvector.nxv16i32()
declare <vscale x 3 x i32> @llvm.experimental.stepvector.nxv3i32()
declare <vscale x 2 x i32> @llvm.experimental.stepvector.nxv2i32()
declare <vscale x 8 x i8> @llvm.experimental.stepvector.nxv8i8()
declare <vscale x 4 x i16> @llvm.experimental.stepvector.nxv4i16()
