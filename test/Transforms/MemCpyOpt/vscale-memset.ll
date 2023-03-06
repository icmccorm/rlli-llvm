; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -memcpyopt -dce -S -verify-memoryssa | FileCheck %s

; Negative test
; Check this test is not transformed into memset, or cause a compiler warning
; warning: Compiler has made implicit assumption that TypeSize is not scalable. This may or may not lead to broken code.

define void @foo(i8* %p) {
; CHECK-LABEL: @foo(
; CHECK-NEXT:    [[A:%.*]] = bitcast i8* [[P:%.*]] to <vscale x 16 x i8>*
; CHECK-NEXT:    [[TMP0:%.*]] = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* [[A]], i64 0
; CHECK-NEXT:    store <vscale x 16 x i8> zeroinitializer, <vscale x 16 x i8>* [[TMP0]], align 16
; CHECK-NEXT:    [[TMP1:%.*]] = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* [[A]], i64 1
; CHECK-NEXT:    store <vscale x 16 x i8> zeroinitializer, <vscale x 16 x i8>* [[TMP1]], align 16
; CHECK-NEXT:    ret void
;
  %a = bitcast i8* %p to <vscale x 16 x i8>*
  %tmp0 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i64 0
  store <vscale x 16 x i8> zeroinitializer, <vscale x 16 x i8>* %tmp0
  %tmp1 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i64 1
  store <vscale x 16 x i8> zeroinitializer, <vscale x 16 x i8>* %tmp1
  ret void
}

; Positive test

define void @memset_vscale_index_zero(i8* %p, i8 %z) {
; CHECK-LABEL: @memset_vscale_index_zero(
; CHECK-NEXT:    [[A:%.*]] = bitcast i8* [[P:%.*]] to <vscale x 16 x i8>*
; CHECK-NEXT:    [[TMP0:%.*]] = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* [[A]], i32 0, i32 0
; CHECK-NEXT:    call void @llvm.memset.p0i8.i64(i8* align 1 [[TMP0]], i8 [[Z:%.*]], i64 17, i1 false)
; CHECK-NEXT:    ret void
;
  %a = bitcast i8* %p to <vscale x 16 x i8>*
  %tmp0 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 0, i32 0
  store i8 %z, i8* %tmp0
  %tmp1 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 0, i32 1
  store i8 %z, i8* %tmp1
  %tmp2 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 0, i32 2
  store i8 %z, i8* %tmp2
  %tmp3 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 0, i32 3
  store i8 %z, i8* %tmp3
  %tmp4 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 0, i32 4
  store i8 %z, i8* %tmp4
  %tmp5 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 0, i32 5
  store i8 %z, i8* %tmp5
  %tmp6 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 0, i32 6
  store i8 %z, i8* %tmp6
  %tmp7 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 0, i32 7
  store i8 %z, i8* %tmp7
  %tmp8 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 0, i32 8
  store i8 %z, i8* %tmp8
  %tmp9 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 0, i32 9
  store i8 %z, i8* %tmp9
  %tmp10 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 0, i32 10
  store i8 %z, i8* %tmp10
  %tmp11 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 0, i32 11
  store i8 %z, i8* %tmp11
  %tmp12 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 0, i32 12
  store i8 %z, i8* %tmp12
  %tmp13 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 0, i32 13
  store i8 %z, i8* %tmp13
  %tmp14 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 0, i32 14
  store i8 %z, i8* %tmp14
  %tmp15 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 0, i32 15
  store i8 %z, i8* %tmp15
  %tmp16 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 0, i32 16
  store i8 %z, i8* %tmp16
  ret void
}

define void @memset_vscale_index_nonzero(i8* %p, i8 %z) {
; CHECK-LABEL: @memset_vscale_index_nonzero(
; CHECK-NEXT:    [[A:%.*]] = bitcast i8* [[P:%.*]] to <vscale x 16 x i8>*
; CHECK-NEXT:    [[TMP0:%.*]] = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* [[A]], i32 1, i32 0
; CHECK-NEXT:    call void @llvm.memset.p0i8.i64(i8* align 1 [[TMP0]], i8 [[Z:%.*]], i64 17, i1 false)
; CHECK-NEXT:    ret void
;
  %a = bitcast i8* %p to <vscale x 16 x i8>*
  %tmp0 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 1, i32 0
  store i8 %z, i8* %tmp0
  %tmp1 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 1, i32 1
  store i8 %z, i8* %tmp1
  %tmp2 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 1, i32 2
  store i8 %z, i8* %tmp2
  %tmp3 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 1, i32 3
  store i8 %z, i8* %tmp3
  %tmp4 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 1, i32 4
  store i8 %z, i8* %tmp4
  %tmp5 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 1, i32 5
  store i8 %z, i8* %tmp5
  %tmp6 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 1, i32 6
  store i8 %z, i8* %tmp6
  %tmp7 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 1, i32 7
  store i8 %z, i8* %tmp7
  %tmp8 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 1, i32 8
  store i8 %z, i8* %tmp8
  %tmp9 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 1, i32 9
  store i8 %z, i8* %tmp9
  %tmp10 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 1, i32 10
  store i8 %z, i8* %tmp10
  %tmp11 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 1, i32 11
  store i8 %z, i8* %tmp11
  %tmp12 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 1, i32 12
  store i8 %z, i8* %tmp12
  %tmp13 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 1, i32 13
  store i8 %z, i8* %tmp13
  %tmp14 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 1, i32 14
  store i8 %z, i8* %tmp14
  %tmp15 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 1, i32 15
  store i8 %z, i8* %tmp15
  %tmp16 = getelementptr <vscale x 16 x i8>, <vscale x 16 x i8>* %a, i32 1, i32 16
  store i8 %z, i8* %tmp16
  ret void
}
