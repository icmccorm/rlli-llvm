; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -march=amdgcn -mcpu=gfx1010 --misched=si -mattr=si-scheduler < %s | FileCheck %s

define amdgpu_gs void @_amdgpu_gs_main() {
; CHECK-LABEL: _amdgpu_gs_main:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    v_mov_b32_e32 v0, 0
; CHECK-NEXT:    s_mov_b32 s0, 0
; CHECK-NEXT:    s_mov_b32 s1, s0
; CHECK-NEXT:    s_mov_b32 s2, s0
; CHECK-NEXT:    v_mov_b32_e32 v1, v0
; CHECK-NEXT:    v_mov_b32_e32 v2, v0
; CHECK-NEXT:    v_mov_b32_e32 v3, v0
; CHECK-NEXT:    s_mov_b32 s3, s0
; CHECK-NEXT:    exp mrt0 off, off, off, off
; CHECK-NEXT:    buffer_store_dwordx4 v[0:3], v0, s[0:3], 0 idxen
; CHECK-NEXT:    s_endpgm
entry:
  call void @llvm.amdgcn.exp.f32(i32 0, i32 0, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, i1 false, i1 false)
  call void @llvm.amdgcn.struct.buffer.store.v4f32(<4 x float> zeroinitializer, <4 x i32> zeroinitializer, i32 0, i32 0, i32 0, i32 0)
  ret void
}

declare void @llvm.amdgcn.exp.f32(i32 immarg, i32 immarg, float, float, float, float, i1 immarg, i1 immarg)
declare void @llvm.amdgcn.struct.buffer.store.v4f32(<4 x float>, <4 x i32>, i32, i32, i32, i32 immarg)
