; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -O3 -S < %s | FileCheck %s
; RUN: opt -instcombine -sccp -bdce -S < %s | FileCheck %s
; RUN: opt -aggressive-instcombine -instcombine -sccp -bdce -S < %s | FileCheck %s

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i1 @foo(i32 %t4, i32 %t10) {
; CHECK-LABEL: @foo(
; CHECK-NEXT:    ret i1 false
;
  %t09 = shl i32 %t10, 24
  %t010 = ashr exact i32 %t09, 24
  %t011 = add nsw i32 %t010, 979
  %t11 = trunc i32 %t4 to i8
  %t12 = icmp eq i8 %t11, 0
  %t14 = zext i1 %t12 to i32
  %t15 = shl i32 %t4, %t14
  %t17 = and i32 %t15, 255
  %t18 = icmp eq i32 %t011, %t17
  ret i1 %t18
}

define i1 @bar(i32 %t4, i32 %t10) {
; CHECK-LABEL: @bar(
; CHECK-NEXT:    ret i1 false
;
  %t09 = shl i32 %t10, 24
  %t010 = ashr exact i32 %t09, 24
  %t011 = add nsw i32 %t010, 979
  %t11 = trunc i32 %t4 to i8
  %t12 = icmp eq i8 %t11, 0
  %t14 = zext i1 %t12 to i8
  %t15 = shl i8 %t11, %t14
  %t17 = zext i8 %t15 to i32
  %t18 = icmp eq i32 %t011, %t17
  ret i1 %t18
}

define i1 @foobar(i32 %t4, i32 %t10) {
; CHECK-LABEL: @foobar(
; CHECK-NEXT:    ret i1 false
;
  %t09 = shl i32 %t10, 24
  %t010 = ashr exact i32 %t09, 24
  %t011 = add nsw i32 %t010, 979
  %t11 = trunc i32 %t4 to i8
  %t12 = icmp eq i8 %t11, 0
  %t13 = zext i8 %t11 to i32
  %t14 = select i1 %t12, i32 1, i32 0
  %t15 = shl nuw nsw i32 %t13, %t14
  %t16 = trunc i32 %t15 to i8
  %t17 = zext i8 %t16 to i32
  %t18 = icmp eq i32 %t011, %t17
  ret i1 %t18
}
