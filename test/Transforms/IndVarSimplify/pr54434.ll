; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S -indvars -verify-scev < %s | FileCheck %s

define void @test() {
; CHECK-LABEL: @test(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[FOR_COND:%.*]]
; CHECK:       for.cond:
; CHECK-NEXT:    br i1 false, label [[FOR_COND92_PREHEADER:%.*]], label [[FOR_END106:%.*]]
; CHECK:       for.cond92.preheader:
; CHECK-NEXT:    br label [[FOR_COND92:%.*]]
; CHECK:       for.cond92:
; CHECK-NEXT:    br i1 false, label [[FOR_BODY94:%.*]], label [[FOR_END:%.*]]
; CHECK:       for.body94:
; CHECK-NEXT:    br label [[FOR_COND92]]
; CHECK:       for.end:
; CHECK-NEXT:    br label [[FOR_COND]]
; CHECK:       for.end106:
; CHECK-NEXT:    ret void
;
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.end, %entry
  %0 = phi i32 [ %inc105, %for.end ], [ 0, %entry ]
  %cmp = icmp sge i32 %0, 1
  br i1 %cmp, label %for.cond92, label %for.end106

for.cond92:                                       ; preds = %for.body94, %for.cond
  %1 = phi i16 [ %inc, %for.body94 ], [ 0, %for.cond ]
  %cmp93 = icmp slt i16 %1, 1
  br i1 %cmp93, label %for.body94, label %for.end

for.body94:                                       ; preds = %for.cond92
  %inc = add nsw i16 %1, 1
  br label %for.cond92

for.end:                                          ; preds = %for.cond92
  %inc105 = add nsw i32 %0, 1
  br label %for.cond

for.end106:                                       ; preds = %for.cond
  ret void
}

