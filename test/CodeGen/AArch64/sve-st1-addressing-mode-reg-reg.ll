; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=aarch64-linux-gnu -mattr=+sve,+bf16 < %s | FileCheck %s

; ST1B

define void @st1_nxv16i8(i8* %addr, i64 %off, <vscale x 16 x i8> %val) {
; CHECK-LABEL: st1_nxv16i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.b
; CHECK-NEXT:    st1b { z0.b }, p0, [x0, x1]
; CHECK-NEXT:    ret
  %ptr = getelementptr inbounds i8, i8* %addr, i64 %off
  %ptrcast = bitcast i8* %ptr to <vscale x 16 x i8>*
  store <vscale x 16 x i8> %val, <vscale x 16 x i8>* %ptrcast
  ret void
}

define void @st1_nxv16i8_bitcast_from_i16(i8* %addr, i64 %off, <vscale x 8 x i16> %val) {
; CHECK-LABEL: st1_nxv16i8_bitcast_from_i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.b
; CHECK-NEXT:    st1b { z0.b }, p0, [x0, x1]
; CHECK-NEXT:    ret
  %ptr = getelementptr inbounds i8, i8* %addr, i64 %off
  %ptrcast = bitcast i8* %ptr to <vscale x 8 x i16>*
  store <vscale x 8 x i16> %val, <vscale x 8 x i16>* %ptrcast
  ret void
}

define void @st1_nxv16i8_bitcast_from_i32(i8* %addr, i64 %off, <vscale x 4 x i32> %val) {
; CHECK-LABEL: st1_nxv16i8_bitcast_from_i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.b
; CHECK-NEXT:    st1b { z0.b }, p0, [x0, x1]
; CHECK-NEXT:    ret
  %ptr = getelementptr inbounds i8, i8* %addr, i64 %off
  %ptrcast = bitcast i8* %ptr to <vscale x 4 x i32>*
  store <vscale x 4 x i32> %val, <vscale x 4 x i32>* %ptrcast
  ret void
}

define void @st1_nxv16i8_bitcast_from_i64(i8* %addr, i64 %off, <vscale x 2 x i64> %val) {
; CHECK-LABEL: st1_nxv16i8_bitcast_from_i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.b
; CHECK-NEXT:    st1b { z0.b }, p0, [x0, x1]
; CHECK-NEXT:    ret
  %ptr = getelementptr inbounds i8, i8* %addr, i64 %off
  %ptrcast = bitcast i8* %ptr to <vscale x 2 x i64>*
  store <vscale x 2 x i64> %val, <vscale x 2 x i64>* %ptrcast
  ret void
}

define void @st1_nxv8i16_trunc8(i8* %addr, i64 %off, <vscale x 8 x i16> %val) {
; CHECK-LABEL: st1_nxv8i16_trunc8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    st1b { z0.h }, p0, [x0, x1]
; CHECK-NEXT:    ret
  %ptr = getelementptr inbounds i8, i8* %addr, i64 %off
  %ptrcast = bitcast i8* %ptr to <vscale x 8 x i8>*
  %trunc = trunc <vscale x 8 x i16> %val to <vscale x 8 x i8>
  store <vscale x 8 x i8> %trunc, <vscale x 8 x i8>* %ptrcast
  ret void
}

define void @st1_nxv4i32_trunc8(i8* %addr, i64 %off, <vscale x 4 x i32> %val) {
; CHECK-LABEL: st1_nxv4i32_trunc8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    st1b { z0.s }, p0, [x0, x1]
; CHECK-NEXT:    ret
  %ptr = getelementptr inbounds i8, i8* %addr, i64 %off
  %ptrcast = bitcast i8* %ptr to <vscale x 4 x i8>*
  %trunc = trunc <vscale x 4 x i32> %val to <vscale x 4 x i8>
  store <vscale x 4 x i8> %trunc, <vscale x 4 x i8>* %ptrcast
  ret void
}

define void @st1_nxv2i64_trunc8(i8* %addr, i64 %off, <vscale x 2 x i64> %val) {
; CHECK-LABEL: st1_nxv2i64_trunc8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    st1b { z0.d }, p0, [x0, x1]
; CHECK-NEXT:    ret
  %ptr = getelementptr inbounds i8, i8* %addr, i64 %off
  %ptrcast = bitcast i8* %ptr to <vscale x 2 x i8>*
  %trunc = trunc <vscale x 2 x i64> %val to <vscale x 2 x i8>
  store <vscale x 2 x i8> %trunc, <vscale x 2 x i8>* %ptrcast
  ret void
}

; ST1H

define void @st1_nxv8i16(i16* %addr, i64 %off, <vscale x 8 x i16> %val) {
; CHECK-LABEL: st1_nxv8i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    st1h { z0.h }, p0, [x0, x1, lsl #1]
; CHECK-NEXT:    ret
  %ptr = getelementptr inbounds i16, i16* %addr, i64 %off
  %ptrcast = bitcast i16* %ptr to <vscale x 8 x i16>*
  store <vscale x 8 x i16> %val, <vscale x 8 x i16>* %ptrcast
  ret void
}

define void @st1_nxv4i32_trunc16(i16* %addr, i64 %off, <vscale x 4 x i32> %val) {
; CHECK-LABEL: st1_nxv4i32_trunc16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    st1h { z0.s }, p0, [x0, x1, lsl #1]
; CHECK-NEXT:    ret
  %ptr = getelementptr inbounds i16, i16* %addr, i64 %off
  %ptrcast = bitcast i16* %ptr to <vscale x 4 x i16>*
  %trunc = trunc <vscale x 4 x i32> %val to <vscale x 4 x i16>
  store <vscale x 4 x i16> %trunc, <vscale x 4 x i16>* %ptrcast
  ret void
}

define void @st1_nxv2i64_trunc16(i16* %addr, i64 %off, <vscale x 2 x i64> %val) {
; CHECK-LABEL: st1_nxv2i64_trunc16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    st1h { z0.d }, p0, [x0, x1, lsl #1]
; CHECK-NEXT:    ret
  %ptr = getelementptr inbounds i16, i16* %addr, i64 %off
  %ptrcast = bitcast i16* %ptr to <vscale x 2 x i16>*
  %trunc = trunc <vscale x 2 x i64> %val to <vscale x 2 x i16>
  store <vscale x 2 x i16> %trunc, <vscale x 2 x i16>* %ptrcast
  ret void
}

define void @st1_nxv8f16(half* %addr, i64 %off, <vscale x 8 x half> %val) {
; CHECK-LABEL: st1_nxv8f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    st1h { z0.h }, p0, [x0, x1, lsl #1]
; CHECK-NEXT:    ret
  %ptr = getelementptr inbounds half, half* %addr, i64 %off
  %ptrcast = bitcast half* %ptr to <vscale x 8 x half>*
  store <vscale x 8 x half> %val, <vscale x 8 x half>* %ptrcast
  ret void
}

define void @st1_nxv8bf16(bfloat* %addr, i64 %off, <vscale x 8 x bfloat> %val) {
; CHECK-LABEL: st1_nxv8bf16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    st1h { z0.h }, p0, [x0, x1, lsl #1]
; CHECK-NEXT:    ret
  %ptr = getelementptr inbounds bfloat, bfloat* %addr, i64 %off
  %ptrcast = bitcast bfloat* %ptr to <vscale x 8 x bfloat>*
  store <vscale x 8 x bfloat> %val, <vscale x 8 x bfloat>* %ptrcast
  ret void
}

define void @st1_nxv4f16(half* %addr, i64 %off, <vscale x 4 x half> %val) {
; CHECK-LABEL: st1_nxv4f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    st1h { z0.s }, p0, [x0, x1, lsl #1]
; CHECK-NEXT:    ret
  %ptr = getelementptr inbounds half, half* %addr, i64 %off
  %ptrcast = bitcast half* %ptr to <vscale x 4 x half>*
  store <vscale x 4 x half> %val, <vscale x 4 x half>* %ptrcast
  ret void
}

define void @st1_nxv4bf16(bfloat* %addr, i64 %off, <vscale x 4 x bfloat> %val) {
; CHECK-LABEL: st1_nxv4bf16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    st1h { z0.s }, p0, [x0, x1, lsl #1]
; CHECK-NEXT:    ret
  %ptr = getelementptr inbounds bfloat, bfloat* %addr, i64 %off
  %ptrcast = bitcast bfloat* %ptr to <vscale x 4 x bfloat>*
  store <vscale x 4 x bfloat> %val, <vscale x 4 x bfloat>* %ptrcast
  ret void
}

define void @st1_nxv2f16(half* %addr, i64 %off, <vscale x 2 x half> %val) {
; CHECK-LABEL: st1_nxv2f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    st1h { z0.d }, p0, [x0, x1, lsl #1]
; CHECK-NEXT:    ret
  %ptr = getelementptr inbounds half, half* %addr, i64 %off
  %ptrcast = bitcast half* %ptr to <vscale x 2 x half>*
  store <vscale x 2 x half> %val, <vscale x 2 x half>* %ptrcast
  ret void
}

define void @st1_nxv2bf16(bfloat* %addr, i64 %off, <vscale x 2 x bfloat> %val) {
; CHECK-LABEL: st1_nxv2bf16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    st1h { z0.d }, p0, [x0, x1, lsl #1]
; CHECK-NEXT:    ret
  %ptr = getelementptr inbounds bfloat, bfloat* %addr, i64 %off
  %ptrcast = bitcast bfloat* %ptr to <vscale x 2 x bfloat>*
  store <vscale x 2 x bfloat> %val, <vscale x 2 x bfloat>* %ptrcast
  ret void
}

; ST1W

define void @st1_nxv4i32(i32* %addr, i64 %off, <vscale x 4 x i32> %val) {
; CHECK-LABEL: st1_nxv4i32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    st1w { z0.s }, p0, [x0, x1, lsl #2]
; CHECK-NEXT:    ret
  %ptr = getelementptr inbounds i32, i32* %addr, i64 %off
  %ptrcast = bitcast i32* %ptr to <vscale x 4 x i32>*
  store <vscale x 4 x i32> %val, <vscale x 4 x i32>* %ptrcast
  ret void
}

define void @st1_nxv2i64_trunc32(i32* %addr, i64 %off, <vscale x 2 x i64> %val) {
; CHECK-LABEL: st1_nxv2i64_trunc32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    st1w { z0.d }, p0, [x0, x1, lsl #2]
; CHECK-NEXT:    ret
  %ptr = getelementptr inbounds i32, i32* %addr, i64 %off
  %ptrcast = bitcast i32* %ptr to <vscale x 2 x i32>*
  %trunc = trunc <vscale x 2 x i64> %val to <vscale x 2 x i32>
  store <vscale x 2 x i32> %trunc, <vscale x 2 x i32>* %ptrcast
  ret void
}

define void @st1_nxv4f32(float* %addr, i64 %off, <vscale x 4 x float> %val) {
; CHECK-LABEL: st1_nxv4f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    st1w { z0.s }, p0, [x0, x1, lsl #2]
; CHECK-NEXT:    ret
  %ptr = getelementptr inbounds float, float* %addr, i64 %off
  %ptrcast = bitcast float* %ptr to <vscale x 4 x float>*
  store <vscale x 4 x float> %val, <vscale x 4 x float>* %ptrcast
  ret void
}

define void @st1_nxv2f32(float* %addr, i64 %off, <vscale x 2 x float> %val) {
; CHECK-LABEL: st1_nxv2f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    st1w { z0.d }, p0, [x0, x1, lsl #2]
; CHECK-NEXT:    ret
  %ptr = getelementptr inbounds float, float* %addr, i64 %off
  %ptrcast = bitcast float* %ptr to <vscale x 2 x float>*
  store <vscale x 2 x float> %val, <vscale x 2 x float>* %ptrcast
  ret void
}

; ST1D

define void @st1_nxv2i64(i64* %addr, i64 %off, <vscale x 2 x i64> %val) {
; CHECK-LABEL: st1_nxv2i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    st1d { z0.d }, p0, [x0, x1, lsl #3]
; CHECK-NEXT:    ret
  %ptr = getelementptr inbounds i64, i64* %addr, i64 %off
  %ptrcast = bitcast i64* %ptr to <vscale x 2 x i64>*
  store <vscale x 2 x i64> %val, <vscale x 2 x i64>* %ptrcast
  ret void
}

define void @st1_nxv2f64(double* %addr, i64 %off, <vscale x 2 x double> %val) {
; CHECK-LABEL: st1_nxv2f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    st1d { z0.d }, p0, [x0, x1, lsl #3]
; CHECK-NEXT:    ret
  %ptr = getelementptr inbounds double, double* %addr, i64 %off
  %ptrcast = bitcast double* %ptr to <vscale x 2 x double>*
  store <vscale x 2 x double> %val, <vscale x 2 x double>* %ptrcast
  ret void
}
