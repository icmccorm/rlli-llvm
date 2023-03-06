; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv64 -mattr=+v,+d,+zfh,+experimental-zvfh -verify-machineinstrs \
; RUN:   < %s | FileCheck %s
declare <vscale x 1 x i8> @llvm.riscv.vmv.v.v.nxv1i8(
  <vscale x 1 x i8>,
  <vscale x 1 x i8>,
  i64);

define <vscale x 1 x i8> @intrinsic_vmv.v.v_v_nxv1i8_nxv1i8(<vscale x 1 x i8> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv1i8_nxv1i8:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, mf8, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 1 x i8> @llvm.riscv.vmv.v.v.nxv1i8(
    <vscale x 1 x i8> undef,
    <vscale x 1 x i8> %0,
    i64 %1)

  ret <vscale x 1 x i8> %a
}

declare <vscale x 2 x i8> @llvm.riscv.vmv.v.v.nxv2i8(
  <vscale x 2 x i8>,
  <vscale x 2 x i8>,
  i64);

define <vscale x 2 x i8> @intrinsic_vmv.v.v_v_nxv2i8_nxv2i8(<vscale x 2 x i8> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv2i8_nxv2i8:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, mf4, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 2 x i8> @llvm.riscv.vmv.v.v.nxv2i8(
    <vscale x 2 x i8> undef,
    <vscale x 2 x i8> %0,
    i64 %1)

  ret <vscale x 2 x i8> %a
}

declare <vscale x 4 x i8> @llvm.riscv.vmv.v.v.nxv4i8(
  <vscale x 4 x i8>,
  <vscale x 4 x i8>,
  i64);

define <vscale x 4 x i8> @intrinsic_vmv.v.v_v_nxv4i8_nxv4i8(<vscale x 4 x i8> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv4i8_nxv4i8:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, mf2, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 4 x i8> @llvm.riscv.vmv.v.v.nxv4i8(
    <vscale x 4 x i8> undef,
    <vscale x 4 x i8> %0,
    i64 %1)

  ret <vscale x 4 x i8> %a
}

declare <vscale x 8 x i8> @llvm.riscv.vmv.v.v.nxv8i8(
  <vscale x 8 x i8>,
  <vscale x 8 x i8>,
  i64);

define <vscale x 8 x i8> @intrinsic_vmv.v.v_v_nxv8i8_nxv8i8(<vscale x 8 x i8> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv8i8_nxv8i8:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, m1, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 8 x i8> @llvm.riscv.vmv.v.v.nxv8i8(
    <vscale x 8 x i8> undef,
    <vscale x 8 x i8> %0,
    i64 %1)

  ret <vscale x 8 x i8> %a
}

declare <vscale x 16 x i8> @llvm.riscv.vmv.v.v.nxv16i8(
  <vscale x 16 x i8>,
  <vscale x 16 x i8>,
  i64);

define <vscale x 16 x i8> @intrinsic_vmv.v.v_v_nxv16i8_nxv16i8(<vscale x 16 x i8> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv16i8_nxv16i8:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, m2, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 16 x i8> @llvm.riscv.vmv.v.v.nxv16i8(
    <vscale x 16 x i8> undef,
    <vscale x 16 x i8> %0,
    i64 %1)

  ret <vscale x 16 x i8> %a
}

declare <vscale x 32 x i8> @llvm.riscv.vmv.v.v.nxv32i8(
  <vscale x 32 x i8>,
  <vscale x 32 x i8>,
  i64);

define <vscale x 32 x i8> @intrinsic_vmv.v.v_v_nxv32i8_nxv32i8(<vscale x 32 x i8> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv32i8_nxv32i8:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, m4, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 32 x i8> @llvm.riscv.vmv.v.v.nxv32i8(
    <vscale x 32 x i8> undef,
    <vscale x 32 x i8> %0,
    i64 %1)

  ret <vscale x 32 x i8> %a
}

declare <vscale x 64 x i8> @llvm.riscv.vmv.v.v.nxv64i8(
  <vscale x 64 x i8>,
  <vscale x 64 x i8>,
  i64);

define <vscale x 64 x i8> @intrinsic_vmv.v.v_v_nxv64i8_nxv64i8(<vscale x 64 x i8> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv64i8_nxv64i8:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e8, m8, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 64 x i8> @llvm.riscv.vmv.v.v.nxv64i8(
    <vscale x 64 x i8> undef,
    <vscale x 64 x i8> %0,
    i64 %1)

  ret <vscale x 64 x i8> %a
}

declare <vscale x 1 x i16> @llvm.riscv.vmv.v.v.nxv1i16(
  <vscale x 1 x i16>,
  <vscale x 1 x i16>,
  i64);

define <vscale x 1 x i16> @intrinsic_vmv.v.v_v_nxv1i16_nxv1i16(<vscale x 1 x i16> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv1i16_nxv1i16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, mf4, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 1 x i16> @llvm.riscv.vmv.v.v.nxv1i16(
    <vscale x 1 x i16> undef,
    <vscale x 1 x i16> %0,
    i64 %1)

  ret <vscale x 1 x i16> %a
}

declare <vscale x 2 x i16> @llvm.riscv.vmv.v.v.nxv2i16(
  <vscale x 2 x i16>,
  <vscale x 2 x i16>,
  i64);

define <vscale x 2 x i16> @intrinsic_vmv.v.v_v_nxv2i16_nxv2i16(<vscale x 2 x i16> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv2i16_nxv2i16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, mf2, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 2 x i16> @llvm.riscv.vmv.v.v.nxv2i16(
    <vscale x 2 x i16> undef,
    <vscale x 2 x i16> %0,
    i64 %1)

  ret <vscale x 2 x i16> %a
}

declare <vscale x 4 x i16> @llvm.riscv.vmv.v.v.nxv4i16(
  <vscale x 4 x i16>,
  <vscale x 4 x i16>,
  i64);

define <vscale x 4 x i16> @intrinsic_vmv.v.v_v_nxv4i16_nxv4i16(<vscale x 4 x i16> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv4i16_nxv4i16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m1, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 4 x i16> @llvm.riscv.vmv.v.v.nxv4i16(
    <vscale x 4 x i16> undef,
    <vscale x 4 x i16> %0,
    i64 %1)

  ret <vscale x 4 x i16> %a
}

declare <vscale x 8 x i16> @llvm.riscv.vmv.v.v.nxv8i16(
  <vscale x 8 x i16>,
  <vscale x 8 x i16>,
  i64);

define <vscale x 8 x i16> @intrinsic_vmv.v.v_v_nxv8i16_nxv8i16(<vscale x 8 x i16> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv8i16_nxv8i16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m2, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 8 x i16> @llvm.riscv.vmv.v.v.nxv8i16(
    <vscale x 8 x i16> undef,
    <vscale x 8 x i16> %0,
    i64 %1)

  ret <vscale x 8 x i16> %a
}

declare <vscale x 16 x i16> @llvm.riscv.vmv.v.v.nxv16i16(
  <vscale x 16 x i16>,
  <vscale x 16 x i16>,
  i64);

define <vscale x 16 x i16> @intrinsic_vmv.v.v_v_nxv16i16_nxv16i16(<vscale x 16 x i16> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv16i16_nxv16i16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m4, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 16 x i16> @llvm.riscv.vmv.v.v.nxv16i16(
    <vscale x 16 x i16> undef,
    <vscale x 16 x i16> %0,
    i64 %1)

  ret <vscale x 16 x i16> %a
}

declare <vscale x 32 x i16> @llvm.riscv.vmv.v.v.nxv32i16(
  <vscale x 32 x i16>,
  <vscale x 32 x i16>,
  i64);

define <vscale x 32 x i16> @intrinsic_vmv.v.v_v_nxv32i16_nxv32i16(<vscale x 32 x i16> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv32i16_nxv32i16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m8, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 32 x i16> @llvm.riscv.vmv.v.v.nxv32i16(
    <vscale x 32 x i16> undef,
    <vscale x 32 x i16> %0,
    i64 %1)

  ret <vscale x 32 x i16> %a
}

declare <vscale x 1 x i32> @llvm.riscv.vmv.v.v.nxv1i32(
  <vscale x 1 x i32>,
  <vscale x 1 x i32>,
  i64);

define <vscale x 1 x i32> @intrinsic_vmv.v.v_v_nxv1i32_nxv1i32(<vscale x 1 x i32> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv1i32_nxv1i32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, mf2, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 1 x i32> @llvm.riscv.vmv.v.v.nxv1i32(
    <vscale x 1 x i32> undef,
    <vscale x 1 x i32> %0,
    i64 %1)

  ret <vscale x 1 x i32> %a
}

declare <vscale x 2 x i32> @llvm.riscv.vmv.v.v.nxv2i32(
  <vscale x 2 x i32>,
  <vscale x 2 x i32>,
  i64);

define <vscale x 2 x i32> @intrinsic_vmv.v.v_v_nxv2i32_nxv2i32(<vscale x 2 x i32> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv2i32_nxv2i32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, m1, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 2 x i32> @llvm.riscv.vmv.v.v.nxv2i32(
    <vscale x 2 x i32> undef,
    <vscale x 2 x i32> %0,
    i64 %1)

  ret <vscale x 2 x i32> %a
}

declare <vscale x 4 x i32> @llvm.riscv.vmv.v.v.nxv4i32(
  <vscale x 4 x i32>,
  <vscale x 4 x i32>,
  i64);

define <vscale x 4 x i32> @intrinsic_vmv.v.v_v_nxv4i32_nxv4i32(<vscale x 4 x i32> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv4i32_nxv4i32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, m2, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 4 x i32> @llvm.riscv.vmv.v.v.nxv4i32(
    <vscale x 4 x i32> undef,
    <vscale x 4 x i32> %0,
    i64 %1)

  ret <vscale x 4 x i32> %a
}

declare <vscale x 8 x i32> @llvm.riscv.vmv.v.v.nxv8i32(
  <vscale x 8 x i32>,
  <vscale x 8 x i32>,
  i64);

define <vscale x 8 x i32> @intrinsic_vmv.v.v_v_nxv8i32_nxv8i32(<vscale x 8 x i32> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv8i32_nxv8i32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, m4, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 8 x i32> @llvm.riscv.vmv.v.v.nxv8i32(
    <vscale x 8 x i32> undef,
    <vscale x 8 x i32> %0,
    i64 %1)

  ret <vscale x 8 x i32> %a
}

declare <vscale x 16 x i32> @llvm.riscv.vmv.v.v.nxv16i32(
  <vscale x 16 x i32>,
  <vscale x 16 x i32>,
  i64);

define <vscale x 16 x i32> @intrinsic_vmv.v.v_v_nxv16i32_nxv16i32(<vscale x 16 x i32> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv16i32_nxv16i32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, m8, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 16 x i32> @llvm.riscv.vmv.v.v.nxv16i32(
    <vscale x 16 x i32> undef,
    <vscale x 16 x i32> %0,
    i64 %1)

  ret <vscale x 16 x i32> %a
}

declare <vscale x 1 x i64> @llvm.riscv.vmv.v.v.nxv1i64(
  <vscale x 1 x i64>,
  <vscale x 1 x i64>,
  i64);

define <vscale x 1 x i64> @intrinsic_vmv.v.v_v_nxv1i64_nxv1i64(<vscale x 1 x i64> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv1i64_nxv1i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e64, m1, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 1 x i64> @llvm.riscv.vmv.v.v.nxv1i64(
    <vscale x 1 x i64> undef,
    <vscale x 1 x i64> %0,
    i64 %1)

  ret <vscale x 1 x i64> %a
}

declare <vscale x 2 x i64> @llvm.riscv.vmv.v.v.nxv2i64(
  <vscale x 2 x i64>,
  <vscale x 2 x i64>,
  i64);

define <vscale x 2 x i64> @intrinsic_vmv.v.v_v_nxv2i64_nxv2i64(<vscale x 2 x i64> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv2i64_nxv2i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e64, m2, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 2 x i64> @llvm.riscv.vmv.v.v.nxv2i64(
    <vscale x 2 x i64> undef,
    <vscale x 2 x i64> %0,
    i64 %1)

  ret <vscale x 2 x i64> %a
}

declare <vscale x 4 x i64> @llvm.riscv.vmv.v.v.nxv4i64(
  <vscale x 4 x i64>,
  <vscale x 4 x i64>,
  i64);

define <vscale x 4 x i64> @intrinsic_vmv.v.v_v_nxv4i64_nxv4i64(<vscale x 4 x i64> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv4i64_nxv4i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e64, m4, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 4 x i64> @llvm.riscv.vmv.v.v.nxv4i64(
    <vscale x 4 x i64> undef,
    <vscale x 4 x i64> %0,
    i64 %1)

  ret <vscale x 4 x i64> %a
}

declare <vscale x 8 x i64> @llvm.riscv.vmv.v.v.nxv8i64(
  <vscale x 8 x i64>,
  <vscale x 8 x i64>,
  i64);

define <vscale x 8 x i64> @intrinsic_vmv.v.v_v_nxv8i64_nxv8i64(<vscale x 8 x i64> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv8i64_nxv8i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e64, m8, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 8 x i64> @llvm.riscv.vmv.v.v.nxv8i64(
    <vscale x 8 x i64> undef,
    <vscale x 8 x i64> %0,
    i64 %1)

  ret <vscale x 8 x i64> %a
}

declare <vscale x 1 x half> @llvm.riscv.vmv.v.v.nxv1f16(
  <vscale x 1 x half>,
  <vscale x 1 x half>,
  i64);

define <vscale x 1 x half> @intrinsic_vmv.v.v_v_nxv1f16_nxv1f16(<vscale x 1 x half> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv1f16_nxv1f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, mf4, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 1 x half> @llvm.riscv.vmv.v.v.nxv1f16(
    <vscale x 1 x half> undef,
    <vscale x 1 x half> %0,
    i64 %1)

  ret <vscale x 1 x half> %a
}

declare <vscale x 2 x half> @llvm.riscv.vmv.v.v.nxv2f16(
  <vscale x 2 x half>,
  <vscale x 2 x half>,
  i64);

define <vscale x 2 x half> @intrinsic_vmv.v.v_v_nxv2f16_nxv2f16(<vscale x 2 x half> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv2f16_nxv2f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, mf2, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 2 x half> @llvm.riscv.vmv.v.v.nxv2f16(
    <vscale x 2 x half> undef,
    <vscale x 2 x half> %0,
    i64 %1)

  ret <vscale x 2 x half> %a
}

declare <vscale x 4 x half> @llvm.riscv.vmv.v.v.nxv4f16(
  <vscale x 4 x half>,
  <vscale x 4 x half>,
  i64);

define <vscale x 4 x half> @intrinsic_vmv.v.v_v_nxv4f16_nxv4f16(<vscale x 4 x half> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv4f16_nxv4f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m1, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 4 x half> @llvm.riscv.vmv.v.v.nxv4f16(
    <vscale x 4 x half> undef,
    <vscale x 4 x half> %0,
    i64 %1)

  ret <vscale x 4 x half> %a
}

declare <vscale x 8 x half> @llvm.riscv.vmv.v.v.nxv8f16(
  <vscale x 8 x half>,
  <vscale x 8 x half>,
  i64);

define <vscale x 8 x half> @intrinsic_vmv.v.v_v_nxv8f16_nxv8f16(<vscale x 8 x half> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv8f16_nxv8f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m2, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 8 x half> @llvm.riscv.vmv.v.v.nxv8f16(
    <vscale x 8 x half> undef,
    <vscale x 8 x half> %0,
    i64 %1)

  ret <vscale x 8 x half> %a
}

declare <vscale x 16 x half> @llvm.riscv.vmv.v.v.nxv16f16(
  <vscale x 16 x half>,
  <vscale x 16 x half>,
  i64);

define <vscale x 16 x half> @intrinsic_vmv.v.v_v_nxv16f16_nxv16f16(<vscale x 16 x half> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv16f16_nxv16f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m4, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 16 x half> @llvm.riscv.vmv.v.v.nxv16f16(
    <vscale x 16 x half> undef,
    <vscale x 16 x half> %0,
    i64 %1)

  ret <vscale x 16 x half> %a
}

declare <vscale x 32 x half> @llvm.riscv.vmv.v.v.nxv32f16(
  <vscale x 32 x half>,
  <vscale x 32 x half>,
  i64);

define <vscale x 32 x half> @intrinsic_vmv.v.v_v_nxv32f16_nxv32f16(<vscale x 32 x half> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv32f16_nxv32f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m8, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 32 x half> @llvm.riscv.vmv.v.v.nxv32f16(
    <vscale x 32 x half> undef,
    <vscale x 32 x half> %0,
    i64 %1)

  ret <vscale x 32 x half> %a
}

declare <vscale x 1 x float> @llvm.riscv.vmv.v.v.nxv1f32(
  <vscale x 1 x float>,
  <vscale x 1 x float>,
  i64);

define <vscale x 1 x float> @intrinsic_vmv.v.v_v_nxv1f32_nxv1f32(<vscale x 1 x float> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv1f32_nxv1f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, mf2, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 1 x float> @llvm.riscv.vmv.v.v.nxv1f32(
    <vscale x 1 x float> undef,
    <vscale x 1 x float> %0,
    i64 %1)

  ret <vscale x 1 x float> %a
}

declare <vscale x 2 x float> @llvm.riscv.vmv.v.v.nxv2f32(
  <vscale x 2 x float>,
  <vscale x 2 x float>,
  i64);

define <vscale x 2 x float> @intrinsic_vmv.v.v_v_nxv2f32_nxv2f32(<vscale x 2 x float> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv2f32_nxv2f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, m1, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 2 x float> @llvm.riscv.vmv.v.v.nxv2f32(
    <vscale x 2 x float> undef,
    <vscale x 2 x float> %0,
    i64 %1)

  ret <vscale x 2 x float> %a
}

declare <vscale x 4 x float> @llvm.riscv.vmv.v.v.nxv4f32(
  <vscale x 4 x float>,
  <vscale x 4 x float>,
  i64);

define <vscale x 4 x float> @intrinsic_vmv.v.v_v_nxv4f32_nxv4f32(<vscale x 4 x float> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv4f32_nxv4f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, m2, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 4 x float> @llvm.riscv.vmv.v.v.nxv4f32(
    <vscale x 4 x float> undef,
    <vscale x 4 x float> %0,
    i64 %1)

  ret <vscale x 4 x float> %a
}

declare <vscale x 8 x float> @llvm.riscv.vmv.v.v.nxv8f32(
  <vscale x 8 x float>,
  <vscale x 8 x float>,
  i64);

define <vscale x 8 x float> @intrinsic_vmv.v.v_v_nxv8f32_nxv8f32(<vscale x 8 x float> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv8f32_nxv8f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, m4, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 8 x float> @llvm.riscv.vmv.v.v.nxv8f32(
    <vscale x 8 x float> undef,
    <vscale x 8 x float> %0,
    i64 %1)

  ret <vscale x 8 x float> %a
}

declare <vscale x 16 x float> @llvm.riscv.vmv.v.v.nxv16f32(
  <vscale x 16 x float>,
  <vscale x 16 x float>,
  i64);

define <vscale x 16 x float> @intrinsic_vmv.v.v_v_nxv16f32_nxv16f32(<vscale x 16 x float> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv16f32_nxv16f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, m8, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 16 x float> @llvm.riscv.vmv.v.v.nxv16f32(
    <vscale x 16 x float> undef,
    <vscale x 16 x float> %0,
    i64 %1)

  ret <vscale x 16 x float> %a
}

declare <vscale x 1 x double> @llvm.riscv.vmv.v.v.nxv1f64(
  <vscale x 1 x double>,
  <vscale x 1 x double>,
  i64);

define <vscale x 1 x double> @intrinsic_vmv.v.v_v_nxv1f64_nxv1f64(<vscale x 1 x double> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv1f64_nxv1f64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e64, m1, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 1 x double> @llvm.riscv.vmv.v.v.nxv1f64(
    <vscale x 1 x double> undef,
    <vscale x 1 x double> %0,
    i64 %1)

  ret <vscale x 1 x double> %a
}

declare <vscale x 2 x double> @llvm.riscv.vmv.v.v.nxv2f64(
  <vscale x 2 x double>,
  <vscale x 2 x double>,
  i64);

define <vscale x 2 x double> @intrinsic_vmv.v.v_v_nxv2f64_nxv2f64(<vscale x 2 x double> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv2f64_nxv2f64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e64, m2, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 2 x double> @llvm.riscv.vmv.v.v.nxv2f64(
    <vscale x 2 x double> undef,
    <vscale x 2 x double> %0,
    i64 %1)

  ret <vscale x 2 x double> %a
}

declare <vscale x 4 x double> @llvm.riscv.vmv.v.v.nxv4f64(
  <vscale x 4 x double>,
  <vscale x 4 x double>,
  i64);

define <vscale x 4 x double> @intrinsic_vmv.v.v_v_nxv4f64_nxv4f64(<vscale x 4 x double> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv4f64_nxv4f64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e64, m4, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 4 x double> @llvm.riscv.vmv.v.v.nxv4f64(
    <vscale x 4 x double> undef,
    <vscale x 4 x double> %0,
    i64 %1)

  ret <vscale x 4 x double> %a
}

declare <vscale x 8 x double> @llvm.riscv.vmv.v.v.nxv8f64(
  <vscale x 8 x double>,
  <vscale x 8 x double>,
  i64);

define <vscale x 8 x double> @intrinsic_vmv.v.v_v_nxv8f64_nxv8f64(<vscale x 8 x double> %0, i64 %1) nounwind {
; CHECK-LABEL: intrinsic_vmv.v.v_v_nxv8f64_nxv8f64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e64, m8, ta, mu
; CHECK-NEXT:    vmv.v.v v8, v8
; CHECK-NEXT:    ret
entry:
  %a = call <vscale x 8 x double> @llvm.riscv.vmv.v.v.nxv8f64(
    <vscale x 8 x double> undef,
    <vscale x 8 x double> %0,
    i64 %1)

  ret <vscale x 8 x double> %a
}
