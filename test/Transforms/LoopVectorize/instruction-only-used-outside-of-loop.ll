; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -passes=loop-vectorize -force-vector-width=4 -force-vector-interleave=1 -S %s | FileCheck %s

; Tests for PR54266.
define i32 @one_direct_branch(i32* %src) {
; CHECK-LABEL: @one_direct_branch(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br i1 true, label [[SCALAR_PH:%.*]], label [[VECTOR_PH:%.*]]
; CHECK:       vector.ph:
; CHECK-NEXT:    br label [[VECTOR_BODY:%.*]]
; CHECK:       vector.body:
; CHECK-NEXT:    [[INDEX:%.*]] = phi i32 [ 0, [[VECTOR_PH]] ], [ [[INDEX_NEXT:%.*]], [[VECTOR_BODY]] ]
; CHECK-NEXT:    [[TMP0:%.*]] = add i32 [[INDEX]], 0
; CHECK-NEXT:    [[TMP1:%.*]] = getelementptr inbounds i32, i32* [[SRC:%.*]], i32 [[TMP0]]
; CHECK-NEXT:    [[TMP2:%.*]] = getelementptr inbounds i32, i32* [[TMP1]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = bitcast i32* [[TMP2]] to <4 x i32>*
; CHECK-NEXT:    [[WIDE_LOAD:%.*]] = load <4 x i32>, <4 x i32>* [[TMP3]], align 4
; CHECK-NEXT:    [[TMP4:%.*]] = xor <4 x i32> <i32 25500, i32 25500, i32 25500, i32 25500>, [[WIDE_LOAD]]
; CHECK-NEXT:    [[INDEX_NEXT]] = add nuw i32 [[INDEX]], 4
; CHECK-NEXT:    [[TMP5:%.*]] = icmp eq i32 [[INDEX_NEXT]], 0
; CHECK-NEXT:    br i1 [[TMP5]], label [[MIDDLE_BLOCK:%.*]], label [[VECTOR_BODY]], !llvm.loop [[LOOP0:![0-9]+]]
; CHECK:       middle.block:
; CHECK-NEXT:    [[TMP6:%.*]] = extractelement <4 x i32> [[TMP4]], i32 3
; CHECK-NEXT:    [[CMP_N:%.*]] = icmp eq i32 0, 0
; CHECK-NEXT:    br i1 [[CMP_N]], label [[EXIT:%.*]], label [[SCALAR_PH]]
; CHECK:       scalar.ph:
; CHECK-NEXT:    [[BC_RESUME_VAL:%.*]] = phi i32 [ 0, [[MIDDLE_BLOCK]] ], [ 0, [[ENTRY:%.*]] ]
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    [[IV:%.*]] = phi i32 [ [[BC_RESUME_VAL]], [[SCALAR_PH]] ], [ [[IV_NEXT:%.*]], [[LOOP_LATCH:%.*]] ]
; CHECK-NEXT:    [[SRC_GEP:%.*]] = getelementptr inbounds i32, i32* [[SRC]], i32 [[IV]]
; CHECK-NEXT:    [[LV:%.*]] = load i32, i32* [[SRC_GEP]], align 4
; CHECK-NEXT:    [[XOR:%.*]] = xor i32 25500, [[LV]]
; CHECK-NEXT:    br label [[LOOP_LATCH]]
; CHECK:       loop.latch:
; CHECK-NEXT:    [[PHI_XOR:%.*]] = phi i32 [ [[XOR]], [[LOOP]] ]
; CHECK-NEXT:    [[IV_NEXT]] = add nsw i32 [[IV]], 1
; CHECK-NEXT:    [[TOBOOL_NOT:%.*]] = icmp eq i32 [[IV_NEXT]], 0
; CHECK-NEXT:    br i1 [[TOBOOL_NOT]], label [[EXIT]], label [[LOOP]], !llvm.loop [[LOOP2:![0-9]+]]
; CHECK:       exit:
; CHECK-NEXT:    [[XOR_LCSSA:%.*]] = phi i32 [ [[PHI_XOR]], [[LOOP_LATCH]] ], [ [[TMP6]], [[MIDDLE_BLOCK]] ]
; CHECK-NEXT:    ret i32 [[XOR_LCSSA]]
;
entry:
  br label %loop

loop:
  %iv = phi i32 [ 0, %entry ], [ %iv.next, %loop.latch ]
  %src.gep = getelementptr inbounds i32, i32* %src, i32 %iv
  %lv = load i32, i32* %src.gep
  %xor = xor i32 25500, %lv
  br label %loop.latch

loop.latch:
  %phi.xor = phi i32 [ %xor, %loop ]
  %iv.next = add nsw i32 %iv, 1
  %tobool.not = icmp eq i32 %iv.next, 0
  br i1 %tobool.not, label %exit, label %loop

exit:
  %xor.lcssa = phi i32 [ %phi.xor, %loop.latch ]
  ret i32 %xor.lcssa
}

define i32 @two_direct_branch(i32* %src) {
; CHECK-LABEL: @two_direct_branch(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br i1 true, label [[SCALAR_PH:%.*]], label [[VECTOR_PH:%.*]]
; CHECK:       vector.ph:
; CHECK-NEXT:    br label [[VECTOR_BODY:%.*]]
; CHECK:       vector.body:
; CHECK-NEXT:    [[INDEX:%.*]] = phi i32 [ 0, [[VECTOR_PH]] ], [ [[INDEX_NEXT:%.*]], [[VECTOR_BODY]] ]
; CHECK-NEXT:    [[TMP0:%.*]] = add i32 [[INDEX]], 0
; CHECK-NEXT:    [[TMP1:%.*]] = getelementptr inbounds i32, i32* [[SRC:%.*]], i32 [[TMP0]]
; CHECK-NEXT:    [[TMP2:%.*]] = getelementptr inbounds i32, i32* [[TMP1]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = bitcast i32* [[TMP2]] to <4 x i32>*
; CHECK-NEXT:    [[WIDE_LOAD:%.*]] = load <4 x i32>, <4 x i32>* [[TMP3]], align 4
; CHECK-NEXT:    [[TMP4:%.*]] = xor <4 x i32> <i32 25500, i32 25500, i32 25500, i32 25500>, [[WIDE_LOAD]]
; CHECK-NEXT:    [[INDEX_NEXT]] = add nuw i32 [[INDEX]], 4
; CHECK-NEXT:    [[TMP5:%.*]] = icmp eq i32 [[INDEX_NEXT]], 0
; CHECK-NEXT:    br i1 [[TMP5]], label [[MIDDLE_BLOCK:%.*]], label [[VECTOR_BODY]], !llvm.loop [[LOOP4:![0-9]+]]
; CHECK:       middle.block:
; CHECK-NEXT:    [[TMP6:%.*]] = extractelement <4 x i32> [[TMP4]], i32 3
; CHECK-NEXT:    [[CMP_N:%.*]] = icmp eq i32 0, 0
; CHECK-NEXT:    br i1 [[CMP_N]], label [[EXIT:%.*]], label [[SCALAR_PH]]
; CHECK:       scalar.ph:
; CHECK-NEXT:    [[BC_RESUME_VAL:%.*]] = phi i32 [ 0, [[MIDDLE_BLOCK]] ], [ 0, [[ENTRY:%.*]] ]
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    [[IV:%.*]] = phi i32 [ [[BC_RESUME_VAL]], [[SCALAR_PH]] ], [ [[IV_NEXT:%.*]], [[LOOP_LATCH:%.*]] ]
; CHECK-NEXT:    [[SRC_GEP:%.*]] = getelementptr inbounds i32, i32* [[SRC]], i32 [[IV]]
; CHECK-NEXT:    [[LV:%.*]] = load i32, i32* [[SRC_GEP]], align 4
; CHECK-NEXT:    [[XOR:%.*]] = xor i32 25500, [[LV]]
; CHECK-NEXT:    br label [[BB:%.*]]
; CHECK:       bb:
; CHECK-NEXT:    [[PHI_XOR_1:%.*]] = phi i32 [ [[XOR]], [[LOOP]] ]
; CHECK-NEXT:    br label [[LOOP_LATCH]]
; CHECK:       loop.latch:
; CHECK-NEXT:    [[PHI_XOR:%.*]] = phi i32 [ [[PHI_XOR_1]], [[BB]] ]
; CHECK-NEXT:    [[IV_NEXT]] = add nsw i32 [[IV]], 1
; CHECK-NEXT:    [[TOBOOL_NOT:%.*]] = icmp eq i32 [[IV_NEXT]], 0
; CHECK-NEXT:    br i1 [[TOBOOL_NOT]], label [[EXIT]], label [[LOOP]], !llvm.loop [[LOOP5:![0-9]+]]
; CHECK:       exit:
; CHECK-NEXT:    [[XOR_LCSSA:%.*]] = phi i32 [ [[PHI_XOR]], [[LOOP_LATCH]] ], [ [[TMP6]], [[MIDDLE_BLOCK]] ]
; CHECK-NEXT:    ret i32 [[XOR_LCSSA]]
;
entry:
  br label %loop

loop:                              ; preds = %for.inc3, %entry
  %iv = phi i32 [ 0, %entry ], [ %iv.next, %loop.latch ]
  %src.gep = getelementptr inbounds i32, i32* %src, i32 %iv
  %lv = load i32, i32* %src.gep
  %xor = xor i32 25500, %lv
  br label %bb

bb:
  %phi.xor.1 = phi i32 [ %xor, %loop ]
  br label %loop.latch

loop.latch:
  %phi.xor = phi i32 [ %phi.xor.1, %bb ]
  %iv.next = add nsw i32 %iv, 1
  %tobool.not = icmp eq i32 %iv.next, 0
  br i1 %tobool.not, label %exit, label %loop

exit:
  %xor.lcssa = phi i32 [ %phi.xor, %loop.latch ]
  ret i32 %xor.lcssa
}

define i32 @cond_branch(i32 %a, i32* %src) {
; CHECK-LABEL: @cond_branch(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br i1 true, label [[SCALAR_PH:%.*]], label [[VECTOR_PH:%.*]]
; CHECK:       vector.ph:
; CHECK-NEXT:    [[BROADCAST_SPLATINSERT:%.*]] = insertelement <4 x i32> poison, i32 [[A:%.*]], i32 0
; CHECK-NEXT:    [[BROADCAST_SPLAT:%.*]] = shufflevector <4 x i32> [[BROADCAST_SPLATINSERT]], <4 x i32> poison, <4 x i32> zeroinitializer
; CHECK-NEXT:    br label [[VECTOR_BODY:%.*]]
; CHECK:       vector.body:
; CHECK-NEXT:    [[INDEX:%.*]] = phi i32 [ 0, [[VECTOR_PH]] ], [ [[INDEX_NEXT:%.*]], [[VECTOR_BODY]] ]
; CHECK-NEXT:    [[VEC_IND:%.*]] = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, [[VECTOR_PH]] ], [ [[VEC_IND_NEXT:%.*]], [[VECTOR_BODY]] ]
; CHECK-NEXT:    [[TMP0:%.*]] = add i32 [[INDEX]], 0
; CHECK-NEXT:    [[TMP1:%.*]] = getelementptr inbounds i32, i32* [[SRC:%.*]], i32 [[TMP0]]
; CHECK-NEXT:    [[TMP2:%.*]] = getelementptr inbounds i32, i32* [[TMP1]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = bitcast i32* [[TMP2]] to <4 x i32>*
; CHECK-NEXT:    [[WIDE_LOAD:%.*]] = load <4 x i32>, <4 x i32>* [[TMP3]], align 4
; CHECK-NEXT:    [[TMP4:%.*]] = xor <4 x i32> <i32 25500, i32 25500, i32 25500, i32 25500>, [[WIDE_LOAD]]
; CHECK-NEXT:    [[TMP5:%.*]] = icmp ne <4 x i32> [[VEC_IND]], [[BROADCAST_SPLAT]]
; CHECK-NEXT:    [[TMP6:%.*]] = xor <4 x i1> [[TMP5]], <i1 true, i1 true, i1 true, i1 true>
; CHECK-NEXT:    [[PREDPHI:%.*]] = select <4 x i1> [[TMP6]], <4 x i32> <i32 10, i32 10, i32 10, i32 10>, <4 x i32> [[TMP4]]
; CHECK-NEXT:    [[INDEX_NEXT]] = add nuw i32 [[INDEX]], 4
; CHECK-NEXT:    [[VEC_IND_NEXT]] = add <4 x i32> [[VEC_IND]], <i32 4, i32 4, i32 4, i32 4>
; CHECK-NEXT:    [[TMP7:%.*]] = icmp eq i32 [[INDEX_NEXT]], 0
; CHECK-NEXT:    br i1 [[TMP7]], label [[MIDDLE_BLOCK:%.*]], label [[VECTOR_BODY]], !llvm.loop [[LOOP6:![0-9]+]]
; CHECK:       middle.block:
; CHECK-NEXT:    [[TMP8:%.*]] = extractelement <4 x i32> [[PREDPHI]], i32 3
; CHECK-NEXT:    [[CMP_N:%.*]] = icmp eq i32 0, 0
; CHECK-NEXT:    br i1 [[CMP_N]], label [[EXIT:%.*]], label [[SCALAR_PH]]
; CHECK:       scalar.ph:
; CHECK-NEXT:    [[BC_RESUME_VAL:%.*]] = phi i32 [ 0, [[MIDDLE_BLOCK]] ], [ 0, [[ENTRY:%.*]] ]
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    [[IV:%.*]] = phi i32 [ [[BC_RESUME_VAL]], [[SCALAR_PH]] ], [ [[IV_NEXT:%.*]], [[LOOP_LATCH:%.*]] ]
; CHECK-NEXT:    [[SRC_GEP:%.*]] = getelementptr inbounds i32, i32* [[SRC]], i32 [[IV]]
; CHECK-NEXT:    [[LV:%.*]] = load i32, i32* [[SRC_GEP]], align 4
; CHECK-NEXT:    [[XOR:%.*]] = xor i32 25500, [[LV]]
; CHECK-NEXT:    [[CMP:%.*]] = icmp ne i32 [[IV]], [[A]]
; CHECK-NEXT:    br i1 [[CMP]], label [[LOOP_LATCH]], label [[THEN:%.*]]
; CHECK:       then:
; CHECK-NEXT:    br label [[LOOP_LATCH]]
; CHECK:       loop.latch:
; CHECK-NEXT:    [[PHI_XOR:%.*]] = phi i32 [ [[XOR]], [[LOOP]] ], [ 10, [[THEN]] ]
; CHECK-NEXT:    [[IV_NEXT]] = add nsw i32 [[IV]], 1
; CHECK-NEXT:    [[TOBOOL_NOT:%.*]] = icmp eq i32 [[IV_NEXT]], 0
; CHECK-NEXT:    br i1 [[TOBOOL_NOT]], label [[EXIT]], label [[LOOP]], !llvm.loop [[LOOP7:![0-9]+]]
; CHECK:       exit:
; CHECK-NEXT:    [[XOR_LCSSA:%.*]] = phi i32 [ [[PHI_XOR]], [[LOOP_LATCH]] ], [ [[TMP8]], [[MIDDLE_BLOCK]] ]
; CHECK-NEXT:    ret i32 [[XOR_LCSSA]]
;
entry:
  br label %loop

loop:
  %iv = phi i32 [ 0, %entry ], [ %iv.next, %loop.latch ]
  %src.gep = getelementptr inbounds i32, i32* %src, i32 %iv
  %lv = load i32, i32* %src.gep
  %xor = xor i32 25500, %lv
  %cmp = icmp ne i32 %iv, %a
  br i1 %cmp, label %loop.latch, label %then

then:
  br label %loop.latch

loop.latch:
  %phi.xor = phi i32 [ %xor, %loop ], [ 10, %then ]
  %iv.next = add nsw i32 %iv, 1
  %tobool.not = icmp eq i32 %iv.next, 0
  br i1 %tobool.not, label %exit, label %loop

exit:
  %xor.lcssa = phi i32 [ %phi.xor, %loop.latch ]
  ret i32 %xor.lcssa
}

; Test case for PR54370.
define i32 @optimizable_trunc_used_outside() {
; CHECK-LABEL: @optimizable_trunc_used_outside(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br i1 false, label [[SCALAR_PH:%.*]], label [[VECTOR_PH:%.*]]
; CHECK:       vector.ph:
; CHECK-NEXT:    br label [[VECTOR_BODY:%.*]]
; CHECK:       vector.body:
; CHECK-NEXT:    [[INDEX:%.*]] = phi i64 [ 0, [[VECTOR_PH]] ], [ [[INDEX_NEXT:%.*]], [[VECTOR_BODY]] ]
; CHECK-NEXT:    [[TMP0:%.*]] = trunc i64 [[INDEX]] to i32
; CHECK-NEXT:    [[TMP1:%.*]] = add i32 [[TMP0]], 0
; CHECK-NEXT:    [[TMP2:%.*]] = add i32 [[TMP0]], 1
; CHECK-NEXT:    [[TMP3:%.*]] = add i32 [[TMP0]], 2
; CHECK-NEXT:    [[TMP4:%.*]] = add i32 [[TMP0]], 3
; CHECK-NEXT:    [[INDEX_NEXT]] = add nuw i64 [[INDEX]], 4
; CHECK-NEXT:    [[TMP5:%.*]] = icmp eq i64 [[INDEX_NEXT]], 1000
; CHECK-NEXT:    br i1 [[TMP5]], label [[MIDDLE_BLOCK:%.*]], label [[VECTOR_BODY]], !llvm.loop [[LOOP8:![0-9]+]]
; CHECK:       middle.block:
; CHECK-NEXT:    [[CMP_N:%.*]] = icmp eq i64 1000, 1000
; CHECK-NEXT:    br i1 [[CMP_N]], label [[EXIT:%.*]], label [[SCALAR_PH]]
; CHECK:       scalar.ph:
; CHECK-NEXT:    [[BC_RESUME_VAL:%.*]] = phi i64 [ 1000, [[MIDDLE_BLOCK]] ], [ 0, [[ENTRY:%.*]] ]
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    [[IV:%.*]] = phi i64 [ [[BC_RESUME_VAL]], [[SCALAR_PH]] ], [ [[IV_NEXT:%.*]], [[LOOP]] ]
; CHECK-NEXT:    [[IV_TRUNC:%.*]] = trunc i64 [[IV]] to i32
; CHECK-NEXT:    [[IV_NEXT]] = add nuw nsw i64 [[IV]], 1
; CHECK-NEXT:    [[EXITCOND_NOT_I_I:%.*]] = icmp eq i64 [[IV_NEXT]], 1000
; CHECK-NEXT:    br i1 [[EXITCOND_NOT_I_I]], label [[EXIT]], label [[LOOP]], !llvm.loop [[LOOP9:![0-9]+]]
; CHECK:       exit:
; CHECK-NEXT:    [[IV_TRUNC_LCSSA:%.*]] = phi i32 [ [[IV_TRUNC]], [[LOOP]] ], [ [[TMP4]], [[MIDDLE_BLOCK]] ]
; CHECK-NEXT:    ret i32 [[IV_TRUNC_LCSSA]]
;
entry:
  br label %loop

loop:
  %iv = phi i64 [ 0, %entry ], [ %iv.next, %loop ]
  %iv.trunc = trunc i64 %iv to i32
  %iv.next = add nuw nsw i64 %iv, 1
  %exitcond.not.i.i = icmp eq i64 %iv.next, 1000
  br i1 %exitcond.not.i.i, label %exit, label %loop

exit:
  %iv.trunc.lcssa = phi i32 [ %iv.trunc, %loop ]
  ret i32 %iv.trunc.lcssa
}
