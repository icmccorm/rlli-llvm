; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -scoped-noalias-aa -slp-vectorizer -mtriple=x86_64-apple-darwin -enable-new-pm=false -S %s | FileCheck %s
; RUN: opt -aa-pipeline='basic-aa,scoped-noalias-aa' -passes=slp-vectorizer -mtriple=x86_64-apple-darwin -S %s | FileCheck %s

define void @version_multiple(i32* nocapture %out_block, i32* nocapture readonly %counter) {
; CHECK-LABEL: @version_multiple(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = load i32, i32* [[COUNTER:%.*]], align 4
; CHECK-NEXT:    [[TMP1:%.*]] = load i32, i32* [[OUT_BLOCK:%.*]], align 4
; CHECK-NEXT:    [[XOR:%.*]] = xor i32 [[TMP1]], [[TMP0]]
; CHECK-NEXT:    store i32 [[XOR]], i32* [[OUT_BLOCK]], align 4
; CHECK-NEXT:    [[ARRAYIDX_1:%.*]] = getelementptr inbounds i32, i32* [[COUNTER]], i64 1
; CHECK-NEXT:    [[TMP2:%.*]] = load i32, i32* [[ARRAYIDX_1]], align 4
; CHECK-NEXT:    [[ARRAYIDX2_1:%.*]] = getelementptr inbounds i32, i32* [[OUT_BLOCK]], i64 1
; CHECK-NEXT:    [[TMP3:%.*]] = load i32, i32* [[ARRAYIDX2_1]], align 4
; CHECK-NEXT:    [[XOR_1:%.*]] = xor i32 [[TMP3]], [[TMP2]]
; CHECK-NEXT:    store i32 [[XOR_1]], i32* [[ARRAYIDX2_1]], align 4
; CHECK-NEXT:    [[ARRAYIDX_2:%.*]] = getelementptr inbounds i32, i32* [[COUNTER]], i64 2
; CHECK-NEXT:    [[TMP4:%.*]] = load i32, i32* [[ARRAYIDX_2]], align 4
; CHECK-NEXT:    [[ARRAYIDX2_2:%.*]] = getelementptr inbounds i32, i32* [[OUT_BLOCK]], i64 2
; CHECK-NEXT:    [[TMP5:%.*]] = load i32, i32* [[ARRAYIDX2_2]], align 4
; CHECK-NEXT:    [[XOR_2:%.*]] = xor i32 [[TMP5]], [[TMP4]]
; CHECK-NEXT:    store i32 [[XOR_2]], i32* [[ARRAYIDX2_2]], align 4
; CHECK-NEXT:    [[ARRAYIDX_3:%.*]] = getelementptr inbounds i32, i32* [[COUNTER]], i64 3
; CHECK-NEXT:    [[TMP6:%.*]] = load i32, i32* [[ARRAYIDX_3]], align 4
; CHECK-NEXT:    [[ARRAYIDX2_3:%.*]] = getelementptr inbounds i32, i32* [[OUT_BLOCK]], i64 3
; CHECK-NEXT:    [[TMP7:%.*]] = load i32, i32* [[ARRAYIDX2_3]], align 4
; CHECK-NEXT:    [[XOR_3:%.*]] = xor i32 [[TMP7]], [[TMP6]]
; CHECK-NEXT:    store i32 [[XOR_3]], i32* [[ARRAYIDX2_3]], align 4
; CHECK-NEXT:    ret void
;
entry:
  %0 = load i32, i32* %counter, align 4
  %1 = load i32, i32* %out_block, align 4
  %xor = xor i32 %1, %0
  store i32 %xor, i32* %out_block, align 4
  %arrayidx.1 = getelementptr inbounds i32, i32* %counter, i64 1
  %2 = load i32, i32* %arrayidx.1, align 4
  %arrayidx2.1 = getelementptr inbounds i32, i32* %out_block, i64 1
  %3 = load i32, i32* %arrayidx2.1, align 4
  %xor.1 = xor i32 %3, %2
  store i32 %xor.1, i32* %arrayidx2.1, align 4
  %arrayidx.2 = getelementptr inbounds i32, i32* %counter, i64 2
  %4 = load i32, i32* %arrayidx.2, align 4
  %arrayidx2.2 = getelementptr inbounds i32, i32* %out_block, i64 2
  %5 = load i32, i32* %arrayidx2.2, align 4
  %xor.2 = xor i32 %5, %4
  store i32 %xor.2, i32* %arrayidx2.2, align 4
  %arrayidx.3 = getelementptr inbounds i32, i32* %counter, i64 3
  %6 = load i32, i32* %arrayidx.3, align 4
  %arrayidx2.3 = getelementptr inbounds i32, i32* %out_block, i64 3
  %7 = load i32, i32* %arrayidx2.3, align 4
  %xor.3 = xor i32 %7, %6
  store i32 %xor.3, i32* %arrayidx2.3, align 4
  ret void
}

declare void @use(<8 x float>)
define void @delete_pointer_bound(float* %a, float* %b, i1 %c) #0 {
; CHECK-LABEL: @delete_pointer_bound(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[B_10:%.*]] = getelementptr inbounds float, float* [[B:%.*]], i64 10
; CHECK-NEXT:    [[B_14:%.*]] = getelementptr inbounds float, float* [[B]], i64 14
; CHECK-NEXT:    br i1 [[C:%.*]], label [[THEN:%.*]], label [[ELSE:%.*]]
; CHECK:       else:
; CHECK-NEXT:    [[L0:%.*]] = load float, float* [[B_10]], align 4
; CHECK-NEXT:    [[L1:%.*]] = load float, float* [[B_14]], align 4
; CHECK-NEXT:    [[I2:%.*]] = insertelement <8 x float> undef, float [[L0]], i32 2
; CHECK-NEXT:    [[I3:%.*]] = insertelement <8 x float> [[I2]], float [[L0]], i32 3
; CHECK-NEXT:    [[I4:%.*]] = insertelement <8 x float> [[I3]], float [[L1]], i32 4
; CHECK-NEXT:    [[I7:%.*]] = insertelement <8 x float> [[I4]], float [[L1]], i32 7
; CHECK-NEXT:    call void @use(<8 x float> [[I7]])
; CHECK-NEXT:    ret void
; CHECK:       then:
; CHECK-NEXT:    [[A_8:%.*]] = getelementptr inbounds float, float* [[A:%.*]], i64 8
; CHECK-NEXT:    store float 0.000000e+00, float* [[A_8]], align 4
; CHECK-NEXT:    [[L6:%.*]] = load float, float* [[B_14]], align 4
; CHECK-NEXT:    [[A_5:%.*]] = getelementptr inbounds float, float* [[A]], i64 5
; CHECK-NEXT:    store float [[L6]], float* [[A_5]], align 4
; CHECK-NEXT:    [[A_6:%.*]] = getelementptr inbounds float, float* [[A]], i64 6
; CHECK-NEXT:    [[TMP0:%.*]] = bitcast float* [[A_6]] to <2 x float>*
; CHECK-NEXT:    store <2 x float> zeroinitializer, <2 x float>* [[TMP0]], align 4
; CHECK-NEXT:    ret void
;
entry:
  %b.10 = getelementptr inbounds float, float* %b, i64 10
  %b.14 = getelementptr inbounds float, float* %b, i64 14
  br i1 %c, label %then, label %else

else:
  %l0 = load float, float* %b.10, align 4
  %l1 = load float, float* %b.14, align 4
  %i2 = insertelement <8 x float> undef, float %l0, i32 2
  %i3 = insertelement <8 x float> %i2, float %l0, i32 3
  %i4 = insertelement <8 x float> %i3, float %l1, i32 4
  %i7 = insertelement <8 x float> %i4, float %l1, i32 7
  call void @use(<8 x float> %i7)
  ret void

then:
  %a.8 = getelementptr inbounds float, float* %a, i64 8
  store float 0.0, float* %a.8, align 4
  %l6 = load float, float* %b.14, align 4
  %a.5 = getelementptr inbounds float, float* %a, i64 5
  store float %l6, float* %a.5, align 4
  %a.6 = getelementptr inbounds float, float* %a, i64 6
  store float 0.0, float* %a.6, align 4
  %a.7 = getelementptr inbounds float, float* %a, i64 7
  store float 0.0, float* %a.7, align 4
  ret void
}

%struct.zot = type { i16, i16, i16, i32, float, float, float, %struct.quux*, %struct.zot*, %struct.wombat*, %struct.wombat.0 }
%struct.quux = type { i16, %struct.quux*, %struct.quux* }
%struct.wombat = type { i32, i16, i8, i8, %struct.eggs* }
%struct.eggs = type { float, i8, %struct.ham }
%struct.ham = type { [2 x double], [8 x i8] }
%struct.wombat.0 = type { %struct.bar }
%struct.bar = type { [3 x double], [3 x double], double, double, i16, [3 x double]*, i32, [3 x double] }

define double @preserve_loop_info(%struct.zot* %arg) {
; CHECK-LABEL: @preserve_loop_info(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP:%.*]] = alloca [3 x double], align 16
; CHECK-NEXT:    br label [[OUTER_HEADER:%.*]]
; CHECK:       outer.header:
; CHECK-NEXT:    br label [[INNER:%.*]]
; CHECK:       inner:
; CHECK-NEXT:    br i1 undef, label [[OUTER_LATCH:%.*]], label [[INNER]]
; CHECK:       outer.latch:
; CHECK-NEXT:    br i1 undef, label [[BB:%.*]], label [[OUTER_HEADER]]
; CHECK:       bb:
; CHECK-NEXT:    [[TMP5:%.*]] = load [3 x double]*, [3 x double]** undef, align 8
; CHECK-NEXT:    [[TMP6:%.*]] = getelementptr inbounds [3 x double], [3 x double]* [[TMP]], i64 0, i64 0
; CHECK-NEXT:    [[TMP7:%.*]] = getelementptr inbounds [3 x double], [3 x double]* [[TMP]], i64 0, i64 1
; CHECK-NEXT:    br label [[LOOP_3HEADER:%.*]]
; CHECK:       loop.3header:
; CHECK-NEXT:    br i1 undef, label [[LOOP_3LATCH:%.*]], label [[BB9:%.*]]
; CHECK:       bb9:
; CHECK-NEXT:    [[TMP10:%.*]] = getelementptr inbounds [3 x double], [3 x double]* [[TMP5]], i64 undef, i64 1
; CHECK-NEXT:    store double undef, double* [[TMP6]], align 16
; CHECK-NEXT:    [[TMP12:%.*]] = load double, double* [[TMP10]], align 8
; CHECK-NEXT:    store double [[TMP12]], double* [[TMP7]], align 8
; CHECK-NEXT:    br label [[LOOP_3LATCH]]
; CHECK:       loop.3latch:
; CHECK-NEXT:    br i1 undef, label [[BB14:%.*]], label [[LOOP_3HEADER]]
; CHECK:       bb14:
; CHECK-NEXT:    [[TMP15:%.*]] = call double undef(double* [[TMP6]], %struct.zot* [[ARG:%.*]])
; CHECK-NEXT:    ret double undef
;
entry:
  %tmp = alloca [3 x double], align 16
  br label %outer.header

outer.header:                                              ; preds = %bb3, %bb
  br label %inner

inner:
  br i1 undef, label %outer.latch, label %inner

outer.latch:                                              ; preds = %bb16
  br i1 undef, label %bb, label %outer.header

bb:                                              ; preds = %bb3
  %tmp5 = load [3 x double]*, [3 x double]** undef, align 8
  %tmp6 = getelementptr inbounds [3 x double], [3 x double]* %tmp, i64 0, i64 0
  %tmp7 = getelementptr inbounds [3 x double], [3 x double]* %tmp, i64 0, i64 1
  br label %loop.3header

loop.3header:                                              ; preds = %bb13, %bb4
  br i1 undef, label %loop.3latch, label %bb9

bb9:                                              ; preds = %bb8
  %tmp10 = getelementptr inbounds [3 x double], [3 x double]* %tmp5, i64 undef, i64 1
  store double undef, double* %tmp6, align 16
  %tmp12 = load double, double* %tmp10, align 8
  store double %tmp12, double* %tmp7, align 8
  br label %loop.3latch

loop.3latch:                                             ; preds = %bb11, %bb8
  br i1 undef, label %bb14, label %loop.3header

bb14:                                             ; preds = %bb13
  %tmp15 = call double undef(double* %tmp6, %struct.zot* %arg)
  ret double undef
}

define void @gather_sequence_crash(<2 x float> %arg, float* %arg1, float %arg2, float* %arg3, float* %arg4, float* %arg5, i1 %c.1, i1 %c.2) {
; CHECK-LABEL: @gather_sequence_crash(
; CHECK-NEXT:  bb:
; CHECK-NEXT:    br i1 [[C_1:%.*]], label [[BB16:%.*]], label [[BB6:%.*]]
; CHECK:       bb6:
; CHECK-NEXT:    [[TMP8:%.*]] = getelementptr inbounds float, float* [[ARG1:%.*]], i32 3
; CHECK-NEXT:    [[TMP0:%.*]] = insertelement <4 x float> <float poison, float poison, float poison, float 0.000000e+00>, float [[ARG2:%.*]], i32 0
; CHECK-NEXT:    [[TMP1:%.*]] = shufflevector <2 x float> [[ARG:%.*]], <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
; CHECK-NEXT:    [[TMP2:%.*]] = shufflevector <4 x float> [[TMP0]], <4 x float> [[TMP1]], <4 x i32> <i32 0, i32 4, i32 5, i32 3>
; CHECK-NEXT:    [[TMP3:%.*]] = fmul <4 x float> [[TMP2]], zeroinitializer
; CHECK-NEXT:    [[TMP4:%.*]] = bitcast float* [[TMP8]] to <4 x float>*
; CHECK-NEXT:    store <4 x float> [[TMP3]], <4 x float>* [[TMP4]], align 4
; CHECK-NEXT:    ret void
; CHECK:       bb16:
; CHECK-NEXT:    br label [[BB17:%.*]]
; CHECK:       bb17:
; CHECK-NEXT:    br label [[BB18:%.*]]
; CHECK:       bb18:
; CHECK-NEXT:    br label [[BB19:%.*]]
; CHECK:       bb19:
; CHECK-NEXT:    br label [[BB20:%.*]]
; CHECK:       bb20:
; CHECK-NEXT:    br label [[BB21:%.*]]
; CHECK:       bb21:
; CHECK-NEXT:    br label [[BB22:%.*]]
; CHECK:       bb22:
; CHECK-NEXT:    [[TMP23:%.*]] = getelementptr inbounds float, float* [[ARG4:%.*]], i32 0
; CHECK-NEXT:    [[TMP24:%.*]] = getelementptr float, float* [[TMP23]], i64 7
; CHECK-NEXT:    br i1 [[C_2:%.*]], label [[BB25:%.*]], label [[BB22]]
; CHECK:       bb25:
; CHECK-NEXT:    [[TMP26:%.*]] = getelementptr float, float* [[TMP23]], i64 6
; CHECK-NEXT:    store float 0.000000e+00, float* [[TMP24]], align 4
; CHECK-NEXT:    [[TMP27:%.*]] = load float, float* [[ARG5:%.*]], align 4
; CHECK-NEXT:    [[TMP29:%.*]] = fadd float 0.000000e+00, 0.000000e+00
; CHECK-NEXT:    store float 0.000000e+00, float* [[TMP26]], align 4
; CHECK-NEXT:    [[TMP30:%.*]] = getelementptr float, float* [[TMP23]], i64 4
; CHECK-NEXT:    [[TMP31:%.*]] = fadd float 0.000000e+00, 0.000000e+00
; CHECK-NEXT:    [[TMP5:%.*]] = bitcast float* [[TMP30]] to <2 x float>*
; CHECK-NEXT:    store <2 x float> zeroinitializer, <2 x float>* [[TMP5]], align 4
; CHECK-NEXT:    [[TMP32:%.*]] = getelementptr inbounds float, float* [[ARG4]], i32 0
; CHECK-NEXT:    br label [[BB33:%.*]]
; CHECK:       bb33:
; CHECK-NEXT:    br label [[BB34:%.*]]
; CHECK:       bb34:
; CHECK-NEXT:    [[TMP35:%.*]] = getelementptr float, float* [[TMP32]], i64 3
; CHECK-NEXT:    [[TMP37:%.*]] = load float, float* [[TMP35]], align 4
; CHECK-NEXT:    [[TMP38:%.*]] = fadd float 0.000000e+00, [[TMP37]]
; CHECK-NEXT:    store float [[TMP38]], float* [[TMP35]], align 4
; CHECK-NEXT:    [[TMP39:%.*]] = getelementptr float, float* [[TMP32]], i64 1
; CHECK-NEXT:    [[TMP6:%.*]] = bitcast float* [[TMP39]] to <2 x float>*
; CHECK-NEXT:    [[TMP7:%.*]] = load <2 x float>, <2 x float>* [[TMP6]], align 4
; CHECK-NEXT:    [[TMP8:%.*]] = fadd <2 x float> zeroinitializer, [[TMP7]]
; CHECK-NEXT:    [[TMP9:%.*]] = bitcast float* [[TMP39]] to <2 x float>*
; CHECK-NEXT:    store <2 x float> [[TMP8]], <2 x float>* [[TMP9]], align 4
; CHECK-NEXT:    [[TMP44:%.*]] = load float, float* [[ARG3:%.*]], align 4
; CHECK-NEXT:    [[TMP45:%.*]] = load float, float* [[TMP32]], align 4
; CHECK-NEXT:    [[TMP46:%.*]] = fadd float 0.000000e+00, [[TMP45]]
; CHECK-NEXT:    store float [[TMP46]], float* [[TMP32]], align 4
; CHECK-NEXT:    call void @quux()
; CHECK-NEXT:    br label [[BB47:%.*]]
; CHECK:       bb47:
; CHECK-NEXT:    br label [[BB17]]
;
bb:
  br i1 %c.1, label %bb16, label %bb6

bb6:                                              ; preds = %bb
  %tmp = getelementptr inbounds float, float* %arg1, i32 4
  %tmp7 = getelementptr inbounds float, float* %arg1, i32 5
  %tmp8 = getelementptr inbounds float, float* %arg1, i32 3
  %tmp9 = getelementptr inbounds float, float* %arg1, i32 6
  %tmp10 = extractelement <2 x float> %arg, i32 0
  %tmp11 = fmul float %tmp10, 0.000000e+00
  store float %tmp11, float* %tmp, align 4
  %tmp12 = extractelement <2 x float> %arg, i32 1
  %tmp13 = fmul float %tmp12, 0.000000e+00
  store float %tmp13, float* %tmp7, align 4
  %tmp14 = fmul float %arg2, 0.000000e+00
  store float %tmp14, float* %tmp8, align 4
  %tmp15 = fmul float 0.000000e+00, 0.000000e+00
  store float %tmp15, float* %tmp9, align 4
  ret void

bb16:                                             ; preds = %bb
  br label %bb17

bb17:                                             ; preds = %bb47, %bb16
  br label %bb18

bb18:                                             ; preds = %bb17
  br label %bb19

bb19:                                             ; preds = %bb18
  br label %bb20

bb20:                                             ; preds = %bb19
  br label %bb21

bb21:                                             ; preds = %bb20
  br label %bb22

bb22:                                             ; preds = %bb22, %bb21
  %tmp23 = getelementptr inbounds float, float* %arg4, i32 0
  %tmp24 = getelementptr float, float* %tmp23, i64 7
  br i1 %c.2, label %bb25, label %bb22

bb25:                                             ; preds = %bb22
  %tmp26 = getelementptr float, float* %tmp23, i64 6
  store float 0.000000e+00, float* %tmp24, align 4
  %tmp27 = load float, float* %arg5, align 4
  %tmp28 = getelementptr float, float* %tmp23, i64 5
  %tmp29 = fadd float 0.000000e+00, 0.000000e+00
  store float 0.000000e+00, float* %tmp26, align 4
  %tmp30 = getelementptr float, float* %tmp23, i64 4
  store float 0.000000e+00, float* %tmp28, align 4
  %tmp31 = fadd float 0.000000e+00, 0.000000e+00
  store float 0.000000e+00, float* %tmp30, align 4
  %tmp32 = getelementptr inbounds float, float* %arg4, i32 0
  br label %bb33

bb33:                                             ; preds = %bb25
  br label %bb34

bb34:                                             ; preds = %bb33
  %tmp35 = getelementptr float, float* %tmp32, i64 3
  %tmp36 = getelementptr float, float* %tmp32, i64 2
  %tmp37 = load float, float* %tmp35, align 4
  %tmp38 = fadd float 0.000000e+00, %tmp37
  store float %tmp38, float* %tmp35, align 4
  %tmp39 = getelementptr float, float* %tmp32, i64 1
  %tmp40 = load float, float* %tmp36, align 4
  %tmp41 = fadd float 0.000000e+00, %tmp40
  store float %tmp41, float* %tmp36, align 4
  %tmp42 = load float, float* %tmp39, align 4
  %tmp43 = fadd float 0.000000e+00, %tmp42
  store float %tmp43, float* %tmp39, align 4
  %tmp44 = load float, float* %arg3, align 4
  %tmp45 = load float, float* %tmp32, align 4
  %tmp46 = fadd float 0.000000e+00, %tmp45
  store float %tmp46, float* %tmp32, align 4
  call void @quux()
  br label %bb47

bb47:                                             ; preds = %bb34
  br label %bb17
}

declare void @quux()
attributes #0 = { "target-features"="+avx2" }
