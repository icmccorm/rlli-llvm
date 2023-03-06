; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+f,+d,+zfh,+experimental-zvfh,+v -target-abi ilp32d -verify-machineinstrs < %s \
; RUN:   | FileCheck %s
; RUN: llc -mtriple=riscv64 -mattr=+f,+d,+zfh,+experimental-zvfh,+v -target-abi lp64d -verify-machineinstrs < %s \
; RUN:   | FileCheck %s

define <vscale x 8 x half> @vsplat_nxv8f16(half %f) {
; CHECK-LABEL: vsplat_nxv8f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e16, m2, ta, mu
; CHECK-NEXT:    vfmv.v.f v8, fa0
; CHECK-NEXT:    ret
  %head = insertelement <vscale x 8 x half> poison, half %f, i32 0
  %splat = shufflevector <vscale x 8 x half> %head, <vscale x 8 x half> poison, <vscale x 8 x i32> zeroinitializer
  ret <vscale x 8 x half> %splat
}

define <vscale x 8 x half> @vsplat_zero_nxv8f16() {
; CHECK-LABEL: vsplat_zero_nxv8f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e16, m2, ta, mu
; CHECK-NEXT:    vmv.v.i v8, 0
; CHECK-NEXT:    ret
  %head = insertelement <vscale x 8 x half> poison, half zeroinitializer, i32 0
  %splat = shufflevector <vscale x 8 x half> %head, <vscale x 8 x half> poison, <vscale x 8 x i32> zeroinitializer
  ret <vscale x 8 x half> %splat
}

define <vscale x 8 x float> @vsplat_nxv8f32(float %f) {
; CHECK-LABEL: vsplat_nxv8f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e32, m4, ta, mu
; CHECK-NEXT:    vfmv.v.f v8, fa0
; CHECK-NEXT:    ret
  %head = insertelement <vscale x 8 x float> poison, float %f, i32 0
  %splat = shufflevector <vscale x 8 x float> %head, <vscale x 8 x float> poison, <vscale x 8 x i32> zeroinitializer
  ret <vscale x 8 x float> %splat
}

define <vscale x 8 x float> @vsplat_zero_nxv8f32() {
; CHECK-LABEL: vsplat_zero_nxv8f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e32, m4, ta, mu
; CHECK-NEXT:    vmv.v.i v8, 0
; CHECK-NEXT:    ret
  %head = insertelement <vscale x 8 x float> poison, float zeroinitializer, i32 0
  %splat = shufflevector <vscale x 8 x float> %head, <vscale x 8 x float> poison, <vscale x 8 x i32> zeroinitializer
  ret <vscale x 8 x float> %splat
}

define <vscale x 8 x double> @vsplat_nxv8f64(double %f) {
; CHECK-LABEL: vsplat_nxv8f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e64, m8, ta, mu
; CHECK-NEXT:    vfmv.v.f v8, fa0
; CHECK-NEXT:    ret
  %head = insertelement <vscale x 8 x double> poison, double %f, i32 0
  %splat = shufflevector <vscale x 8 x double> %head, <vscale x 8 x double> poison, <vscale x 8 x i32> zeroinitializer
  ret <vscale x 8 x double> %splat
}

define <vscale x 8 x double> @vsplat_zero_nxv8f64() {
; CHECK-LABEL: vsplat_zero_nxv8f64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e64, m8, ta, mu
; CHECK-NEXT:    vmv.v.i v8, 0
; CHECK-NEXT:    ret
  %head = insertelement <vscale x 8 x double> poison, double zeroinitializer, i32 0
  %splat = shufflevector <vscale x 8 x double> %head, <vscale x 8 x double> poison, <vscale x 8 x i32> zeroinitializer
  ret <vscale x 8 x double> %splat
}

; Test that we fold this to a vlse with 0 stride.
define <vscale x 8 x float> @vsplat_load_nxv8f32(float* %ptr) {
; CHECK-LABEL: vsplat_load_nxv8f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e32, m4, ta, mu
; CHECK-NEXT:    vlse32.v v8, (a0), zero
; CHECK-NEXT:    ret
  %f = load float, float* %ptr
  %head = insertelement <vscale x 8 x float> poison, float %f, i32 0
  %splat = shufflevector <vscale x 8 x float> %head, <vscale x 8 x float> poison, <vscale x 8 x i32> zeroinitializer
  ret <vscale x 8 x float> %splat
}
