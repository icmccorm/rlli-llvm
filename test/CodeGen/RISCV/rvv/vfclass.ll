; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: sed 's/iXLen/i32/g' %s | llc -mtriple=riscv32 -mattr=+v,+zfh,+experimental-zvfh \
; RUN:   -verify-machineinstrs -target-abi=ilp32d | FileCheck %s
; RUN: sed 's/iXLen/i64/g' %s | llc -mtriple=riscv64 -mattr=+v,+zfh,+experimental-zvfh \
; RUN:   -verify-machineinstrs -target-abi=lp64d | FileCheck %s
declare <vscale x 1 x i16> @llvm.riscv.vfclass.nxv1i16(
  <vscale x 1 x i16>,
  <vscale x 1 x half>,
  iXLen);

define <vscale x 1 x i16> @intrinsic_vfclass_v_nxv1i16_nxv1f16(
; CHECK-LABEL: intrinsic_vfclass_v_nxv1i16_nxv1f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, mf4, ta, mu
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    ret
  <vscale x 1 x half> %0,
  iXLen %1) nounwind {
entry:
  %a = call <vscale x 1 x i16> @llvm.riscv.vfclass.nxv1i16(
    <vscale x 1 x i16> undef,
    <vscale x 1 x half> %0,
    iXLen %1)

  ret <vscale x 1 x i16> %a
}

declare <vscale x 1 x i16> @llvm.riscv.vfclass.mask.nxv1i16(
  <vscale x 1 x i16>,
  <vscale x 1 x half>,
  <vscale x 1 x i1>,
  iXLen, iXLen);

define <vscale x 1 x i16> @intrinsic_vfclass_mask_v_nxv1i16_nxv1f16(
; CHECK-LABEL: intrinsic_vfclass_mask_v_nxv1i16_nxv1f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, mf4, tu, mu
; CHECK-NEXT:    vfclass.v v8, v9, v0.t
; CHECK-NEXT:    ret
  <vscale x 1 x i16> %0,
  <vscale x 1 x half> %1,
  <vscale x 1 x i1> %2,
  iXLen %3) nounwind {
entry:
  %a = call <vscale x 1 x i16> @llvm.riscv.vfclass.mask.nxv1i16(
    <vscale x 1 x i16> %0,
    <vscale x 1 x half> %1,
    <vscale x 1 x i1> %2,
    iXLen %3, iXLen 0)

  ret <vscale x 1 x i16> %a
}

declare <vscale x 2 x i16> @llvm.riscv.vfclass.nxv2i16(
  <vscale x 2 x i16>,
  <vscale x 2 x half>,
  iXLen);

define <vscale x 2 x i16> @intrinsic_vfclass_v_nxv2i16_nxv2f16(
; CHECK-LABEL: intrinsic_vfclass_v_nxv2i16_nxv2f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, mf2, ta, mu
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    ret
  <vscale x 2 x half> %0,
  iXLen %1) nounwind {
entry:
  %a = call <vscale x 2 x i16> @llvm.riscv.vfclass.nxv2i16(
    <vscale x 2 x i16> undef,
    <vscale x 2 x half> %0,
    iXLen %1)

  ret <vscale x 2 x i16> %a
}

declare <vscale x 2 x i16> @llvm.riscv.vfclass.mask.nxv2i16(
  <vscale x 2 x i16>,
  <vscale x 2 x half>,
  <vscale x 2 x i1>,
  iXLen, iXLen);

define <vscale x 2 x i16> @intrinsic_vfclass_mask_v_nxv2i16_nxv2f16(
; CHECK-LABEL: intrinsic_vfclass_mask_v_nxv2i16_nxv2f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, mf2, tu, mu
; CHECK-NEXT:    vfclass.v v8, v9, v0.t
; CHECK-NEXT:    ret
  <vscale x 2 x i16> %0,
  <vscale x 2 x half> %1,
  <vscale x 2 x i1> %2,
  iXLen %3) nounwind {
entry:
  %a = call <vscale x 2 x i16> @llvm.riscv.vfclass.mask.nxv2i16(
    <vscale x 2 x i16> %0,
    <vscale x 2 x half> %1,
    <vscale x 2 x i1> %2,
    iXLen %3, iXLen 0)

  ret <vscale x 2 x i16> %a
}

declare <vscale x 4 x i16> @llvm.riscv.vfclass.nxv4i16(
  <vscale x 4 x i16>,
  <vscale x 4 x half>,
  iXLen);

define <vscale x 4 x i16> @intrinsic_vfclass_v_nxv4i16_nxv4f16(
; CHECK-LABEL: intrinsic_vfclass_v_nxv4i16_nxv4f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m1, ta, mu
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    ret
  <vscale x 4 x half> %0,
  iXLen %1) nounwind {
entry:
  %a = call <vscale x 4 x i16> @llvm.riscv.vfclass.nxv4i16(
    <vscale x 4 x i16> undef,
    <vscale x 4 x half> %0,
    iXLen %1)

  ret <vscale x 4 x i16> %a
}

declare <vscale x 4 x i16> @llvm.riscv.vfclass.mask.nxv4i16(
  <vscale x 4 x i16>,
  <vscale x 4 x half>,
  <vscale x 4 x i1>,
  iXLen, iXLen);

define <vscale x 4 x i16> @intrinsic_vfclass_mask_v_nxv4i16_nxv4f16(
; CHECK-LABEL: intrinsic_vfclass_mask_v_nxv4i16_nxv4f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m1, tu, mu
; CHECK-NEXT:    vfclass.v v8, v9, v0.t
; CHECK-NEXT:    ret
  <vscale x 4 x i16> %0,
  <vscale x 4 x half> %1,
  <vscale x 4 x i1> %2,
  iXLen %3) nounwind {
entry:
  %a = call <vscale x 4 x i16> @llvm.riscv.vfclass.mask.nxv4i16(
    <vscale x 4 x i16> %0,
    <vscale x 4 x half> %1,
    <vscale x 4 x i1> %2,
    iXLen %3, iXLen 0)

  ret <vscale x 4 x i16> %a
}

declare <vscale x 8 x i16> @llvm.riscv.vfclass.nxv8i16(
  <vscale x 8 x i16>,
  <vscale x 8 x half>,
  iXLen);

define <vscale x 8 x i16> @intrinsic_vfclass_v_nxv8i16_nxv8f16(
; CHECK-LABEL: intrinsic_vfclass_v_nxv8i16_nxv8f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m2, ta, mu
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    ret
  <vscale x 8 x half> %0,
  iXLen %1) nounwind {
entry:
  %a = call <vscale x 8 x i16> @llvm.riscv.vfclass.nxv8i16(
    <vscale x 8 x i16> undef,
    <vscale x 8 x half> %0,
    iXLen %1)

  ret <vscale x 8 x i16> %a
}

declare <vscale x 8 x i16> @llvm.riscv.vfclass.mask.nxv8i16(
  <vscale x 8 x i16>,
  <vscale x 8 x half>,
  <vscale x 8 x i1>,
  iXLen, iXLen);

define <vscale x 8 x i16> @intrinsic_vfclass_mask_v_nxv8i16_nxv8f16(
; CHECK-LABEL: intrinsic_vfclass_mask_v_nxv8i16_nxv8f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m2, tu, mu
; CHECK-NEXT:    vfclass.v v8, v10, v0.t
; CHECK-NEXT:    ret
  <vscale x 8 x i16> %0,
  <vscale x 8 x half> %1,
  <vscale x 8 x i1> %2,
  iXLen %3) nounwind {
entry:
  %a = call <vscale x 8 x i16> @llvm.riscv.vfclass.mask.nxv8i16(
    <vscale x 8 x i16> %0,
    <vscale x 8 x half> %1,
    <vscale x 8 x i1> %2,
    iXLen %3, iXLen 0)

  ret <vscale x 8 x i16> %a
}

declare <vscale x 16 x i16> @llvm.riscv.vfclass.nxv16i16(
  <vscale x 16 x i16>,
  <vscale x 16 x half>,
  iXLen);

define <vscale x 16 x i16> @intrinsic_vfclass_v_nxv16i16_nxv16f16(
; CHECK-LABEL: intrinsic_vfclass_v_nxv16i16_nxv16f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m4, ta, mu
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    ret
  <vscale x 16 x half> %0,
  iXLen %1) nounwind {
entry:
  %a = call <vscale x 16 x i16> @llvm.riscv.vfclass.nxv16i16(
    <vscale x 16 x i16> undef,
    <vscale x 16 x half> %0,
    iXLen %1)

  ret <vscale x 16 x i16> %a
}

declare <vscale x 16 x i16> @llvm.riscv.vfclass.mask.nxv16i16(
  <vscale x 16 x i16>,
  <vscale x 16 x half>,
  <vscale x 16 x i1>,
  iXLen, iXLen);

define <vscale x 16 x i16> @intrinsic_vfclass_mask_v_nxv16i16_nxv16f16(
; CHECK-LABEL: intrinsic_vfclass_mask_v_nxv16i16_nxv16f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m4, tu, mu
; CHECK-NEXT:    vfclass.v v8, v12, v0.t
; CHECK-NEXT:    ret
  <vscale x 16 x i16> %0,
  <vscale x 16 x half> %1,
  <vscale x 16 x i1> %2,
  iXLen %3) nounwind {
entry:
  %a = call <vscale x 16 x i16> @llvm.riscv.vfclass.mask.nxv16i16(
    <vscale x 16 x i16> %0,
    <vscale x 16 x half> %1,
    <vscale x 16 x i1> %2,
    iXLen %3, iXLen 0)

  ret <vscale x 16 x i16> %a
}

declare <vscale x 32 x i16> @llvm.riscv.vfclass.nxv32i16(
  <vscale x 32 x i16>,
  <vscale x 32 x half>,
  iXLen);

define <vscale x 32 x i16> @intrinsic_vfclass_v_nxv32i16_nxv32f16(
; CHECK-LABEL: intrinsic_vfclass_v_nxv32i16_nxv32f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m8, ta, mu
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    ret
  <vscale x 32 x half> %0,
  iXLen %1) nounwind {
entry:
  %a = call <vscale x 32 x i16> @llvm.riscv.vfclass.nxv32i16(
    <vscale x 32 x i16> undef,
    <vscale x 32 x half> %0,
    iXLen %1)

  ret <vscale x 32 x i16> %a
}

declare <vscale x 32 x i16> @llvm.riscv.vfclass.mask.nxv32i16(
  <vscale x 32 x i16>,
  <vscale x 32 x half>,
  <vscale x 32 x i1>,
  iXLen, iXLen);

define <vscale x 32 x i16> @intrinsic_vfclass_mask_v_nxv32i16_nxv32f16(
; CHECK-LABEL: intrinsic_vfclass_mask_v_nxv32i16_nxv32f16:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e16, m8, tu, mu
; CHECK-NEXT:    vfclass.v v8, v16, v0.t
; CHECK-NEXT:    ret
  <vscale x 32 x i16> %0,
  <vscale x 32 x half> %1,
  <vscale x 32 x i1> %2,
  iXLen %3) nounwind {
entry:
  %a = call <vscale x 32 x i16> @llvm.riscv.vfclass.mask.nxv32i16(
    <vscale x 32 x i16> %0,
    <vscale x 32 x half> %1,
    <vscale x 32 x i1> %2,
    iXLen %3, iXLen 0)

  ret <vscale x 32 x i16> %a
}

declare <vscale x 1 x i32> @llvm.riscv.vfclass.nxv1i32(
  <vscale x 1 x i32>,
  <vscale x 1 x float>,
  iXLen);

define <vscale x 1 x i32> @intrinsic_vfclass_v_nxv1i32_nxv1f32(
; CHECK-LABEL: intrinsic_vfclass_v_nxv1i32_nxv1f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, mf2, ta, mu
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    ret
  <vscale x 1 x float> %0,
  iXLen %1) nounwind {
entry:
  %a = call <vscale x 1 x i32> @llvm.riscv.vfclass.nxv1i32(
    <vscale x 1 x i32> undef,
    <vscale x 1 x float> %0,
    iXLen %1)

  ret <vscale x 1 x i32> %a
}

declare <vscale x 1 x i32> @llvm.riscv.vfclass.mask.nxv1i32(
  <vscale x 1 x i32>,
  <vscale x 1 x float>,
  <vscale x 1 x i1>,
  iXLen, iXLen);

define <vscale x 1 x i32> @intrinsic_vfclass_mask_v_nxv1i32_nxv1f32(
; CHECK-LABEL: intrinsic_vfclass_mask_v_nxv1i32_nxv1f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, mf2, tu, mu
; CHECK-NEXT:    vfclass.v v8, v9, v0.t
; CHECK-NEXT:    ret
  <vscale x 1 x i32> %0,
  <vscale x 1 x float> %1,
  <vscale x 1 x i1> %2,
  iXLen %3) nounwind {
entry:
  %a = call <vscale x 1 x i32> @llvm.riscv.vfclass.mask.nxv1i32(
    <vscale x 1 x i32> %0,
    <vscale x 1 x float> %1,
    <vscale x 1 x i1> %2,
    iXLen %3, iXLen 0)

  ret <vscale x 1 x i32> %a
}

declare <vscale x 2 x i32> @llvm.riscv.vfclass.nxv2i32(
  <vscale x 2 x i32>,
  <vscale x 2 x float>,
  iXLen);

define <vscale x 2 x i32> @intrinsic_vfclass_v_nxv2i32_nxv2f32(
; CHECK-LABEL: intrinsic_vfclass_v_nxv2i32_nxv2f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, m1, ta, mu
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    ret
  <vscale x 2 x float> %0,
  iXLen %1) nounwind {
entry:
  %a = call <vscale x 2 x i32> @llvm.riscv.vfclass.nxv2i32(
    <vscale x 2 x i32> undef,
    <vscale x 2 x float> %0,
    iXLen %1)

  ret <vscale x 2 x i32> %a
}

declare <vscale x 2 x i32> @llvm.riscv.vfclass.mask.nxv2i32(
  <vscale x 2 x i32>,
  <vscale x 2 x float>,
  <vscale x 2 x i1>,
  iXLen, iXLen);

define <vscale x 2 x i32> @intrinsic_vfclass_mask_v_nxv2i32_nxv2f32(
; CHECK-LABEL: intrinsic_vfclass_mask_v_nxv2i32_nxv2f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, m1, tu, mu
; CHECK-NEXT:    vfclass.v v8, v9, v0.t
; CHECK-NEXT:    ret
  <vscale x 2 x i32> %0,
  <vscale x 2 x float> %1,
  <vscale x 2 x i1> %2,
  iXLen %3) nounwind {
entry:
  %a = call <vscale x 2 x i32> @llvm.riscv.vfclass.mask.nxv2i32(
    <vscale x 2 x i32> %0,
    <vscale x 2 x float> %1,
    <vscale x 2 x i1> %2,
    iXLen %3, iXLen 0)

  ret <vscale x 2 x i32> %a
}

declare <vscale x 4 x i32> @llvm.riscv.vfclass.nxv4i32(
  <vscale x 4 x i32>,
  <vscale x 4 x float>,
  iXLen);

define <vscale x 4 x i32> @intrinsic_vfclass_v_nxv4i32_nxv4f32(
; CHECK-LABEL: intrinsic_vfclass_v_nxv4i32_nxv4f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, m2, ta, mu
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    ret
  <vscale x 4 x float> %0,
  iXLen %1) nounwind {
entry:
  %a = call <vscale x 4 x i32> @llvm.riscv.vfclass.nxv4i32(
    <vscale x 4 x i32> undef,
    <vscale x 4 x float> %0,
    iXLen %1)

  ret <vscale x 4 x i32> %a
}

declare <vscale x 4 x i32> @llvm.riscv.vfclass.mask.nxv4i32(
  <vscale x 4 x i32>,
  <vscale x 4 x float>,
  <vscale x 4 x i1>,
  iXLen, iXLen);

define <vscale x 4 x i32> @intrinsic_vfclass_mask_v_nxv4i32_nxv4f32(
; CHECK-LABEL: intrinsic_vfclass_mask_v_nxv4i32_nxv4f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, m2, tu, mu
; CHECK-NEXT:    vfclass.v v8, v10, v0.t
; CHECK-NEXT:    ret
  <vscale x 4 x i32> %0,
  <vscale x 4 x float> %1,
  <vscale x 4 x i1> %2,
  iXLen %3) nounwind {
entry:
  %a = call <vscale x 4 x i32> @llvm.riscv.vfclass.mask.nxv4i32(
    <vscale x 4 x i32> %0,
    <vscale x 4 x float> %1,
    <vscale x 4 x i1> %2,
    iXLen %3, iXLen 0)

  ret <vscale x 4 x i32> %a
}

declare <vscale x 8 x i32> @llvm.riscv.vfclass.nxv8i32(
  <vscale x 8 x i32>,
  <vscale x 8 x float>,
  iXLen);

define <vscale x 8 x i32> @intrinsic_vfclass_v_nxv8i32_nxv8f32(
; CHECK-LABEL: intrinsic_vfclass_v_nxv8i32_nxv8f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, m4, ta, mu
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    ret
  <vscale x 8 x float> %0,
  iXLen %1) nounwind {
entry:
  %a = call <vscale x 8 x i32> @llvm.riscv.vfclass.nxv8i32(
    <vscale x 8 x i32> undef,
    <vscale x 8 x float> %0,
    iXLen %1)

  ret <vscale x 8 x i32> %a
}

declare <vscale x 8 x i32> @llvm.riscv.vfclass.mask.nxv8i32(
  <vscale x 8 x i32>,
  <vscale x 8 x float>,
  <vscale x 8 x i1>,
  iXLen, iXLen);

define <vscale x 8 x i32> @intrinsic_vfclass_mask_v_nxv8i32_nxv8f32(
; CHECK-LABEL: intrinsic_vfclass_mask_v_nxv8i32_nxv8f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, m4, tu, mu
; CHECK-NEXT:    vfclass.v v8, v12, v0.t
; CHECK-NEXT:    ret
  <vscale x 8 x i32> %0,
  <vscale x 8 x float> %1,
  <vscale x 8 x i1> %2,
  iXLen %3) nounwind {
entry:
  %a = call <vscale x 8 x i32> @llvm.riscv.vfclass.mask.nxv8i32(
    <vscale x 8 x i32> %0,
    <vscale x 8 x float> %1,
    <vscale x 8 x i1> %2,
    iXLen %3, iXLen 0)

  ret <vscale x 8 x i32> %a
}

declare <vscale x 16 x i32> @llvm.riscv.vfclass.nxv16i32(
  <vscale x 16 x i32>,
  <vscale x 16 x float>,
  iXLen);

define <vscale x 16 x i32> @intrinsic_vfclass_v_nxv16i32_nxv16f32(
; CHECK-LABEL: intrinsic_vfclass_v_nxv16i32_nxv16f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, m8, ta, mu
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    ret
  <vscale x 16 x float> %0,
  iXLen %1) nounwind {
entry:
  %a = call <vscale x 16 x i32> @llvm.riscv.vfclass.nxv16i32(
    <vscale x 16 x i32> undef,
    <vscale x 16 x float> %0,
    iXLen %1)

  ret <vscale x 16 x i32> %a
}

declare <vscale x 16 x i32> @llvm.riscv.vfclass.mask.nxv16i32(
  <vscale x 16 x i32>,
  <vscale x 16 x float>,
  <vscale x 16 x i1>,
  iXLen, iXLen);

define <vscale x 16 x i32> @intrinsic_vfclass_mask_v_nxv16i32_nxv16f32(
; CHECK-LABEL: intrinsic_vfclass_mask_v_nxv16i32_nxv16f32:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e32, m8, tu, mu
; CHECK-NEXT:    vfclass.v v8, v16, v0.t
; CHECK-NEXT:    ret
  <vscale x 16 x i32> %0,
  <vscale x 16 x float> %1,
  <vscale x 16 x i1> %2,
  iXLen %3) nounwind {
entry:
  %a = call <vscale x 16 x i32> @llvm.riscv.vfclass.mask.nxv16i32(
    <vscale x 16 x i32> %0,
    <vscale x 16 x float> %1,
    <vscale x 16 x i1> %2,
    iXLen %3, iXLen 0)

  ret <vscale x 16 x i32> %a
}

declare <vscale x 1 x i64> @llvm.riscv.vfclass.nxv1i64(
  <vscale x 1 x i64>,
  <vscale x 1 x double>,
  iXLen);

define <vscale x 1 x i64> @intrinsic_vfclass_v_nxv1i64_nxv1f64(
; CHECK-LABEL: intrinsic_vfclass_v_nxv1i64_nxv1f64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e64, m1, ta, mu
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    ret
  <vscale x 1 x double> %0,
  iXLen %1) nounwind {
entry:
  %a = call <vscale x 1 x i64> @llvm.riscv.vfclass.nxv1i64(
    <vscale x 1 x i64> undef,
    <vscale x 1 x double> %0,
    iXLen %1)

  ret <vscale x 1 x i64> %a
}

declare <vscale x 1 x i64> @llvm.riscv.vfclass.mask.nxv1i64(
  <vscale x 1 x i64>,
  <vscale x 1 x double>,
  <vscale x 1 x i1>,
  iXLen, iXLen);

define <vscale x 1 x i64> @intrinsic_vfclass_mask_v_nxv1i64_nxv1f64(
; CHECK-LABEL: intrinsic_vfclass_mask_v_nxv1i64_nxv1f64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e64, m1, tu, mu
; CHECK-NEXT:    vfclass.v v8, v9, v0.t
; CHECK-NEXT:    ret
  <vscale x 1 x i64> %0,
  <vscale x 1 x double> %1,
  <vscale x 1 x i1> %2,
  iXLen %3) nounwind {
entry:
  %a = call <vscale x 1 x i64> @llvm.riscv.vfclass.mask.nxv1i64(
    <vscale x 1 x i64> %0,
    <vscale x 1 x double> %1,
    <vscale x 1 x i1> %2,
    iXLen %3, iXLen 0)

  ret <vscale x 1 x i64> %a
}

declare <vscale x 2 x i64> @llvm.riscv.vfclass.nxv2i64(
  <vscale x 2 x i64>,
  <vscale x 2 x double>,
  iXLen);

define <vscale x 2 x i64> @intrinsic_vfclass_v_nxv2i64_nxv2f64(
; CHECK-LABEL: intrinsic_vfclass_v_nxv2i64_nxv2f64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e64, m2, ta, mu
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    ret
  <vscale x 2 x double> %0,
  iXLen %1) nounwind {
entry:
  %a = call <vscale x 2 x i64> @llvm.riscv.vfclass.nxv2i64(
    <vscale x 2 x i64> undef,
    <vscale x 2 x double> %0,
    iXLen %1)

  ret <vscale x 2 x i64> %a
}

declare <vscale x 2 x i64> @llvm.riscv.vfclass.mask.nxv2i64(
  <vscale x 2 x i64>,
  <vscale x 2 x double>,
  <vscale x 2 x i1>,
  iXLen, iXLen);

define <vscale x 2 x i64> @intrinsic_vfclass_mask_v_nxv2i64_nxv2f64(
; CHECK-LABEL: intrinsic_vfclass_mask_v_nxv2i64_nxv2f64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e64, m2, tu, mu
; CHECK-NEXT:    vfclass.v v8, v10, v0.t
; CHECK-NEXT:    ret
  <vscale x 2 x i64> %0,
  <vscale x 2 x double> %1,
  <vscale x 2 x i1> %2,
  iXLen %3) nounwind {
entry:
  %a = call <vscale x 2 x i64> @llvm.riscv.vfclass.mask.nxv2i64(
    <vscale x 2 x i64> %0,
    <vscale x 2 x double> %1,
    <vscale x 2 x i1> %2,
    iXLen %3, iXLen 0)

  ret <vscale x 2 x i64> %a
}

declare <vscale x 4 x i64> @llvm.riscv.vfclass.nxv4i64(
  <vscale x 4 x i64>,
  <vscale x 4 x double>,
  iXLen);

define <vscale x 4 x i64> @intrinsic_vfclass_v_nxv4i64_nxv4f64(
; CHECK-LABEL: intrinsic_vfclass_v_nxv4i64_nxv4f64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e64, m4, ta, mu
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    ret
  <vscale x 4 x double> %0,
  iXLen %1) nounwind {
entry:
  %a = call <vscale x 4 x i64> @llvm.riscv.vfclass.nxv4i64(
    <vscale x 4 x i64> undef,
    <vscale x 4 x double> %0,
    iXLen %1)

  ret <vscale x 4 x i64> %a
}

declare <vscale x 4 x i64> @llvm.riscv.vfclass.mask.nxv4i64(
  <vscale x 4 x i64>,
  <vscale x 4 x double>,
  <vscale x 4 x i1>,
  iXLen, iXLen);

define <vscale x 4 x i64> @intrinsic_vfclass_mask_v_nxv4i64_nxv4f64(
; CHECK-LABEL: intrinsic_vfclass_mask_v_nxv4i64_nxv4f64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e64, m4, tu, mu
; CHECK-NEXT:    vfclass.v v8, v12, v0.t
; CHECK-NEXT:    ret
  <vscale x 4 x i64> %0,
  <vscale x 4 x double> %1,
  <vscale x 4 x i1> %2,
  iXLen %3) nounwind {
entry:
  %a = call <vscale x 4 x i64> @llvm.riscv.vfclass.mask.nxv4i64(
    <vscale x 4 x i64> %0,
    <vscale x 4 x double> %1,
    <vscale x 4 x i1> %2,
    iXLen %3, iXLen 0)

  ret <vscale x 4 x i64> %a
}

declare <vscale x 8 x i64> @llvm.riscv.vfclass.nxv8i64(
  <vscale x 8 x i64>,
  <vscale x 8 x double>,
  iXLen);

define <vscale x 8 x i64> @intrinsic_vfclass_v_nxv8i64_nxv8f64(
; CHECK-LABEL: intrinsic_vfclass_v_nxv8i64_nxv8f64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e64, m8, ta, mu
; CHECK-NEXT:    vfclass.v v8, v8
; CHECK-NEXT:    ret
  <vscale x 8 x double> %0,
  iXLen %1) nounwind {
entry:
  %a = call <vscale x 8 x i64> @llvm.riscv.vfclass.nxv8i64(
    <vscale x 8 x i64> undef,
    <vscale x 8 x double> %0,
    iXLen %1)

  ret <vscale x 8 x i64> %a
}

declare <vscale x 8 x i64> @llvm.riscv.vfclass.mask.nxv8i64(
  <vscale x 8 x i64>,
  <vscale x 8 x double>,
  <vscale x 8 x i1>,
  iXLen, iXLen);

define <vscale x 8 x i64> @intrinsic_vfclass_mask_v_nxv8i64_nxv8f64(
; CHECK-LABEL: intrinsic_vfclass_mask_v_nxv8i64_nxv8f64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a0, e64, m8, tu, mu
; CHECK-NEXT:    vfclass.v v8, v16, v0.t
; CHECK-NEXT:    ret
  <vscale x 8 x i64> %0,
  <vscale x 8 x double> %1,
  <vscale x 8 x i1> %2,
  iXLen %3) nounwind {
entry:
  %a = call <vscale x 8 x i64> @llvm.riscv.vfclass.mask.nxv8i64(
    <vscale x 8 x i64> %0,
    <vscale x 8 x double> %1,
    <vscale x 8 x i1> %2,
    iXLen %3, iXLen 0)

  ret <vscale x 8 x i64> %a
}
