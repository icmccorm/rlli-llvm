; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv64 -mattr=+v,+d,+zfh,+experimental-zvfh,+f -verify-machineinstrs \
; RUN:   < %s | FileCheck %s

; The intrinsics are not supported with RV32.

declare void @llvm.riscv.vsuxei.nxv1i8.nxv1i64(
  <vscale x 1 x i8>,
  <vscale x 1 x i8>*,
  <vscale x 1 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv1i8_nxv1i8_nxv1i64(<vscale x 1 x i8> %0, <vscale x 1 x i8>* %1, <vscale x 1 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv1i8_nxv1i8_nxv1i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e8, mf8, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v9
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv1i8.nxv1i64(
    <vscale x 1 x i8> %0,
    <vscale x 1 x i8>* %1,
    <vscale x 1 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv1i8.nxv1i64(
  <vscale x 1 x i8>,
  <vscale x 1 x i8>*,
  <vscale x 1 x i64>,
  <vscale x 1 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv1i8_nxv1i8_nxv1i64(<vscale x 1 x i8> %0, <vscale x 1 x i8>* %1, <vscale x 1 x i64> %2, <vscale x 1 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv1i8_nxv1i8_nxv1i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e8, mf8, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v9, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv1i8.nxv1i64(
    <vscale x 1 x i8> %0,
    <vscale x 1 x i8>* %1,
    <vscale x 1 x i64> %2,
    <vscale x 1 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv2i8.nxv2i64(
  <vscale x 2 x i8>,
  <vscale x 2 x i8>*,
  <vscale x 2 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv2i8_nxv2i8_nxv2i64(<vscale x 2 x i8> %0, <vscale x 2 x i8>* %1, <vscale x 2 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv2i8_nxv2i8_nxv2i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e8, mf4, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v10
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv2i8.nxv2i64(
    <vscale x 2 x i8> %0,
    <vscale x 2 x i8>* %1,
    <vscale x 2 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv2i8.nxv2i64(
  <vscale x 2 x i8>,
  <vscale x 2 x i8>*,
  <vscale x 2 x i64>,
  <vscale x 2 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv2i8_nxv2i8_nxv2i64(<vscale x 2 x i8> %0, <vscale x 2 x i8>* %1, <vscale x 2 x i64> %2, <vscale x 2 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv2i8_nxv2i8_nxv2i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e8, mf4, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v10, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv2i8.nxv2i64(
    <vscale x 2 x i8> %0,
    <vscale x 2 x i8>* %1,
    <vscale x 2 x i64> %2,
    <vscale x 2 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv4i8.nxv4i64(
  <vscale x 4 x i8>,
  <vscale x 4 x i8>*,
  <vscale x 4 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv4i8_nxv4i8_nxv4i64(<vscale x 4 x i8> %0, <vscale x 4 x i8>* %1, <vscale x 4 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv4i8_nxv4i8_nxv4i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e8, mf2, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v12
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv4i8.nxv4i64(
    <vscale x 4 x i8> %0,
    <vscale x 4 x i8>* %1,
    <vscale x 4 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv4i8.nxv4i64(
  <vscale x 4 x i8>,
  <vscale x 4 x i8>*,
  <vscale x 4 x i64>,
  <vscale x 4 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv4i8_nxv4i8_nxv4i64(<vscale x 4 x i8> %0, <vscale x 4 x i8>* %1, <vscale x 4 x i64> %2, <vscale x 4 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv4i8_nxv4i8_nxv4i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e8, mf2, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v12, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv4i8.nxv4i64(
    <vscale x 4 x i8> %0,
    <vscale x 4 x i8>* %1,
    <vscale x 4 x i64> %2,
    <vscale x 4 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv8i8.nxv8i64(
  <vscale x 8 x i8>,
  <vscale x 8 x i8>*,
  <vscale x 8 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv8i8_nxv8i8_nxv8i64(<vscale x 8 x i8> %0, <vscale x 8 x i8>* %1, <vscale x 8 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv8i8_nxv8i8_nxv8i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e8, m1, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v16
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv8i8.nxv8i64(
    <vscale x 8 x i8> %0,
    <vscale x 8 x i8>* %1,
    <vscale x 8 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv8i8.nxv8i64(
  <vscale x 8 x i8>,
  <vscale x 8 x i8>*,
  <vscale x 8 x i64>,
  <vscale x 8 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv8i8_nxv8i8_nxv8i64(<vscale x 8 x i8> %0, <vscale x 8 x i8>* %1, <vscale x 8 x i64> %2, <vscale x 8 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv8i8_nxv8i8_nxv8i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e8, m1, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v16, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv8i8.nxv8i64(
    <vscale x 8 x i8> %0,
    <vscale x 8 x i8>* %1,
    <vscale x 8 x i64> %2,
    <vscale x 8 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv1i16.nxv1i64(
  <vscale x 1 x i16>,
  <vscale x 1 x i16>*,
  <vscale x 1 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv1i16_nxv1i16_nxv1i64(<vscale x 1 x i16> %0, <vscale x 1 x i16>* %1, <vscale x 1 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv1i16_nxv1i16_nxv1i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e16, mf4, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v9
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv1i16.nxv1i64(
    <vscale x 1 x i16> %0,
    <vscale x 1 x i16>* %1,
    <vscale x 1 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv1i16.nxv1i64(
  <vscale x 1 x i16>,
  <vscale x 1 x i16>*,
  <vscale x 1 x i64>,
  <vscale x 1 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv1i16_nxv1i16_nxv1i64(<vscale x 1 x i16> %0, <vscale x 1 x i16>* %1, <vscale x 1 x i64> %2, <vscale x 1 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv1i16_nxv1i16_nxv1i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e16, mf4, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v9, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv1i16.nxv1i64(
    <vscale x 1 x i16> %0,
    <vscale x 1 x i16>* %1,
    <vscale x 1 x i64> %2,
    <vscale x 1 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv2i16.nxv2i64(
  <vscale x 2 x i16>,
  <vscale x 2 x i16>*,
  <vscale x 2 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv2i16_nxv2i16_nxv2i64(<vscale x 2 x i16> %0, <vscale x 2 x i16>* %1, <vscale x 2 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv2i16_nxv2i16_nxv2i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e16, mf2, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v10
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv2i16.nxv2i64(
    <vscale x 2 x i16> %0,
    <vscale x 2 x i16>* %1,
    <vscale x 2 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv2i16.nxv2i64(
  <vscale x 2 x i16>,
  <vscale x 2 x i16>*,
  <vscale x 2 x i64>,
  <vscale x 2 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv2i16_nxv2i16_nxv2i64(<vscale x 2 x i16> %0, <vscale x 2 x i16>* %1, <vscale x 2 x i64> %2, <vscale x 2 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv2i16_nxv2i16_nxv2i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e16, mf2, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v10, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv2i16.nxv2i64(
    <vscale x 2 x i16> %0,
    <vscale x 2 x i16>* %1,
    <vscale x 2 x i64> %2,
    <vscale x 2 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv4i16.nxv4i64(
  <vscale x 4 x i16>,
  <vscale x 4 x i16>*,
  <vscale x 4 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv4i16_nxv4i16_nxv4i64(<vscale x 4 x i16> %0, <vscale x 4 x i16>* %1, <vscale x 4 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv4i16_nxv4i16_nxv4i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e16, m1, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v12
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv4i16.nxv4i64(
    <vscale x 4 x i16> %0,
    <vscale x 4 x i16>* %1,
    <vscale x 4 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv4i16.nxv4i64(
  <vscale x 4 x i16>,
  <vscale x 4 x i16>*,
  <vscale x 4 x i64>,
  <vscale x 4 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv4i16_nxv4i16_nxv4i64(<vscale x 4 x i16> %0, <vscale x 4 x i16>* %1, <vscale x 4 x i64> %2, <vscale x 4 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv4i16_nxv4i16_nxv4i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e16, m1, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v12, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv4i16.nxv4i64(
    <vscale x 4 x i16> %0,
    <vscale x 4 x i16>* %1,
    <vscale x 4 x i64> %2,
    <vscale x 4 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv8i16.nxv8i64(
  <vscale x 8 x i16>,
  <vscale x 8 x i16>*,
  <vscale x 8 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv8i16_nxv8i16_nxv8i64(<vscale x 8 x i16> %0, <vscale x 8 x i16>* %1, <vscale x 8 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv8i16_nxv8i16_nxv8i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e16, m2, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v16
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv8i16.nxv8i64(
    <vscale x 8 x i16> %0,
    <vscale x 8 x i16>* %1,
    <vscale x 8 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv8i16.nxv8i64(
  <vscale x 8 x i16>,
  <vscale x 8 x i16>*,
  <vscale x 8 x i64>,
  <vscale x 8 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv8i16_nxv8i16_nxv8i64(<vscale x 8 x i16> %0, <vscale x 8 x i16>* %1, <vscale x 8 x i64> %2, <vscale x 8 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv8i16_nxv8i16_nxv8i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e16, m2, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v16, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv8i16.nxv8i64(
    <vscale x 8 x i16> %0,
    <vscale x 8 x i16>* %1,
    <vscale x 8 x i64> %2,
    <vscale x 8 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv1i32.nxv1i64(
  <vscale x 1 x i32>,
  <vscale x 1 x i32>*,
  <vscale x 1 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv1i32_nxv1i32_nxv1i64(<vscale x 1 x i32> %0, <vscale x 1 x i32>* %1, <vscale x 1 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv1i32_nxv1i32_nxv1i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e32, mf2, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v9
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv1i32.nxv1i64(
    <vscale x 1 x i32> %0,
    <vscale x 1 x i32>* %1,
    <vscale x 1 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv1i32.nxv1i64(
  <vscale x 1 x i32>,
  <vscale x 1 x i32>*,
  <vscale x 1 x i64>,
  <vscale x 1 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv1i32_nxv1i32_nxv1i64(<vscale x 1 x i32> %0, <vscale x 1 x i32>* %1, <vscale x 1 x i64> %2, <vscale x 1 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv1i32_nxv1i32_nxv1i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e32, mf2, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v9, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv1i32.nxv1i64(
    <vscale x 1 x i32> %0,
    <vscale x 1 x i32>* %1,
    <vscale x 1 x i64> %2,
    <vscale x 1 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv2i32.nxv2i64(
  <vscale x 2 x i32>,
  <vscale x 2 x i32>*,
  <vscale x 2 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv2i32_nxv2i32_nxv2i64(<vscale x 2 x i32> %0, <vscale x 2 x i32>* %1, <vscale x 2 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv2i32_nxv2i32_nxv2i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e32, m1, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v10
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv2i32.nxv2i64(
    <vscale x 2 x i32> %0,
    <vscale x 2 x i32>* %1,
    <vscale x 2 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv2i32.nxv2i64(
  <vscale x 2 x i32>,
  <vscale x 2 x i32>*,
  <vscale x 2 x i64>,
  <vscale x 2 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv2i32_nxv2i32_nxv2i64(<vscale x 2 x i32> %0, <vscale x 2 x i32>* %1, <vscale x 2 x i64> %2, <vscale x 2 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv2i32_nxv2i32_nxv2i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e32, m1, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v10, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv2i32.nxv2i64(
    <vscale x 2 x i32> %0,
    <vscale x 2 x i32>* %1,
    <vscale x 2 x i64> %2,
    <vscale x 2 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv4i32.nxv4i64(
  <vscale x 4 x i32>,
  <vscale x 4 x i32>*,
  <vscale x 4 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv4i32_nxv4i32_nxv4i64(<vscale x 4 x i32> %0, <vscale x 4 x i32>* %1, <vscale x 4 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv4i32_nxv4i32_nxv4i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e32, m2, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v12
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv4i32.nxv4i64(
    <vscale x 4 x i32> %0,
    <vscale x 4 x i32>* %1,
    <vscale x 4 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv4i32.nxv4i64(
  <vscale x 4 x i32>,
  <vscale x 4 x i32>*,
  <vscale x 4 x i64>,
  <vscale x 4 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv4i32_nxv4i32_nxv4i64(<vscale x 4 x i32> %0, <vscale x 4 x i32>* %1, <vscale x 4 x i64> %2, <vscale x 4 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv4i32_nxv4i32_nxv4i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e32, m2, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v12, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv4i32.nxv4i64(
    <vscale x 4 x i32> %0,
    <vscale x 4 x i32>* %1,
    <vscale x 4 x i64> %2,
    <vscale x 4 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv8i32.nxv8i64(
  <vscale x 8 x i32>,
  <vscale x 8 x i32>*,
  <vscale x 8 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv8i32_nxv8i32_nxv8i64(<vscale x 8 x i32> %0, <vscale x 8 x i32>* %1, <vscale x 8 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv8i32_nxv8i32_nxv8i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e32, m4, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v16
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv8i32.nxv8i64(
    <vscale x 8 x i32> %0,
    <vscale x 8 x i32>* %1,
    <vscale x 8 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv8i32.nxv8i64(
  <vscale x 8 x i32>,
  <vscale x 8 x i32>*,
  <vscale x 8 x i64>,
  <vscale x 8 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv8i32_nxv8i32_nxv8i64(<vscale x 8 x i32> %0, <vscale x 8 x i32>* %1, <vscale x 8 x i64> %2, <vscale x 8 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv8i32_nxv8i32_nxv8i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e32, m4, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v16, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv8i32.nxv8i64(
    <vscale x 8 x i32> %0,
    <vscale x 8 x i32>* %1,
    <vscale x 8 x i64> %2,
    <vscale x 8 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv1i64.nxv1i64(
  <vscale x 1 x i64>,
  <vscale x 1 x i64>*,
  <vscale x 1 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv1i64_nxv1i64_nxv1i64(<vscale x 1 x i64> %0, <vscale x 1 x i64>* %1, <vscale x 1 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv1i64_nxv1i64_nxv1i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e64, m1, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v9
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv1i64.nxv1i64(
    <vscale x 1 x i64> %0,
    <vscale x 1 x i64>* %1,
    <vscale x 1 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv1i64.nxv1i64(
  <vscale x 1 x i64>,
  <vscale x 1 x i64>*,
  <vscale x 1 x i64>,
  <vscale x 1 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv1i64_nxv1i64_nxv1i64(<vscale x 1 x i64> %0, <vscale x 1 x i64>* %1, <vscale x 1 x i64> %2, <vscale x 1 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv1i64_nxv1i64_nxv1i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e64, m1, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v9, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv1i64.nxv1i64(
    <vscale x 1 x i64> %0,
    <vscale x 1 x i64>* %1,
    <vscale x 1 x i64> %2,
    <vscale x 1 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv2i64.nxv2i64(
  <vscale x 2 x i64>,
  <vscale x 2 x i64>*,
  <vscale x 2 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv2i64_nxv2i64_nxv2i64(<vscale x 2 x i64> %0, <vscale x 2 x i64>* %1, <vscale x 2 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv2i64_nxv2i64_nxv2i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e64, m2, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v10
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv2i64.nxv2i64(
    <vscale x 2 x i64> %0,
    <vscale x 2 x i64>* %1,
    <vscale x 2 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv2i64.nxv2i64(
  <vscale x 2 x i64>,
  <vscale x 2 x i64>*,
  <vscale x 2 x i64>,
  <vscale x 2 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv2i64_nxv2i64_nxv2i64(<vscale x 2 x i64> %0, <vscale x 2 x i64>* %1, <vscale x 2 x i64> %2, <vscale x 2 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv2i64_nxv2i64_nxv2i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e64, m2, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v10, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv2i64.nxv2i64(
    <vscale x 2 x i64> %0,
    <vscale x 2 x i64>* %1,
    <vscale x 2 x i64> %2,
    <vscale x 2 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv4i64.nxv4i64(
  <vscale x 4 x i64>,
  <vscale x 4 x i64>*,
  <vscale x 4 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv4i64_nxv4i64_nxv4i64(<vscale x 4 x i64> %0, <vscale x 4 x i64>* %1, <vscale x 4 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv4i64_nxv4i64_nxv4i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e64, m4, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v12
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv4i64.nxv4i64(
    <vscale x 4 x i64> %0,
    <vscale x 4 x i64>* %1,
    <vscale x 4 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv4i64.nxv4i64(
  <vscale x 4 x i64>,
  <vscale x 4 x i64>*,
  <vscale x 4 x i64>,
  <vscale x 4 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv4i64_nxv4i64_nxv4i64(<vscale x 4 x i64> %0, <vscale x 4 x i64>* %1, <vscale x 4 x i64> %2, <vscale x 4 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv4i64_nxv4i64_nxv4i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e64, m4, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v12, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv4i64.nxv4i64(
    <vscale x 4 x i64> %0,
    <vscale x 4 x i64>* %1,
    <vscale x 4 x i64> %2,
    <vscale x 4 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv8i64.nxv8i64(
  <vscale x 8 x i64>,
  <vscale x 8 x i64>*,
  <vscale x 8 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv8i64_nxv8i64_nxv8i64(<vscale x 8 x i64> %0, <vscale x 8 x i64>* %1, <vscale x 8 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv8i64_nxv8i64_nxv8i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e64, m8, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v16
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv8i64.nxv8i64(
    <vscale x 8 x i64> %0,
    <vscale x 8 x i64>* %1,
    <vscale x 8 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv8i64.nxv8i64(
  <vscale x 8 x i64>,
  <vscale x 8 x i64>*,
  <vscale x 8 x i64>,
  <vscale x 8 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv8i64_nxv8i64_nxv8i64(<vscale x 8 x i64> %0, <vscale x 8 x i64>* %1, <vscale x 8 x i64> %2, <vscale x 8 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv8i64_nxv8i64_nxv8i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e64, m8, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v16, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv8i64.nxv8i64(
    <vscale x 8 x i64> %0,
    <vscale x 8 x i64>* %1,
    <vscale x 8 x i64> %2,
    <vscale x 8 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv1f16.nxv1i64(
  <vscale x 1 x half>,
  <vscale x 1 x half>*,
  <vscale x 1 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv1f16_nxv1f16_nxv1i64(<vscale x 1 x half> %0, <vscale x 1 x half>* %1, <vscale x 1 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv1f16_nxv1f16_nxv1i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e16, mf4, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v9
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv1f16.nxv1i64(
    <vscale x 1 x half> %0,
    <vscale x 1 x half>* %1,
    <vscale x 1 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv1f16.nxv1i64(
  <vscale x 1 x half>,
  <vscale x 1 x half>*,
  <vscale x 1 x i64>,
  <vscale x 1 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv1f16_nxv1f16_nxv1i64(<vscale x 1 x half> %0, <vscale x 1 x half>* %1, <vscale x 1 x i64> %2, <vscale x 1 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv1f16_nxv1f16_nxv1i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e16, mf4, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v9, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv1f16.nxv1i64(
    <vscale x 1 x half> %0,
    <vscale x 1 x half>* %1,
    <vscale x 1 x i64> %2,
    <vscale x 1 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv2f16.nxv2i64(
  <vscale x 2 x half>,
  <vscale x 2 x half>*,
  <vscale x 2 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv2f16_nxv2f16_nxv2i64(<vscale x 2 x half> %0, <vscale x 2 x half>* %1, <vscale x 2 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv2f16_nxv2f16_nxv2i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e16, mf2, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v10
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv2f16.nxv2i64(
    <vscale x 2 x half> %0,
    <vscale x 2 x half>* %1,
    <vscale x 2 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv2f16.nxv2i64(
  <vscale x 2 x half>,
  <vscale x 2 x half>*,
  <vscale x 2 x i64>,
  <vscale x 2 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv2f16_nxv2f16_nxv2i64(<vscale x 2 x half> %0, <vscale x 2 x half>* %1, <vscale x 2 x i64> %2, <vscale x 2 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv2f16_nxv2f16_nxv2i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e16, mf2, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v10, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv2f16.nxv2i64(
    <vscale x 2 x half> %0,
    <vscale x 2 x half>* %1,
    <vscale x 2 x i64> %2,
    <vscale x 2 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv4f16.nxv4i64(
  <vscale x 4 x half>,
  <vscale x 4 x half>*,
  <vscale x 4 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv4f16_nxv4f16_nxv4i64(<vscale x 4 x half> %0, <vscale x 4 x half>* %1, <vscale x 4 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv4f16_nxv4f16_nxv4i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e16, m1, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v12
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv4f16.nxv4i64(
    <vscale x 4 x half> %0,
    <vscale x 4 x half>* %1,
    <vscale x 4 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv4f16.nxv4i64(
  <vscale x 4 x half>,
  <vscale x 4 x half>*,
  <vscale x 4 x i64>,
  <vscale x 4 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv4f16_nxv4f16_nxv4i64(<vscale x 4 x half> %0, <vscale x 4 x half>* %1, <vscale x 4 x i64> %2, <vscale x 4 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv4f16_nxv4f16_nxv4i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e16, m1, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v12, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv4f16.nxv4i64(
    <vscale x 4 x half> %0,
    <vscale x 4 x half>* %1,
    <vscale x 4 x i64> %2,
    <vscale x 4 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv8f16.nxv8i64(
  <vscale x 8 x half>,
  <vscale x 8 x half>*,
  <vscale x 8 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv8f16_nxv8f16_nxv8i64(<vscale x 8 x half> %0, <vscale x 8 x half>* %1, <vscale x 8 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv8f16_nxv8f16_nxv8i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e16, m2, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v16
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv8f16.nxv8i64(
    <vscale x 8 x half> %0,
    <vscale x 8 x half>* %1,
    <vscale x 8 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv8f16.nxv8i64(
  <vscale x 8 x half>,
  <vscale x 8 x half>*,
  <vscale x 8 x i64>,
  <vscale x 8 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv8f16_nxv8f16_nxv8i64(<vscale x 8 x half> %0, <vscale x 8 x half>* %1, <vscale x 8 x i64> %2, <vscale x 8 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv8f16_nxv8f16_nxv8i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e16, m2, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v16, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv8f16.nxv8i64(
    <vscale x 8 x half> %0,
    <vscale x 8 x half>* %1,
    <vscale x 8 x i64> %2,
    <vscale x 8 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv1f32.nxv1i64(
  <vscale x 1 x float>,
  <vscale x 1 x float>*,
  <vscale x 1 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv1f32_nxv1f32_nxv1i64(<vscale x 1 x float> %0, <vscale x 1 x float>* %1, <vscale x 1 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv1f32_nxv1f32_nxv1i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e32, mf2, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v9
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv1f32.nxv1i64(
    <vscale x 1 x float> %0,
    <vscale x 1 x float>* %1,
    <vscale x 1 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv1f32.nxv1i64(
  <vscale x 1 x float>,
  <vscale x 1 x float>*,
  <vscale x 1 x i64>,
  <vscale x 1 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv1f32_nxv1f32_nxv1i64(<vscale x 1 x float> %0, <vscale x 1 x float>* %1, <vscale x 1 x i64> %2, <vscale x 1 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv1f32_nxv1f32_nxv1i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e32, mf2, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v9, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv1f32.nxv1i64(
    <vscale x 1 x float> %0,
    <vscale x 1 x float>* %1,
    <vscale x 1 x i64> %2,
    <vscale x 1 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv2f32.nxv2i64(
  <vscale x 2 x float>,
  <vscale x 2 x float>*,
  <vscale x 2 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv2f32_nxv2f32_nxv2i64(<vscale x 2 x float> %0, <vscale x 2 x float>* %1, <vscale x 2 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv2f32_nxv2f32_nxv2i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e32, m1, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v10
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv2f32.nxv2i64(
    <vscale x 2 x float> %0,
    <vscale x 2 x float>* %1,
    <vscale x 2 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv2f32.nxv2i64(
  <vscale x 2 x float>,
  <vscale x 2 x float>*,
  <vscale x 2 x i64>,
  <vscale x 2 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv2f32_nxv2f32_nxv2i64(<vscale x 2 x float> %0, <vscale x 2 x float>* %1, <vscale x 2 x i64> %2, <vscale x 2 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv2f32_nxv2f32_nxv2i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e32, m1, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v10, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv2f32.nxv2i64(
    <vscale x 2 x float> %0,
    <vscale x 2 x float>* %1,
    <vscale x 2 x i64> %2,
    <vscale x 2 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv4f32.nxv4i64(
  <vscale x 4 x float>,
  <vscale x 4 x float>*,
  <vscale x 4 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv4f32_nxv4f32_nxv4i64(<vscale x 4 x float> %0, <vscale x 4 x float>* %1, <vscale x 4 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv4f32_nxv4f32_nxv4i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e32, m2, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v12
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv4f32.nxv4i64(
    <vscale x 4 x float> %0,
    <vscale x 4 x float>* %1,
    <vscale x 4 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv4f32.nxv4i64(
  <vscale x 4 x float>,
  <vscale x 4 x float>*,
  <vscale x 4 x i64>,
  <vscale x 4 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv4f32_nxv4f32_nxv4i64(<vscale x 4 x float> %0, <vscale x 4 x float>* %1, <vscale x 4 x i64> %2, <vscale x 4 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv4f32_nxv4f32_nxv4i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e32, m2, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v12, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv4f32.nxv4i64(
    <vscale x 4 x float> %0,
    <vscale x 4 x float>* %1,
    <vscale x 4 x i64> %2,
    <vscale x 4 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv8f32.nxv8i64(
  <vscale x 8 x float>,
  <vscale x 8 x float>*,
  <vscale x 8 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv8f32_nxv8f32_nxv8i64(<vscale x 8 x float> %0, <vscale x 8 x float>* %1, <vscale x 8 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv8f32_nxv8f32_nxv8i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e32, m4, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v16
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv8f32.nxv8i64(
    <vscale x 8 x float> %0,
    <vscale x 8 x float>* %1,
    <vscale x 8 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv8f32.nxv8i64(
  <vscale x 8 x float>,
  <vscale x 8 x float>*,
  <vscale x 8 x i64>,
  <vscale x 8 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv8f32_nxv8f32_nxv8i64(<vscale x 8 x float> %0, <vscale x 8 x float>* %1, <vscale x 8 x i64> %2, <vscale x 8 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv8f32_nxv8f32_nxv8i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e32, m4, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v16, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv8f32.nxv8i64(
    <vscale x 8 x float> %0,
    <vscale x 8 x float>* %1,
    <vscale x 8 x i64> %2,
    <vscale x 8 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv1f64.nxv1i64(
  <vscale x 1 x double>,
  <vscale x 1 x double>*,
  <vscale x 1 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv1f64_nxv1f64_nxv1i64(<vscale x 1 x double> %0, <vscale x 1 x double>* %1, <vscale x 1 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv1f64_nxv1f64_nxv1i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e64, m1, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v9
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv1f64.nxv1i64(
    <vscale x 1 x double> %0,
    <vscale x 1 x double>* %1,
    <vscale x 1 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv1f64.nxv1i64(
  <vscale x 1 x double>,
  <vscale x 1 x double>*,
  <vscale x 1 x i64>,
  <vscale x 1 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv1f64_nxv1f64_nxv1i64(<vscale x 1 x double> %0, <vscale x 1 x double>* %1, <vscale x 1 x i64> %2, <vscale x 1 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv1f64_nxv1f64_nxv1i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e64, m1, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v9, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv1f64.nxv1i64(
    <vscale x 1 x double> %0,
    <vscale x 1 x double>* %1,
    <vscale x 1 x i64> %2,
    <vscale x 1 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv2f64.nxv2i64(
  <vscale x 2 x double>,
  <vscale x 2 x double>*,
  <vscale x 2 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv2f64_nxv2f64_nxv2i64(<vscale x 2 x double> %0, <vscale x 2 x double>* %1, <vscale x 2 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv2f64_nxv2f64_nxv2i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e64, m2, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v10
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv2f64.nxv2i64(
    <vscale x 2 x double> %0,
    <vscale x 2 x double>* %1,
    <vscale x 2 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv2f64.nxv2i64(
  <vscale x 2 x double>,
  <vscale x 2 x double>*,
  <vscale x 2 x i64>,
  <vscale x 2 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv2f64_nxv2f64_nxv2i64(<vscale x 2 x double> %0, <vscale x 2 x double>* %1, <vscale x 2 x i64> %2, <vscale x 2 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv2f64_nxv2f64_nxv2i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e64, m2, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v10, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv2f64.nxv2i64(
    <vscale x 2 x double> %0,
    <vscale x 2 x double>* %1,
    <vscale x 2 x i64> %2,
    <vscale x 2 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv4f64.nxv4i64(
  <vscale x 4 x double>,
  <vscale x 4 x double>*,
  <vscale x 4 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv4f64_nxv4f64_nxv4i64(<vscale x 4 x double> %0, <vscale x 4 x double>* %1, <vscale x 4 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv4f64_nxv4f64_nxv4i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e64, m4, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v12
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv4f64.nxv4i64(
    <vscale x 4 x double> %0,
    <vscale x 4 x double>* %1,
    <vscale x 4 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv4f64.nxv4i64(
  <vscale x 4 x double>,
  <vscale x 4 x double>*,
  <vscale x 4 x i64>,
  <vscale x 4 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv4f64_nxv4f64_nxv4i64(<vscale x 4 x double> %0, <vscale x 4 x double>* %1, <vscale x 4 x i64> %2, <vscale x 4 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv4f64_nxv4f64_nxv4i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e64, m4, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v12, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv4f64.nxv4i64(
    <vscale x 4 x double> %0,
    <vscale x 4 x double>* %1,
    <vscale x 4 x i64> %2,
    <vscale x 4 x i1> %3,
    i64 %4)

  ret void
}

declare void @llvm.riscv.vsuxei.nxv8f64.nxv8i64(
  <vscale x 8 x double>,
  <vscale x 8 x double>*,
  <vscale x 8 x i64>,
  i64);

define void @intrinsic_vsuxei_v_nxv8f64_nxv8f64_nxv8i64(<vscale x 8 x double> %0, <vscale x 8 x double>* %1, <vscale x 8 x i64> %2, i64 %3) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_v_nxv8f64_nxv8f64_nxv8i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e64, m8, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v16
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.nxv8f64.nxv8i64(
    <vscale x 8 x double> %0,
    <vscale x 8 x double>* %1,
    <vscale x 8 x i64> %2,
    i64 %3)

  ret void
}

declare void @llvm.riscv.vsuxei.mask.nxv8f64.nxv8i64(
  <vscale x 8 x double>,
  <vscale x 8 x double>*,
  <vscale x 8 x i64>,
  <vscale x 8 x i1>,
  i64);

define void @intrinsic_vsuxei_mask_v_nxv8f64_nxv8f64_nxv8i64(<vscale x 8 x double> %0, <vscale x 8 x double>* %1, <vscale x 8 x i64> %2, <vscale x 8 x i1> %3, i64 %4) nounwind {
; CHECK-LABEL: intrinsic_vsuxei_mask_v_nxv8f64_nxv8f64_nxv8i64:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsetvli zero, a1, e64, m8, ta, mu
; CHECK-NEXT:    vsuxei64.v v8, (a0), v16, v0.t
; CHECK-NEXT:    ret
entry:
  call void @llvm.riscv.vsuxei.mask.nxv8f64.nxv8i64(
    <vscale x 8 x double> %0,
    <vscale x 8 x double>* %1,
    <vscale x 8 x i64> %2,
    <vscale x 8 x i1> %3,
    i64 %4)

  ret void
}
