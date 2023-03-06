; RUN: llc --mtriple=loongarch32 < %s | FileCheck %s --check-prefix=LA32
; RUN: llc --mtriple=loongarch64 < %s | FileCheck %s --check-prefix=LA64

;; Exercise the 'sub' LLVM IR: https://llvm.org/docs/LangRef.html#sub-instruction

define i1 @sub_i1(i1 %x, i1 %y) {
; LA32-LABEL: sub_i1:
; LA32:       # %bb.0:
; LA32-NEXT:    sub.w $a0, $a0, $a1
; LA32-NEXT:    jirl $zero, $ra, 0
;
; LA64-LABEL: sub_i1:
; LA64:       # %bb.0:
; LA64-NEXT:    sub.d $a0, $a0, $a1
; LA64-NEXT:    jirl $zero, $ra, 0
  %sub = sub i1 %x, %y
  ret i1 %sub
}

define i8 @sub_i8(i8 %x, i8 %y) {
; LA32-LABEL: sub_i8:
; LA32:       # %bb.0:
; LA32-NEXT:    sub.w $a0, $a0, $a1
; LA32-NEXT:    jirl $zero, $ra, 0
;
; LA64-LABEL: sub_i8:
; LA64:       # %bb.0:
; LA64-NEXT:    sub.d $a0, $a0, $a1
; LA64-NEXT:    jirl $zero, $ra, 0
  %sub = sub i8 %x, %y
  ret i8 %sub
}

define i16 @sub_i16(i16 %x, i16 %y) {
; LA32-LABEL: sub_i16:
; LA32:       # %bb.0:
; LA32-NEXT:    sub.w $a0, $a0, $a1
; LA32-NEXT:    jirl $zero, $ra, 0
;
; LA64-LABEL: sub_i16:
; LA64:       # %bb.0:
; LA64-NEXT:    sub.d $a0, $a0, $a1
; LA64-NEXT:    jirl $zero, $ra, 0
  %sub = sub i16 %x, %y
  ret i16 %sub
}

define i32 @sub_i32(i32 %x, i32 %y) {
; LA32-LABEL: sub_i32:
; LA32:       # %bb.0:
; LA32-NEXT:    sub.w $a0, $a0, $a1
; LA32-NEXT:    jirl $zero, $ra, 0
;
; LA64-LABEL: sub_i32:
; LA64:       # %bb.0:
; LA64-NEXT:    sub.d $a0, $a0, $a1
; LA64-NEXT:    jirl $zero, $ra, 0
  %sub = sub i32 %x, %y
  ret i32 %sub
}

;; Match the pattern:
;; def : PatGprGpr_32<sub, SUB_W>;
define signext i32 @sub_i32_sext(i32 %x, i32 %y) {
; LA32-LABEL: sub_i32_sext:
; LA32:       # %bb.0:
; LA32-NEXT:    sub.w $a0, $a0, $a1
; LA32-NEXT:    jirl $zero, $ra, 0
;
; LA64-LABEL: sub_i32_sext:
; LA64:       # %bb.0:
; LA64-NEXT:    sub.w $a0, $a0, $a1
; LA64-NEXT:    jirl $zero, $ra, 0
  %sub = sub i32 %x, %y
  ret i32 %sub
}

define i64 @sub_i64(i64 %x, i64 %y) {
; LA32-LABEL: sub_i64:
; LA32:       # %bb.0:
; LA32-NEXT:    sub.w $a1, $a1, $a3
; LA32-NEXT:    sltu $a3, $a0, $a2
; LA32-NEXT:    sub.w $a1, $a1, $a3
; LA32-NEXT:    sub.w $a0, $a0, $a2
; LA32-NEXT:    jirl $zero, $ra, 0
;
; LA64-LABEL: sub_i64:
; LA64:       # %bb.0:
; LA64-NEXT:    sub.d $a0, $a0, $a1
; LA64-NEXT:    jirl $zero, $ra, 0
  %sub = sub i64 %x, %y
  ret i64 %sub
}
