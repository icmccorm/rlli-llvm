; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -passes=instcombine -S | FileCheck %s

target datalayout = "e-p:40:64:64:32-p1:16:16:16-p2:32:32:32-p3:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"

declare i32 @test58_d(i64 )

define i1 @test59(i8* %foo) {
; CHECK-LABEL: @test59(
; CHECK-NEXT:    [[GEP1:%.*]] = getelementptr inbounds i8, i8* [[FOO:%.*]], i32 8
; CHECK-NEXT:    [[TMP1:%.*]] = ptrtoint i8* [[GEP1]] to i40
; CHECK-NEXT:    [[USE:%.*]] = zext i40 [[TMP1]] to i64
; CHECK-NEXT:    [[CALL:%.*]] = call i32 @test58_d(i64 [[USE]])
; CHECK-NEXT:    ret i1 true
;
  %bit = bitcast i8* %foo to i32*
  %gep1 = getelementptr inbounds i32, i32* %bit, i64 2
  %gep2 = getelementptr inbounds i8, i8* %foo, i64 10
  %cast1 = bitcast i32* %gep1 to i8*
  %cmp = icmp ult i8* %cast1, %gep2
  %use = ptrtoint i8* %cast1 to i64
  %call = call i32 @test58_d(i64 %use)
  ret i1 %cmp
}

define i1 @test59_as1(i8 addrspace(1)* %foo) {
; CHECK-LABEL: @test59_as1(
; CHECK-NEXT:    [[GEP1:%.*]] = getelementptr inbounds i8, i8 addrspace(1)* [[FOO:%.*]], i16 8
; CHECK-NEXT:    [[TMP1:%.*]] = ptrtoint i8 addrspace(1)* [[GEP1]] to i16
; CHECK-NEXT:    [[USE:%.*]] = zext i16 [[TMP1]] to i64
; CHECK-NEXT:    [[CALL:%.*]] = call i32 @test58_d(i64 [[USE]])
; CHECK-NEXT:    ret i1 true
;
  %bit = bitcast i8 addrspace(1)* %foo to i32 addrspace(1)*
  %gep1 = getelementptr inbounds i32, i32 addrspace(1)* %bit, i64 2
  %gep2 = getelementptr inbounds i8, i8 addrspace(1)* %foo, i64 10
  %cast1 = bitcast i32 addrspace(1)* %gep1 to i8 addrspace(1)*
  %cmp = icmp ult i8 addrspace(1)* %cast1, %gep2
  %use = ptrtoint i8 addrspace(1)* %cast1 to i64
  %call = call i32 @test58_d(i64 %use)
  ret i1 %cmp
}

define i1 @test60(i8* %foo, i64 %i, i64 %j) {
; CHECK-LABEL: @test60(
; CHECK-NEXT:    [[TMP1:%.*]] = trunc i64 [[I:%.*]] to i32
; CHECK-NEXT:    [[TMP2:%.*]] = trunc i64 [[J:%.*]] to i32
; CHECK-NEXT:    [[GEP1_IDX:%.*]] = shl nsw i32 [[TMP1]], 2
; CHECK-NEXT:    [[TMP3:%.*]] = icmp slt i32 [[GEP1_IDX]], [[TMP2]]
; CHECK-NEXT:    ret i1 [[TMP3]]
;
  %bit = bitcast i8* %foo to i32*
  %gep1 = getelementptr inbounds i32, i32* %bit, i64 %i
  %gep2 = getelementptr inbounds i8, i8* %foo, i64 %j
  %cast1 = bitcast i32* %gep1 to i8*
  %cmp = icmp ult i8* %cast1, %gep2
  ret i1 %cmp
}

define i1 @test60_as1(i8 addrspace(1)* %foo, i64 %i, i64 %j) {
; CHECK-LABEL: @test60_as1(
; CHECK-NEXT:    [[TMP1:%.*]] = trunc i64 [[I:%.*]] to i16
; CHECK-NEXT:    [[TMP2:%.*]] = trunc i64 [[J:%.*]] to i16
; CHECK-NEXT:    [[GEP1_IDX:%.*]] = shl nsw i16 [[TMP1]], 2
; CHECK-NEXT:    [[TMP3:%.*]] = icmp slt i16 [[GEP1_IDX]], [[TMP2]]
; CHECK-NEXT:    ret i1 [[TMP3]]
;
  %bit = bitcast i8 addrspace(1)* %foo to i32 addrspace(1)*
  %gep1 = getelementptr inbounds i32, i32 addrspace(1)* %bit, i64 %i
  %gep2 = getelementptr inbounds i8, i8 addrspace(1)* %foo, i64 %j
  %cast1 = bitcast i32 addrspace(1)* %gep1 to i8 addrspace(1)*
  %cmp = icmp ult i8 addrspace(1)* %cast1, %gep2
  ret i1 %cmp
}

; Same as test60, but look through an addrspacecast instead of a
; bitcast. This uses the same sized addrspace.
define i1 @test60_addrspacecast(i8* %foo, i64 %i, i64 %j) {
; CHECK-LABEL: @test60_addrspacecast(
; CHECK-NEXT:    [[TMP1:%.*]] = trunc i64 [[J:%.*]] to i32
; CHECK-NEXT:    [[I_TR:%.*]] = trunc i64 [[I:%.*]] to i32
; CHECK-NEXT:    [[TMP2:%.*]] = shl i32 [[I_TR]], 2
; CHECK-NEXT:    [[TMP3:%.*]] = icmp slt i32 [[TMP2]], [[TMP1]]
; CHECK-NEXT:    ret i1 [[TMP3]]
;
  %bit = addrspacecast i8* %foo to i32 addrspace(3)*
  %gep1 = getelementptr inbounds i32, i32 addrspace(3)* %bit, i64 %i
  %gep2 = getelementptr inbounds i8, i8* %foo, i64 %j
  %cast1 = addrspacecast i32 addrspace(3)* %gep1 to i8*
  %cmp = icmp ult i8* %cast1, %gep2
  ret i1 %cmp
}

define i1 @test60_addrspacecast_smaller(i8* %foo, i16 %i, i64 %j) {
; CHECK-LABEL: @test60_addrspacecast_smaller(
; CHECK-NEXT:    [[GEP1_IDX:%.*]] = shl nsw i16 [[I:%.*]], 2
; CHECK-NEXT:    [[TMP1:%.*]] = trunc i64 [[J:%.*]] to i16
; CHECK-NEXT:    [[TMP2:%.*]] = icmp slt i16 [[GEP1_IDX]], [[TMP1]]
; CHECK-NEXT:    ret i1 [[TMP2]]
;
  %bit = addrspacecast i8* %foo to i32 addrspace(1)*
  %gep1 = getelementptr inbounds i32, i32 addrspace(1)* %bit, i16 %i
  %gep2 = getelementptr inbounds i8, i8* %foo, i64 %j
  %cast1 = addrspacecast i32 addrspace(1)* %gep1 to i8*
  %cmp = icmp ult i8* %cast1, %gep2
  ret i1 %cmp
}

define i1 @test60_addrspacecast_larger(i8 addrspace(1)* %foo, i32 %i, i16 %j) {
; CHECK-LABEL: @test60_addrspacecast_larger(
; CHECK-NEXT:    [[I_TR:%.*]] = trunc i32 [[I:%.*]] to i16
; CHECK-NEXT:    [[TMP1:%.*]] = shl i16 [[I_TR]], 2
; CHECK-NEXT:    [[TMP2:%.*]] = icmp slt i16 [[TMP1]], [[J:%.*]]
; CHECK-NEXT:    ret i1 [[TMP2]]
;
  %bit = addrspacecast i8 addrspace(1)* %foo to i32 addrspace(2)*
  %gep1 = getelementptr inbounds i32, i32 addrspace(2)* %bit, i32 %i
  %gep2 = getelementptr inbounds i8, i8 addrspace(1)* %foo, i16 %j
  %cast1 = addrspacecast i32 addrspace(2)* %gep1 to i8 addrspace(1)*
  %cmp = icmp ult i8 addrspace(1)* %cast1, %gep2
  ret i1 %cmp
}

define i1 @test61(i8* %foo, i64 %i, i64 %j) {
; CHECK-LABEL: @test61(
; CHECK-NEXT:    [[BIT:%.*]] = bitcast i8* [[FOO:%.*]] to i32*
; CHECK-NEXT:    [[TMP1:%.*]] = trunc i64 [[I:%.*]] to i32
; CHECK-NEXT:    [[GEP1:%.*]] = getelementptr i32, i32* [[BIT]], i32 [[TMP1]]
; CHECK-NEXT:    [[TMP2:%.*]] = trunc i64 [[J:%.*]] to i32
; CHECK-NEXT:    [[GEP2:%.*]] = getelementptr i8, i8* [[FOO]], i32 [[TMP2]]
; CHECK-NEXT:    [[CAST1:%.*]] = bitcast i32* [[GEP1]] to i8*
; CHECK-NEXT:    [[CMP:%.*]] = icmp ugt i8* [[GEP2]], [[CAST1]]
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %bit = bitcast i8* %foo to i32*
  %gep1 = getelementptr i32, i32* %bit, i64 %i
  %gep2 = getelementptr  i8,  i8* %foo, i64 %j
  %cast1 = bitcast i32* %gep1 to i8*
  %cmp = icmp ult i8* %cast1, %gep2
  ret i1 %cmp
; Don't transform non-inbounds GEPs.
}

define i1 @test61_as1(i8 addrspace(1)* %foo, i16 %i, i16 %j) {
; CHECK-LABEL: @test61_as1(
; CHECK-NEXT:    [[BIT:%.*]] = bitcast i8 addrspace(1)* [[FOO:%.*]] to i32 addrspace(1)*
; CHECK-NEXT:    [[GEP1:%.*]] = getelementptr i32, i32 addrspace(1)* [[BIT]], i16 [[I:%.*]]
; CHECK-NEXT:    [[GEP2:%.*]] = getelementptr i8, i8 addrspace(1)* [[FOO]], i16 [[J:%.*]]
; CHECK-NEXT:    [[CAST1:%.*]] = bitcast i32 addrspace(1)* [[GEP1]] to i8 addrspace(1)*
; CHECK-NEXT:    [[CMP:%.*]] = icmp ugt i8 addrspace(1)* [[GEP2]], [[CAST1]]
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %bit = bitcast i8 addrspace(1)* %foo to i32 addrspace(1)*
  %gep1 = getelementptr i32, i32 addrspace(1)* %bit, i16 %i
  %gep2 = getelementptr i8, i8 addrspace(1)* %foo, i16 %j
  %cast1 = bitcast i32 addrspace(1)* %gep1 to i8 addrspace(1)*
  %cmp = icmp ult i8 addrspace(1)* %cast1, %gep2
  ret i1 %cmp
; Don't transform non-inbounds GEPs.
}

; Negative test: GEP inbounds may cross sign boundary.
define i1 @test62(i8* %a) {
; CHECK-LABEL: @test62(
; CHECK-NEXT:    [[ARRAYIDX1:%.*]] = getelementptr inbounds i8, i8* [[A:%.*]], i32 1
; CHECK-NEXT:    [[ARRAYIDX2:%.*]] = getelementptr inbounds i8, i8* [[A]], i32 10
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i8* [[ARRAYIDX1]], [[ARRAYIDX2]]
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %arrayidx1 = getelementptr inbounds i8, i8* %a, i64 1
  %arrayidx2 = getelementptr inbounds i8, i8* %a, i64 10
  %cmp = icmp slt i8* %arrayidx1, %arrayidx2
  ret i1 %cmp
}

define i1 @test62_as1(i8 addrspace(1)* %a) {
; CHECK-LABEL: @test62_as1(
; CHECK-NEXT:    [[ARRAYIDX1:%.*]] = getelementptr inbounds i8, i8 addrspace(1)* [[A:%.*]], i16 1
; CHECK-NEXT:    [[ARRAYIDX2:%.*]] = getelementptr inbounds i8, i8 addrspace(1)* [[A]], i16 10
; CHECK-NEXT:    [[CMP:%.*]] = icmp slt i8 addrspace(1)* [[ARRAYIDX1]], [[ARRAYIDX2]]
; CHECK-NEXT:    ret i1 [[CMP]]
;
  %arrayidx1 = getelementptr inbounds i8, i8 addrspace(1)* %a, i64 1
  %arrayidx2 = getelementptr inbounds i8, i8 addrspace(1)* %a, i64 10
  %cmp = icmp slt i8 addrspace(1)* %arrayidx1, %arrayidx2
  ret i1 %cmp
}


; Variation of the above with an ashr
define i1 @icmp_and_ashr_multiuse(i32 %X) {
; CHECK-LABEL: @icmp_and_ashr_multiuse(
; CHECK-NEXT:    [[TMP1:%.*]] = and i32 [[X:%.*]], 240
; CHECK-NEXT:    [[TOBOOL:%.*]] = icmp ne i32 [[TMP1]], 224
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[X]], 496
; CHECK-NEXT:    [[TOBOOL2:%.*]] = icmp ne i32 [[TMP2]], 432
; CHECK-NEXT:    [[AND3:%.*]] = and i1 [[TOBOOL]], [[TOBOOL2]]
; CHECK-NEXT:    ret i1 [[AND3]]
;
  %shr = ashr i32 %X, 4
  %and = and i32 %shr, 15
  %and2 = and i32 %shr, 31 ; second use of the shift
  %tobool = icmp ne i32 %and, 14
  %tobool2 = icmp ne i32 %and2, 27
  %and3 = and i1 %tobool, %tobool2
  ret i1 %and3
}

define i1 @icmp_and_ashr_multiuse_logical(i32 %X) {
; CHECK-LABEL: @icmp_and_ashr_multiuse_logical(
; CHECK-NEXT:    [[TMP1:%.*]] = and i32 [[X:%.*]], 240
; CHECK-NEXT:    [[TOBOOL:%.*]] = icmp ne i32 [[TMP1]], 224
; CHECK-NEXT:    [[TMP2:%.*]] = and i32 [[X]], 496
; CHECK-NEXT:    [[TOBOOL2:%.*]] = icmp ne i32 [[TMP2]], 432
; CHECK-NEXT:    [[AND3:%.*]] = and i1 [[TOBOOL]], [[TOBOOL2]]
; CHECK-NEXT:    ret i1 [[AND3]]
;
  %shr = ashr i32 %X, 4
  %and = and i32 %shr, 15
  %and2 = and i32 %shr, 31 ; second use of the shift
  %tobool = icmp ne i32 %and, 14
  %tobool2 = icmp ne i32 %and2, 27
  %and3 = select i1 %tobool, i1 %tobool2, i1 false
  ret i1 %and3
}

define i1 @icmp_lshr_and_overshift(i8 %X) {
; CHECK-LABEL: @icmp_lshr_and_overshift(
; CHECK-NEXT:    [[TOBOOL:%.*]] = icmp ugt i8 [[X:%.*]], 31
; CHECK-NEXT:    ret i1 [[TOBOOL]]
;
  %shr = lshr i8 %X, 5
  %and = and i8 %shr, 15
  %tobool = icmp ne i8 %and, 0
  ret i1 %tobool
}

; We shouldn't simplify this because the and uses bits that are shifted in.
define i1 @icmp_ashr_and_overshift(i8 %X) {
; CHECK-LABEL: @icmp_ashr_and_overshift(
; CHECK-NEXT:    [[SHR:%.*]] = ashr i8 [[X:%.*]], 5
; CHECK-NEXT:    [[AND:%.*]] = and i8 [[SHR]], 15
; CHECK-NEXT:    [[TOBOOL:%.*]] = icmp ne i8 [[AND]], 0
; CHECK-NEXT:    ret i1 [[TOBOOL]]
;
  %shr = ashr i8 %X, 5
  %and = and i8 %shr, 15
  %tobool = icmp ne i8 %and, 0
  ret i1 %tobool
}

; PR16244
define i1 @test71(i8* %x) {
; CHECK-LABEL: @test71(
; CHECK-NEXT:    ret i1 false
;
  %a = getelementptr i8, i8* %x, i64 8
  %b = getelementptr inbounds i8, i8* %x, i64 8
  %c = icmp ugt i8* %a, %b
  ret i1 %c
}

define i1 @test71_as1(i8 addrspace(1)* %x) {
; CHECK-LABEL: @test71_as1(
; CHECK-NEXT:    ret i1 false
;
  %a = getelementptr i8, i8 addrspace(1)* %x, i64 8
  %b = getelementptr inbounds i8, i8 addrspace(1)* %x, i64 8
  %c = icmp ugt i8 addrspace(1)* %a, %b
  ret i1 %c
}

