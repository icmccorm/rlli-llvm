; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -passes=instcombine -S | FileCheck %s
; PR2756

define <2 x i8> @foo(<2 x i8> %x) {
; CHECK-LABEL: @foo(
; CHECK-NEXT:    [[A:%.*]] = srem <2 x i8> [[X:%.*]], <i8 2, i8 2>
; CHECK-NEXT:    ret <2 x i8> [[A]]
;
  %A = srem <2 x i8> %x, <i8 2, i8 -2>
  ret <2 x i8> %A
}
