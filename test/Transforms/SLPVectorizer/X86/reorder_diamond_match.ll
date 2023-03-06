; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -slp-vectorizer -S -mtriple=x86_64-unknown-linux-gnu -mcpu=skylake-avx512 | FileCheck %s

define void @test() {
; CHECK-LABEL: @test(
; CHECK-NEXT:    [[TMP1:%.*]] = getelementptr inbounds i8, i8* undef, i64 4
; CHECK-NEXT:    [[TMP2:%.*]] = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* undef, i64 0, i64 1, i64 0
; CHECK-NEXT:    [[TMP3:%.*]] = bitcast i8* [[TMP1]] to <4 x i8>*
; CHECK-NEXT:    [[TMP4:%.*]] = load <4 x i8>, <4 x i8>* [[TMP3]], align 1
; CHECK-NEXT:    [[TMP5:%.*]] = zext <4 x i8> [[TMP4]] to <4 x i32>
; CHECK-NEXT:    [[TMP6:%.*]] = sub nsw <4 x i32> zeroinitializer, [[TMP5]]
; CHECK-NEXT:    [[TMP7:%.*]] = shl nsw <4 x i32> [[TMP6]], zeroinitializer
; CHECK-NEXT:    [[TMP8:%.*]] = add nsw <4 x i32> [[TMP7]], zeroinitializer
; CHECK-NEXT:    [[TMP9:%.*]] = shufflevector <4 x i32> [[TMP8]], <4 x i32> poison, <4 x i32> <i32 1, i32 0, i32 3, i32 2>
; CHECK-NEXT:    [[TMP10:%.*]] = add nsw <4 x i32> [[TMP8]], [[TMP9]]
; CHECK-NEXT:    [[TMP11:%.*]] = sub nsw <4 x i32> [[TMP8]], [[TMP9]]
; CHECK-NEXT:    [[TMP12:%.*]] = shufflevector <4 x i32> [[TMP10]], <4 x i32> [[TMP11]], <4 x i32> <i32 1, i32 4, i32 3, i32 6>
; CHECK-NEXT:    [[TMP13:%.*]] = add nsw <4 x i32> zeroinitializer, [[TMP12]]
; CHECK-NEXT:    [[TMP14:%.*]] = sub nsw <4 x i32> zeroinitializer, [[TMP12]]
; CHECK-NEXT:    [[TMP15:%.*]] = shufflevector <4 x i32> [[TMP13]], <4 x i32> [[TMP14]], <4 x i32> <i32 0, i32 1, i32 6, i32 7>
; CHECK-NEXT:    [[TMP16:%.*]] = bitcast i32* [[TMP2]] to <4 x i32>*
; CHECK-NEXT:    store <4 x i32> [[TMP15]], <4 x i32>* [[TMP16]], align 16
; CHECK-NEXT:    ret void
;
  %1 = getelementptr inbounds i8, i8* undef, i64 4
  %2 = load i8, i8* %1, align 1
  %3 = zext i8 %2 to i32
  %4 = sub nsw i32 0, %3
  %5 = shl nsw i32 %4, 0
  %6 = add nsw i32 %5, 0
  %7 = getelementptr inbounds i8, i8* undef, i64 5
  %8 = load i8, i8* %7, align 1
  %9 = zext i8 %8 to i32
  %10 = sub nsw i32 0, %9
  %11 = shl nsw i32 %10, 0
  %12 = add nsw i32 %11, 0
  %13 = getelementptr inbounds i8, i8* undef, i64 6
  %14 = load i8, i8* %13, align 1
  %15 = zext i8 %14 to i32
  %16 = sub nsw i32 0, %15
  %17 = shl nsw i32 %16, 0
  %18 = add nsw i32 %17, 0
  %19 = getelementptr inbounds i8, i8* undef, i64 7
  %20 = load i8, i8* %19, align 1
  %21 = zext i8 %20 to i32
  %22 = sub nsw i32 0, %21
  %23 = shl nsw i32 %22, 0
  %24 = add nsw i32 %23, 0
  %25 = add nsw i32 %12, %6
  %26 = sub nsw i32 %6, %12
  %27 = add nsw i32 %24, %18
  %28 = sub nsw i32 %18, %24
  %29 = add nsw i32 0, %25
  %30 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* undef, i64 0, i64 1, i64 0
  store i32 %29, i32* %30, align 16
  %31 = sub nsw i32 0, %27
  %32 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* undef, i64 0, i64 1, i64 2
  store i32 %31, i32* %32, align 8
  %33 = add nsw i32 0, %26
  %34 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* undef, i64 0, i64 1, i64 1
  store i32 %33, i32* %34, align 4
  %35 = sub nsw i32 0, %28
  %36 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* undef, i64 0, i64 1, i64 3
  store i32 %35, i32* %36, align 4
  ret void
}
