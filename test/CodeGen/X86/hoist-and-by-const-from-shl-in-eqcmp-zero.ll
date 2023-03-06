; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=i686-unknown-linux-gnu -mattr=+sse,sse2                  < %s | FileCheck %s --check-prefixes=X86,X86-SSE2,X86-BMI1
; RUN: llc -mtriple=i686-unknown-linux-gnu -mattr=+sse,sse2,+bmi             < %s | FileCheck %s --check-prefixes=X86,X86-SSE2,X86-BMI1
; RUN: llc -mtriple=i686-unknown-linux-gnu -mattr=+sse,sse2,+bmi,+bmi2       < %s | FileCheck %s --check-prefixes=X86,X86-SSE2,X86-BMI2
; RUN: llc -mtriple=i686-unknown-linux-gnu -mattr=+sse,sse2,+bmi,+bmi2,+avx2 < %s | FileCheck %s --check-prefixes=X86,X86-BMI2,AVX2
; RUN: llc -mtriple=x86_64-unknown-linux-gnu -mattr=+sse,sse2                  < %s | FileCheck %s --check-prefixes=X64,X64-SSE2,X64-BMI1
; RUN: llc -mtriple=x86_64-unknown-linux-gnu -mattr=+sse,sse2,+bmi             < %s | FileCheck %s --check-prefixes=X64,X64-SSE2,X64-BMI1
; RUN: llc -mtriple=x86_64-unknown-linux-gnu -mattr=+sse,sse2,+bmi,+bmi2       < %s | FileCheck %s --check-prefixes=X64,X64-SSE2,X64-BMI2
; RUN: llc -mtriple=x86_64-unknown-linux-gnu -mattr=+sse,sse2,+bmi,+bmi2,+avx2 < %s | FileCheck %s --check-prefixes=X64,X64-BMI2,AVX2

; We are looking for the following pattern here:
;   (X & (C << Y)) ==/!= 0
; It may be optimal to hoist the constant:
;   ((X l>> Y) & C) ==/!= 0

;------------------------------------------------------------------------------;
; A few scalar test
;------------------------------------------------------------------------------;

; i8 scalar

define i1 @scalar_i8_signbit_eq(i8 %x, i8 %y) nounwind {
; X86-LABEL: scalar_i8_signbit_eq:
; X86:       # %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    shrb %cl, %al
; X86-NEXT:    testb $-128, %al
; X86-NEXT:    sete %al
; X86-NEXT:    retl
;
; X64-LABEL: scalar_i8_signbit_eq:
; X64:       # %bb.0:
; X64-NEXT:    movl %esi, %ecx
; X64-NEXT:    # kill: def $cl killed $cl killed $ecx
; X64-NEXT:    shrb %cl, %dil
; X64-NEXT:    testb $-128, %dil
; X64-NEXT:    sete %al
; X64-NEXT:    retq
  %t0 = shl i8 128, %y
  %t1 = and i8 %t0, %x
  %res = icmp eq i8 %t1, 0
  ret i1 %res
}

define i1 @scalar_i8_lowestbit_eq(i8 %x, i8 %y) nounwind {
; X86-LABEL: scalar_i8_lowestbit_eq:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; X86-NEXT:    btl %eax, %ecx
; X86-NEXT:    setae %al
; X86-NEXT:    retl
;
; X64-LABEL: scalar_i8_lowestbit_eq:
; X64:       # %bb.0:
; X64-NEXT:    btl %esi, %edi
; X64-NEXT:    setae %al
; X64-NEXT:    retq
  %t0 = shl i8 1, %y
  %t1 = and i8 %t0, %x
  %res = icmp eq i8 %t1, 0
  ret i1 %res
}

define i1 @scalar_i8_bitsinmiddle_eq(i8 %x, i8 %y) nounwind {
; X86-LABEL: scalar_i8_bitsinmiddle_eq:
; X86:       # %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    shrb %cl, %al
; X86-NEXT:    testb $24, %al
; X86-NEXT:    sete %al
; X86-NEXT:    retl
;
; X64-LABEL: scalar_i8_bitsinmiddle_eq:
; X64:       # %bb.0:
; X64-NEXT:    movl %esi, %ecx
; X64-NEXT:    # kill: def $cl killed $cl killed $ecx
; X64-NEXT:    shrb %cl, %dil
; X64-NEXT:    testb $24, %dil
; X64-NEXT:    sete %al
; X64-NEXT:    retq
  %t0 = shl i8 24, %y
  %t1 = and i8 %t0, %x
  %res = icmp eq i8 %t1, 0
  ret i1 %res
}

; i16 scalar

define i1 @scalar_i16_signbit_eq(i16 %x, i16 %y) nounwind {
; X86-BMI1-LABEL: scalar_i16_signbit_eq:
; X86-BMI1:       # %bb.0:
; X86-BMI1-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; X86-BMI1-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-BMI1-NEXT:    shrl %cl, %eax
; X86-BMI1-NEXT:    testl $32768, %eax # imm = 0x8000
; X86-BMI1-NEXT:    sete %al
; X86-BMI1-NEXT:    retl
;
; X86-BMI2-LABEL: scalar_i16_signbit_eq:
; X86-BMI2:       # %bb.0:
; X86-BMI2-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-BMI2-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; X86-BMI2-NEXT:    shrxl %ecx, %eax, %eax
; X86-BMI2-NEXT:    testl $32768, %eax # imm = 0x8000
; X86-BMI2-NEXT:    sete %al
; X86-BMI2-NEXT:    retl
;
; X64-BMI1-LABEL: scalar_i16_signbit_eq:
; X64-BMI1:       # %bb.0:
; X64-BMI1-NEXT:    movl %esi, %ecx
; X64-BMI1-NEXT:    movzwl %di, %eax
; X64-BMI1-NEXT:    # kill: def $cl killed $cl killed $ecx
; X64-BMI1-NEXT:    shrl %cl, %eax
; X64-BMI1-NEXT:    testl $32768, %eax # imm = 0x8000
; X64-BMI1-NEXT:    sete %al
; X64-BMI1-NEXT:    retq
;
; X64-BMI2-LABEL: scalar_i16_signbit_eq:
; X64-BMI2:       # %bb.0:
; X64-BMI2-NEXT:    movzwl %di, %eax
; X64-BMI2-NEXT:    shrxl %esi, %eax, %eax
; X64-BMI2-NEXT:    testl $32768, %eax # imm = 0x8000
; X64-BMI2-NEXT:    sete %al
; X64-BMI2-NEXT:    retq
  %t0 = shl i16 32768, %y
  %t1 = and i16 %t0, %x
  %res = icmp eq i16 %t1, 0
  ret i1 %res
}

define i1 @scalar_i16_lowestbit_eq(i16 %x, i16 %y) nounwind {
; X86-LABEL: scalar_i16_lowestbit_eq:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; X86-NEXT:    btl %eax, %ecx
; X86-NEXT:    setae %al
; X86-NEXT:    retl
;
; X64-LABEL: scalar_i16_lowestbit_eq:
; X64:       # %bb.0:
; X64-NEXT:    btl %esi, %edi
; X64-NEXT:    setae %al
; X64-NEXT:    retq
  %t0 = shl i16 1, %y
  %t1 = and i16 %t0, %x
  %res = icmp eq i16 %t1, 0
  ret i1 %res
}

define i1 @scalar_i16_bitsinmiddle_eq(i16 %x, i16 %y) nounwind {
; X86-BMI1-LABEL: scalar_i16_bitsinmiddle_eq:
; X86-BMI1:       # %bb.0:
; X86-BMI1-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; X86-BMI1-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-BMI1-NEXT:    shrl %cl, %eax
; X86-BMI1-NEXT:    testl $4080, %eax # imm = 0xFF0
; X86-BMI1-NEXT:    sete %al
; X86-BMI1-NEXT:    retl
;
; X86-BMI2-LABEL: scalar_i16_bitsinmiddle_eq:
; X86-BMI2:       # %bb.0:
; X86-BMI2-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-BMI2-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; X86-BMI2-NEXT:    shrxl %ecx, %eax, %eax
; X86-BMI2-NEXT:    testl $4080, %eax # imm = 0xFF0
; X86-BMI2-NEXT:    sete %al
; X86-BMI2-NEXT:    retl
;
; X64-BMI1-LABEL: scalar_i16_bitsinmiddle_eq:
; X64-BMI1:       # %bb.0:
; X64-BMI1-NEXT:    movl %esi, %ecx
; X64-BMI1-NEXT:    movzwl %di, %eax
; X64-BMI1-NEXT:    # kill: def $cl killed $cl killed $ecx
; X64-BMI1-NEXT:    shrl %cl, %eax
; X64-BMI1-NEXT:    testl $4080, %eax # imm = 0xFF0
; X64-BMI1-NEXT:    sete %al
; X64-BMI1-NEXT:    retq
;
; X64-BMI2-LABEL: scalar_i16_bitsinmiddle_eq:
; X64-BMI2:       # %bb.0:
; X64-BMI2-NEXT:    movzwl %di, %eax
; X64-BMI2-NEXT:    shrxl %esi, %eax, %eax
; X64-BMI2-NEXT:    testl $4080, %eax # imm = 0xFF0
; X64-BMI2-NEXT:    sete %al
; X64-BMI2-NEXT:    retq
  %t0 = shl i16 4080, %y
  %t1 = and i16 %t0, %x
  %res = icmp eq i16 %t1, 0
  ret i1 %res
}

; i32 scalar

define i1 @scalar_i32_signbit_eq(i32 %x, i32 %y) nounwind {
; X86-BMI1-LABEL: scalar_i32_signbit_eq:
; X86-BMI1:       # %bb.0:
; X86-BMI1-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; X86-BMI1-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-BMI1-NEXT:    shrl %cl, %eax
; X86-BMI1-NEXT:    testl $-2147483648, %eax # imm = 0x80000000
; X86-BMI1-NEXT:    sete %al
; X86-BMI1-NEXT:    retl
;
; X86-BMI2-LABEL: scalar_i32_signbit_eq:
; X86-BMI2:       # %bb.0:
; X86-BMI2-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-BMI2-NEXT:    shrxl %eax, {{[0-9]+}}(%esp), %eax
; X86-BMI2-NEXT:    testl $-2147483648, %eax # imm = 0x80000000
; X86-BMI2-NEXT:    sete %al
; X86-BMI2-NEXT:    retl
;
; X64-BMI1-LABEL: scalar_i32_signbit_eq:
; X64-BMI1:       # %bb.0:
; X64-BMI1-NEXT:    movl %esi, %ecx
; X64-BMI1-NEXT:    # kill: def $cl killed $cl killed $ecx
; X64-BMI1-NEXT:    shrl %cl, %edi
; X64-BMI1-NEXT:    testl $-2147483648, %edi # imm = 0x80000000
; X64-BMI1-NEXT:    sete %al
; X64-BMI1-NEXT:    retq
;
; X64-BMI2-LABEL: scalar_i32_signbit_eq:
; X64-BMI2:       # %bb.0:
; X64-BMI2-NEXT:    shrxl %esi, %edi, %eax
; X64-BMI2-NEXT:    testl $-2147483648, %eax # imm = 0x80000000
; X64-BMI2-NEXT:    sete %al
; X64-BMI2-NEXT:    retq
  %t0 = shl i32 2147483648, %y
  %t1 = and i32 %t0, %x
  %res = icmp eq i32 %t1, 0
  ret i1 %res
}

define i1 @scalar_i32_lowestbit_eq(i32 %x, i32 %y) nounwind {
; X86-LABEL: scalar_i32_lowestbit_eq:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; X86-NEXT:    btl %ecx, %eax
; X86-NEXT:    setae %al
; X86-NEXT:    retl
;
; X64-LABEL: scalar_i32_lowestbit_eq:
; X64:       # %bb.0:
; X64-NEXT:    btl %esi, %edi
; X64-NEXT:    setae %al
; X64-NEXT:    retq
  %t0 = shl i32 1, %y
  %t1 = and i32 %t0, %x
  %res = icmp eq i32 %t1, 0
  ret i1 %res
}

define i1 @scalar_i32_bitsinmiddle_eq(i32 %x, i32 %y) nounwind {
; X86-BMI1-LABEL: scalar_i32_bitsinmiddle_eq:
; X86-BMI1:       # %bb.0:
; X86-BMI1-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; X86-BMI1-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-BMI1-NEXT:    shrl %cl, %eax
; X86-BMI1-NEXT:    testl $16776960, %eax # imm = 0xFFFF00
; X86-BMI1-NEXT:    sete %al
; X86-BMI1-NEXT:    retl
;
; X86-BMI2-LABEL: scalar_i32_bitsinmiddle_eq:
; X86-BMI2:       # %bb.0:
; X86-BMI2-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-BMI2-NEXT:    shrxl %eax, {{[0-9]+}}(%esp), %eax
; X86-BMI2-NEXT:    testl $16776960, %eax # imm = 0xFFFF00
; X86-BMI2-NEXT:    sete %al
; X86-BMI2-NEXT:    retl
;
; X64-BMI1-LABEL: scalar_i32_bitsinmiddle_eq:
; X64-BMI1:       # %bb.0:
; X64-BMI1-NEXT:    movl %esi, %ecx
; X64-BMI1-NEXT:    # kill: def $cl killed $cl killed $ecx
; X64-BMI1-NEXT:    shrl %cl, %edi
; X64-BMI1-NEXT:    testl $16776960, %edi # imm = 0xFFFF00
; X64-BMI1-NEXT:    sete %al
; X64-BMI1-NEXT:    retq
;
; X64-BMI2-LABEL: scalar_i32_bitsinmiddle_eq:
; X64-BMI2:       # %bb.0:
; X64-BMI2-NEXT:    shrxl %esi, %edi, %eax
; X64-BMI2-NEXT:    testl $16776960, %eax # imm = 0xFFFF00
; X64-BMI2-NEXT:    sete %al
; X64-BMI2-NEXT:    retq
  %t0 = shl i32 16776960, %y
  %t1 = and i32 %t0, %x
  %res = icmp eq i32 %t1, 0
  ret i1 %res
}

; i64 scalar

define i1 @scalar_i64_signbit_eq(i64 %x, i64 %y) nounwind {
; X86-BMI1-LABEL: scalar_i64_signbit_eq:
; X86-BMI1:       # %bb.0:
; X86-BMI1-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; X86-BMI1-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-BMI1-NEXT:    shrl %cl, %eax
; X86-BMI1-NEXT:    xorl %edx, %edx
; X86-BMI1-NEXT:    testb $32, %cl
; X86-BMI1-NEXT:    cmovel %eax, %edx
; X86-BMI1-NEXT:    testl $-2147483648, %edx # imm = 0x80000000
; X86-BMI1-NEXT:    sete %al
; X86-BMI1-NEXT:    retl
;
; X86-BMI2-LABEL: scalar_i64_signbit_eq:
; X86-BMI2:       # %bb.0:
; X86-BMI2-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-BMI2-NEXT:    shrxl %eax, {{[0-9]+}}(%esp), %ecx
; X86-BMI2-NEXT:    xorl %edx, %edx
; X86-BMI2-NEXT:    testb $32, %al
; X86-BMI2-NEXT:    cmovel %ecx, %edx
; X86-BMI2-NEXT:    testl $-2147483648, %edx # imm = 0x80000000
; X86-BMI2-NEXT:    sete %al
; X86-BMI2-NEXT:    retl
;
; X64-BMI1-LABEL: scalar_i64_signbit_eq:
; X64-BMI1:       # %bb.0:
; X64-BMI1-NEXT:    movq %rsi, %rcx
; X64-BMI1-NEXT:    # kill: def $cl killed $cl killed $rcx
; X64-BMI1-NEXT:    shrq %cl, %rdi
; X64-BMI1-NEXT:    btq $63, %rdi
; X64-BMI1-NEXT:    setae %al
; X64-BMI1-NEXT:    retq
;
; X64-BMI2-LABEL: scalar_i64_signbit_eq:
; X64-BMI2:       # %bb.0:
; X64-BMI2-NEXT:    shrxq %rsi, %rdi, %rax
; X64-BMI2-NEXT:    btq $63, %rax
; X64-BMI2-NEXT:    setae %al
; X64-BMI2-NEXT:    retq
  %t0 = shl i64 9223372036854775808, %y
  %t1 = and i64 %t0, %x
  %res = icmp eq i64 %t1, 0
  ret i1 %res
}

define i1 @scalar_i64_lowestbit_eq(i64 %x, i64 %y) nounwind {
; X86-BMI1-LABEL: scalar_i64_lowestbit_eq:
; X86-BMI1:       # %bb.0:
; X86-BMI1-NEXT:    pushl %esi
; X86-BMI1-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; X86-BMI1-NEXT:    movl $1, %eax
; X86-BMI1-NEXT:    xorl %esi, %esi
; X86-BMI1-NEXT:    xorl %edx, %edx
; X86-BMI1-NEXT:    shldl %cl, %eax, %edx
; X86-BMI1-NEXT:    shll %cl, %eax
; X86-BMI1-NEXT:    testb $32, %cl
; X86-BMI1-NEXT:    cmovnel %eax, %edx
; X86-BMI1-NEXT:    cmovnel %esi, %eax
; X86-BMI1-NEXT:    andl {{[0-9]+}}(%esp), %edx
; X86-BMI1-NEXT:    andl {{[0-9]+}}(%esp), %eax
; X86-BMI1-NEXT:    orl %edx, %eax
; X86-BMI1-NEXT:    sete %al
; X86-BMI1-NEXT:    popl %esi
; X86-BMI1-NEXT:    retl
;
; X86-BMI2-LABEL: scalar_i64_lowestbit_eq:
; X86-BMI2:       # %bb.0:
; X86-BMI2-NEXT:    pushl %esi
; X86-BMI2-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; X86-BMI2-NEXT:    movl $1, %eax
; X86-BMI2-NEXT:    xorl %edx, %edx
; X86-BMI2-NEXT:    xorl %esi, %esi
; X86-BMI2-NEXT:    shldl %cl, %eax, %esi
; X86-BMI2-NEXT:    shlxl %ecx, %eax, %eax
; X86-BMI2-NEXT:    testb $32, %cl
; X86-BMI2-NEXT:    cmovnel %eax, %esi
; X86-BMI2-NEXT:    cmovnel %edx, %eax
; X86-BMI2-NEXT:    andl {{[0-9]+}}(%esp), %esi
; X86-BMI2-NEXT:    andl {{[0-9]+}}(%esp), %eax
; X86-BMI2-NEXT:    orl %esi, %eax
; X86-BMI2-NEXT:    sete %al
; X86-BMI2-NEXT:    popl %esi
; X86-BMI2-NEXT:    retl
;
; X64-LABEL: scalar_i64_lowestbit_eq:
; X64:       # %bb.0:
; X64-NEXT:    btq %rsi, %rdi
; X64-NEXT:    setae %al
; X64-NEXT:    retq
  %t0 = shl i64 1, %y
  %t1 = and i64 %t0, %x
  %res = icmp eq i64 %t1, 0
  ret i1 %res
}

define i1 @scalar_i64_bitsinmiddle_eq(i64 %x, i64 %y) nounwind {
; X86-BMI1-LABEL: scalar_i64_bitsinmiddle_eq:
; X86-BMI1:       # %bb.0:
; X86-BMI1-NEXT:    pushl %esi
; X86-BMI1-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; X86-BMI1-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-BMI1-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-BMI1-NEXT:    movl %edx, %esi
; X86-BMI1-NEXT:    shrl %cl, %esi
; X86-BMI1-NEXT:    shrdl %cl, %edx, %eax
; X86-BMI1-NEXT:    xorl %edx, %edx
; X86-BMI1-NEXT:    testb $32, %cl
; X86-BMI1-NEXT:    cmovnel %esi, %eax
; X86-BMI1-NEXT:    cmovel %esi, %edx
; X86-BMI1-NEXT:    andl $-65536, %eax # imm = 0xFFFF0000
; X86-BMI1-NEXT:    movzwl %dx, %ecx
; X86-BMI1-NEXT:    orl %eax, %ecx
; X86-BMI1-NEXT:    sete %al
; X86-BMI1-NEXT:    popl %esi
; X86-BMI1-NEXT:    retl
;
; X86-BMI2-LABEL: scalar_i64_bitsinmiddle_eq:
; X86-BMI2:       # %bb.0:
; X86-BMI2-NEXT:    pushl %esi
; X86-BMI2-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; X86-BMI2-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-BMI2-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-BMI2-NEXT:    shrdl %cl, %edx, %eax
; X86-BMI2-NEXT:    shrxl %ecx, %edx, %edx
; X86-BMI2-NEXT:    xorl %esi, %esi
; X86-BMI2-NEXT:    testb $32, %cl
; X86-BMI2-NEXT:    cmovnel %edx, %eax
; X86-BMI2-NEXT:    cmovel %edx, %esi
; X86-BMI2-NEXT:    andl $-65536, %eax # imm = 0xFFFF0000
; X86-BMI2-NEXT:    movzwl %si, %ecx
; X86-BMI2-NEXT:    orl %eax, %ecx
; X86-BMI2-NEXT:    sete %al
; X86-BMI2-NEXT:    popl %esi
; X86-BMI2-NEXT:    retl
;
; X64-BMI1-LABEL: scalar_i64_bitsinmiddle_eq:
; X64-BMI1:       # %bb.0:
; X64-BMI1-NEXT:    movq %rsi, %rcx
; X64-BMI1-NEXT:    # kill: def $cl killed $cl killed $rcx
; X64-BMI1-NEXT:    shrq %cl, %rdi
; X64-BMI1-NEXT:    shrq $16, %rdi
; X64-BMI1-NEXT:    testl %edi, %edi
; X64-BMI1-NEXT:    sete %al
; X64-BMI1-NEXT:    retq
;
; X64-BMI2-LABEL: scalar_i64_bitsinmiddle_eq:
; X64-BMI2:       # %bb.0:
; X64-BMI2-NEXT:    shrxq %rsi, %rdi, %rax
; X64-BMI2-NEXT:    shrq $16, %rax
; X64-BMI2-NEXT:    testl %eax, %eax
; X64-BMI2-NEXT:    sete %al
; X64-BMI2-NEXT:    retq
  %t0 = shl i64 281474976645120, %y
  %t1 = and i64 %t0, %x
  %res = icmp eq i64 %t1, 0
  ret i1 %res
}

;------------------------------------------------------------------------------;
; A few trivial vector tests
;------------------------------------------------------------------------------;

define <4 x i1> @vec_4xi32_splat_eq(<4 x i32> %x, <4 x i32> %y) nounwind {
; X86-SSE2-LABEL: vec_4xi32_splat_eq:
; X86-SSE2:       # %bb.0:
; X86-SSE2-NEXT:    pslld $23, %xmm1
; X86-SSE2-NEXT:    paddd {{\.?LCPI[0-9]+_[0-9]+}}, %xmm1
; X86-SSE2-NEXT:    cvttps2dq %xmm1, %xmm1
; X86-SSE2-NEXT:    movdqa {{.*#+}} xmm2 = [1,1,1,1]
; X86-SSE2-NEXT:    pshufd {{.*#+}} xmm3 = xmm1[1,1,3,3]
; X86-SSE2-NEXT:    pmuludq %xmm2, %xmm1
; X86-SSE2-NEXT:    pshufd {{.*#+}} xmm1 = xmm1[0,2,2,3]
; X86-SSE2-NEXT:    pmuludq %xmm2, %xmm3
; X86-SSE2-NEXT:    pshufd {{.*#+}} xmm2 = xmm3[0,2,2,3]
; X86-SSE2-NEXT:    punpckldq {{.*#+}} xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
; X86-SSE2-NEXT:    pand %xmm1, %xmm0
; X86-SSE2-NEXT:    pxor %xmm1, %xmm1
; X86-SSE2-NEXT:    pcmpeqd %xmm1, %xmm0
; X86-SSE2-NEXT:    retl
;
; AVX2-LABEL: vec_4xi32_splat_eq:
; AVX2:       # %bb.0:
; AVX2-NEXT:    vpbroadcastd {{.*#+}} xmm2 = [1,1,1,1]
; AVX2-NEXT:    vpxor %xmm3, %xmm3, %xmm3
; AVX2-NEXT:    vpsrlvd %xmm1, %xmm0, %xmm0
; AVX2-NEXT:    vpand %xmm2, %xmm0, %xmm0
; AVX2-NEXT:    vpcmpeqd %xmm3, %xmm0, %xmm0
; AVX2-NEXT:    ret{{[l|q]}}
;
; X64-SSE2-LABEL: vec_4xi32_splat_eq:
; X64-SSE2:       # %bb.0:
; X64-SSE2-NEXT:    pslld $23, %xmm1
; X64-SSE2-NEXT:    paddd {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm1
; X64-SSE2-NEXT:    cvttps2dq %xmm1, %xmm1
; X64-SSE2-NEXT:    movdqa {{.*#+}} xmm2 = [1,1,1,1]
; X64-SSE2-NEXT:    pshufd {{.*#+}} xmm3 = xmm1[1,1,3,3]
; X64-SSE2-NEXT:    pmuludq %xmm2, %xmm1
; X64-SSE2-NEXT:    pshufd {{.*#+}} xmm1 = xmm1[0,2,2,3]
; X64-SSE2-NEXT:    pmuludq %xmm2, %xmm3
; X64-SSE2-NEXT:    pshufd {{.*#+}} xmm2 = xmm3[0,2,2,3]
; X64-SSE2-NEXT:    punpckldq {{.*#+}} xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
; X64-SSE2-NEXT:    pand %xmm1, %xmm0
; X64-SSE2-NEXT:    pxor %xmm1, %xmm1
; X64-SSE2-NEXT:    pcmpeqd %xmm1, %xmm0
; X64-SSE2-NEXT:    retq
  %t0 = shl <4 x i32> <i32 1, i32 1, i32 1, i32 1>, %y
  %t1 = and <4 x i32> %t0, %x
  %res = icmp eq <4 x i32> %t1, <i32 0, i32 0, i32 0, i32 0>
  ret <4 x i1> %res
}

define <4 x i1> @vec_4xi32_nonsplat_eq(<4 x i32> %x, <4 x i32> %y) nounwind {
; X86-SSE2-LABEL: vec_4xi32_nonsplat_eq:
; X86-SSE2:       # %bb.0:
; X86-SSE2-NEXT:    pslld $23, %xmm1
; X86-SSE2-NEXT:    paddd {{\.?LCPI[0-9]+_[0-9]+}}, %xmm1
; X86-SSE2-NEXT:    cvttps2dq %xmm1, %xmm1
; X86-SSE2-NEXT:    pshufd {{.*#+}} xmm2 = xmm1[1,1,3,3]
; X86-SSE2-NEXT:    pmuludq {{\.?LCPI[0-9]+_[0-9]+}}, %xmm1
; X86-SSE2-NEXT:    pshufd {{.*#+}} xmm1 = xmm1[0,2,2,3]
; X86-SSE2-NEXT:    pmuludq {{\.?LCPI[0-9]+_[0-9]+}}, %xmm2
; X86-SSE2-NEXT:    pshufd {{.*#+}} xmm2 = xmm2[0,2,2,3]
; X86-SSE2-NEXT:    punpckldq {{.*#+}} xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
; X86-SSE2-NEXT:    pand %xmm1, %xmm0
; X86-SSE2-NEXT:    pxor %xmm1, %xmm1
; X86-SSE2-NEXT:    pcmpeqd %xmm1, %xmm0
; X86-SSE2-NEXT:    retl
;
; AVX2-LABEL: vec_4xi32_nonsplat_eq:
; AVX2:       # %bb.0:
; AVX2-NEXT:    vmovdqa {{.*#+}} xmm2 = [0,1,16776960,2147483648]
; AVX2-NEXT:    vpsllvd %xmm1, %xmm2, %xmm1
; AVX2-NEXT:    vpand %xmm0, %xmm1, %xmm0
; AVX2-NEXT:    vpxor %xmm1, %xmm1, %xmm1
; AVX2-NEXT:    vpcmpeqd %xmm1, %xmm0, %xmm0
; AVX2-NEXT:    ret{{[l|q]}}
;
; X64-SSE2-LABEL: vec_4xi32_nonsplat_eq:
; X64-SSE2:       # %bb.0:
; X64-SSE2-NEXT:    pslld $23, %xmm1
; X64-SSE2-NEXT:    paddd {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm1
; X64-SSE2-NEXT:    cvttps2dq %xmm1, %xmm1
; X64-SSE2-NEXT:    pshufd {{.*#+}} xmm2 = xmm1[1,1,3,3]
; X64-SSE2-NEXT:    pmuludq {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm1
; X64-SSE2-NEXT:    pshufd {{.*#+}} xmm1 = xmm1[0,2,2,3]
; X64-SSE2-NEXT:    pmuludq {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm2
; X64-SSE2-NEXT:    pshufd {{.*#+}} xmm2 = xmm2[0,2,2,3]
; X64-SSE2-NEXT:    punpckldq {{.*#+}} xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
; X64-SSE2-NEXT:    pand %xmm1, %xmm0
; X64-SSE2-NEXT:    pxor %xmm1, %xmm1
; X64-SSE2-NEXT:    pcmpeqd %xmm1, %xmm0
; X64-SSE2-NEXT:    retq
  %t0 = shl <4 x i32> <i32 0, i32 1, i32 16776960, i32 2147483648>, %y
  %t1 = and <4 x i32> %t0, %x
  %res = icmp eq <4 x i32> %t1, <i32 0, i32 0, i32 0, i32 0>
  ret <4 x i1> %res
}

define <4 x i1> @vec_4xi32_nonsplat_undef0_eq(<4 x i32> %x, <4 x i32> %y) nounwind {
; X86-SSE2-LABEL: vec_4xi32_nonsplat_undef0_eq:
; X86-SSE2:       # %bb.0:
; X86-SSE2-NEXT:    movl $1, %eax
; X86-SSE2-NEXT:    movd %eax, %xmm2
; X86-SSE2-NEXT:    pslld $23, %xmm1
; X86-SSE2-NEXT:    paddd {{\.?LCPI[0-9]+_[0-9]+}}, %xmm1
; X86-SSE2-NEXT:    cvttps2dq %xmm1, %xmm1
; X86-SSE2-NEXT:    pmuludq %xmm1, %xmm2
; X86-SSE2-NEXT:    pshufd {{.*#+}} xmm2 = xmm2[0,2,2,3]
; X86-SSE2-NEXT:    pshufd {{.*#+}} xmm1 = xmm1[1,1,3,3]
; X86-SSE2-NEXT:    pmuludq {{\.?LCPI[0-9]+_[0-9]+}}, %xmm1
; X86-SSE2-NEXT:    pshufd {{.*#+}} xmm1 = xmm1[0,2,2,3]
; X86-SSE2-NEXT:    punpckldq {{.*#+}} xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
; X86-SSE2-NEXT:    pand %xmm2, %xmm0
; X86-SSE2-NEXT:    pxor %xmm1, %xmm1
; X86-SSE2-NEXT:    pcmpeqd %xmm1, %xmm0
; X86-SSE2-NEXT:    retl
;
; AVX2-LABEL: vec_4xi32_nonsplat_undef0_eq:
; AVX2:       # %bb.0:
; AVX2-NEXT:    vpbroadcastd {{.*#+}} xmm2 = [1,1,1,1]
; AVX2-NEXT:    vpxor %xmm3, %xmm3, %xmm3
; AVX2-NEXT:    vpsrlvd %xmm1, %xmm0, %xmm0
; AVX2-NEXT:    vpand %xmm2, %xmm0, %xmm0
; AVX2-NEXT:    vpcmpeqd %xmm3, %xmm0, %xmm0
; AVX2-NEXT:    ret{{[l|q]}}
;
; X64-SSE2-LABEL: vec_4xi32_nonsplat_undef0_eq:
; X64-SSE2:       # %bb.0:
; X64-SSE2-NEXT:    movl $1, %eax
; X64-SSE2-NEXT:    movd %eax, %xmm2
; X64-SSE2-NEXT:    pslld $23, %xmm1
; X64-SSE2-NEXT:    paddd {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm1
; X64-SSE2-NEXT:    cvttps2dq %xmm1, %xmm1
; X64-SSE2-NEXT:    pmuludq %xmm1, %xmm2
; X64-SSE2-NEXT:    pshufd {{.*#+}} xmm2 = xmm2[0,2,2,3]
; X64-SSE2-NEXT:    pshufd {{.*#+}} xmm1 = xmm1[1,1,3,3]
; X64-SSE2-NEXT:    pmuludq {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm1
; X64-SSE2-NEXT:    pshufd {{.*#+}} xmm1 = xmm1[0,2,2,3]
; X64-SSE2-NEXT:    punpckldq {{.*#+}} xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
; X64-SSE2-NEXT:    pand %xmm2, %xmm0
; X64-SSE2-NEXT:    pxor %xmm1, %xmm1
; X64-SSE2-NEXT:    pcmpeqd %xmm1, %xmm0
; X64-SSE2-NEXT:    retq
  %t0 = shl <4 x i32> <i32 1, i32 1, i32 undef, i32 1>, %y
  %t1 = and <4 x i32> %t0, %x
  %res = icmp eq <4 x i32> %t1, <i32 0, i32 0, i32 0, i32 0>
  ret <4 x i1> %res
}
define <4 x i1> @vec_4xi32_nonsplat_undef1_eq(<4 x i32> %x, <4 x i32> %y) nounwind {
; X86-SSE2-LABEL: vec_4xi32_nonsplat_undef1_eq:
; X86-SSE2:       # %bb.0:
; X86-SSE2-NEXT:    pslld $23, %xmm1
; X86-SSE2-NEXT:    paddd {{\.?LCPI[0-9]+_[0-9]+}}, %xmm1
; X86-SSE2-NEXT:    cvttps2dq %xmm1, %xmm1
; X86-SSE2-NEXT:    movdqa {{.*#+}} xmm2 = [1,1,1,1]
; X86-SSE2-NEXT:    pshufd {{.*#+}} xmm3 = xmm1[1,1,3,3]
; X86-SSE2-NEXT:    pmuludq %xmm2, %xmm1
; X86-SSE2-NEXT:    pshufd {{.*#+}} xmm1 = xmm1[0,2,2,3]
; X86-SSE2-NEXT:    pmuludq %xmm2, %xmm3
; X86-SSE2-NEXT:    pshufd {{.*#+}} xmm2 = xmm3[0,2,2,3]
; X86-SSE2-NEXT:    punpckldq {{.*#+}} xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
; X86-SSE2-NEXT:    pand %xmm1, %xmm0
; X86-SSE2-NEXT:    pxor %xmm1, %xmm1
; X86-SSE2-NEXT:    pcmpeqd %xmm1, %xmm0
; X86-SSE2-NEXT:    retl
;
; AVX2-LABEL: vec_4xi32_nonsplat_undef1_eq:
; AVX2:       # %bb.0:
; AVX2-NEXT:    vpbroadcastd {{.*#+}} xmm2 = [1,1,1,1]
; AVX2-NEXT:    vpsllvd %xmm1, %xmm2, %xmm1
; AVX2-NEXT:    vpand %xmm0, %xmm1, %xmm0
; AVX2-NEXT:    vpxor %xmm1, %xmm1, %xmm1
; AVX2-NEXT:    vpcmpeqd %xmm1, %xmm0, %xmm0
; AVX2-NEXT:    ret{{[l|q]}}
;
; X64-SSE2-LABEL: vec_4xi32_nonsplat_undef1_eq:
; X64-SSE2:       # %bb.0:
; X64-SSE2-NEXT:    pslld $23, %xmm1
; X64-SSE2-NEXT:    paddd {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm1
; X64-SSE2-NEXT:    cvttps2dq %xmm1, %xmm1
; X64-SSE2-NEXT:    movdqa {{.*#+}} xmm2 = [1,1,1,1]
; X64-SSE2-NEXT:    pshufd {{.*#+}} xmm3 = xmm1[1,1,3,3]
; X64-SSE2-NEXT:    pmuludq %xmm2, %xmm1
; X64-SSE2-NEXT:    pshufd {{.*#+}} xmm1 = xmm1[0,2,2,3]
; X64-SSE2-NEXT:    pmuludq %xmm2, %xmm3
; X64-SSE2-NEXT:    pshufd {{.*#+}} xmm2 = xmm3[0,2,2,3]
; X64-SSE2-NEXT:    punpckldq {{.*#+}} xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
; X64-SSE2-NEXT:    pand %xmm1, %xmm0
; X64-SSE2-NEXT:    pxor %xmm1, %xmm1
; X64-SSE2-NEXT:    pcmpeqd %xmm1, %xmm0
; X64-SSE2-NEXT:    retq
  %t0 = shl <4 x i32> <i32 1, i32 1, i32 1, i32 1>, %y
  %t1 = and <4 x i32> %t0, %x
  %res = icmp eq <4 x i32> %t1, <i32 0, i32 0, i32 undef, i32 0>
  ret <4 x i1> %res
}
define <4 x i1> @vec_4xi32_nonsplat_undef2_eq(<4 x i32> %x, <4 x i32> %y) nounwind {
; X86-SSE2-LABEL: vec_4xi32_nonsplat_undef2_eq:
; X86-SSE2:       # %bb.0:
; X86-SSE2-NEXT:    movl $1, %eax
; X86-SSE2-NEXT:    movd %eax, %xmm2
; X86-SSE2-NEXT:    pslld $23, %xmm1
; X86-SSE2-NEXT:    paddd {{\.?LCPI[0-9]+_[0-9]+}}, %xmm1
; X86-SSE2-NEXT:    cvttps2dq %xmm1, %xmm1
; X86-SSE2-NEXT:    pmuludq %xmm1, %xmm2
; X86-SSE2-NEXT:    pshufd {{.*#+}} xmm2 = xmm2[0,2,2,3]
; X86-SSE2-NEXT:    pshufd {{.*#+}} xmm1 = xmm1[1,1,3,3]
; X86-SSE2-NEXT:    pmuludq {{\.?LCPI[0-9]+_[0-9]+}}, %xmm1
; X86-SSE2-NEXT:    pshufd {{.*#+}} xmm1 = xmm1[0,2,2,3]
; X86-SSE2-NEXT:    punpckldq {{.*#+}} xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
; X86-SSE2-NEXT:    pand %xmm2, %xmm0
; X86-SSE2-NEXT:    pxor %xmm1, %xmm1
; X86-SSE2-NEXT:    pcmpeqd %xmm1, %xmm0
; X86-SSE2-NEXT:    retl
;
; AVX2-LABEL: vec_4xi32_nonsplat_undef2_eq:
; AVX2:       # %bb.0:
; AVX2-NEXT:    vpbroadcastd {{.*#+}} xmm2 = [1,1,1,1]
; AVX2-NEXT:    vpsllvd %xmm1, %xmm2, %xmm1
; AVX2-NEXT:    vpand %xmm0, %xmm1, %xmm0
; AVX2-NEXT:    vpxor %xmm1, %xmm1, %xmm1
; AVX2-NEXT:    vpcmpeqd %xmm1, %xmm0, %xmm0
; AVX2-NEXT:    ret{{[l|q]}}
;
; X64-SSE2-LABEL: vec_4xi32_nonsplat_undef2_eq:
; X64-SSE2:       # %bb.0:
; X64-SSE2-NEXT:    movl $1, %eax
; X64-SSE2-NEXT:    movd %eax, %xmm2
; X64-SSE2-NEXT:    pslld $23, %xmm1
; X64-SSE2-NEXT:    paddd {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm1
; X64-SSE2-NEXT:    cvttps2dq %xmm1, %xmm1
; X64-SSE2-NEXT:    pmuludq %xmm1, %xmm2
; X64-SSE2-NEXT:    pshufd {{.*#+}} xmm2 = xmm2[0,2,2,3]
; X64-SSE2-NEXT:    pshufd {{.*#+}} xmm1 = xmm1[1,1,3,3]
; X64-SSE2-NEXT:    pmuludq {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm1
; X64-SSE2-NEXT:    pshufd {{.*#+}} xmm1 = xmm1[0,2,2,3]
; X64-SSE2-NEXT:    punpckldq {{.*#+}} xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
; X64-SSE2-NEXT:    pand %xmm2, %xmm0
; X64-SSE2-NEXT:    pxor %xmm1, %xmm1
; X64-SSE2-NEXT:    pcmpeqd %xmm1, %xmm0
; X64-SSE2-NEXT:    retq
  %t0 = shl <4 x i32> <i32 1, i32 1, i32 undef, i32 1>, %y
  %t1 = and <4 x i32> %t0, %x
  %res = icmp eq <4 x i32> %t1, <i32 0, i32 0, i32 undef, i32 0>
  ret <4 x i1> %res
}

;------------------------------------------------------------------------------;
; A special tests
;------------------------------------------------------------------------------;

define i1 @scalar_i8_signbit_ne(i8 %x, i8 %y) nounwind {
; X86-LABEL: scalar_i8_signbit_ne:
; X86:       # %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    shrb %cl, %al
; X86-NEXT:    shrb $7, %al
; X86-NEXT:    retl
;
; X64-LABEL: scalar_i8_signbit_ne:
; X64:       # %bb.0:
; X64-NEXT:    movl %esi, %ecx
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    # kill: def $cl killed $cl killed $ecx
; X64-NEXT:    shrb %cl, %al
; X64-NEXT:    shrb $7, %al
; X64-NEXT:    # kill: def $al killed $al killed $eax
; X64-NEXT:    retq
  %t0 = shl i8 128, %y
  %t1 = and i8 %t0, %x
  %res = icmp ne i8 %t1, 0 ;  we are perfectly happy with 'ne' predicate
  ret i1 %res
}

;------------------------------------------------------------------------------;
; What if X is a constant too?
;------------------------------------------------------------------------------;

define i1 @scalar_i32_x_is_const_eq(i32 %y) nounwind {
; X86-BMI1-LABEL: scalar_i32_x_is_const_eq:
; X86-BMI1:       # %bb.0:
; X86-BMI1-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; X86-BMI1-NEXT:    movl $-1437226411, %eax # imm = 0xAA55AA55
; X86-BMI1-NEXT:    shll %cl, %eax
; X86-BMI1-NEXT:    testb $1, %al
; X86-BMI1-NEXT:    sete %al
; X86-BMI1-NEXT:    retl
;
; X86-BMI2-LABEL: scalar_i32_x_is_const_eq:
; X86-BMI2:       # %bb.0:
; X86-BMI2-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-BMI2-NEXT:    movl $-1437226411, %ecx # imm = 0xAA55AA55
; X86-BMI2-NEXT:    shlxl %eax, %ecx, %eax
; X86-BMI2-NEXT:    testb $1, %al
; X86-BMI2-NEXT:    sete %al
; X86-BMI2-NEXT:    retl
;
; X64-BMI1-LABEL: scalar_i32_x_is_const_eq:
; X64-BMI1:       # %bb.0:
; X64-BMI1-NEXT:    movl %edi, %ecx
; X64-BMI1-NEXT:    movl $-1437226411, %eax # imm = 0xAA55AA55
; X64-BMI1-NEXT:    # kill: def $cl killed $cl killed $ecx
; X64-BMI1-NEXT:    shll %cl, %eax
; X64-BMI1-NEXT:    testb $1, %al
; X64-BMI1-NEXT:    sete %al
; X64-BMI1-NEXT:    retq
;
; X64-BMI2-LABEL: scalar_i32_x_is_const_eq:
; X64-BMI2:       # %bb.0:
; X64-BMI2-NEXT:    movl $-1437226411, %eax # imm = 0xAA55AA55
; X64-BMI2-NEXT:    shlxl %edi, %eax, %eax
; X64-BMI2-NEXT:    testb $1, %al
; X64-BMI2-NEXT:    sete %al
; X64-BMI2-NEXT:    retq
  %t0 = shl i32 2857740885, %y
  %t1 = and i32 %t0, 1
  %res = icmp eq i32 %t1, 0
  ret i1 %res
}
define i1 @scalar_i32_x_is_const2_eq(i32 %y) nounwind {
; X86-LABEL: scalar_i32_x_is_const2_eq:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    movl $-1437226411, %ecx # imm = 0xAA55AA55
; X86-NEXT:    btl %eax, %ecx
; X86-NEXT:    setae %al
; X86-NEXT:    retl
;
; X64-LABEL: scalar_i32_x_is_const2_eq:
; X64:       # %bb.0:
; X64-NEXT:    movl $-1437226411, %eax # imm = 0xAA55AA55
; X64-NEXT:    btl %edi, %eax
; X64-NEXT:    setae %al
; X64-NEXT:    retq
  %t0 = shl i32 1, %y
  %t1 = and i32 %t0, 2857740885
  %res = icmp eq i32 %t1, 0
  ret i1 %res
}

;------------------------------------------------------------------------------;
; A few negative tests
;------------------------------------------------------------------------------;

define i1 @negative_scalar_i8_bitsinmiddle_slt(i8 %x, i8 %y) nounwind {
; X86-LABEL: negative_scalar_i8_bitsinmiddle_slt:
; X86:       # %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; X86-NEXT:    movb $24, %al
; X86-NEXT:    shlb %cl, %al
; X86-NEXT:    andb {{[0-9]+}}(%esp), %al
; X86-NEXT:    shrb $7, %al
; X86-NEXT:    retl
;
; X64-LABEL: negative_scalar_i8_bitsinmiddle_slt:
; X64:       # %bb.0:
; X64-NEXT:    movl %esi, %ecx
; X64-NEXT:    movb $24, %al
; X64-NEXT:    # kill: def $cl killed $cl killed $ecx
; X64-NEXT:    shlb %cl, %al
; X64-NEXT:    andb %dil, %al
; X64-NEXT:    shrb $7, %al
; X64-NEXT:    retq
  %t0 = shl i8 24, %y
  %t1 = and i8 %t0, %x
  %res = icmp slt i8 %t1, 0
  ret i1 %res
}

define i1 @scalar_i8_signbit_eq_with_nonzero(i8 %x, i8 %y) nounwind {
; X86-LABEL: scalar_i8_signbit_eq_with_nonzero:
; X86:       # %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; X86-NEXT:    movb $-128, %al
; X86-NEXT:    shlb %cl, %al
; X86-NEXT:    andb {{[0-9]+}}(%esp), %al
; X86-NEXT:    cmpb $1, %al
; X86-NEXT:    sete %al
; X86-NEXT:    retl
;
; X64-LABEL: scalar_i8_signbit_eq_with_nonzero:
; X64:       # %bb.0:
; X64-NEXT:    movl %esi, %ecx
; X64-NEXT:    movb $-128, %al
; X64-NEXT:    # kill: def $cl killed $cl killed $ecx
; X64-NEXT:    shlb %cl, %al
; X64-NEXT:    andb %dil, %al
; X64-NEXT:    cmpb $1, %al
; X64-NEXT:    sete %al
; X64-NEXT:    retq
  %t0 = shl i8 128, %y
  %t1 = and i8 %t0, %x
  %res = icmp eq i8 %t1, 1 ; should be comparing with 0
  ret i1 %res
}
