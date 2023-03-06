; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -march=ve -mattr=+vpu | FileCheck %s

declare <512 x float> @llvm.vp.fsub.v512f32(<512 x float>, <512 x float>, <512 x i1>, i32)

define fastcc <512 x float> @test_vp_fsub_v512f32_vv(<512 x float> %i0, <512 x float> %i1, <512 x i1> %m, i32 %n) {
; CHECK-LABEL: test_vp_fsub_v512f32_vv:
; CHECK:       # %bb.0:
; CHECK-NEXT:    adds.w.sx %s0, 1, %s0
; CHECK-NEXT:    and %s0, %s0, (32)0
; CHECK-NEXT:    srl %s0, %s0, 1
; CHECK-NEXT:    lvl %s0
; CHECK-NEXT:    pvfsub %v0, %v0, %v1, %vm2
; CHECK-NEXT:    b.l.t (, %s10)
  %r0 = call <512 x float> @llvm.vp.fsub.v512f32(<512 x float> %i0, <512 x float> %i1, <512 x i1> %m, i32 %n)
  ret <512 x float> %r0
}

define fastcc <512 x float> @test_vp_fsub_v512f32_rv(float %s0, <512 x float> %i1, <512 x i1> %m, i32 %n) {
; CHECK-LABEL: test_vp_fsub_v512f32_rv:
; CHECK:       # %bb.0:
; CHECK-NEXT:    and %s2, %s0, (32)1
; CHECK-NEXT:    srl %s0, %s0, 32
; CHECK-NEXT:    or %s0, %s0, %s2
; CHECK-NEXT:    adds.w.sx %s1, 1, %s1
; CHECK-NEXT:    and %s1, %s1, (32)0
; CHECK-NEXT:    srl %s1, %s1, 1
; CHECK-NEXT:    lvl %s1
; CHECK-NEXT:    pvfsub %v0, %s0, %v0, %vm2
; CHECK-NEXT:    b.l.t (, %s10)
  %xins = insertelement <512 x float> undef, float %s0, i32 0
  %i0 = shufflevector <512 x float> %xins, <512 x float> undef, <512 x i32> zeroinitializer
  %r0 = call <512 x float> @llvm.vp.fsub.v512f32(<512 x float> %i0, <512 x float> %i1, <512 x i1> %m, i32 %n)
  ret <512 x float> %r0
}

define fastcc <512 x float> @test_vp_fsub_v512f32_vr(<512 x float> %i0, float %s1, <512 x i1> %m, i32 %n) {
; CHECK-LABEL: test_vp_fsub_v512f32_vr:
; CHECK:       # %bb.0:
; CHECK-NEXT:    and %s2, %s0, (32)1
; CHECK-NEXT:    srl %s0, %s0, 32
; CHECK-NEXT:    or %s0, %s0, %s2
; CHECK-NEXT:    lea %s2, 256
; CHECK-NEXT:    lvl %s2
; CHECK-NEXT:    vbrd %v1, %s0
; CHECK-NEXT:    adds.w.sx %s0, 1, %s1
; CHECK-NEXT:    and %s0, %s0, (32)0
; CHECK-NEXT:    srl %s0, %s0, 1
; CHECK-NEXT:    lvl %s0
; CHECK-NEXT:    pvfsub %v0, %v0, %v1, %vm2
; CHECK-NEXT:    b.l.t (, %s10)
  %yins = insertelement <512 x float> undef, float %s1, i32 0
  %i1 = shufflevector <512 x float> %yins, <512 x float> undef, <512 x i32> zeroinitializer
  %r0 = call <512 x float> @llvm.vp.fsub.v512f32(<512 x float> %i0, <512 x float> %i1, <512 x i1> %m, i32 %n)
  ret <512 x float> %r0
}
