; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-- -relocation-model=pic | FileCheck %s

@x = common global i16 0

define signext i16 @f() nounwind {
; CHECK-LABEL: f:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    pushq %rax
; CHECK-NEXT:    callq h@PLT
; CHECK-NEXT:    movswl %ax, %edi
; CHECK-NEXT:    callq g@PLT
; CHECK-NEXT:    movq x@GOTPCREL(%rip), %rax
; CHECK-NEXT:    movzwl (%rax), %eax
; CHECK-NEXT:    popq %rcx
; CHECK-NEXT:    retq
entry:
	%0 = tail call signext i16 @h() nounwind
	%1 = sext i16 %0 to i32
	tail call void @g(i32 %1) nounwind
	%2 = load i16, ptr @x, align 2
	ret i16 %2
}

declare signext i16 @h()

declare void @g(i32)
