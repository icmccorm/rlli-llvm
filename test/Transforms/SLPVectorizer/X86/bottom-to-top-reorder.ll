; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -slp-vectorizer -S -mtriple=x86_64-unknown-linux-gnu -mattr=+avx < %s | FileCheck %s

define void @test(i32* %0, i32* %1, i32* %2) {
; CHECK-LABEL: @test(
; CHECK-NEXT:    [[TMP4:%.*]] = getelementptr inbounds i32, i32* [[TMP0:%.*]], i64 4
; CHECK-NEXT:    [[TMP5:%.*]] = bitcast i32* [[TMP1:%.*]] to <4 x i32>*
; CHECK-NEXT:    [[TMP6:%.*]] = load <4 x i32>, <4 x i32>* [[TMP5]], align 4
; CHECK-NEXT:    [[TMP7:%.*]] = bitcast i32* [[TMP0]] to <4 x i32>*
; CHECK-NEXT:    [[TMP8:%.*]] = load <4 x i32>, <4 x i32>* [[TMP7]], align 4
; CHECK-NEXT:    [[TMP9:%.*]] = bitcast i32* [[TMP4]] to <4 x i32>*
; CHECK-NEXT:    [[TMP10:%.*]] = load <4 x i32>, <4 x i32>* [[TMP9]], align 4
; CHECK-NEXT:    [[TMP11:%.*]] = sub <4 x i32> <i32 0, i32 0, i32 undef, i32 0>, [[TMP8]]
; CHECK-NEXT:    [[TMP12:%.*]] = sub <4 x i32> [[TMP11]], [[TMP10]]
; CHECK-NEXT:    [[TMP13:%.*]] = add <4 x i32> [[TMP12]], [[TMP6]]
; CHECK-NEXT:    [[TMP14:%.*]] = add <4 x i32> [[TMP13]], <i32 0, i32 0, i32 1, i32 0>
; CHECK-NEXT:    [[TMP15:%.*]] = sub <4 x i32> [[TMP13]], <i32 0, i32 0, i32 1, i32 0>
; CHECK-NEXT:    [[TMP16:%.*]] = shufflevector <4 x i32> [[TMP14]], <4 x i32> [[TMP15]], <4 x i32> <i32 2, i32 0, i32 1, i32 7>
; CHECK-NEXT:    [[TMP17:%.*]] = add <4 x i32> [[TMP16]], zeroinitializer
; CHECK-NEXT:    [[TMP18:%.*]] = sub <4 x i32> [[TMP16]], zeroinitializer
; CHECK-NEXT:    [[TMP19:%.*]] = shufflevector <4 x i32> [[TMP17]], <4 x i32> [[TMP18]], <4 x i32> <i32 0, i32 5, i32 6, i32 7>
; CHECK-NEXT:    [[TMP20:%.*]] = add <4 x i32> [[TMP19]], zeroinitializer
; CHECK-NEXT:    [[TMP21:%.*]] = sub <4 x i32> [[TMP19]], zeroinitializer
; CHECK-NEXT:    [[TMP22:%.*]] = shufflevector <4 x i32> [[TMP20]], <4 x i32> [[TMP21]], <4 x i32> <i32 0, i32 5, i32 6, i32 3>
; CHECK-NEXT:    [[TMP23:%.*]] = bitcast i32* [[TMP2:%.*]] to <4 x i32>*
; CHECK-NEXT:    store <4 x i32> [[TMP22]], <4 x i32>* [[TMP23]], align 4
; CHECK-NEXT:    ret void
;
  %4 = load i32, i32* %1, align 4
  %5 = load i32, i32* %0, align 4
  %6 = getelementptr inbounds i32, i32* %0, i64 4
  %7 = load i32, i32* %6, align 4
  %8 = getelementptr inbounds i32, i32* %1, i64 1
  %9 = load i32, i32* %8, align 4
  %10 = getelementptr inbounds i32, i32* %0, i64 1
  %11 = load i32, i32* %10, align 4
  %12 = getelementptr inbounds i32, i32* %0, i64 5
  %13 = load i32, i32* %12, align 4
  %14 = getelementptr inbounds i32, i32* %1, i64 2
  %15 = load i32, i32* %14, align 4
  %16 = getelementptr inbounds i32, i32* %0, i64 2
  %17 = load i32, i32* %16, align 4
  %18 = getelementptr inbounds i32, i32* %0, i64 6
  %19 = load i32, i32* %18, align 4
  %20 = getelementptr inbounds i32, i32* %1, i64 3
  %21 = load i32, i32* %20, align 4
  %22 = getelementptr inbounds i32, i32* %0, i64 3
  %23 = load i32, i32* %22, align 4
  %24 = getelementptr inbounds i32, i32* %0, i64 7
  %25 = load i32, i32* %24, align 4
  %26 = sub i32 0, %23
  %27 = sub i32 %26, %25
  %28 = add i32 %27, %21
  %29 = sub i32 undef, %17
  %30 = sub i32 %29, %19
  %31 = add i32 %30, %15
  %32 = sub i32 0, %11
  %33 = sub i32 %32, %13
  %34 = add i32 %33, %9
  %35 = sub i32 0, %5
  %36 = sub i32 %35, %7
  %37 = add i32 %36, %4
  %38 = add i32 %31, 1
  %39 = add i32 %38, 0
  %40 = add i32 %39, 0
  store i32 %40, i32* %2, align 4
  %41 = getelementptr inbounds i32, i32* %2, i64 2
  %42 = add i32 0, %34
  %43 = sub i32 %42, 0
  %44 = sub i32 %43, 0
  store i32 %44, i32* %41, align 4
  %45 = getelementptr inbounds i32, i32* %2, i64 1
  %46 = add i32 %37, 0
  %47 = sub i32 %46, 0
  %48 = sub i32 %47, 0
  store i32 %48, i32* %45, align 4
  %49 = getelementptr inbounds i32, i32* %2, i64 3
  %50 = sub i32 %28, 0
  %51 = sub i32 %50, 0
  %52 = add i32 %51, 0
  store i32 %52, i32* %49, align 4
  ret void
}
