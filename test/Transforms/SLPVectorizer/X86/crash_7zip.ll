; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -basic-aa -slp-vectorizer -dce -S -mtriple=x86_64-apple-macosx10.8.0 -mcpu=corei7 | FileCheck %s

target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.8.0"

%struct.CLzmaDec.1.28.55.82.103.124.145.166.181.196.229.259.334 = type { %struct._CLzmaProps.0.27.54.81.102.123.144.165.180.195.228.258.333, i16*, i8*, i8*, i32, i32, i64, i64, i32, i32, i32, [4 x i32], i32, i32, i32, i32, i32, [20 x i8] }
%struct._CLzmaProps.0.27.54.81.102.123.144.165.180.195.228.258.333 = type { i32, i32, i32, i32 }

define fastcc void @LzmaDec_DecodeReal2(%struct.CLzmaDec.1.28.55.82.103.124.145.166.181.196.229.259.334* %p) {
; CHECK-LABEL: @LzmaDec_DecodeReal2(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[RANGE20_I:%.*]] = getelementptr inbounds [[STRUCT_CLZMADEC_1_28_55_82_103_124_145_166_181_196_229_259_334:%.*]], %struct.CLzmaDec.1.28.55.82.103.124.145.166.181.196.229.259.334* [[P:%.*]], i64 0, i32 4
; CHECK-NEXT:    br label [[DO_BODY66_I:%.*]]
; CHECK:       do.body66.i:
; CHECK-NEXT:    [[TMP0:%.*]] = phi <2 x i32> [ [[TMP3:%.*]], [[DO_COND_I:%.*]] ], [ undef, [[ENTRY:%.*]] ]
; CHECK-NEXT:    [[TMP1:%.*]] = select <2 x i1> undef, <2 x i32> undef, <2 x i32> [[TMP0]]
; CHECK-NEXT:    br i1 undef, label [[DO_COND_I]], label [[IF_ELSE_I:%.*]]
; CHECK:       if.else.i:
; CHECK-NEXT:    [[TMP2:%.*]] = sub <2 x i32> [[TMP1]], undef
; CHECK-NEXT:    br label [[DO_COND_I]]
; CHECK:       do.cond.i:
; CHECK-NEXT:    [[TMP3]] = phi <2 x i32> [ [[TMP2]], [[IF_ELSE_I]] ], [ [[TMP1]], [[DO_BODY66_I]] ]
; CHECK-NEXT:    br i1 undef, label [[DO_BODY66_I]], label [[DO_END1006_I:%.*]]
; CHECK:       do.end1006.i:
; CHECK-NEXT:    [[TMP4:%.*]] = select <2 x i1> undef, <2 x i32> undef, <2 x i32> [[TMP3]]
; CHECK-NEXT:    [[TMP5:%.*]] = bitcast i32* [[RANGE20_I]] to <2 x i32>*
; CHECK-NEXT:    store <2 x i32> [[TMP4]], <2 x i32>* [[TMP5]], align 4
; CHECK-NEXT:    ret void
;
entry:
  %range20.i = getelementptr inbounds %struct.CLzmaDec.1.28.55.82.103.124.145.166.181.196.229.259.334, %struct.CLzmaDec.1.28.55.82.103.124.145.166.181.196.229.259.334* %p, i64 0, i32 4
  %code21.i = getelementptr inbounds %struct.CLzmaDec.1.28.55.82.103.124.145.166.181.196.229.259.334, %struct.CLzmaDec.1.28.55.82.103.124.145.166.181.196.229.259.334* %p, i64 0, i32 5
  br label %do.body66.i

do.body66.i:                                      ; preds = %do.cond.i, %entry
  %range.2.i = phi i32 [ %range.4.i, %do.cond.i ], [ undef, %entry ]
  %code.2.i = phi i32 [ %code.4.i, %do.cond.i ], [ undef, %entry ]
  %.range.2.i = select i1 undef, i32 undef, i32 %range.2.i
  %.code.2.i = select i1 undef, i32 undef, i32 %code.2.i
  br i1 undef, label %do.cond.i, label %if.else.i

if.else.i:                                        ; preds = %do.body66.i
  %sub91.i = sub i32 %.range.2.i, undef
  %sub92.i = sub i32 %.code.2.i, undef
  br label %do.cond.i

do.cond.i:                                        ; preds = %if.else.i, %do.body66.i
  %range.4.i = phi i32 [ %sub91.i, %if.else.i ], [ undef, %do.body66.i ]
  %code.4.i = phi i32 [ %sub92.i, %if.else.i ], [ %.code.2.i, %do.body66.i ]
  br i1 undef, label %do.body66.i, label %do.end1006.i

do.end1006.i:                                     ; preds = %do.cond.i
  %.range.4.i = select i1 undef, i32 undef, i32 %range.4.i
  %.code.4.i = select i1 undef, i32 undef, i32 %code.4.i
  store i32 %.range.4.i, i32* %range20.i, align 4
  store i32 %.code.4.i, i32* %code21.i, align 4
  ret void
}
