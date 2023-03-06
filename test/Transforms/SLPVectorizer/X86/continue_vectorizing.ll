; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -basic-aa -slp-vectorizer -S -mtriple=x86_64-apple-macosx10.8.0 -mcpu=corei7-avx | FileCheck %s

target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.8.0"

; We will keep trying to vectorize the basic block even we already find vectorized store.
define void @test1(double* %a, double* %b, double* %c, double* %d) {
; CHECK-LABEL: @test1(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = bitcast double* [[A:%.*]] to <2 x double>*
; CHECK-NEXT:    [[TMP1:%.*]] = load <2 x double>, <2 x double>* [[TMP0]], align 8
; CHECK-NEXT:    [[TMP2:%.*]] = bitcast double* [[B:%.*]] to <2 x double>*
; CHECK-NEXT:    [[TMP3:%.*]] = load <2 x double>, <2 x double>* [[TMP2]], align 8
; CHECK-NEXT:    [[TMP4:%.*]] = fmul <2 x double> [[TMP1]], [[TMP3]]
; CHECK-NEXT:    [[TMP5:%.*]] = bitcast double* [[C:%.*]] to <2 x double>*
; CHECK-NEXT:    store <2 x double> [[TMP4]], <2 x double>* [[TMP5]], align 8
; CHECK-NEXT:    [[TMP6:%.*]] = bitcast double* [[A]] to <4 x i32>*
; CHECK-NEXT:    [[TMP7:%.*]] = load <4 x i32>, <4 x i32>* [[TMP6]], align 8
; CHECK-NEXT:    [[TMP8:%.*]] = bitcast double* [[B]] to <4 x i32>*
; CHECK-NEXT:    [[TMP9:%.*]] = load <4 x i32>, <4 x i32>* [[TMP8]], align 8
; CHECK-NEXT:    [[TMP10:%.*]] = mul <4 x i32> [[TMP7]], [[TMP9]]
; CHECK-NEXT:    [[TMP11:%.*]] = bitcast double* [[D:%.*]] to <4 x i32>*
; CHECK-NEXT:    store <4 x i32> [[TMP10]], <4 x i32>* [[TMP11]], align 8
; CHECK-NEXT:    ret void
;
entry:
  %i0 = load double, double* %a, align 8
  %i1 = load double, double* %b, align 8
  %mul = fmul double %i0, %i1
  %arrayidx3 = getelementptr inbounds double, double* %a, i64 1
  %i3 = load double, double* %arrayidx3, align 8
  %arrayidx4 = getelementptr inbounds double, double* %b, i64 1
  %i4 = load double, double* %arrayidx4, align 8
  %mul5 = fmul double %i3, %i4
  store double %mul, double* %c, align 8
  %arrayidx5 = getelementptr inbounds double, double* %c, i64 1
  store double %mul5, double* %arrayidx5, align 8
  %0 = bitcast double* %a to <4 x i32>*
  %1 = load <4 x i32>, <4 x i32>* %0, align 8
  %2 = bitcast double* %b to <4 x i32>*
  %3 = load <4 x i32>, <4 x i32>* %2, align 8
  %4 = mul <4 x i32> %1, %3
  %5 = bitcast double* %d to <4 x i32>*
  store <4 x i32> %4, <4 x i32>* %5, align 8
  ret void
}