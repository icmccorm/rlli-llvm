; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=arm64-apple-ios -relocation-model=pic -frame-pointer=all | FileCheck %s

@__stack_chk_guard = external global i64*

; PR20558

; Load the stack guard for the second time, just in case the previous value gets spilled.
define i32 @test_stack_guard_remat2() ssp {
; CHECK-LABEL: test_stack_guard_remat2:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    sub sp, sp, #64
; CHECK-NEXT:    .cfi_def_cfa_offset 64
; CHECK-NEXT:    stp x29, x30, [sp, #48] ; 16-byte Folded Spill
; CHECK-NEXT:    add x29, sp, #48
; CHECK-NEXT:    .cfi_def_cfa w29, 16
; CHECK-NEXT:    .cfi_offset w30, -8
; CHECK-NEXT:    .cfi_offset w29, -16
; CHECK-NEXT:  Lloh0:
; CHECK-NEXT:    adrp x8, ___stack_chk_guard@GOTPAGE
; CHECK-NEXT:  Lloh1:
; CHECK-NEXT:    adrp x9, ___stack_chk_guard@GOTPAGE
; CHECK-NEXT:  Lloh2:
; CHECK-NEXT:    ldr x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
; CHECK-NEXT:  Lloh3:
; CHECK-NEXT:    ldr x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
; CHECK-NEXT:  Lloh4:
; CHECK-NEXT:    ldr x8, [x8]
; CHECK-NEXT:  Lloh5:
; CHECK-NEXT:    ldr x9, [x9]
; CHECK-NEXT:    str x8, [sp]
; CHECK-NEXT:  Lloh6:
; CHECK-NEXT:    adrp x8, ___stack_chk_guard@GOTPAGE
; CHECK-NEXT:    stur x9, [x29, #-8]
; CHECK-NEXT:  Lloh7:
; CHECK-NEXT:    ldr x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
; CHECK-NEXT:    ldur x9, [x29, #-8]
; CHECK-NEXT:  Lloh8:
; CHECK-NEXT:    ldr x8, [x8]
; CHECK-NEXT:    cmp x8, x9
; CHECK-NEXT:    b.ne LBB0_2
; CHECK-NEXT:  ; %bb.1: ; %entry
; CHECK-NEXT:    ldp x29, x30, [sp, #48] ; 16-byte Folded Reload
; CHECK-NEXT:    mov w0, #-1
; CHECK-NEXT:    add sp, sp, #64
; CHECK-NEXT:    ret
; CHECK-NEXT:  LBB0_2: ; %entry
; CHECK-NEXT:    bl ___stack_chk_fail
; CHECK-NEXT:    .loh AdrpLdrGotLdr Lloh6, Lloh7, Lloh8
; CHECK-NEXT:    .loh AdrpLdrGotLdr Lloh1, Lloh3, Lloh5
; CHECK-NEXT:    .loh AdrpLdrGotLdr Lloh0, Lloh2, Lloh4
entry:
  %StackGuardSlot = alloca i8*
  %StackGuard = load i8*, i8** bitcast (i64** @__stack_chk_guard to i8**)
  call void @llvm.stackprotector(i8* %StackGuard, i8** %StackGuardSlot)
  %container = alloca [32 x i8], align 1
  call void @llvm.stackprotectorcheck(i8** bitcast (i64** @__stack_chk_guard to i8**))
  ret i32 -1
}

declare void @llvm.stackprotector(i8*, i8**) ssp
declare void @llvm.stackprotectorcheck(i8**) ssp
