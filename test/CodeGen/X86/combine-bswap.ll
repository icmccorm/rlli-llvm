; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-unknown -mattr=+sse2 | FileCheck %s --check-prefix=X86
; RUN: llc < %s -mtriple=x86_64-unknown -mattr=+avx | FileCheck %s --check-prefix=X64

; These tests just check that the plumbing is in place for @llvm.bswap. The
; actual output is massive at the moment as llvm.bswap is not yet legal.

declare i16 @llvm.bswap.i16(i16) readnone
declare i32 @llvm.bswap.i32(i32) readnone
declare i64 @llvm.bswap.i64(i64) readnone
declare i32 @llvm.bswap.v4i32(i32) readnone

; fold (bswap undef) -> undef
define i32 @test_undef() nounwind {
; X86-LABEL: test_undef:
; X86:       # %bb.0:
; X86-NEXT:    retl
;
; X64-LABEL: test_undef:
; X64:       # %bb.0:
; X64-NEXT:    retq
  %b = call i32 @llvm.bswap.i32(i32 undef)
  ret i32 %b
}

; fold (bswap (bswap x)) -> x
define i32 @test_bswap_bswap(i32 %a0) nounwind {
; X86-LABEL: test_bswap_bswap:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    retl
;
; X64-LABEL: test_bswap_bswap:
; X64:       # %bb.0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    retq
  %b = call i32 @llvm.bswap.i32(i32 %a0)
  %c = call i32 @llvm.bswap.i32(i32 %b)
  ret i32 %c
}

define i16 @test_bswap_srli_8_bswap_i16(i16 %a) nounwind {
; X86-LABEL: test_bswap_srli_8_bswap_i16:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    shll $8, %eax
; X86-NEXT:    # kill: def $ax killed $ax killed $eax
; X86-NEXT:    retl
;
; X64-LABEL: test_bswap_srli_8_bswap_i16:
; X64:       # %bb.0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    shll $8, %eax
; X64-NEXT:    # kill: def $ax killed $ax killed $eax
; X64-NEXT:    retq
    %1 = call i16 @llvm.bswap.i16(i16 %a)
    %2 = lshr i16 %1, 8
    %3 = call i16 @llvm.bswap.i16(i16 %2)
    ret i16 %3
}

define i32 @test_bswap_srli_8_bswap_i32(i32 %a) nounwind {
; X86-LABEL: test_bswap_srli_8_bswap_i32:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    shll $8, %eax
; X86-NEXT:    retl
;
; X64-LABEL: test_bswap_srli_8_bswap_i32:
; X64:       # %bb.0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    shll $8, %eax
; X64-NEXT:    retq
    %1 = call i32 @llvm.bswap.i32(i32 %a)
    %2 = lshr i32 %1, 8
    %3 = call i32 @llvm.bswap.i32(i32 %2)
    ret i32 %3
}

define i64 @test_bswap_srli_16_bswap_i64(i64 %a) nounwind {
; X86-LABEL: test_bswap_srli_16_bswap_i64:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    shll $16, %eax
; X86-NEXT:    retl
;
; X64-LABEL: test_bswap_srli_16_bswap_i64:
; X64:       # %bb.0:
; X64-NEXT:    movq %rdi, %rax
; X64-NEXT:    shlq $16, %rax
; X64-NEXT:    retq
    %1 = call i64 @llvm.bswap.i64(i64 %a)
    %2 = lshr i64 %1, 16
    %3 = call i64 @llvm.bswap.i64(i64 %2)
    ret i64 %3
}

define i16 @test_bswap_shli_8_bswap_i16(i16 %a) nounwind {
; X86-LABEL: test_bswap_shli_8_bswap_i16:
; X86:       # %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    # kill: def $ax killed $ax killed $eax
; X86-NEXT:    retl
;
; X64-LABEL: test_bswap_shli_8_bswap_i16:
; X64:       # %bb.0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    movzbl %ah, %eax
; X64-NEXT:    # kill: def $ax killed $ax killed $eax
; X64-NEXT:    retq
    %1 = call i16 @llvm.bswap.i16(i16 %a)
    %2 = shl i16 %1, 8
    %3 = call i16 @llvm.bswap.i16(i16 %2)
    ret i16 %3
}

define i32 @test_bswap_shli_8_bswap_i32(i32 %a) nounwind {
; X86-LABEL: test_bswap_shli_8_bswap_i32:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    shrl $8, %eax
; X86-NEXT:    retl
;
; X64-LABEL: test_bswap_shli_8_bswap_i32:
; X64:       # %bb.0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    shrl $8, %eax
; X64-NEXT:    retq
    %1 = call i32 @llvm.bswap.i32(i32 %a)
    %2 = shl i32 %1, 8
    %3 = call i32 @llvm.bswap.i32(i32 %2)
    ret i32 %3
}

define i64 @test_bswap_shli_16_bswap_i64(i64 %a) nounwind {
; X86-LABEL: test_bswap_shli_16_bswap_i64:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    retl
;
; X64-LABEL: test_bswap_shli_16_bswap_i64:
; X64:       # %bb.0:
; X64-NEXT:    movq %rdi, %rax
; X64-NEXT:    shrq $16, %rax
; X64-NEXT:    retq
    %1 = call i64 @llvm.bswap.i64(i64 %a)
    %2 = shl i64 %1, 16
    %3 = call i64 @llvm.bswap.i64(i64 %2)
    ret i64 %3
}

define i32 @test_demandedbits_bswap(i32 %a0) nounwind {
; X86-LABEL: test_demandedbits_bswap:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    bswapl %eax
; X86-NEXT:    andl $-65536, %eax # imm = 0xFFFF0000
; X86-NEXT:    retl
;
; X64-LABEL: test_demandedbits_bswap:
; X64:       # %bb.0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    bswapl %eax
; X64-NEXT:    andl $-65536, %eax # imm = 0xFFFF0000
; X64-NEXT:    retq
  %b = or i32 %a0, 4278190080
  %c = call i32 @llvm.bswap.i32(i32 %b)
  %d = and i32 %c, 4294901760
  ret i32 %d
}

define void @demand_one_loaded_byte(ptr %xp, ptr %yp) {
; X86-LABEL: demand_one_loaded_byte:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; X86-NEXT:    movzbl 4(%ecx), %ecx
; X86-NEXT:    movb %cl, (%eax)
; X86-NEXT:    retl
;
; X64-LABEL: demand_one_loaded_byte:
; X64:       # %bb.0:
; X64-NEXT:    movzbl 4(%rdi), %eax
; X64-NEXT:    movb %al, (%rsi)
; X64-NEXT:    retq
  %x = load i64, ptr %xp, align 8
  %x_zzzz7654 = lshr i64 %x, 32
  %x_z7654zzz = shl nuw nsw i64 %x_zzzz7654, 24
  %x_4zzz = trunc i64 %x_z7654zzz to i32
  %y = load i32, ptr %yp, align 4
  %y_321z = and i32 %y, -256
  %x_zzz4 = call i32 @llvm.bswap.i32(i32 %x_4zzz)
  %r = or i32 %x_zzz4, %y_321z
  store i32 %r, ptr %yp, align 4
  ret void
}

define i64 @test_bswap64_shift48_zext(i16 %a0) {
; X86-LABEL: test_bswap64_shift48_zext:
; X86:       # %bb.0:
; X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    rolw $8, %ax
; X86-NEXT:    movzwl %ax, %eax
; X86-NEXT:    xorl %edx, %edx
; X86-NEXT:    retl
;
; X64-LABEL: test_bswap64_shift48_zext:
; X64:       # %bb.0:
; X64-NEXT:    rolw $8, %di
; X64-NEXT:    movzwl %di, %eax
; X64-NEXT:    retq
  %z = zext i16 %a0 to i64
  %s = shl i64 %z, 48
  %b = call i64 @llvm.bswap.i64(i64 %s)
  ret i64 %b
}

define i64 @test_bswap64_shift48(i64 %a0) {
; X86-LABEL: test_bswap64_shift48:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    rolw $8, %ax
; X86-NEXT:    movzwl %ax, %eax
; X86-NEXT:    xorl %edx, %edx
; X86-NEXT:    retl
;
; X64-LABEL: test_bswap64_shift48:
; X64:       # %bb.0:
; X64-NEXT:    rolw $8, %di
; X64-NEXT:    movzwl %di, %eax
; X64-NEXT:    retq
  %s = shl i64 %a0, 48
  %b = call i64 @llvm.bswap.i64(i64 %s)
  ret i64 %b
}

define i32 @test_bswap32_shift17(i32 %a0) {
; X86-LABEL: test_bswap32_shift17:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    shll $17, %eax
; X86-NEXT:    bswapl %eax
; X86-NEXT:    retl
;
; X64-LABEL: test_bswap32_shift17:
; X64:       # %bb.0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    shll $17, %eax
; X64-NEXT:    bswapl %eax
; X64-NEXT:    retq
  %s = shl i32 %a0, 17
  %b = call i32 @llvm.bswap.i32(i32 %s)
  ret i32 %b
}

; negative test
define i64 @test_bswap64_shift17(i64 %a0) {
; X86-LABEL: test_bswap64_shift17:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    shldl $17, %edx, %eax
; X86-NEXT:    shll $17, %edx
; X86-NEXT:    bswapl %eax
; X86-NEXT:    bswapl %edx
; X86-NEXT:    retl
;
; X64-LABEL: test_bswap64_shift17:
; X64:       # %bb.0:
; X64-NEXT:    movq %rdi, %rax
; X64-NEXT:    shlq $17, %rax
; X64-NEXT:    bswapq %rax
; X64-NEXT:    retq
  %s = shl i64 %a0, 17
  %b = call i64 @llvm.bswap.i64(i64 %s)
  ret i64 %b
}

; negative test
define i64 @test_bswap64_shift48_multiuse(i64 %a0, ptr %a1) {
; X86-LABEL: test_bswap64_shift48_multiuse:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    shll $16, %eax
; X86-NEXT:    movl %eax, 4(%ecx)
; X86-NEXT:    bswapl %eax
; X86-NEXT:    movl %eax, (%ecx)
; X86-NEXT:    xorl %edx, %edx
; X86-NEXT:    retl
;
; X64-LABEL: test_bswap64_shift48_multiuse:
; X64:       # %bb.0:
; X64-NEXT:    shlq $48, %rdi
; X64-NEXT:    movq %rdi, %rax
; X64-NEXT:    bswapq %rax
; X64-NEXT:    orq %rax, %rdi
; X64-NEXT:    movq %rdi, (%rsi)
; X64-NEXT:    retq
  %s = shl i64 %a0, 48
  %b = call i64 @llvm.bswap.i64(i64 %s)
  %a = add i64 %s, %b
  store i64 %a, ptr %a1
  ret i64 %b
}
