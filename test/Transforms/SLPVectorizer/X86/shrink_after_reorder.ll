; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -slp-vectorizer -S -o - -mtriple=x86_64-unknown-linux-gnu -mcpu=haswell < %s | FileCheck %s

define void @wombat(i32* %ptr, i32* %ptr1) {
; CHECK-LABEL: @wombat(
; CHECK-NEXT:  bb:
; CHECK-NEXT:    [[TMP8:%.*]] = getelementptr inbounds i32, i32* [[PTR:%.*]], i64 0
; CHECK-NEXT:    [[TMP27:%.*]] = getelementptr inbounds i32, i32* [[PTR1:%.*]], i32 3
; CHECK-NEXT:    [[TMP0:%.*]] = bitcast i32* [[TMP8]] to <2 x i32>*
; CHECK-NEXT:    [[TMP1:%.*]] = load <2 x i32>, <2 x i32>* [[TMP0]], align 8
; CHECK-NEXT:    [[SHUFFLE:%.*]] = shufflevector <2 x i32> [[TMP1]], <2 x i32> poison, <4 x i32> <i32 1, i32 0, i32 1, i32 0>
; CHECK-NEXT:    [[SHRINK_SHUFFLE:%.*]] = shufflevector <4 x i32> [[SHUFFLE]], <4 x i32> poison, <2 x i32> <i32 0, i32 1>
; CHECK-NEXT:    [[TMP2:%.*]] = add nsw <2 x i32> [[SHRINK_SHUFFLE]], <i32 -1, i32 -1>
; CHECK-NEXT:    [[SHUFFLE1:%.*]] = shufflevector <2 x i32> [[TMP2]], <2 x i32> poison, <4 x i32> <i32 0, i32 1, i32 0, i32 1>
; CHECK-NEXT:    [[TMP3:%.*]] = icmp sgt <4 x i32> [[SHUFFLE]], undef
; CHECK-NEXT:    [[TMP4:%.*]] = select <4 x i1> [[TMP3]], <4 x i32> undef, <4 x i32> [[SHUFFLE1]]
; CHECK-NEXT:    [[TMP5:%.*]] = select <4 x i1> zeroinitializer, <4 x i32> zeroinitializer, <4 x i32> [[TMP4]]
; CHECK-NEXT:    [[TMP6:%.*]] = bitcast i32* [[TMP27]] to <4 x i32>*
; CHECK-NEXT:    store <4 x i32> [[TMP5]], <4 x i32>* [[TMP6]], align 8
; CHECK-NEXT:    ret void
;
bb:
  %tmp7 = getelementptr inbounds i32, i32* %ptr, i64 1
  %tmp8 = getelementptr inbounds i32, i32* %ptr, i64 0
  %tmp12 = load i32, i32* %tmp7, align 4
  %tmp13 = load i32, i32* %tmp8, align 8
  %tmp21 = add nsw i32 %tmp12, -1
  %tmp22 = fptosi float undef to i32
  %tmp23 = icmp slt i32 %tmp22, 0
  %tmp24 = icmp sgt i32 %tmp12, %tmp22
  %tmp25 = select i1 %tmp24, i32 %tmp22, i32 %tmp21
  %tmp26 = select i1 %tmp23, i32 0, i32 %tmp25
  %tmp27 = getelementptr inbounds i32, i32* %ptr1, i32 3
  store i32 %tmp26, i32* %tmp27, align 8
  %tmp28 = add nsw i32 %tmp13, -1
  %tmp29 = fptosi float undef to i32
  %tmp30 = icmp slt i32 %tmp29, 0
  %tmp31 = icmp sgt i32 %tmp13, %tmp29
  %tmp32 = select i1 %tmp31, i32 %tmp29, i32 %tmp28
  %tmp33 = select i1 %tmp30, i32 0, i32 %tmp32
  %tmp34 = getelementptr inbounds i32, i32* %ptr1, i32 4
  store i32 %tmp33, i32* %tmp34, align 4
  %tmp35 = fptosi float undef to i32
  %tmp36 = icmp slt i32 %tmp35, 0
  %tmp37 = icmp sgt i32 %tmp12, %tmp35
  %tmp38 = select i1 %tmp37, i32 %tmp35, i32 %tmp21
  %tmp39 = select i1 %tmp36, i32 0, i32 %tmp38
  %tmp40 = getelementptr inbounds i32, i32* %ptr1, i32 5
  store i32 %tmp39, i32* %tmp40, align 8
  %tmp41 = fptosi float undef to i32
  %tmp42 = icmp slt i32 %tmp41, 0
  %tmp43 = icmp sgt i32 %tmp13, %tmp41
  %tmp44 = select i1 %tmp43, i32 %tmp41, i32 %tmp28
  %tmp45 = select i1 %tmp42, i32 0, i32 %tmp44
  %tmp46 = getelementptr inbounds i32, i32* %ptr1, i32 6
  store i32 %tmp45, i32* %tmp46, align 4
  ret void
}

define internal i32 @ipvideo_decode_block_opcode_0xD_16() {
; CHECK-LABEL: @ipvideo_decode_block_opcode_0xD_16(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[FOR_BODY:%.*]]
; CHECK:       for.body:
; CHECK-NEXT:    [[TMP0:%.*]] = phi <2 x i16> [ undef, [[ENTRY:%.*]] ], [ [[SHRINK_SHUFFLE:%.*]], [[IF_END:%.*]] ]
; CHECK-NEXT:    [[SHUFFLE:%.*]] = shufflevector <2 x i16> [[TMP0]], <2 x i16> poison, <8 x i32> <i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1>
; CHECK-NEXT:    br label [[IF_END]]
; CHECK:       if.end:
; CHECK-NEXT:    store <8 x i16> [[SHUFFLE]], <8 x i16>* undef, align 2
; CHECK-NEXT:    [[SHRINK_SHUFFLE]] = shufflevector <8 x i16> [[SHUFFLE]], <8 x i16> poison, <2 x i32> <i32 0, i32 4>
; CHECK-NEXT:    br label [[FOR_BODY]]
;
entry:
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %P.sroa.7.0 = phi i16 [ undef, %entry ], [ %P.sroa.7.0, %if.end ]
  %P.sroa.0.0 = phi i16 [ undef, %entry ], [ %P.sroa.0.0, %if.end ]
  br label %if.end

if.end:                                           ; preds = %for.body
  store i16 %P.sroa.0.0, i16* undef, align 2
  %arrayidx11.1 = getelementptr inbounds i16, i16* undef, i32 1
  store i16 %P.sroa.0.0, i16* %arrayidx11.1, align 2
  %arrayidx11.2 = getelementptr inbounds i16, i16* undef, i32 2
  store i16 %P.sroa.0.0, i16* %arrayidx11.2, align 2
  %arrayidx11.3 = getelementptr inbounds i16, i16* undef, i32 3
  store i16 %P.sroa.0.0, i16* %arrayidx11.3, align 2
  %arrayidx11.4 = getelementptr inbounds i16, i16* undef, i32 4
  store i16 %P.sroa.7.0, i16* %arrayidx11.4, align 2
  %arrayidx11.5 = getelementptr inbounds i16, i16* undef, i32 5
  store i16 %P.sroa.7.0, i16* %arrayidx11.5, align 2
  %arrayidx11.6 = getelementptr inbounds i16, i16* undef, i32 6
  store i16 %P.sroa.7.0, i16* %arrayidx11.6, align 2
  %arrayidx11.7 = getelementptr inbounds i16, i16* undef, i32 7
  store i16 %P.sroa.7.0, i16* %arrayidx11.7, align 2
  br label %for.body
}
