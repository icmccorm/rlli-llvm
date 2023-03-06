; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -passes=sroa -S | FileCheck %s
; RUN: opt < %s -passes=sroa -S | FileCheck %s

; This test checks that SROA runs mem2reg on scalable vectors.

define <vscale x 16 x i1> @alloca_nxv16i1(<vscale x 16 x i1> %pg) {
; CHECK-LABEL: @alloca_nxv16i1(
; CHECK-NEXT:    ret <vscale x 16 x i1> [[PG:%.*]]
;
  %pg.addr = alloca <vscale x 16 x i1>
  store <vscale x 16 x i1> %pg, ptr %pg.addr
  %1 = load <vscale x 16 x i1>, ptr %pg.addr
  ret <vscale x 16 x i1> %1
}

define <vscale x 16 x i8> @alloca_nxv16i8(<vscale x 16 x i8> %vec) {
; CHECK-LABEL: @alloca_nxv16i8(
; CHECK-NEXT:    ret <vscale x 16 x i8> [[VEC:%.*]]
;
  %vec.addr = alloca <vscale x 16 x i8>
  store <vscale x 16 x i8> %vec, ptr %vec.addr
  %1 = load <vscale x 16 x i8>, ptr %vec.addr
  ret <vscale x 16 x i8> %1
}

; Test scalable alloca that can't be promoted. Mem2Reg only considers
; non-volatile loads and stores for promotion.
define <vscale x 16 x i8> @unpromotable_alloca(<vscale x 16 x i8> %vec) {
; CHECK-LABEL: @unpromotable_alloca(
; CHECK-NEXT:    [[VEC_ADDR:%.*]] = alloca <vscale x 16 x i8>, align 16
; CHECK-NEXT:    store volatile <vscale x 16 x i8> [[VEC:%.*]], ptr [[VEC_ADDR]], align 16
; CHECK-NEXT:    [[TMP1:%.*]] = load volatile <vscale x 16 x i8>, ptr [[VEC_ADDR]], align 16
; CHECK-NEXT:    ret <vscale x 16 x i8> [[TMP1]]
;
  %vec.addr = alloca <vscale x 16 x i8>
  store volatile <vscale x 16 x i8> %vec, ptr %vec.addr
  %1 = load volatile <vscale x 16 x i8>, ptr %vec.addr
  ret <vscale x 16 x i8> %1
}

; Test we bail out when using an alloca of a fixed-length vector (VLS) that was
; bitcasted to a scalable vector.
define <vscale x 4 x i32> @cast_alloca_to_svint32_t(<vscale x 4 x i32> %type.coerce) {
; CHECK-LABEL: @cast_alloca_to_svint32_t(
; CHECK-NEXT:    [[TYPE:%.*]] = alloca <16 x i32>, align 64
; CHECK-NEXT:    [[TYPE_ADDR:%.*]] = alloca <16 x i32>, align 64
; CHECK-NEXT:    store <vscale x 4 x i32> [[TYPE_COERCE:%.*]], ptr [[TYPE]], align 16
; CHECK-NEXT:    [[TYPE1:%.*]] = load <16 x i32>, ptr [[TYPE]], align 64
; CHECK-NEXT:    store <16 x i32> [[TYPE1]], ptr [[TYPE_ADDR]], align 64
; CHECK-NEXT:    [[TMP2:%.*]] = load <16 x i32>, ptr [[TYPE_ADDR]], align 64
; CHECK-NEXT:    [[TMP4:%.*]] = load <vscale x 4 x i32>, ptr [[TYPE_ADDR]], align 16
; CHECK-NEXT:    ret <vscale x 4 x i32> [[TMP4]]
;
  %type = alloca <16 x i32>
  %type.addr = alloca <16 x i32>
  store <vscale x 4 x i32> %type.coerce, ptr %type
  %type1 = load <16 x i32>, ptr %type
  store <16 x i32> %type1, ptr %type.addr
  %1 = load <16 x i32>, ptr %type.addr
  %2 = load <vscale x 4 x i32>, ptr %type.addr
  ret <vscale x 4 x i32> %2
}

; When casting from VLA to VLS via memory check we bail out when producing a
; GEP where the element type is a scalable vector.
define <vscale x 4 x i32> @cast_alloca_from_svint32_t() {
; CHECK-LABEL: @cast_alloca_from_svint32_t(
; CHECK-NEXT:    [[RETVAL_COERCE:%.*]] = alloca <vscale x 4 x i32>, align 16
; CHECK-NEXT:    store <16 x i32> undef, ptr [[RETVAL_COERCE]], align 16
; CHECK-NEXT:    [[TMP2:%.*]] = load <vscale x 4 x i32>, ptr [[RETVAL_COERCE]], align 16
; CHECK-NEXT:    ret <vscale x 4 x i32> [[TMP2]]
;
  %retval = alloca <16 x i32>
  %retval.coerce = alloca <vscale x 4 x i32>
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %retval.coerce, ptr align 16 %retval, i64 64, i1 false)
  %1 = load <vscale x 4 x i32>, ptr %retval.coerce
  ret <vscale x 4 x i32> %1
}

declare void @llvm.memcpy.p0.p0.i64(ptr nocapture, ptr nocapture, i64, i1) nounwind
