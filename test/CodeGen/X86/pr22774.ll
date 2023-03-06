; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=x86_64-pc-linux-gnu -mattr=+avx < %s | FileCheck %s

@in = dso_local global <4 x i64> <i64 -1, i64 -1, i64 -1, i64 -1>, align 32
@out = dso_local global <2 x i64> zeroinitializer, align 16

define dso_local i32 @_Z3foov() {
; CHECK-LABEL: _Z3foov:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vmovsd {{.*#+}} xmm0 = mem[0],zero
; CHECK-NEXT:    vmovaps %xmm0, out(%rip)
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
entry:
  %0 = load <4 x i64>, ptr @in, align 32
  %vecext = extractelement <4 x i64> %0, i32 0
  %vecinit = insertelement <2 x i64> undef, i64 %vecext, i32 0
  %vecinit1 = insertelement <2 x i64> %vecinit, i64 0, i32 1
  store <2 x i64> %vecinit1, ptr @out, align 16
  ret i32 0
}
