; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --check-globals
; This test checks to make sure that constant exprs fold in some simple
; situations

; RUN: opt -S < %s | FileCheck %s
; RUN: llvm-as < %s | llvm-dis | FileCheck %s
; RUN: verify-uselistorder %s

@A = global i64 0

@add = global i64* inttoptr (i64 add (i64 ptrtoint (i64* @A to i64), i64 0) to i64*) ; X + 0 == X
@sub = global i64* inttoptr (i64 sub (i64 ptrtoint (i64* @A to i64), i64 0) to i64*) ; X - 0 == X
@mul = global i64* inttoptr (i64 mul (i64 ptrtoint (i64* @A to i64), i64 0) to i64*) ; X * 0 == 0
@and1 = global i64* inttoptr (i64 and (i64 ptrtoint (i64* @A to i64), i64 0) to i64*) ; X & 0 == 0
@and2 = global i64* inttoptr (i64 and (i64 ptrtoint (i64* @A to i64), i64 -1) to i64*) ; X & -1 == X
@or = global i64 or (i64 ptrtoint (i64* @A to i64), i64 -1)  ; X | -1 == -1
@xor = global i64* inttoptr (i64 xor (i64 ptrtoint (i64* @A to i64), i64 0) to i64*) ; X ^ 0 == X

%Ty = type { i32, i32 }
@B = external global %Ty

; @icmp_ult1 and @icmp_ult2 will be folded by the target-dependent constant folder instead.
@icmp_ult1 = global i1 icmp ult (i64* @A, i64* getelementptr (i64, i64* @A, i64 1))        ; true
@icmp_slt = global i1 icmp slt (i64* @A, i64* getelementptr (i64, i64* @A, i64 0))        ; false
@icmp_ult2 = global i1 icmp ult (i32* getelementptr (%Ty, %Ty* @B, i64 0, i32 0),
  i32* getelementptr (%Ty, %Ty* @B, i64 0, i32 1))            ; true
;global i1 icmp ne (i64* @A, i64* bitcast (%Ty* @B to i64*))                 ; true

; PR2206
@cons = weak global i32 0, align 8              ; <i32*> [#uses=1]
@and3 = global i64 and (i64 ptrtoint (i32* @cons to i64), i64 7)

@gep1 = global <2 x i8*> getelementptr(i8, <2 x i8*> undef, <2 x i64> <i64 1, i64 1>)
@gep2 = global <2 x i8*> getelementptr({ i8 }, <2 x { i8 }*> undef, <2 x i64> <i64 1, i64 1>, <2 x i32> <i32 0, i32 0>)
@gep3 = global <2 x i8*> getelementptr(i8, <2 x i8*> zeroinitializer, <2 x i64> <i64 0, i64 0>)
@gep4 = global <2 x i8*> getelementptr({ i8 }, <2 x { i8 }*> zeroinitializer, <2 x i64> <i64 0, i64 0>, <2 x i32> <i32 0, i32 0>)


; Need a function to make update_test_checks.py work.
;.
; CHECK: @[[A:[a-zA-Z0-9_$"\\.-]+]] = global i64 0
; CHECK: @[[ADD:[a-zA-Z0-9_$"\\.-]+]] = global i64* @A
; CHECK: @[[SUB:[a-zA-Z0-9_$"\\.-]+]] = global i64* @A
; CHECK: @[[MUL:[a-zA-Z0-9_$"\\.-]+]] = global i64* null
; CHECK: @[[AND1:[a-zA-Z0-9_$"\\.-]+]] = global i64* null
; CHECK: @[[AND2:[a-zA-Z0-9_$"\\.-]+]] = global i64* @A
; CHECK: @[[OR:[a-zA-Z0-9_$"\\.-]+]] = global i64 -1
; CHECK: @[[XOR:[a-zA-Z0-9_$"\\.-]+]] = global i64* @A
; CHECK: @[[B:[a-zA-Z0-9_$"\\.-]+]] = external global [[TY:%.*]]
; CHECK: @[[ICMP_ULT1:[a-zA-Z0-9_$"\\.-]+]] = global i1 icmp ugt (i64* getelementptr inbounds (i64, i64* @A, i64 1), i64* @A)
; CHECK: @[[ICMP_SLT:[a-zA-Z0-9_$"\\.-]+]] = global i1 false
; CHECK: @[[ICMP_ULT2:[a-zA-Z0-9_$"\\.-]+]] = global i1 icmp ult (i32* getelementptr inbounds ([[TY:%.*]], %Ty* @B, i64 0, i32 0), i32* getelementptr inbounds ([[TY]], %Ty* @B, i64 0, i32 1))
; CHECK: @[[CONS:[a-zA-Z0-9_$"\\.-]+]] = weak global i32 0, align 8
; CHECK: @[[AND3:[a-zA-Z0-9_$"\\.-]+]] = global i64 0
; CHECK: @[[GEP1:[a-zA-Z0-9_$"\\.-]+]] = global <2 x i8*> undef
; CHECK: @[[GEP2:[a-zA-Z0-9_$"\\.-]+]] = global <2 x i8*> undef
; CHECK: @[[GEP3:[a-zA-Z0-9_$"\\.-]+]] = global <2 x i8*> zeroinitializer
; CHECK: @[[GEP4:[a-zA-Z0-9_$"\\.-]+]] = global <2 x i8*> zeroinitializer
;.
define void @dummy() {
; CHECK-LABEL: @dummy(
; CHECK-NEXT:    ret void
;
  ret void
}
