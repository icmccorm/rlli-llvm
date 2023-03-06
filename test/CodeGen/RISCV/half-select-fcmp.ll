; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+zfh -verify-machineinstrs \
; RUN:   -target-abi ilp32f < %s | FileCheck %s
; RUN: llc -mtriple=riscv64 -mattr=+zfh -verify-machineinstrs \
; RUN:   -target-abi lp64f < %s | FileCheck %s

define half @select_fcmp_false(half %a, half %b) nounwind {
; CHECK-LABEL: select_fcmp_false:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fmv.h fa0, fa1
; CHECK-NEXT:    ret
  %1 = fcmp false half %a, %b
  %2 = select i1 %1, half %a, half %b
  ret half %2
}

define half @select_fcmp_oeq(half %a, half %b) nounwind {
; CHECK-LABEL: select_fcmp_oeq:
; CHECK:       # %bb.0:
; CHECK-NEXT:    feq.h a0, fa0, fa1
; CHECK-NEXT:    bnez a0, .LBB1_2
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    fmv.h fa0, fa1
; CHECK-NEXT:  .LBB1_2:
; CHECK-NEXT:    ret
  %1 = fcmp oeq half %a, %b
  %2 = select i1 %1, half %a, half %b
  ret half %2
}

define half @select_fcmp_ogt(half %a, half %b) nounwind {
; CHECK-LABEL: select_fcmp_ogt:
; CHECK:       # %bb.0:
; CHECK-NEXT:    flt.h a0, fa1, fa0
; CHECK-NEXT:    bnez a0, .LBB2_2
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    fmv.h fa0, fa1
; CHECK-NEXT:  .LBB2_2:
; CHECK-NEXT:    ret
  %1 = fcmp ogt half %a, %b
  %2 = select i1 %1, half %a, half %b
  ret half %2
}

define half @select_fcmp_oge(half %a, half %b) nounwind {
; CHECK-LABEL: select_fcmp_oge:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fle.h a0, fa1, fa0
; CHECK-NEXT:    bnez a0, .LBB3_2
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    fmv.h fa0, fa1
; CHECK-NEXT:  .LBB3_2:
; CHECK-NEXT:    ret
  %1 = fcmp oge half %a, %b
  %2 = select i1 %1, half %a, half %b
  ret half %2
}

define half @select_fcmp_olt(half %a, half %b) nounwind {
; CHECK-LABEL: select_fcmp_olt:
; CHECK:       # %bb.0:
; CHECK-NEXT:    flt.h a0, fa0, fa1
; CHECK-NEXT:    bnez a0, .LBB4_2
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    fmv.h fa0, fa1
; CHECK-NEXT:  .LBB4_2:
; CHECK-NEXT:    ret
  %1 = fcmp olt half %a, %b
  %2 = select i1 %1, half %a, half %b
  ret half %2
}

define half @select_fcmp_ole(half %a, half %b) nounwind {
; CHECK-LABEL: select_fcmp_ole:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fle.h a0, fa0, fa1
; CHECK-NEXT:    bnez a0, .LBB5_2
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    fmv.h fa0, fa1
; CHECK-NEXT:  .LBB5_2:
; CHECK-NEXT:    ret
  %1 = fcmp ole half %a, %b
  %2 = select i1 %1, half %a, half %b
  ret half %2
}

define half @select_fcmp_one(half %a, half %b) nounwind {
; CHECK-LABEL: select_fcmp_one:
; CHECK:       # %bb.0:
; CHECK-NEXT:    flt.h a0, fa0, fa1
; CHECK-NEXT:    flt.h a1, fa1, fa0
; CHECK-NEXT:    or a0, a1, a0
; CHECK-NEXT:    bnez a0, .LBB6_2
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    fmv.h fa0, fa1
; CHECK-NEXT:  .LBB6_2:
; CHECK-NEXT:    ret
  %1 = fcmp one half %a, %b
  %2 = select i1 %1, half %a, half %b
  ret half %2
}

define half @select_fcmp_ord(half %a, half %b) nounwind {
; CHECK-LABEL: select_fcmp_ord:
; CHECK:       # %bb.0:
; CHECK-NEXT:    feq.h a0, fa1, fa1
; CHECK-NEXT:    feq.h a1, fa0, fa0
; CHECK-NEXT:    and a0, a1, a0
; CHECK-NEXT:    bnez a0, .LBB7_2
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    fmv.h fa0, fa1
; CHECK-NEXT:  .LBB7_2:
; CHECK-NEXT:    ret
  %1 = fcmp ord half %a, %b
  %2 = select i1 %1, half %a, half %b
  ret half %2
}

define half @select_fcmp_ueq(half %a, half %b) nounwind {
; CHECK-LABEL: select_fcmp_ueq:
; CHECK:       # %bb.0:
; CHECK-NEXT:    flt.h a0, fa0, fa1
; CHECK-NEXT:    flt.h a1, fa1, fa0
; CHECK-NEXT:    or a0, a1, a0
; CHECK-NEXT:    beqz a0, .LBB8_2
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    fmv.h fa0, fa1
; CHECK-NEXT:  .LBB8_2:
; CHECK-NEXT:    ret
  %1 = fcmp ueq half %a, %b
  %2 = select i1 %1, half %a, half %b
  ret half %2
}

define half @select_fcmp_ugt(half %a, half %b) nounwind {
; CHECK-LABEL: select_fcmp_ugt:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fle.h a0, fa0, fa1
; CHECK-NEXT:    beqz a0, .LBB9_2
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    fmv.h fa0, fa1
; CHECK-NEXT:  .LBB9_2:
; CHECK-NEXT:    ret
  %1 = fcmp ugt half %a, %b
  %2 = select i1 %1, half %a, half %b
  ret half %2
}

define half @select_fcmp_uge(half %a, half %b) nounwind {
; CHECK-LABEL: select_fcmp_uge:
; CHECK:       # %bb.0:
; CHECK-NEXT:    flt.h a0, fa0, fa1
; CHECK-NEXT:    beqz a0, .LBB10_2
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    fmv.h fa0, fa1
; CHECK-NEXT:  .LBB10_2:
; CHECK-NEXT:    ret
  %1 = fcmp uge half %a, %b
  %2 = select i1 %1, half %a, half %b
  ret half %2
}

define half @select_fcmp_ult(half %a, half %b) nounwind {
; CHECK-LABEL: select_fcmp_ult:
; CHECK:       # %bb.0:
; CHECK-NEXT:    fle.h a0, fa1, fa0
; CHECK-NEXT:    beqz a0, .LBB11_2
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    fmv.h fa0, fa1
; CHECK-NEXT:  .LBB11_2:
; CHECK-NEXT:    ret
  %1 = fcmp ult half %a, %b
  %2 = select i1 %1, half %a, half %b
  ret half %2
}

define half @select_fcmp_ule(half %a, half %b) nounwind {
; CHECK-LABEL: select_fcmp_ule:
; CHECK:       # %bb.0:
; CHECK-NEXT:    flt.h a0, fa1, fa0
; CHECK-NEXT:    beqz a0, .LBB12_2
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    fmv.h fa0, fa1
; CHECK-NEXT:  .LBB12_2:
; CHECK-NEXT:    ret
  %1 = fcmp ule half %a, %b
  %2 = select i1 %1, half %a, half %b
  ret half %2
}

define half @select_fcmp_une(half %a, half %b) nounwind {
; CHECK-LABEL: select_fcmp_une:
; CHECK:       # %bb.0:
; CHECK-NEXT:    feq.h a0, fa0, fa1
; CHECK-NEXT:    beqz a0, .LBB13_2
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    fmv.h fa0, fa1
; CHECK-NEXT:  .LBB13_2:
; CHECK-NEXT:    ret
  %1 = fcmp une half %a, %b
  %2 = select i1 %1, half %a, half %b
  ret half %2
}

define half @select_fcmp_uno(half %a, half %b) nounwind {
; CHECK-LABEL: select_fcmp_uno:
; CHECK:       # %bb.0:
; CHECK-NEXT:    feq.h a0, fa1, fa1
; CHECK-NEXT:    feq.h a1, fa0, fa0
; CHECK-NEXT:    and a0, a1, a0
; CHECK-NEXT:    beqz a0, .LBB14_2
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    fmv.h fa0, fa1
; CHECK-NEXT:  .LBB14_2:
; CHECK-NEXT:    ret
  %1 = fcmp uno half %a, %b
  %2 = select i1 %1, half %a, half %b
  ret half %2
}

define half @select_fcmp_true(half %a, half %b) nounwind {
; CHECK-LABEL: select_fcmp_true:
; CHECK:       # %bb.0:
; CHECK-NEXT:    ret
  %1 = fcmp true half %a, %b
  %2 = select i1 %1, half %a, half %b
  ret half %2
}

; Ensure that ISel succeeds for a select+fcmp that has an i32 result type.
define i32 @i32_select_fcmp_oeq(half %a, half %b, i32 %c, i32 %d) nounwind {
; CHECK-LABEL: i32_select_fcmp_oeq:
; CHECK:       # %bb.0:
; CHECK-NEXT:    feq.h a2, fa0, fa1
; CHECK-NEXT:    bnez a2, .LBB16_2
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    mv a0, a1
; CHECK-NEXT:  .LBB16_2:
; CHECK-NEXT:    ret
  %1 = fcmp oeq half %a, %b
  %2 = select i1 %1, i32 %c, i32 %d
  ret i32 %2
}
