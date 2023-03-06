; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -verify-machineinstrs -mtriple=aarch64-- -O0 -fast-isel=0 -global-isel=false %s -o - | FileCheck %s -check-prefix=NOLSE
; RUN: llc -verify-machineinstrs -mtriple=aarch64-- -mattr=+lse -O0 -fast-isel=0 -global-isel=false %s -o - | FileCheck %s -check-prefix=LSE

; Ensure there's no stack spill in between ldxr/stxr pairs.

define i8 @test_rmw_add_8(i8* %dst)   {
; NOLSE-LABEL: test_rmw_add_8:
; NOLSE:       // %bb.0: // %entry
; NOLSE-NEXT:    sub sp, sp, #32
; NOLSE-NEXT:    .cfi_def_cfa_offset 32
; NOLSE-NEXT:    str x0, [sp, #16] // 8-byte Folded Spill
; NOLSE-NEXT:    ldrb w8, [x0]
; NOLSE-NEXT:    str w8, [sp, #28] // 4-byte Folded Spill
; NOLSE-NEXT:    b .LBB0_1
; NOLSE-NEXT:  .LBB0_1: // %atomicrmw.start
; NOLSE-NEXT:    // =>This Loop Header: Depth=1
; NOLSE-NEXT:    // Child Loop BB0_2 Depth 2
; NOLSE-NEXT:    ldr w9, [sp, #28] // 4-byte Folded Reload
; NOLSE-NEXT:    ldr x11, [sp, #16] // 8-byte Folded Reload
; NOLSE-NEXT:    add w12, w9, #1
; NOLSE-NEXT:  .LBB0_2: // %atomicrmw.start
; NOLSE-NEXT:    // Parent Loop BB0_1 Depth=1
; NOLSE-NEXT:    // => This Inner Loop Header: Depth=2
; NOLSE-NEXT:    ldaxrb w8, [x11]
; NOLSE-NEXT:    cmp w8, w9, uxtb
; NOLSE-NEXT:    b.ne .LBB0_4
; NOLSE-NEXT:  // %bb.3: // %atomicrmw.start
; NOLSE-NEXT:    // in Loop: Header=BB0_2 Depth=2
; NOLSE-NEXT:    stlxrb w10, w12, [x11]
; NOLSE-NEXT:    cbnz w10, .LBB0_2
; NOLSE-NEXT:  .LBB0_4: // %atomicrmw.start
; NOLSE-NEXT:    // in Loop: Header=BB0_1 Depth=1
; NOLSE-NEXT:    subs w9, w8, w9, uxtb
; NOLSE-NEXT:    cset w9, eq
; NOLSE-NEXT:    str w8, [sp, #12] // 4-byte Folded Spill
; NOLSE-NEXT:    subs w9, w9, #1
; NOLSE-NEXT:    str w8, [sp, #28] // 4-byte Folded Spill
; NOLSE-NEXT:    b.ne .LBB0_1
; NOLSE-NEXT:    b .LBB0_5
; NOLSE-NEXT:  .LBB0_5: // %atomicrmw.end
; NOLSE-NEXT:    ldr w0, [sp, #12] // 4-byte Folded Reload
; NOLSE-NEXT:    add sp, sp, #32
; NOLSE-NEXT:    ret
;
; LSE-LABEL: test_rmw_add_8:
; LSE:       // %bb.0: // %entry
; LSE-NEXT:    mov w8, #1
; LSE-NEXT:    ldaddalb w8, w0, [x0]
; LSE-NEXT:    ret
entry:
  %res = atomicrmw add i8* %dst, i8 1 seq_cst
  ret i8 %res
}

define i16 @test_rmw_add_16(i16* %dst)   {
; NOLSE-LABEL: test_rmw_add_16:
; NOLSE:       // %bb.0: // %entry
; NOLSE-NEXT:    sub sp, sp, #32
; NOLSE-NEXT:    .cfi_def_cfa_offset 32
; NOLSE-NEXT:    str x0, [sp, #16] // 8-byte Folded Spill
; NOLSE-NEXT:    ldrh w8, [x0]
; NOLSE-NEXT:    str w8, [sp, #28] // 4-byte Folded Spill
; NOLSE-NEXT:    b .LBB1_1
; NOLSE-NEXT:  .LBB1_1: // %atomicrmw.start
; NOLSE-NEXT:    // =>This Loop Header: Depth=1
; NOLSE-NEXT:    // Child Loop BB1_2 Depth 2
; NOLSE-NEXT:    ldr w9, [sp, #28] // 4-byte Folded Reload
; NOLSE-NEXT:    ldr x11, [sp, #16] // 8-byte Folded Reload
; NOLSE-NEXT:    add w12, w9, #1
; NOLSE-NEXT:  .LBB1_2: // %atomicrmw.start
; NOLSE-NEXT:    // Parent Loop BB1_1 Depth=1
; NOLSE-NEXT:    // => This Inner Loop Header: Depth=2
; NOLSE-NEXT:    ldaxrh w8, [x11]
; NOLSE-NEXT:    cmp w8, w9, uxth
; NOLSE-NEXT:    b.ne .LBB1_4
; NOLSE-NEXT:  // %bb.3: // %atomicrmw.start
; NOLSE-NEXT:    // in Loop: Header=BB1_2 Depth=2
; NOLSE-NEXT:    stlxrh w10, w12, [x11]
; NOLSE-NEXT:    cbnz w10, .LBB1_2
; NOLSE-NEXT:  .LBB1_4: // %atomicrmw.start
; NOLSE-NEXT:    // in Loop: Header=BB1_1 Depth=1
; NOLSE-NEXT:    subs w9, w8, w9, uxth
; NOLSE-NEXT:    cset w9, eq
; NOLSE-NEXT:    str w8, [sp, #12] // 4-byte Folded Spill
; NOLSE-NEXT:    subs w9, w9, #1
; NOLSE-NEXT:    str w8, [sp, #28] // 4-byte Folded Spill
; NOLSE-NEXT:    b.ne .LBB1_1
; NOLSE-NEXT:    b .LBB1_5
; NOLSE-NEXT:  .LBB1_5: // %atomicrmw.end
; NOLSE-NEXT:    ldr w0, [sp, #12] // 4-byte Folded Reload
; NOLSE-NEXT:    add sp, sp, #32
; NOLSE-NEXT:    ret
;
; LSE-LABEL: test_rmw_add_16:
; LSE:       // %bb.0: // %entry
; LSE-NEXT:    mov w8, #1
; LSE-NEXT:    ldaddalh w8, w0, [x0]
; LSE-NEXT:    ret
entry:
  %res = atomicrmw add i16* %dst, i16 1 seq_cst
  ret i16 %res
}

define i32 @test_rmw_add_32(i32* %dst)   {
; NOLSE-LABEL: test_rmw_add_32:
; NOLSE:       // %bb.0: // %entry
; NOLSE-NEXT:    sub sp, sp, #32
; NOLSE-NEXT:    .cfi_def_cfa_offset 32
; NOLSE-NEXT:    str x0, [sp, #16] // 8-byte Folded Spill
; NOLSE-NEXT:    ldr w8, [x0]
; NOLSE-NEXT:    str w8, [sp, #28] // 4-byte Folded Spill
; NOLSE-NEXT:    b .LBB2_1
; NOLSE-NEXT:  .LBB2_1: // %atomicrmw.start
; NOLSE-NEXT:    // =>This Loop Header: Depth=1
; NOLSE-NEXT:    // Child Loop BB2_2 Depth 2
; NOLSE-NEXT:    ldr w9, [sp, #28] // 4-byte Folded Reload
; NOLSE-NEXT:    ldr x11, [sp, #16] // 8-byte Folded Reload
; NOLSE-NEXT:    add w12, w9, #1
; NOLSE-NEXT:  .LBB2_2: // %atomicrmw.start
; NOLSE-NEXT:    // Parent Loop BB2_1 Depth=1
; NOLSE-NEXT:    // => This Inner Loop Header: Depth=2
; NOLSE-NEXT:    ldaxr w8, [x11]
; NOLSE-NEXT:    cmp w8, w9
; NOLSE-NEXT:    b.ne .LBB2_4
; NOLSE-NEXT:  // %bb.3: // %atomicrmw.start
; NOLSE-NEXT:    // in Loop: Header=BB2_2 Depth=2
; NOLSE-NEXT:    stlxr w10, w12, [x11]
; NOLSE-NEXT:    cbnz w10, .LBB2_2
; NOLSE-NEXT:  .LBB2_4: // %atomicrmw.start
; NOLSE-NEXT:    // in Loop: Header=BB2_1 Depth=1
; NOLSE-NEXT:    subs w9, w8, w9
; NOLSE-NEXT:    cset w9, eq
; NOLSE-NEXT:    str w8, [sp, #12] // 4-byte Folded Spill
; NOLSE-NEXT:    subs w9, w9, #1
; NOLSE-NEXT:    str w8, [sp, #28] // 4-byte Folded Spill
; NOLSE-NEXT:    b.ne .LBB2_1
; NOLSE-NEXT:    b .LBB2_5
; NOLSE-NEXT:  .LBB2_5: // %atomicrmw.end
; NOLSE-NEXT:    ldr w0, [sp, #12] // 4-byte Folded Reload
; NOLSE-NEXT:    add sp, sp, #32
; NOLSE-NEXT:    ret
;
; LSE-LABEL: test_rmw_add_32:
; LSE:       // %bb.0: // %entry
; LSE-NEXT:    mov w8, #1
; LSE-NEXT:    ldaddal w8, w0, [x0]
; LSE-NEXT:    ret
entry:
  %res = atomicrmw add i32* %dst, i32 1 seq_cst
  ret i32 %res
}

define i64 @test_rmw_add_64(i64* %dst)   {
; NOLSE-LABEL: test_rmw_add_64:
; NOLSE:       // %bb.0: // %entry
; NOLSE-NEXT:    sub sp, sp, #32
; NOLSE-NEXT:    .cfi_def_cfa_offset 32
; NOLSE-NEXT:    str x0, [sp, #16] // 8-byte Folded Spill
; NOLSE-NEXT:    ldr x8, [x0]
; NOLSE-NEXT:    str x8, [sp, #24] // 8-byte Folded Spill
; NOLSE-NEXT:    b .LBB3_1
; NOLSE-NEXT:  .LBB3_1: // %atomicrmw.start
; NOLSE-NEXT:    // =>This Loop Header: Depth=1
; NOLSE-NEXT:    // Child Loop BB3_2 Depth 2
; NOLSE-NEXT:    ldr x9, [sp, #24] // 8-byte Folded Reload
; NOLSE-NEXT:    ldr x11, [sp, #16] // 8-byte Folded Reload
; NOLSE-NEXT:    add x12, x9, #1
; NOLSE-NEXT:  .LBB3_2: // %atomicrmw.start
; NOLSE-NEXT:    // Parent Loop BB3_1 Depth=1
; NOLSE-NEXT:    // => This Inner Loop Header: Depth=2
; NOLSE-NEXT:    ldaxr x8, [x11]
; NOLSE-NEXT:    cmp x8, x9
; NOLSE-NEXT:    b.ne .LBB3_4
; NOLSE-NEXT:  // %bb.3: // %atomicrmw.start
; NOLSE-NEXT:    // in Loop: Header=BB3_2 Depth=2
; NOLSE-NEXT:    stlxr w10, x12, [x11]
; NOLSE-NEXT:    cbnz w10, .LBB3_2
; NOLSE-NEXT:  .LBB3_4: // %atomicrmw.start
; NOLSE-NEXT:    // in Loop: Header=BB3_1 Depth=1
; NOLSE-NEXT:    subs x9, x8, x9
; NOLSE-NEXT:    cset w9, eq
; NOLSE-NEXT:    str x8, [sp, #8] // 8-byte Folded Spill
; NOLSE-NEXT:    subs w9, w9, #1
; NOLSE-NEXT:    str x8, [sp, #24] // 8-byte Folded Spill
; NOLSE-NEXT:    b.ne .LBB3_1
; NOLSE-NEXT:    b .LBB3_5
; NOLSE-NEXT:  .LBB3_5: // %atomicrmw.end
; NOLSE-NEXT:    ldr x0, [sp, #8] // 8-byte Folded Reload
; NOLSE-NEXT:    add sp, sp, #32
; NOLSE-NEXT:    ret
;
; LSE-LABEL: test_rmw_add_64:
; LSE:       // %bb.0: // %entry
; LSE-NEXT:    mov w8, #1
; LSE-NEXT:    // kill: def $x8 killed $w8
; LSE-NEXT:    ldaddal x8, x0, [x0]
; LSE-NEXT:    ret
entry:
  %res = atomicrmw add i64* %dst, i64 1 seq_cst
  ret i64 %res
}

define i128 @test_rmw_add_128(i128* %dst)   {
; NOLSE-LABEL: test_rmw_add_128:
; NOLSE:       // %bb.0: // %entry
; NOLSE-NEXT:    sub sp, sp, #48
; NOLSE-NEXT:    .cfi_def_cfa_offset 48
; NOLSE-NEXT:    str x0, [sp, #24] // 8-byte Folded Spill
; NOLSE-NEXT:    ldr x8, [x0, #8]
; NOLSE-NEXT:    ldr x9, [x0]
; NOLSE-NEXT:    str x9, [sp, #32] // 8-byte Folded Spill
; NOLSE-NEXT:    str x8, [sp, #40] // 8-byte Folded Spill
; NOLSE-NEXT:    b .LBB4_1
; NOLSE-NEXT:  .LBB4_1: // %atomicrmw.start
; NOLSE-NEXT:    // =>This Loop Header: Depth=1
; NOLSE-NEXT:    // Child Loop BB4_2 Depth 2
; NOLSE-NEXT:    ldr x11, [sp, #40] // 8-byte Folded Reload
; NOLSE-NEXT:    ldr x8, [sp, #32] // 8-byte Folded Reload
; NOLSE-NEXT:    ldr x13, [sp, #24] // 8-byte Folded Reload
; NOLSE-NEXT:    adds x14, x8, #1
; NOLSE-NEXT:    cinc x15, x11, hs
; NOLSE-NEXT:  .LBB4_2: // %atomicrmw.start
; NOLSE-NEXT:    // Parent Loop BB4_1 Depth=1
; NOLSE-NEXT:    // => This Inner Loop Header: Depth=2
; NOLSE-NEXT:    ldaxp x10, x9, [x13]
; NOLSE-NEXT:    cmp x10, x8
; NOLSE-NEXT:    cset w12, ne
; NOLSE-NEXT:    cmp x9, x11
; NOLSE-NEXT:    cinc w12, w12, ne
; NOLSE-NEXT:    cbnz w12, .LBB4_4
; NOLSE-NEXT:  // %bb.3: // %atomicrmw.start
; NOLSE-NEXT:    // in Loop: Header=BB4_2 Depth=2
; NOLSE-NEXT:    stlxp w12, x14, x15, [x13]
; NOLSE-NEXT:    cbnz w12, .LBB4_2
; NOLSE-NEXT:    b .LBB4_5
; NOLSE-NEXT:  .LBB4_4: // %atomicrmw.start
; NOLSE-NEXT:    // in Loop: Header=BB4_2 Depth=2
; NOLSE-NEXT:    stlxp w12, x10, x9, [x13]
; NOLSE-NEXT:    cbnz w12, .LBB4_2
; NOLSE-NEXT:  .LBB4_5: // %atomicrmw.start
; NOLSE-NEXT:    // in Loop: Header=BB4_1 Depth=1
; NOLSE-NEXT:    eor x11, x9, x11
; NOLSE-NEXT:    eor x8, x10, x8
; NOLSE-NEXT:    orr x8, x8, x11
; NOLSE-NEXT:    str x9, [sp, #8] // 8-byte Folded Spill
; NOLSE-NEXT:    str x10, [sp, #16] // 8-byte Folded Spill
; NOLSE-NEXT:    str x10, [sp, #32] // 8-byte Folded Spill
; NOLSE-NEXT:    str x9, [sp, #40] // 8-byte Folded Spill
; NOLSE-NEXT:    cbnz x8, .LBB4_1
; NOLSE-NEXT:    b .LBB4_6
; NOLSE-NEXT:  .LBB4_6: // %atomicrmw.end
; NOLSE-NEXT:    ldr x1, [sp, #8] // 8-byte Folded Reload
; NOLSE-NEXT:    ldr x0, [sp, #16] // 8-byte Folded Reload
; NOLSE-NEXT:    add sp, sp, #48
; NOLSE-NEXT:    ret
;
; LSE-LABEL: test_rmw_add_128:
; LSE:       // %bb.0: // %entry
; LSE-NEXT:    sub sp, sp, #48
; LSE-NEXT:    .cfi_def_cfa_offset 48
; LSE-NEXT:    str x0, [sp, #24] // 8-byte Folded Spill
; LSE-NEXT:    ldr x8, [x0, #8]
; LSE-NEXT:    ldr x9, [x0]
; LSE-NEXT:    str x9, [sp, #32] // 8-byte Folded Spill
; LSE-NEXT:    str x8, [sp, #40] // 8-byte Folded Spill
; LSE-NEXT:    b .LBB4_1
; LSE-NEXT:  .LBB4_1: // %atomicrmw.start
; LSE-NEXT:    // =>This Inner Loop Header: Depth=1
; LSE-NEXT:    ldr x10, [sp, #40] // 8-byte Folded Reload
; LSE-NEXT:    ldr x8, [sp, #32] // 8-byte Folded Reload
; LSE-NEXT:    ldr x9, [sp, #24] // 8-byte Folded Reload
; LSE-NEXT:    mov x0, x8
; LSE-NEXT:    mov x1, x10
; LSE-NEXT:    adds x2, x8, #1
; LSE-NEXT:    cinc x11, x10, hs
; LSE-NEXT:    // kill: def $x2 killed $x2 def $x2_x3
; LSE-NEXT:    mov x3, x11
; LSE-NEXT:    caspal x0, x1, x2, x3, [x9]
; LSE-NEXT:    mov x9, x1
; LSE-NEXT:    str x9, [sp, #8] // 8-byte Folded Spill
; LSE-NEXT:    eor x11, x9, x10
; LSE-NEXT:    mov x10, x0
; LSE-NEXT:    str x10, [sp, #16] // 8-byte Folded Spill
; LSE-NEXT:    eor x8, x10, x8
; LSE-NEXT:    orr x8, x8, x11
; LSE-NEXT:    str x10, [sp, #32] // 8-byte Folded Spill
; LSE-NEXT:    str x9, [sp, #40] // 8-byte Folded Spill
; LSE-NEXT:    cbnz x8, .LBB4_1
; LSE-NEXT:    b .LBB4_2
; LSE-NEXT:  .LBB4_2: // %atomicrmw.end
; LSE-NEXT:    ldr x1, [sp, #8] // 8-byte Folded Reload
; LSE-NEXT:    ldr x0, [sp, #16] // 8-byte Folded Reload
; LSE-NEXT:    add sp, sp, #48
; LSE-NEXT:    ret
entry:
  %res = atomicrmw add i128* %dst, i128 1 seq_cst
  ret i128 %res
}
define i8 @test_rmw_nand_8(i8* %dst)   {
; NOLSE-LABEL: test_rmw_nand_8:
; NOLSE:       // %bb.0: // %entry
; NOLSE-NEXT:    sub sp, sp, #32
; NOLSE-NEXT:    .cfi_def_cfa_offset 32
; NOLSE-NEXT:    str x0, [sp, #16] // 8-byte Folded Spill
; NOLSE-NEXT:    ldrb w8, [x0]
; NOLSE-NEXT:    str w8, [sp, #28] // 4-byte Folded Spill
; NOLSE-NEXT:    b .LBB5_1
; NOLSE-NEXT:  .LBB5_1: // %atomicrmw.start
; NOLSE-NEXT:    // =>This Loop Header: Depth=1
; NOLSE-NEXT:    // Child Loop BB5_2 Depth 2
; NOLSE-NEXT:    ldr w9, [sp, #28] // 4-byte Folded Reload
; NOLSE-NEXT:    ldr x11, [sp, #16] // 8-byte Folded Reload
; NOLSE-NEXT:    mvn w8, w9
; NOLSE-NEXT:    orr w12, w8, #0xfffffffe
; NOLSE-NEXT:  .LBB5_2: // %atomicrmw.start
; NOLSE-NEXT:    // Parent Loop BB5_1 Depth=1
; NOLSE-NEXT:    // => This Inner Loop Header: Depth=2
; NOLSE-NEXT:    ldaxrb w8, [x11]
; NOLSE-NEXT:    cmp w8, w9, uxtb
; NOLSE-NEXT:    b.ne .LBB5_4
; NOLSE-NEXT:  // %bb.3: // %atomicrmw.start
; NOLSE-NEXT:    // in Loop: Header=BB5_2 Depth=2
; NOLSE-NEXT:    stlxrb w10, w12, [x11]
; NOLSE-NEXT:    cbnz w10, .LBB5_2
; NOLSE-NEXT:  .LBB5_4: // %atomicrmw.start
; NOLSE-NEXT:    // in Loop: Header=BB5_1 Depth=1
; NOLSE-NEXT:    subs w9, w8, w9, uxtb
; NOLSE-NEXT:    cset w9, eq
; NOLSE-NEXT:    str w8, [sp, #12] // 4-byte Folded Spill
; NOLSE-NEXT:    subs w9, w9, #1
; NOLSE-NEXT:    str w8, [sp, #28] // 4-byte Folded Spill
; NOLSE-NEXT:    b.ne .LBB5_1
; NOLSE-NEXT:    b .LBB5_5
; NOLSE-NEXT:  .LBB5_5: // %atomicrmw.end
; NOLSE-NEXT:    ldr w0, [sp, #12] // 4-byte Folded Reload
; NOLSE-NEXT:    add sp, sp, #32
; NOLSE-NEXT:    ret
;
; LSE-LABEL: test_rmw_nand_8:
; LSE:       // %bb.0: // %entry
; LSE-NEXT:    sub sp, sp, #32
; LSE-NEXT:    .cfi_def_cfa_offset 32
; LSE-NEXT:    str x0, [sp, #16] // 8-byte Folded Spill
; LSE-NEXT:    ldrb w8, [x0]
; LSE-NEXT:    str w8, [sp, #28] // 4-byte Folded Spill
; LSE-NEXT:    b .LBB5_1
; LSE-NEXT:  .LBB5_1: // %atomicrmw.start
; LSE-NEXT:    // =>This Inner Loop Header: Depth=1
; LSE-NEXT:    ldr w9, [sp, #28] // 4-byte Folded Reload
; LSE-NEXT:    ldr x11, [sp, #16] // 8-byte Folded Reload
; LSE-NEXT:    mvn w8, w9
; LSE-NEXT:    orr w10, w8, #0xfffffffe
; LSE-NEXT:    mov w8, w9
; LSE-NEXT:    casalb w8, w10, [x11]
; LSE-NEXT:    subs w9, w8, w9, uxtb
; LSE-NEXT:    cset w9, eq
; LSE-NEXT:    str w8, [sp, #12] // 4-byte Folded Spill
; LSE-NEXT:    subs w9, w9, #1
; LSE-NEXT:    str w8, [sp, #28] // 4-byte Folded Spill
; LSE-NEXT:    b.ne .LBB5_1
; LSE-NEXT:    b .LBB5_2
; LSE-NEXT:  .LBB5_2: // %atomicrmw.end
; LSE-NEXT:    ldr w0, [sp, #12] // 4-byte Folded Reload
; LSE-NEXT:    add sp, sp, #32
; LSE-NEXT:    ret
entry:
  %res = atomicrmw nand i8* %dst, i8 1 seq_cst
  ret i8 %res
}

define i16 @test_rmw_nand_16(i16* %dst)   {
; NOLSE-LABEL: test_rmw_nand_16:
; NOLSE:       // %bb.0: // %entry
; NOLSE-NEXT:    sub sp, sp, #32
; NOLSE-NEXT:    .cfi_def_cfa_offset 32
; NOLSE-NEXT:    str x0, [sp, #16] // 8-byte Folded Spill
; NOLSE-NEXT:    ldrh w8, [x0]
; NOLSE-NEXT:    str w8, [sp, #28] // 4-byte Folded Spill
; NOLSE-NEXT:    b .LBB6_1
; NOLSE-NEXT:  .LBB6_1: // %atomicrmw.start
; NOLSE-NEXT:    // =>This Loop Header: Depth=1
; NOLSE-NEXT:    // Child Loop BB6_2 Depth 2
; NOLSE-NEXT:    ldr w9, [sp, #28] // 4-byte Folded Reload
; NOLSE-NEXT:    ldr x11, [sp, #16] // 8-byte Folded Reload
; NOLSE-NEXT:    mvn w8, w9
; NOLSE-NEXT:    orr w12, w8, #0xfffffffe
; NOLSE-NEXT:  .LBB6_2: // %atomicrmw.start
; NOLSE-NEXT:    // Parent Loop BB6_1 Depth=1
; NOLSE-NEXT:    // => This Inner Loop Header: Depth=2
; NOLSE-NEXT:    ldaxrh w8, [x11]
; NOLSE-NEXT:    cmp w8, w9, uxth
; NOLSE-NEXT:    b.ne .LBB6_4
; NOLSE-NEXT:  // %bb.3: // %atomicrmw.start
; NOLSE-NEXT:    // in Loop: Header=BB6_2 Depth=2
; NOLSE-NEXT:    stlxrh w10, w12, [x11]
; NOLSE-NEXT:    cbnz w10, .LBB6_2
; NOLSE-NEXT:  .LBB6_4: // %atomicrmw.start
; NOLSE-NEXT:    // in Loop: Header=BB6_1 Depth=1
; NOLSE-NEXT:    subs w9, w8, w9, uxth
; NOLSE-NEXT:    cset w9, eq
; NOLSE-NEXT:    str w8, [sp, #12] // 4-byte Folded Spill
; NOLSE-NEXT:    subs w9, w9, #1
; NOLSE-NEXT:    str w8, [sp, #28] // 4-byte Folded Spill
; NOLSE-NEXT:    b.ne .LBB6_1
; NOLSE-NEXT:    b .LBB6_5
; NOLSE-NEXT:  .LBB6_5: // %atomicrmw.end
; NOLSE-NEXT:    ldr w0, [sp, #12] // 4-byte Folded Reload
; NOLSE-NEXT:    add sp, sp, #32
; NOLSE-NEXT:    ret
;
; LSE-LABEL: test_rmw_nand_16:
; LSE:       // %bb.0: // %entry
; LSE-NEXT:    sub sp, sp, #32
; LSE-NEXT:    .cfi_def_cfa_offset 32
; LSE-NEXT:    str x0, [sp, #16] // 8-byte Folded Spill
; LSE-NEXT:    ldrh w8, [x0]
; LSE-NEXT:    str w8, [sp, #28] // 4-byte Folded Spill
; LSE-NEXT:    b .LBB6_1
; LSE-NEXT:  .LBB6_1: // %atomicrmw.start
; LSE-NEXT:    // =>This Inner Loop Header: Depth=1
; LSE-NEXT:    ldr w9, [sp, #28] // 4-byte Folded Reload
; LSE-NEXT:    ldr x11, [sp, #16] // 8-byte Folded Reload
; LSE-NEXT:    mvn w8, w9
; LSE-NEXT:    orr w10, w8, #0xfffffffe
; LSE-NEXT:    mov w8, w9
; LSE-NEXT:    casalh w8, w10, [x11]
; LSE-NEXT:    subs w9, w8, w9, uxth
; LSE-NEXT:    cset w9, eq
; LSE-NEXT:    str w8, [sp, #12] // 4-byte Folded Spill
; LSE-NEXT:    subs w9, w9, #1
; LSE-NEXT:    str w8, [sp, #28] // 4-byte Folded Spill
; LSE-NEXT:    b.ne .LBB6_1
; LSE-NEXT:    b .LBB6_2
; LSE-NEXT:  .LBB6_2: // %atomicrmw.end
; LSE-NEXT:    ldr w0, [sp, #12] // 4-byte Folded Reload
; LSE-NEXT:    add sp, sp, #32
; LSE-NEXT:    ret
entry:
  %res = atomicrmw nand i16* %dst, i16 1 seq_cst
  ret i16 %res
}

define i32 @test_rmw_nand_32(i32* %dst)   {
; NOLSE-LABEL: test_rmw_nand_32:
; NOLSE:       // %bb.0: // %entry
; NOLSE-NEXT:    sub sp, sp, #32
; NOLSE-NEXT:    .cfi_def_cfa_offset 32
; NOLSE-NEXT:    str x0, [sp, #16] // 8-byte Folded Spill
; NOLSE-NEXT:    ldr w8, [x0]
; NOLSE-NEXT:    str w8, [sp, #28] // 4-byte Folded Spill
; NOLSE-NEXT:    b .LBB7_1
; NOLSE-NEXT:  .LBB7_1: // %atomicrmw.start
; NOLSE-NEXT:    // =>This Loop Header: Depth=1
; NOLSE-NEXT:    // Child Loop BB7_2 Depth 2
; NOLSE-NEXT:    ldr w9, [sp, #28] // 4-byte Folded Reload
; NOLSE-NEXT:    ldr x11, [sp, #16] // 8-byte Folded Reload
; NOLSE-NEXT:    mvn w8, w9
; NOLSE-NEXT:    orr w12, w8, #0xfffffffe
; NOLSE-NEXT:  .LBB7_2: // %atomicrmw.start
; NOLSE-NEXT:    // Parent Loop BB7_1 Depth=1
; NOLSE-NEXT:    // => This Inner Loop Header: Depth=2
; NOLSE-NEXT:    ldaxr w8, [x11]
; NOLSE-NEXT:    cmp w8, w9
; NOLSE-NEXT:    b.ne .LBB7_4
; NOLSE-NEXT:  // %bb.3: // %atomicrmw.start
; NOLSE-NEXT:    // in Loop: Header=BB7_2 Depth=2
; NOLSE-NEXT:    stlxr w10, w12, [x11]
; NOLSE-NEXT:    cbnz w10, .LBB7_2
; NOLSE-NEXT:  .LBB7_4: // %atomicrmw.start
; NOLSE-NEXT:    // in Loop: Header=BB7_1 Depth=1
; NOLSE-NEXT:    subs w9, w8, w9
; NOLSE-NEXT:    cset w9, eq
; NOLSE-NEXT:    str w8, [sp, #12] // 4-byte Folded Spill
; NOLSE-NEXT:    subs w9, w9, #1
; NOLSE-NEXT:    str w8, [sp, #28] // 4-byte Folded Spill
; NOLSE-NEXT:    b.ne .LBB7_1
; NOLSE-NEXT:    b .LBB7_5
; NOLSE-NEXT:  .LBB7_5: // %atomicrmw.end
; NOLSE-NEXT:    ldr w0, [sp, #12] // 4-byte Folded Reload
; NOLSE-NEXT:    add sp, sp, #32
; NOLSE-NEXT:    ret
;
; LSE-LABEL: test_rmw_nand_32:
; LSE:       // %bb.0: // %entry
; LSE-NEXT:    sub sp, sp, #32
; LSE-NEXT:    .cfi_def_cfa_offset 32
; LSE-NEXT:    str x0, [sp, #16] // 8-byte Folded Spill
; LSE-NEXT:    ldr w8, [x0]
; LSE-NEXT:    str w8, [sp, #28] // 4-byte Folded Spill
; LSE-NEXT:    b .LBB7_1
; LSE-NEXT:  .LBB7_1: // %atomicrmw.start
; LSE-NEXT:    // =>This Inner Loop Header: Depth=1
; LSE-NEXT:    ldr w9, [sp, #28] // 4-byte Folded Reload
; LSE-NEXT:    ldr x11, [sp, #16] // 8-byte Folded Reload
; LSE-NEXT:    mvn w8, w9
; LSE-NEXT:    orr w10, w8, #0xfffffffe
; LSE-NEXT:    mov w8, w9
; LSE-NEXT:    casal w8, w10, [x11]
; LSE-NEXT:    subs w9, w8, w9
; LSE-NEXT:    cset w9, eq
; LSE-NEXT:    str w8, [sp, #12] // 4-byte Folded Spill
; LSE-NEXT:    subs w9, w9, #1
; LSE-NEXT:    str w8, [sp, #28] // 4-byte Folded Spill
; LSE-NEXT:    b.ne .LBB7_1
; LSE-NEXT:    b .LBB7_2
; LSE-NEXT:  .LBB7_2: // %atomicrmw.end
; LSE-NEXT:    ldr w0, [sp, #12] // 4-byte Folded Reload
; LSE-NEXT:    add sp, sp, #32
; LSE-NEXT:    ret
entry:
  %res = atomicrmw nand i32* %dst, i32 1 seq_cst
  ret i32 %res
}

define i64 @test_rmw_nand_64(i64* %dst)   {
; NOLSE-LABEL: test_rmw_nand_64:
; NOLSE:       // %bb.0: // %entry
; NOLSE-NEXT:    sub sp, sp, #32
; NOLSE-NEXT:    .cfi_def_cfa_offset 32
; NOLSE-NEXT:    str x0, [sp, #16] // 8-byte Folded Spill
; NOLSE-NEXT:    ldr x8, [x0]
; NOLSE-NEXT:    str x8, [sp, #24] // 8-byte Folded Spill
; NOLSE-NEXT:    b .LBB8_1
; NOLSE-NEXT:  .LBB8_1: // %atomicrmw.start
; NOLSE-NEXT:    // =>This Loop Header: Depth=1
; NOLSE-NEXT:    // Child Loop BB8_2 Depth 2
; NOLSE-NEXT:    ldr x9, [sp, #24] // 8-byte Folded Reload
; NOLSE-NEXT:    ldr x11, [sp, #16] // 8-byte Folded Reload
; NOLSE-NEXT:    mov w8, w9
; NOLSE-NEXT:    mvn w10, w8
; NOLSE-NEXT:    // implicit-def: $x8
; NOLSE-NEXT:    mov w8, w10
; NOLSE-NEXT:    orr x12, x8, #0xfffffffffffffffe
; NOLSE-NEXT:  .LBB8_2: // %atomicrmw.start
; NOLSE-NEXT:    // Parent Loop BB8_1 Depth=1
; NOLSE-NEXT:    // => This Inner Loop Header: Depth=2
; NOLSE-NEXT:    ldaxr x8, [x11]
; NOLSE-NEXT:    cmp x8, x9
; NOLSE-NEXT:    b.ne .LBB8_4
; NOLSE-NEXT:  // %bb.3: // %atomicrmw.start
; NOLSE-NEXT:    // in Loop: Header=BB8_2 Depth=2
; NOLSE-NEXT:    stlxr w10, x12, [x11]
; NOLSE-NEXT:    cbnz w10, .LBB8_2
; NOLSE-NEXT:  .LBB8_4: // %atomicrmw.start
; NOLSE-NEXT:    // in Loop: Header=BB8_1 Depth=1
; NOLSE-NEXT:    subs x9, x8, x9
; NOLSE-NEXT:    cset w9, eq
; NOLSE-NEXT:    str x8, [sp, #8] // 8-byte Folded Spill
; NOLSE-NEXT:    subs w9, w9, #1
; NOLSE-NEXT:    str x8, [sp, #24] // 8-byte Folded Spill
; NOLSE-NEXT:    b.ne .LBB8_1
; NOLSE-NEXT:    b .LBB8_5
; NOLSE-NEXT:  .LBB8_5: // %atomicrmw.end
; NOLSE-NEXT:    ldr x0, [sp, #8] // 8-byte Folded Reload
; NOLSE-NEXT:    add sp, sp, #32
; NOLSE-NEXT:    ret
;
; LSE-LABEL: test_rmw_nand_64:
; LSE:       // %bb.0: // %entry
; LSE-NEXT:    sub sp, sp, #32
; LSE-NEXT:    .cfi_def_cfa_offset 32
; LSE-NEXT:    str x0, [sp, #16] // 8-byte Folded Spill
; LSE-NEXT:    ldr x8, [x0]
; LSE-NEXT:    str x8, [sp, #24] // 8-byte Folded Spill
; LSE-NEXT:    b .LBB8_1
; LSE-NEXT:  .LBB8_1: // %atomicrmw.start
; LSE-NEXT:    // =>This Inner Loop Header: Depth=1
; LSE-NEXT:    ldr x9, [sp, #24] // 8-byte Folded Reload
; LSE-NEXT:    ldr x11, [sp, #16] // 8-byte Folded Reload
; LSE-NEXT:    mov w8, w9
; LSE-NEXT:    mvn w10, w8
; LSE-NEXT:    // implicit-def: $x8
; LSE-NEXT:    mov w8, w10
; LSE-NEXT:    orr x10, x8, #0xfffffffffffffffe
; LSE-NEXT:    mov x8, x9
; LSE-NEXT:    casal x8, x10, [x11]
; LSE-NEXT:    subs x9, x8, x9
; LSE-NEXT:    cset w9, eq
; LSE-NEXT:    str x8, [sp, #8] // 8-byte Folded Spill
; LSE-NEXT:    subs w9, w9, #1
; LSE-NEXT:    str x8, [sp, #24] // 8-byte Folded Spill
; LSE-NEXT:    b.ne .LBB8_1
; LSE-NEXT:    b .LBB8_2
; LSE-NEXT:  .LBB8_2: // %atomicrmw.end
; LSE-NEXT:    ldr x0, [sp, #8] // 8-byte Folded Reload
; LSE-NEXT:    add sp, sp, #32
; LSE-NEXT:    ret
entry:
  %res = atomicrmw nand i64* %dst, i64 1 seq_cst
  ret i64 %res
}

define i128 @test_rmw_nand_128(i128* %dst)   {
; NOLSE-LABEL: test_rmw_nand_128:
; NOLSE:       // %bb.0: // %entry
; NOLSE-NEXT:    sub sp, sp, #48
; NOLSE-NEXT:    .cfi_def_cfa_offset 48
; NOLSE-NEXT:    str x0, [sp, #24] // 8-byte Folded Spill
; NOLSE-NEXT:    ldr x8, [x0, #8]
; NOLSE-NEXT:    ldr x9, [x0]
; NOLSE-NEXT:    str x9, [sp, #32] // 8-byte Folded Spill
; NOLSE-NEXT:    str x8, [sp, #40] // 8-byte Folded Spill
; NOLSE-NEXT:    b .LBB9_1
; NOLSE-NEXT:  .LBB9_1: // %atomicrmw.start
; NOLSE-NEXT:    // =>This Loop Header: Depth=1
; NOLSE-NEXT:    // Child Loop BB9_2 Depth 2
; NOLSE-NEXT:    ldr x11, [sp, #40] // 8-byte Folded Reload
; NOLSE-NEXT:    ldr x8, [sp, #32] // 8-byte Folded Reload
; NOLSE-NEXT:    ldr x13, [sp, #24] // 8-byte Folded Reload
; NOLSE-NEXT:    mov w9, w8
; NOLSE-NEXT:    mvn w10, w9
; NOLSE-NEXT:    // implicit-def: $x9
; NOLSE-NEXT:    mov w9, w10
; NOLSE-NEXT:    orr x14, x9, #0xfffffffffffffffe
; NOLSE-NEXT:    mov x15, #-1
; NOLSE-NEXT:  .LBB9_2: // %atomicrmw.start
; NOLSE-NEXT:    // Parent Loop BB9_1 Depth=1
; NOLSE-NEXT:    // => This Inner Loop Header: Depth=2
; NOLSE-NEXT:    ldaxp x10, x9, [x13]
; NOLSE-NEXT:    cmp x10, x8
; NOLSE-NEXT:    cset w12, ne
; NOLSE-NEXT:    cmp x9, x11
; NOLSE-NEXT:    cinc w12, w12, ne
; NOLSE-NEXT:    cbnz w12, .LBB9_4
; NOLSE-NEXT:  // %bb.3: // %atomicrmw.start
; NOLSE-NEXT:    // in Loop: Header=BB9_2 Depth=2
; NOLSE-NEXT:    stlxp w12, x14, x15, [x13]
; NOLSE-NEXT:    cbnz w12, .LBB9_2
; NOLSE-NEXT:    b .LBB9_5
; NOLSE-NEXT:  .LBB9_4: // %atomicrmw.start
; NOLSE-NEXT:    // in Loop: Header=BB9_2 Depth=2
; NOLSE-NEXT:    stlxp w12, x10, x9, [x13]
; NOLSE-NEXT:    cbnz w12, .LBB9_2
; NOLSE-NEXT:  .LBB9_5: // %atomicrmw.start
; NOLSE-NEXT:    // in Loop: Header=BB9_1 Depth=1
; NOLSE-NEXT:    eor x11, x9, x11
; NOLSE-NEXT:    eor x8, x10, x8
; NOLSE-NEXT:    orr x8, x8, x11
; NOLSE-NEXT:    str x9, [sp, #8] // 8-byte Folded Spill
; NOLSE-NEXT:    str x10, [sp, #16] // 8-byte Folded Spill
; NOLSE-NEXT:    str x10, [sp, #32] // 8-byte Folded Spill
; NOLSE-NEXT:    str x9, [sp, #40] // 8-byte Folded Spill
; NOLSE-NEXT:    cbnz x8, .LBB9_1
; NOLSE-NEXT:    b .LBB9_6
; NOLSE-NEXT:  .LBB9_6: // %atomicrmw.end
; NOLSE-NEXT:    ldr x1, [sp, #8] // 8-byte Folded Reload
; NOLSE-NEXT:    ldr x0, [sp, #16] // 8-byte Folded Reload
; NOLSE-NEXT:    add sp, sp, #48
; NOLSE-NEXT:    ret
;
; LSE-LABEL: test_rmw_nand_128:
; LSE:       // %bb.0: // %entry
; LSE-NEXT:    sub sp, sp, #48
; LSE-NEXT:    .cfi_def_cfa_offset 48
; LSE-NEXT:    str x0, [sp, #24] // 8-byte Folded Spill
; LSE-NEXT:    ldr x8, [x0, #8]
; LSE-NEXT:    ldr x9, [x0]
; LSE-NEXT:    str x9, [sp, #32] // 8-byte Folded Spill
; LSE-NEXT:    str x8, [sp, #40] // 8-byte Folded Spill
; LSE-NEXT:    b .LBB9_1
; LSE-NEXT:  .LBB9_1: // %atomicrmw.start
; LSE-NEXT:    // =>This Inner Loop Header: Depth=1
; LSE-NEXT:    ldr x10, [sp, #40] // 8-byte Folded Reload
; LSE-NEXT:    ldr x8, [sp, #32] // 8-byte Folded Reload
; LSE-NEXT:    ldr x9, [sp, #24] // 8-byte Folded Reload
; LSE-NEXT:    mov x0, x8
; LSE-NEXT:    mov x1, x10
; LSE-NEXT:    mov w11, w8
; LSE-NEXT:    mvn w12, w11
; LSE-NEXT:    // implicit-def: $x11
; LSE-NEXT:    mov w11, w12
; LSE-NEXT:    orr x2, x11, #0xfffffffffffffffe
; LSE-NEXT:    mov x11, #-1
; LSE-NEXT:    // kill: def $x2 killed $x2 def $x2_x3
; LSE-NEXT:    mov x3, x11
; LSE-NEXT:    caspal x0, x1, x2, x3, [x9]
; LSE-NEXT:    mov x9, x1
; LSE-NEXT:    str x9, [sp, #8] // 8-byte Folded Spill
; LSE-NEXT:    eor x11, x9, x10
; LSE-NEXT:    mov x10, x0
; LSE-NEXT:    str x10, [sp, #16] // 8-byte Folded Spill
; LSE-NEXT:    eor x8, x10, x8
; LSE-NEXT:    orr x8, x8, x11
; LSE-NEXT:    str x10, [sp, #32] // 8-byte Folded Spill
; LSE-NEXT:    str x9, [sp, #40] // 8-byte Folded Spill
; LSE-NEXT:    cbnz x8, .LBB9_1
; LSE-NEXT:    b .LBB9_2
; LSE-NEXT:  .LBB9_2: // %atomicrmw.end
; LSE-NEXT:    ldr x1, [sp, #8] // 8-byte Folded Reload
; LSE-NEXT:    ldr x0, [sp, #16] // 8-byte Folded Reload
; LSE-NEXT:    add sp, sp, #48
; LSE-NEXT:    ret
entry:
  %res = atomicrmw nand i128* %dst, i128 1 seq_cst
  ret i128 %res
}
