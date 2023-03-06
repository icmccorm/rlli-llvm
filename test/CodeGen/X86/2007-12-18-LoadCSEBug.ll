; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-- -mcpu=generic | FileCheck %s
; PR1872

	%struct.c34007g__designated___XUB = type { i32, i32, i32, i32 }
	%struct.c34007g__pkg__parent = type { ptr, ptr }

define void @_ada_c34007g() {
; CHECK-LABEL: _ada_c34007g:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    pushl %ebp
; CHECK-NEXT:    .cfi_def_cfa_offset 8
; CHECK-NEXT:    .cfi_offset %ebp, -8
; CHECK-NEXT:    movl %esp, %ebp
; CHECK-NEXT:    .cfi_def_cfa_register %ebp
; CHECK-NEXT:    andl $-8, %esp
; CHECK-NEXT:    subl $8, %esp
; CHECK-NEXT:    movl (%esp), %eax
; CHECK-NEXT:    testl %eax, %eax
; CHECK-NEXT:    je .LBB0_3
; CHECK-NEXT:  # %bb.1: # %entry
; CHECK-NEXT:    orl {{[0-9]+}}(%esp), %eax
; CHECK-NEXT:    jne .LBB0_3
; CHECK-NEXT:  # %bb.2: # %entry
; CHECK-NEXT:    movb $1, %al
; CHECK-NEXT:    testb %al, %al
; CHECK-NEXT:  .LBB0_3: # %bb5507
; CHECK-NEXT:    movl %ebp, %esp
; CHECK-NEXT:    popl %ebp
; CHECK-NEXT:    .cfi_def_cfa %esp, 4
; CHECK-NEXT:    retl
entry:
	%x8 = alloca %struct.c34007g__pkg__parent, align 8		; <ptr> [#uses=2]
	%tmp1272 = getelementptr %struct.c34007g__pkg__parent, ptr %x8, i32 0, i32 0		; <ptr> [#uses=1]
	br i1 true, label %bb4668, label %bb848

bb4668:		; preds = %bb4648
	%tmp5464 = load i64, ptr %x8, align 8		; <i64> [#uses=1]
	%tmp5467 = icmp ne i64 0, %tmp5464		; <i1> [#uses=1]
	%tmp5470 = load ptr, ptr %tmp1272, align 8		; <ptr> [#uses=1]
	%tmp5471 = icmp eq ptr %tmp5470, null		; <i1> [#uses=1]
	%tmp5475 = or i1 %tmp5471, %tmp5467		; <i1> [#uses=1]
	%tmp5497 = or i1 %tmp5475, false		; <i1> [#uses=1]
	br i1 %tmp5497, label %bb848, label %bb5507

bb848:		; preds = %entry
	ret void

bb5507:		; preds = %bb4668
	ret void
}
