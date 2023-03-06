; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S -passes=instcombine < %s | FileCheck %s

; This test is used to verify we are not crashing at Assertion `CastInst::castIsValid(opc, C, Ty) && "Invalid constantexpr cast!".
define <vscale x 2 x i8*> @gep_index_type_is_scalable(i8* %p) {
; CHECK-LABEL: @gep_index_type_is_scalable(
; CHECK-NEXT:    [[GEP:%.*]] = getelementptr i8, i8* [[P:%.*]], <vscale x 2 x i64> undef
; CHECK-NEXT:    ret <vscale x 2 x i8*> [[GEP]]
;
  %gep = getelementptr i8, i8* %p, <vscale x 2 x i64> undef
  ret <vscale x 2 x i8*> %gep
}

; This test serves to verify code changes for "GEP.getNumIndices() == 1".
define <vscale x 4 x i32>* @gep_num_of_indices_1(<vscale x 4 x i32>* %p) {
; CHECK-LABEL: @gep_num_of_indices_1(
; CHECK-NEXT:    [[GEP:%.*]] = getelementptr <vscale x 4 x i32>, <vscale x 4 x i32>* [[P:%.*]], i64 1
; CHECK-NEXT:    ret <vscale x 4 x i32>* [[GEP]]
;
  %gep = getelementptr <vscale x 4 x i32>, <vscale x 4 x i32>* %p, i64 1
  ret <vscale x 4 x i32>* %gep
}

; This test serves to verify code changes for "GEP.getNumOperands() == 2".
define void @gep_bitcast(i8* %p) {
; CHECK-LABEL: @gep_bitcast(
; CHECK-NEXT:    [[CAST:%.*]] = bitcast i8* [[P:%.*]] to <vscale x 16 x i8>*
; CHECK-NEXT:    store <vscale x 16 x i8> zeroinitializer, <vscale x 16 x i8>* [[CAST]], align 16
; CHECK-NEXT:    [[GEP2:%.*]] = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* [[CAST]], i64 1
; CHECK-NEXT:    store <vscale x 16 x i8> zeroinitializer, <vscale x 16 x i8>* [[GEP2]], align 16
; CHECK-NEXT:    ret void
;
  %cast = bitcast i8* %p to <vscale x 16 x i8>*
  %gep1 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %cast, i64 0
  store <vscale x 16 x i8> zeroinitializer, <vscale x 16 x i8>* %gep1
  %gep2 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %cast, i64 1
  store <vscale x 16 x i8> zeroinitializer, <vscale x 16 x i8>* %gep2
  ret void
}

; These tests serve to verify code changes when underlying gep ptr is alloca.
; This test is to verify 'inbounds' is added when it's valid to accumulate constant offset.
define i32 @gep_alloca_inbounds_vscale_zero() {
; CHECK-LABEL: @gep_alloca_inbounds_vscale_zero(
; CHECK-NEXT:    [[A:%.*]] = alloca <vscale x 4 x i32>, align 16
; CHECK-NEXT:    [[TMP:%.*]] = getelementptr inbounds <vscale x 4 x i32>, <vscale x 4 x i32>* [[A]], i64 0, i64 2
; CHECK-NEXT:    [[LOAD:%.*]] = load i32, i32* [[TMP]], align 8
; CHECK-NEXT:    ret i32 [[LOAD]]
;
  %a = alloca <vscale x 4 x i32>
  %tmp = getelementptr <vscale x 4 x i32>, <vscale x 4 x i32>* %a, i32 0, i32 2
  %load = load i32, i32* %tmp
  ret i32 %load
}

; This test is to verify 'inbounds' is not added when a constant offset can not be determined at compile-time.
define i32 @gep_alloca_inbounds_vscale_nonzero() {
; CHECK-LABEL: @gep_alloca_inbounds_vscale_nonzero(
; CHECK-NEXT:    [[A:%.*]] = alloca <vscale x 4 x i32>, align 16
; CHECK-NEXT:    [[TMP:%.*]] = getelementptr <vscale x 4 x i32>, <vscale x 4 x i32>* [[A]], i64 1, i64 2
; CHECK-NEXT:    [[LOAD:%.*]] = load i32, i32* [[TMP]], align 8
; CHECK-NEXT:    ret i32 [[LOAD]]
;
  %a = alloca <vscale x 4 x i32>
  %tmp = getelementptr <vscale x 4 x i32>, <vscale x 4 x i32>* %a, i32 1, i32 2
  %load = load i32, i32* %tmp
  ret i32 %load
}
