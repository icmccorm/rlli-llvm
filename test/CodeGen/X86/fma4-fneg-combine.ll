; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-linux-gnu -mattr=+fma4,-fma  | FileCheck %s
; RUN: llc < %s -mtriple=x86_64-unknown-linux-gnu -mattr=+fma4,+fma  | FileCheck %s

declare <4 x float> @llvm.x86.fma4.vfmadd.ss(<4 x float> %a, <4 x float> %b, <4 x float> %c)
declare <2 x double> @llvm.x86.fma4.vfmadd.sd(<2 x double> %a, <2 x double> %b, <2 x double> %c)

; TODO this can be negated
define <4 x float> @test1(<4 x float> %a, <4 x float> %b, <4 x float> %c) {
; CHECK-LABEL: test1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmaddss {{.*#+}} xmm0 = (xmm0 * xmm1) + xmm2
; CHECK-NEXT:    vxorps {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0, %xmm0
; CHECK-NEXT:    retq
  %res = tail call <4 x float> @llvm.x86.fma4.vfmadd.ss(<4 x float> %a, <4 x float> %b, <4 x float> %c)
  %sub.i = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %res
  ret <4 x float> %sub.i
}

define <4 x float> @test2(<4 x float> %a, <4 x float> %b, <4 x float> %c) {
; CHECK-LABEL: test2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmsubss {{.*#+}} xmm0 = (xmm0 * xmm1) - xmm2
; CHECK-NEXT:    retq
  %sub.i = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %c
  %res = tail call <4 x float> @llvm.x86.fma4.vfmadd.ss(<4 x float> %a, <4 x float> %b, <4 x float> %sub.i)
  ret <4 x float> %res
}

define <4 x float> @test3(<4 x float> %a, <4 x float> %b, <4 x float> %c) {
; CHECK-LABEL: test3:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfnmaddss {{.*#+}} xmm0 = -(xmm0 * xmm1) + xmm2
; CHECK-NEXT:    retq
  %sub.i = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %b
  %res = tail call <4 x float> @llvm.x86.fma4.vfmadd.ss(<4 x float> %a, <4 x float> %sub.i, <4 x float> %c)
  ret <4 x float> %res
}

define <4 x float> @test4(<4 x float> %a, <4 x float> %b, <4 x float> %c) {
; CHECK-LABEL: test4:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfnmaddss {{.*#+}} xmm0 = -(xmm0 * xmm1) + xmm2
; CHECK-NEXT:    retq
  %sub.i = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %a
  %res = tail call <4 x float> @llvm.x86.fma4.vfmadd.ss(<4 x float> %sub.i, <4 x float> %b, <4 x float> %c)
  ret <4 x float> %res
}

define <4 x float> @test5(<4 x float> %a, <4 x float> %b, <4 x float> %c) {
; CHECK-LABEL: test5:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfnmsubss {{.*#+}} xmm0 = -(xmm0 * xmm1) - xmm2
; CHECK-NEXT:    retq
  %sub.i = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %a
  %sub.i.2 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %c
  %res = tail call <4 x float> @llvm.x86.fma4.vfmadd.ss(<4 x float> %sub.i, <4 x float> %b, <4 x float> %sub.i.2)
  ret <4 x float> %res
}

define <2 x double> @test6(<2 x double> %a, <2 x double> %b, <2 x double> %c) {
; CHECK-LABEL: test6:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmaddsd {{.*#+}} xmm0 = (xmm0 * xmm1) + xmm2
; CHECK-NEXT:    vxorpd {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0, %xmm0
; CHECK-NEXT:    retq
  %res = tail call <2 x double> @llvm.x86.fma4.vfmadd.sd(<2 x double> %a, <2 x double> %b, <2 x double> %c)
  %sub.i = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %res
  ret <2 x double> %sub.i
}

define <2 x double> @test7(<2 x double> %a, <2 x double> %b, <2 x double> %c) {
; CHECK-LABEL: test7:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfmsubsd {{.*#+}} xmm0 = (xmm0 * xmm1) - xmm2
; CHECK-NEXT:    retq
  %sub.i = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %c
  %res = tail call <2 x double> @llvm.x86.fma4.vfmadd.sd(<2 x double> %a, <2 x double> %b, <2 x double> %sub.i)
  ret <2 x double> %res
}

define <2 x double> @test8(<2 x double> %a, <2 x double> %b, <2 x double> %c) {
; CHECK-LABEL: test8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfnmaddsd {{.*#+}} xmm0 = -(xmm0 * xmm1) + xmm2
; CHECK-NEXT:    retq
  %sub.i = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %b
  %res = tail call <2 x double> @llvm.x86.fma4.vfmadd.sd(<2 x double> %a, <2 x double> %sub.i, <2 x double> %c)
  ret <2 x double> %res
}

define <2 x double> @test9(<2 x double> %a, <2 x double> %b, <2 x double> %c) {
; CHECK-LABEL: test9:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfnmaddsd {{.*#+}} xmm0 = -(xmm0 * xmm1) + xmm2
; CHECK-NEXT:    retq
  %sub.i = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %a
  %res = tail call <2 x double> @llvm.x86.fma4.vfmadd.sd(<2 x double> %sub.i, <2 x double> %b, <2 x double> %c)
  ret <2 x double> %res
}

define <2 x double> @test10(<2 x double> %a, <2 x double> %b, <2 x double> %c) {
; CHECK-LABEL: test10:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vfnmsubsd {{.*#+}} xmm0 = -(xmm0 * xmm1) - xmm2
; CHECK-NEXT:    retq
  %sub.i = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %a
  %sub.i.2 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %c
  %res = tail call <2 x double> @llvm.x86.fma4.vfmadd.sd(<2 x double> %sub.i, <2 x double> %b, <2 x double> %sub.i.2)
  ret <2 x double> %res
}
