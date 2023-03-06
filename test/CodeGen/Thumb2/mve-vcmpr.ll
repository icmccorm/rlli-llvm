; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=thumbv8.1m.main-none-none-eabi -mattr=+mve -verify-machineinstrs %s -o - | FileCheck %s

define arm_aapcs_vfpcc <4 x i32> @vcmp_eq_v4i32(<4 x i32> %src, i32 %src2, <4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: vcmp_eq_v4i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.i32 eq, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <4 x i32> undef, i32 %src2, i32 0
  %sp = shufflevector <4 x i32> %i, <4 x i32> undef, <4 x i32> zeroinitializer
  %c = icmp eq <4 x i32> %src, %sp
  %s = select <4 x i1> %c, <4 x i32> %a, <4 x i32> %b
  ret <4 x i32> %s
}

define arm_aapcs_vfpcc <4 x i32> @vcmp_ne_v4i32(<4 x i32> %src, i32 %src2, <4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: vcmp_ne_v4i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.i32 ne, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <4 x i32> undef, i32 %src2, i32 0
  %sp = shufflevector <4 x i32> %i, <4 x i32> undef, <4 x i32> zeroinitializer
  %c = icmp ne <4 x i32> %src, %sp
  %s = select <4 x i1> %c, <4 x i32> %a, <4 x i32> %b
  ret <4 x i32> %s
}

define arm_aapcs_vfpcc <4 x i32> @vcmp_sgt_v4i32(<4 x i32> %src, i32 %src2, <4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: vcmp_sgt_v4i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.s32 gt, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <4 x i32> undef, i32 %src2, i32 0
  %sp = shufflevector <4 x i32> %i, <4 x i32> undef, <4 x i32> zeroinitializer
  %c = icmp sgt <4 x i32> %src, %sp
  %s = select <4 x i1> %c, <4 x i32> %a, <4 x i32> %b
  ret <4 x i32> %s
}

define arm_aapcs_vfpcc <4 x i32> @vcmp_sge_v4i32(<4 x i32> %src, i32 %src2, <4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: vcmp_sge_v4i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.s32 ge, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <4 x i32> undef, i32 %src2, i32 0
  %sp = shufflevector <4 x i32> %i, <4 x i32> undef, <4 x i32> zeroinitializer
  %c = icmp sge <4 x i32> %src, %sp
  %s = select <4 x i1> %c, <4 x i32> %a, <4 x i32> %b
  ret <4 x i32> %s
}

define arm_aapcs_vfpcc <4 x i32> @vcmp_slt_v4i32(<4 x i32> %src, i32 %src2, <4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: vcmp_slt_v4i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.s32 lt, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <4 x i32> undef, i32 %src2, i32 0
  %sp = shufflevector <4 x i32> %i, <4 x i32> undef, <4 x i32> zeroinitializer
  %c = icmp slt <4 x i32> %src, %sp
  %s = select <4 x i1> %c, <4 x i32> %a, <4 x i32> %b
  ret <4 x i32> %s
}

define arm_aapcs_vfpcc <4 x i32> @vcmp_sle_v4i32(<4 x i32> %src, i32 %src2, <4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: vcmp_sle_v4i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.s32 le, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <4 x i32> undef, i32 %src2, i32 0
  %sp = shufflevector <4 x i32> %i, <4 x i32> undef, <4 x i32> zeroinitializer
  %c = icmp sle <4 x i32> %src, %sp
  %s = select <4 x i1> %c, <4 x i32> %a, <4 x i32> %b
  ret <4 x i32> %s
}

define arm_aapcs_vfpcc <4 x i32> @vcmp_ugt_v4i32(<4 x i32> %src, i32 %src2, <4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: vcmp_ugt_v4i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.u32 hi, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <4 x i32> undef, i32 %src2, i32 0
  %sp = shufflevector <4 x i32> %i, <4 x i32> undef, <4 x i32> zeroinitializer
  %c = icmp ugt <4 x i32> %src, %sp
  %s = select <4 x i1> %c, <4 x i32> %a, <4 x i32> %b
  ret <4 x i32> %s
}

define arm_aapcs_vfpcc <4 x i32> @vcmp_uge_v4i32(<4 x i32> %src, i32 %src2, <4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: vcmp_uge_v4i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.u32 cs, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <4 x i32> undef, i32 %src2, i32 0
  %sp = shufflevector <4 x i32> %i, <4 x i32> undef, <4 x i32> zeroinitializer
  %c = icmp uge <4 x i32> %src, %sp
  %s = select <4 x i1> %c, <4 x i32> %a, <4 x i32> %b
  ret <4 x i32> %s
}

define arm_aapcs_vfpcc <4 x i32> @vcmp_ult_v4i32(<4 x i32> %src, i32 %src2, <4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: vcmp_ult_v4i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vdup.32 q3, r0
; CHECK-NEXT:    vcmp.u32 hi, q3, q0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <4 x i32> undef, i32 %src2, i32 0
  %sp = shufflevector <4 x i32> %i, <4 x i32> undef, <4 x i32> zeroinitializer
  %c = icmp ult <4 x i32> %src, %sp
  %s = select <4 x i1> %c, <4 x i32> %a, <4 x i32> %b
  ret <4 x i32> %s
}

define arm_aapcs_vfpcc <4 x i32> @vcmp_ule_v4i32(<4 x i32> %src, i32 %src2, <4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: vcmp_ule_v4i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vdup.32 q3, r0
; CHECK-NEXT:    vcmp.u32 cs, q3, q0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <4 x i32> undef, i32 %src2, i32 0
  %sp = shufflevector <4 x i32> %i, <4 x i32> undef, <4 x i32> zeroinitializer
  %c = icmp ule <4 x i32> %src, %sp
  %s = select <4 x i1> %c, <4 x i32> %a, <4 x i32> %b
  ret <4 x i32> %s
}


define arm_aapcs_vfpcc <8 x i16> @vcmp_eq_v8i16(<8 x i16> %src, i16 %src2, <8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: vcmp_eq_v8i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.i16 eq, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <8 x i16> undef, i16 %src2, i32 0
  %sp = shufflevector <8 x i16> %i, <8 x i16> undef, <8 x i32> zeroinitializer
  %c = icmp eq <8 x i16> %src, %sp
  %s = select <8 x i1> %c, <8 x i16> %a, <8 x i16> %b
  ret <8 x i16> %s
}

define arm_aapcs_vfpcc <8 x i16> @vcmp_ne_v8i16(<8 x i16> %src, i16 %src2, <8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: vcmp_ne_v8i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.i16 ne, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <8 x i16> undef, i16 %src2, i32 0
  %sp = shufflevector <8 x i16> %i, <8 x i16> undef, <8 x i32> zeroinitializer
  %c = icmp ne <8 x i16> %src, %sp
  %s = select <8 x i1> %c, <8 x i16> %a, <8 x i16> %b
  ret <8 x i16> %s
}

define arm_aapcs_vfpcc <8 x i16> @vcmp_sgt_v8i16(<8 x i16> %src, i16 %src2, <8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: vcmp_sgt_v8i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.s16 gt, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <8 x i16> undef, i16 %src2, i32 0
  %sp = shufflevector <8 x i16> %i, <8 x i16> undef, <8 x i32> zeroinitializer
  %c = icmp sgt <8 x i16> %src, %sp
  %s = select <8 x i1> %c, <8 x i16> %a, <8 x i16> %b
  ret <8 x i16> %s
}

define arm_aapcs_vfpcc <8 x i16> @vcmp_sge_v8i16(<8 x i16> %src, i16 %src2, <8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: vcmp_sge_v8i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.s16 ge, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <8 x i16> undef, i16 %src2, i32 0
  %sp = shufflevector <8 x i16> %i, <8 x i16> undef, <8 x i32> zeroinitializer
  %c = icmp sge <8 x i16> %src, %sp
  %s = select <8 x i1> %c, <8 x i16> %a, <8 x i16> %b
  ret <8 x i16> %s
}

define arm_aapcs_vfpcc <8 x i16> @vcmp_slt_v8i16(<8 x i16> %src, i16 %src2, <8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: vcmp_slt_v8i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.s16 lt, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <8 x i16> undef, i16 %src2, i32 0
  %sp = shufflevector <8 x i16> %i, <8 x i16> undef, <8 x i32> zeroinitializer
  %c = icmp slt <8 x i16> %src, %sp
  %s = select <8 x i1> %c, <8 x i16> %a, <8 x i16> %b
  ret <8 x i16> %s
}

define arm_aapcs_vfpcc <8 x i16> @vcmp_sle_v8i16(<8 x i16> %src, i16 %src2, <8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: vcmp_sle_v8i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.s16 le, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <8 x i16> undef, i16 %src2, i32 0
  %sp = shufflevector <8 x i16> %i, <8 x i16> undef, <8 x i32> zeroinitializer
  %c = icmp sle <8 x i16> %src, %sp
  %s = select <8 x i1> %c, <8 x i16> %a, <8 x i16> %b
  ret <8 x i16> %s
}

define arm_aapcs_vfpcc <8 x i16> @vcmp_ugt_v8i16(<8 x i16> %src, i16 %src2, <8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: vcmp_ugt_v8i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.u16 hi, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <8 x i16> undef, i16 %src2, i32 0
  %sp = shufflevector <8 x i16> %i, <8 x i16> undef, <8 x i32> zeroinitializer
  %c = icmp ugt <8 x i16> %src, %sp
  %s = select <8 x i1> %c, <8 x i16> %a, <8 x i16> %b
  ret <8 x i16> %s
}

define arm_aapcs_vfpcc <8 x i16> @vcmp_uge_v8i16(<8 x i16> %src, i16 %src2, <8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: vcmp_uge_v8i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.u16 cs, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <8 x i16> undef, i16 %src2, i32 0
  %sp = shufflevector <8 x i16> %i, <8 x i16> undef, <8 x i32> zeroinitializer
  %c = icmp uge <8 x i16> %src, %sp
  %s = select <8 x i1> %c, <8 x i16> %a, <8 x i16> %b
  ret <8 x i16> %s
}

define arm_aapcs_vfpcc <8 x i16> @vcmp_ult_v8i16(<8 x i16> %src, i16 %src2, <8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: vcmp_ult_v8i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vdup.16 q3, r0
; CHECK-NEXT:    vcmp.u16 hi, q3, q0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <8 x i16> undef, i16 %src2, i32 0
  %sp = shufflevector <8 x i16> %i, <8 x i16> undef, <8 x i32> zeroinitializer
  %c = icmp ult <8 x i16> %src, %sp
  %s = select <8 x i1> %c, <8 x i16> %a, <8 x i16> %b
  ret <8 x i16> %s
}

define arm_aapcs_vfpcc <8 x i16> @vcmp_ule_v8i16(<8 x i16> %src, i16 %src2, <8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: vcmp_ule_v8i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vdup.16 q3, r0
; CHECK-NEXT:    vcmp.u16 cs, q3, q0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <8 x i16> undef, i16 %src2, i32 0
  %sp = shufflevector <8 x i16> %i, <8 x i16> undef, <8 x i32> zeroinitializer
  %c = icmp ule <8 x i16> %src, %sp
  %s = select <8 x i1> %c, <8 x i16> %a, <8 x i16> %b
  ret <8 x i16> %s
}


define arm_aapcs_vfpcc <16 x i8> @vcmp_eq_v16i8(<16 x i8> %src, i8 %src2, <16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: vcmp_eq_v16i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.i8 eq, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <16 x i8> undef, i8 %src2, i32 0
  %sp = shufflevector <16 x i8> %i, <16 x i8> undef, <16 x i32> zeroinitializer
  %c = icmp eq <16 x i8> %src, %sp
  %s = select <16 x i1> %c, <16 x i8> %a, <16 x i8> %b
  ret <16 x i8> %s
}

define arm_aapcs_vfpcc <16 x i8> @vcmp_ne_v16i8(<16 x i8> %src, i8 %src2, <16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: vcmp_ne_v16i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.i8 ne, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <16 x i8> undef, i8 %src2, i32 0
  %sp = shufflevector <16 x i8> %i, <16 x i8> undef, <16 x i32> zeroinitializer
  %c = icmp ne <16 x i8> %src, %sp
  %s = select <16 x i1> %c, <16 x i8> %a, <16 x i8> %b
  ret <16 x i8> %s
}

define arm_aapcs_vfpcc <16 x i8> @vcmp_sgt_v16i8(<16 x i8> %src, i8 %src2, <16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: vcmp_sgt_v16i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.s8 gt, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <16 x i8> undef, i8 %src2, i32 0
  %sp = shufflevector <16 x i8> %i, <16 x i8> undef, <16 x i32> zeroinitializer
  %c = icmp sgt <16 x i8> %src, %sp
  %s = select <16 x i1> %c, <16 x i8> %a, <16 x i8> %b
  ret <16 x i8> %s
}

define arm_aapcs_vfpcc <16 x i8> @vcmp_sge_v16i8(<16 x i8> %src, i8 %src2, <16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: vcmp_sge_v16i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.s8 ge, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <16 x i8> undef, i8 %src2, i32 0
  %sp = shufflevector <16 x i8> %i, <16 x i8> undef, <16 x i32> zeroinitializer
  %c = icmp sge <16 x i8> %src, %sp
  %s = select <16 x i1> %c, <16 x i8> %a, <16 x i8> %b
  ret <16 x i8> %s
}

define arm_aapcs_vfpcc <16 x i8> @vcmp_slt_v16i8(<16 x i8> %src, i8 %src2, <16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: vcmp_slt_v16i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.s8 lt, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <16 x i8> undef, i8 %src2, i32 0
  %sp = shufflevector <16 x i8> %i, <16 x i8> undef, <16 x i32> zeroinitializer
  %c = icmp slt <16 x i8> %src, %sp
  %s = select <16 x i1> %c, <16 x i8> %a, <16 x i8> %b
  ret <16 x i8> %s
}

define arm_aapcs_vfpcc <16 x i8> @vcmp_sle_v16i8(<16 x i8> %src, i8 %src2, <16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: vcmp_sle_v16i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.s8 le, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <16 x i8> undef, i8 %src2, i32 0
  %sp = shufflevector <16 x i8> %i, <16 x i8> undef, <16 x i32> zeroinitializer
  %c = icmp sle <16 x i8> %src, %sp
  %s = select <16 x i1> %c, <16 x i8> %a, <16 x i8> %b
  ret <16 x i8> %s
}

define arm_aapcs_vfpcc <16 x i8> @vcmp_ugt_v16i8(<16 x i8> %src, i8 %src2, <16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: vcmp_ugt_v16i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.u8 hi, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <16 x i8> undef, i8 %src2, i32 0
  %sp = shufflevector <16 x i8> %i, <16 x i8> undef, <16 x i32> zeroinitializer
  %c = icmp ugt <16 x i8> %src, %sp
  %s = select <16 x i1> %c, <16 x i8> %a, <16 x i8> %b
  ret <16 x i8> %s
}

define arm_aapcs_vfpcc <16 x i8> @vcmp_uge_v16i8(<16 x i8> %src, i8 %src2, <16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: vcmp_uge_v16i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.u8 cs, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <16 x i8> undef, i8 %src2, i32 0
  %sp = shufflevector <16 x i8> %i, <16 x i8> undef, <16 x i32> zeroinitializer
  %c = icmp uge <16 x i8> %src, %sp
  %s = select <16 x i1> %c, <16 x i8> %a, <16 x i8> %b
  ret <16 x i8> %s
}

define arm_aapcs_vfpcc <16 x i8> @vcmp_ult_v16i8(<16 x i8> %src, i8 %src2, <16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: vcmp_ult_v16i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vdup.8 q3, r0
; CHECK-NEXT:    vcmp.u8 hi, q3, q0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <16 x i8> undef, i8 %src2, i32 0
  %sp = shufflevector <16 x i8> %i, <16 x i8> undef, <16 x i32> zeroinitializer
  %c = icmp ult <16 x i8> %src, %sp
  %s = select <16 x i1> %c, <16 x i8> %a, <16 x i8> %b
  ret <16 x i8> %s
}

define arm_aapcs_vfpcc <16 x i8> @vcmp_ule_v16i8(<16 x i8> %src, i8 %src2, <16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: vcmp_ule_v16i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vdup.8 q3, r0
; CHECK-NEXT:    vcmp.u8 cs, q3, q0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <16 x i8> undef, i8 %src2, i32 0
  %sp = shufflevector <16 x i8> %i, <16 x i8> undef, <16 x i32> zeroinitializer
  %c = icmp ule <16 x i8> %src, %sp
  %s = select <16 x i1> %c, <16 x i8> %a, <16 x i8> %b
  ret <16 x i8> %s
}


define arm_aapcs_vfpcc <2 x i64> @vcmp_eq_v2i64(<2 x i64> %src, i64 %src2, <2 x i64> %a, <2 x i64> %b) {
; CHECK-LABEL: vcmp_eq_v2i64:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov r2, r3, d0
; CHECK-NEXT:    eors r3, r1
; CHECK-NEXT:    eors r2, r0
; CHECK-NEXT:    orrs r2, r3
; CHECK-NEXT:    mov.w r3, #0
; CHECK-NEXT:    csetm r2, eq
; CHECK-NEXT:    bfi r3, r2, #0, #8
; CHECK-NEXT:    vmov r12, r2, d1
; CHECK-NEXT:    eors r1, r2
; CHECK-NEXT:    eor.w r0, r0, r12
; CHECK-NEXT:    orrs r0, r1
; CHECK-NEXT:    csetm r0, eq
; CHECK-NEXT:    bfi r3, r0, #8, #8
; CHECK-NEXT:    vmsr p0, r3
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <2 x i64> undef, i64 %src2, i32 0
  %sp = shufflevector <2 x i64> %i, <2 x i64> undef, <2 x i32> zeroinitializer
  %c = icmp eq <2 x i64> %src, %sp
  %s = select <2 x i1> %c, <2 x i64> %a, <2 x i64> %b
  ret <2 x i64> %s
}

define arm_aapcs_vfpcc <2 x i32> @vcmp_eq_v2i32(<2 x i64> %src, i64 %src2, <2 x i32> %a, <2 x i32> %b) {
; CHECK-LABEL: vcmp_eq_v2i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov r2, r3, d0
; CHECK-NEXT:    eors r3, r1
; CHECK-NEXT:    eors r2, r0
; CHECK-NEXT:    orrs r2, r3
; CHECK-NEXT:    mov.w r3, #0
; CHECK-NEXT:    csetm r2, eq
; CHECK-NEXT:    bfi r3, r2, #0, #8
; CHECK-NEXT:    vmov r12, r2, d1
; CHECK-NEXT:    eors r1, r2
; CHECK-NEXT:    eor.w r0, r0, r12
; CHECK-NEXT:    orrs r0, r1
; CHECK-NEXT:    csetm r0, eq
; CHECK-NEXT:    bfi r3, r0, #8, #8
; CHECK-NEXT:    vmsr p0, r3
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <2 x i64> undef, i64 %src2, i32 0
  %sp = shufflevector <2 x i64> %i, <2 x i64> undef, <2 x i32> zeroinitializer
  %c = icmp eq <2 x i64> %src, %sp
  %s = select <2 x i1> %c, <2 x i32> %a, <2 x i32> %b
  ret <2 x i32> %s
}

define arm_aapcs_vfpcc <2 x i32> @vcmp_multi_v2i32(<2 x i64> %a, <2 x i32> %b, <2 x i32> %c) {
; CHECK-LABEL: vcmp_multi_v2i32:
; CHECK:       @ %bb.0:
; CHECK-NEXT:    vmov r0, r1, d0
; CHECK-NEXT:    movs r2, #0
; CHECK-NEXT:    orrs r0, r1
; CHECK-NEXT:    csetm r1, eq
; CHECK-NEXT:    movs r0, #0
; CHECK-NEXT:    bfi r2, r1, #0, #8
; CHECK-NEXT:    vmov r1, r3, d1
; CHECK-NEXT:    vmov.i32 q0, #0x0
; CHECK-NEXT:    orrs r1, r3
; CHECK-NEXT:    vmov r3, s8
; CHECK-NEXT:    csetm r1, eq
; CHECK-NEXT:    bfi r2, r1, #8, #8
; CHECK-NEXT:    vmsr p0, r2
; CHECK-NEXT:    vpsel q0, q0, q2
; CHECK-NEXT:    vmov r1, s0
; CHECK-NEXT:    subs r2, r1, r3
; CHECK-NEXT:    asr.w r12, r1, #31
; CHECK-NEXT:    sbcs.w r2, r12, r3, asr #31
; CHECK-NEXT:    vmov r3, s4
; CHECK-NEXT:    cset r2, lt
; CHECK-NEXT:    cmp r1, #0
; CHECK-NEXT:    cset r1, ne
; CHECK-NEXT:    cmp r3, #0
; CHECK-NEXT:    cset r3, ne
; CHECK-NEXT:    ands r1, r3
; CHECK-NEXT:    vmov r3, s10
; CHECK-NEXT:    ands r1, r2
; CHECK-NEXT:    rsbs r1, r1, #0
; CHECK-NEXT:    bfi r0, r1, #0, #8
; CHECK-NEXT:    vmov r1, s2
; CHECK-NEXT:    subs r2, r1, r3
; CHECK-NEXT:    asr.w r12, r1, #31
; CHECK-NEXT:    sbcs.w r2, r12, r3, asr #31
; CHECK-NEXT:    vmov r3, s6
; CHECK-NEXT:    cset r2, lt
; CHECK-NEXT:    cmp r1, #0
; CHECK-NEXT:    cset r1, ne
; CHECK-NEXT:    cmp r3, #0
; CHECK-NEXT:    cset r3, ne
; CHECK-NEXT:    ands r1, r3
; CHECK-NEXT:    ands r1, r2
; CHECK-NEXT:    rsbs r1, r1, #0
; CHECK-NEXT:    bfi r0, r1, #8, #8
; CHECK-NEXT:    vmsr p0, r0
; CHECK-NEXT:    vpsel q0, q2, q0
; CHECK-NEXT:    bx lr
  %a4 = icmp eq <2 x i64> %a, zeroinitializer
  %a5 = select <2 x i1> %a4, <2 x i32> zeroinitializer, <2 x i32> %c
  %a6 = icmp ne <2 x i32> %b, zeroinitializer
  %a7 = icmp slt <2 x i32> %a5, %c
  %a8 = icmp ne <2 x i32> %a5, zeroinitializer
  %a9 = and <2 x i1> %a6, %a8
  %a10 = and <2 x i1> %a7, %a9
  %a11 = select <2 x i1> %a10, <2 x i32> %c, <2 x i32> %a5
  ret <2 x i32> %a11
}

; Reversed

define arm_aapcs_vfpcc <4 x i32> @vcmp_r_eq_v4i32(<4 x i32> %src, i32 %src2, <4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: vcmp_r_eq_v4i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.i32 eq, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <4 x i32> undef, i32 %src2, i32 0
  %sp = shufflevector <4 x i32> %i, <4 x i32> undef, <4 x i32> zeroinitializer
  %c = icmp eq <4 x i32> %sp, %src
  %s = select <4 x i1> %c, <4 x i32> %a, <4 x i32> %b
  ret <4 x i32> %s
}

define arm_aapcs_vfpcc <4 x i32> @vcmp_r_ne_v4i32(<4 x i32> %src, i32 %src2, <4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: vcmp_r_ne_v4i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.i32 ne, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <4 x i32> undef, i32 %src2, i32 0
  %sp = shufflevector <4 x i32> %i, <4 x i32> undef, <4 x i32> zeroinitializer
  %c = icmp ne <4 x i32> %sp, %src
  %s = select <4 x i1> %c, <4 x i32> %a, <4 x i32> %b
  ret <4 x i32> %s
}

define arm_aapcs_vfpcc <4 x i32> @vcmp_r_sgt_v4i32(<4 x i32> %src, i32 %src2, <4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: vcmp_r_sgt_v4i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.s32 lt, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <4 x i32> undef, i32 %src2, i32 0
  %sp = shufflevector <4 x i32> %i, <4 x i32> undef, <4 x i32> zeroinitializer
  %c = icmp sgt <4 x i32> %sp, %src
  %s = select <4 x i1> %c, <4 x i32> %a, <4 x i32> %b
  ret <4 x i32> %s
}

define arm_aapcs_vfpcc <4 x i32> @vcmp_r_sge_v4i32(<4 x i32> %src, i32 %src2, <4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: vcmp_r_sge_v4i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.s32 le, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <4 x i32> undef, i32 %src2, i32 0
  %sp = shufflevector <4 x i32> %i, <4 x i32> undef, <4 x i32> zeroinitializer
  %c = icmp sge <4 x i32> %sp, %src
  %s = select <4 x i1> %c, <4 x i32> %a, <4 x i32> %b
  ret <4 x i32> %s
}

define arm_aapcs_vfpcc <4 x i32> @vcmp_r_slt_v4i32(<4 x i32> %src, i32 %src2, <4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: vcmp_r_slt_v4i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.s32 gt, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <4 x i32> undef, i32 %src2, i32 0
  %sp = shufflevector <4 x i32> %i, <4 x i32> undef, <4 x i32> zeroinitializer
  %c = icmp slt <4 x i32> %sp, %src
  %s = select <4 x i1> %c, <4 x i32> %a, <4 x i32> %b
  ret <4 x i32> %s
}

define arm_aapcs_vfpcc <4 x i32> @vcmp_r_sle_v4i32(<4 x i32> %src, i32 %src2, <4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: vcmp_r_sle_v4i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.s32 ge, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <4 x i32> undef, i32 %src2, i32 0
  %sp = shufflevector <4 x i32> %i, <4 x i32> undef, <4 x i32> zeroinitializer
  %c = icmp sle <4 x i32> %sp, %src
  %s = select <4 x i1> %c, <4 x i32> %a, <4 x i32> %b
  ret <4 x i32> %s
}

define arm_aapcs_vfpcc <4 x i32> @vcmp_r_ugt_v4i32(<4 x i32> %src, i32 %src2, <4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: vcmp_r_ugt_v4i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vdup.32 q3, r0
; CHECK-NEXT:    vcmp.u32 hi, q3, q0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <4 x i32> undef, i32 %src2, i32 0
  %sp = shufflevector <4 x i32> %i, <4 x i32> undef, <4 x i32> zeroinitializer
  %c = icmp ugt <4 x i32> %sp, %src
  %s = select <4 x i1> %c, <4 x i32> %a, <4 x i32> %b
  ret <4 x i32> %s
}

define arm_aapcs_vfpcc <4 x i32> @vcmp_r_uge_v4i32(<4 x i32> %src, i32 %src2, <4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: vcmp_r_uge_v4i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vdup.32 q3, r0
; CHECK-NEXT:    vcmp.u32 cs, q3, q0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <4 x i32> undef, i32 %src2, i32 0
  %sp = shufflevector <4 x i32> %i, <4 x i32> undef, <4 x i32> zeroinitializer
  %c = icmp uge <4 x i32> %sp, %src
  %s = select <4 x i1> %c, <4 x i32> %a, <4 x i32> %b
  ret <4 x i32> %s
}

define arm_aapcs_vfpcc <4 x i32> @vcmp_r_ult_v4i32(<4 x i32> %src, i32 %src2, <4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: vcmp_r_ult_v4i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.u32 hi, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <4 x i32> undef, i32 %src2, i32 0
  %sp = shufflevector <4 x i32> %i, <4 x i32> undef, <4 x i32> zeroinitializer
  %c = icmp ult <4 x i32> %sp, %src
  %s = select <4 x i1> %c, <4 x i32> %a, <4 x i32> %b
  ret <4 x i32> %s
}

define arm_aapcs_vfpcc <4 x i32> @vcmp_r_ule_v4i32(<4 x i32> %src, i32 %src2, <4 x i32> %a, <4 x i32> %b) {
; CHECK-LABEL: vcmp_r_ule_v4i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.u32 cs, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <4 x i32> undef, i32 %src2, i32 0
  %sp = shufflevector <4 x i32> %i, <4 x i32> undef, <4 x i32> zeroinitializer
  %c = icmp ule <4 x i32> %sp, %src
  %s = select <4 x i1> %c, <4 x i32> %a, <4 x i32> %b
  ret <4 x i32> %s
}


define arm_aapcs_vfpcc <8 x i16> @vcmp_r_eq_v8i16(<8 x i16> %src, i16 %src2, <8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: vcmp_r_eq_v8i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.i16 eq, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <8 x i16> undef, i16 %src2, i32 0
  %sp = shufflevector <8 x i16> %i, <8 x i16> undef, <8 x i32> zeroinitializer
  %c = icmp eq <8 x i16> %sp, %src
  %s = select <8 x i1> %c, <8 x i16> %a, <8 x i16> %b
  ret <8 x i16> %s
}

define arm_aapcs_vfpcc <8 x i16> @vcmp_r_ne_v8i16(<8 x i16> %src, i16 %src2, <8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: vcmp_r_ne_v8i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.i16 ne, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <8 x i16> undef, i16 %src2, i32 0
  %sp = shufflevector <8 x i16> %i, <8 x i16> undef, <8 x i32> zeroinitializer
  %c = icmp ne <8 x i16> %sp, %src
  %s = select <8 x i1> %c, <8 x i16> %a, <8 x i16> %b
  ret <8 x i16> %s
}

define arm_aapcs_vfpcc <8 x i16> @vcmp_r_sgt_v8i16(<8 x i16> %src, i16 %src2, <8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: vcmp_r_sgt_v8i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.s16 lt, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <8 x i16> undef, i16 %src2, i32 0
  %sp = shufflevector <8 x i16> %i, <8 x i16> undef, <8 x i32> zeroinitializer
  %c = icmp sgt <8 x i16> %sp, %src
  %s = select <8 x i1> %c, <8 x i16> %a, <8 x i16> %b
  ret <8 x i16> %s
}

define arm_aapcs_vfpcc <8 x i16> @vcmp_r_sge_v8i16(<8 x i16> %src, i16 %src2, <8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: vcmp_r_sge_v8i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.s16 le, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <8 x i16> undef, i16 %src2, i32 0
  %sp = shufflevector <8 x i16> %i, <8 x i16> undef, <8 x i32> zeroinitializer
  %c = icmp sge <8 x i16> %sp, %src
  %s = select <8 x i1> %c, <8 x i16> %a, <8 x i16> %b
  ret <8 x i16> %s
}

define arm_aapcs_vfpcc <8 x i16> @vcmp_r_slt_v8i16(<8 x i16> %src, i16 %src2, <8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: vcmp_r_slt_v8i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.s16 gt, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <8 x i16> undef, i16 %src2, i32 0
  %sp = shufflevector <8 x i16> %i, <8 x i16> undef, <8 x i32> zeroinitializer
  %c = icmp slt <8 x i16> %sp, %src
  %s = select <8 x i1> %c, <8 x i16> %a, <8 x i16> %b
  ret <8 x i16> %s
}

define arm_aapcs_vfpcc <8 x i16> @vcmp_r_sle_v8i16(<8 x i16> %src, i16 %src2, <8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: vcmp_r_sle_v8i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.s16 ge, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <8 x i16> undef, i16 %src2, i32 0
  %sp = shufflevector <8 x i16> %i, <8 x i16> undef, <8 x i32> zeroinitializer
  %c = icmp sle <8 x i16> %sp, %src
  %s = select <8 x i1> %c, <8 x i16> %a, <8 x i16> %b
  ret <8 x i16> %s
}

define arm_aapcs_vfpcc <8 x i16> @vcmp_r_ugt_v8i16(<8 x i16> %src, i16 %src2, <8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: vcmp_r_ugt_v8i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vdup.16 q3, r0
; CHECK-NEXT:    vcmp.u16 hi, q3, q0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <8 x i16> undef, i16 %src2, i32 0
  %sp = shufflevector <8 x i16> %i, <8 x i16> undef, <8 x i32> zeroinitializer
  %c = icmp ugt <8 x i16> %sp, %src
  %s = select <8 x i1> %c, <8 x i16> %a, <8 x i16> %b
  ret <8 x i16> %s
}

define arm_aapcs_vfpcc <8 x i16> @vcmp_r_uge_v8i16(<8 x i16> %src, i16 %src2, <8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: vcmp_r_uge_v8i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vdup.16 q3, r0
; CHECK-NEXT:    vcmp.u16 cs, q3, q0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <8 x i16> undef, i16 %src2, i32 0
  %sp = shufflevector <8 x i16> %i, <8 x i16> undef, <8 x i32> zeroinitializer
  %c = icmp uge <8 x i16> %sp, %src
  %s = select <8 x i1> %c, <8 x i16> %a, <8 x i16> %b
  ret <8 x i16> %s
}

define arm_aapcs_vfpcc <8 x i16> @vcmp_r_ult_v8i16(<8 x i16> %src, i16 %src2, <8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: vcmp_r_ult_v8i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.u16 hi, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <8 x i16> undef, i16 %src2, i32 0
  %sp = shufflevector <8 x i16> %i, <8 x i16> undef, <8 x i32> zeroinitializer
  %c = icmp ult <8 x i16> %sp, %src
  %s = select <8 x i1> %c, <8 x i16> %a, <8 x i16> %b
  ret <8 x i16> %s
}

define arm_aapcs_vfpcc <8 x i16> @vcmp_r_ule_v8i16(<8 x i16> %src, i16 %src2, <8 x i16> %a, <8 x i16> %b) {
; CHECK-LABEL: vcmp_r_ule_v8i16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.u16 cs, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <8 x i16> undef, i16 %src2, i32 0
  %sp = shufflevector <8 x i16> %i, <8 x i16> undef, <8 x i32> zeroinitializer
  %c = icmp ule <8 x i16> %sp, %src
  %s = select <8 x i1> %c, <8 x i16> %a, <8 x i16> %b
  ret <8 x i16> %s
}


define arm_aapcs_vfpcc <16 x i8> @vcmp_r_eq_v16i8(<16 x i8> %src, i8 %src2, <16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: vcmp_r_eq_v16i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.i8 eq, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <16 x i8> undef, i8 %src2, i32 0
  %sp = shufflevector <16 x i8> %i, <16 x i8> undef, <16 x i32> zeroinitializer
  %c = icmp eq <16 x i8> %sp, %src
  %s = select <16 x i1> %c, <16 x i8> %a, <16 x i8> %b
  ret <16 x i8> %s
}

define arm_aapcs_vfpcc <16 x i8> @vcmp_r_ne_v16i8(<16 x i8> %src, i8 %src2, <16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: vcmp_r_ne_v16i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.i8 ne, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <16 x i8> undef, i8 %src2, i32 0
  %sp = shufflevector <16 x i8> %i, <16 x i8> undef, <16 x i32> zeroinitializer
  %c = icmp ne <16 x i8> %sp, %src
  %s = select <16 x i1> %c, <16 x i8> %a, <16 x i8> %b
  ret <16 x i8> %s
}

define arm_aapcs_vfpcc <16 x i8> @vcmp_r_sgt_v16i8(<16 x i8> %src, i8 %src2, <16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: vcmp_r_sgt_v16i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.s8 lt, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <16 x i8> undef, i8 %src2, i32 0
  %sp = shufflevector <16 x i8> %i, <16 x i8> undef, <16 x i32> zeroinitializer
  %c = icmp sgt <16 x i8> %sp, %src
  %s = select <16 x i1> %c, <16 x i8> %a, <16 x i8> %b
  ret <16 x i8> %s
}

define arm_aapcs_vfpcc <16 x i8> @vcmp_r_sge_v16i8(<16 x i8> %src, i8 %src2, <16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: vcmp_r_sge_v16i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.s8 le, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <16 x i8> undef, i8 %src2, i32 0
  %sp = shufflevector <16 x i8> %i, <16 x i8> undef, <16 x i32> zeroinitializer
  %c = icmp sge <16 x i8> %sp, %src
  %s = select <16 x i1> %c, <16 x i8> %a, <16 x i8> %b
  ret <16 x i8> %s
}

define arm_aapcs_vfpcc <16 x i8> @vcmp_r_slt_v16i8(<16 x i8> %src, i8 %src2, <16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: vcmp_r_slt_v16i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.s8 gt, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <16 x i8> undef, i8 %src2, i32 0
  %sp = shufflevector <16 x i8> %i, <16 x i8> undef, <16 x i32> zeroinitializer
  %c = icmp slt <16 x i8> %sp, %src
  %s = select <16 x i1> %c, <16 x i8> %a, <16 x i8> %b
  ret <16 x i8> %s
}

define arm_aapcs_vfpcc <16 x i8> @vcmp_r_sle_v16i8(<16 x i8> %src, i8 %src2, <16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: vcmp_r_sle_v16i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.s8 ge, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <16 x i8> undef, i8 %src2, i32 0
  %sp = shufflevector <16 x i8> %i, <16 x i8> undef, <16 x i32> zeroinitializer
  %c = icmp sle <16 x i8> %sp, %src
  %s = select <16 x i1> %c, <16 x i8> %a, <16 x i8> %b
  ret <16 x i8> %s
}

define arm_aapcs_vfpcc <16 x i8> @vcmp_r_ugt_v16i8(<16 x i8> %src, i8 %src2, <16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: vcmp_r_ugt_v16i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vdup.8 q3, r0
; CHECK-NEXT:    vcmp.u8 hi, q3, q0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <16 x i8> undef, i8 %src2, i32 0
  %sp = shufflevector <16 x i8> %i, <16 x i8> undef, <16 x i32> zeroinitializer
  %c = icmp ugt <16 x i8> %sp, %src
  %s = select <16 x i1> %c, <16 x i8> %a, <16 x i8> %b
  ret <16 x i8> %s
}

define arm_aapcs_vfpcc <16 x i8> @vcmp_r_uge_v16i8(<16 x i8> %src, i8 %src2, <16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: vcmp_r_uge_v16i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vdup.8 q3, r0
; CHECK-NEXT:    vcmp.u8 cs, q3, q0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <16 x i8> undef, i8 %src2, i32 0
  %sp = shufflevector <16 x i8> %i, <16 x i8> undef, <16 x i32> zeroinitializer
  %c = icmp uge <16 x i8> %sp, %src
  %s = select <16 x i1> %c, <16 x i8> %a, <16 x i8> %b
  ret <16 x i8> %s
}

define arm_aapcs_vfpcc <16 x i8> @vcmp_r_ult_v16i8(<16 x i8> %src, i8 %src2, <16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: vcmp_r_ult_v16i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.u8 hi, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <16 x i8> undef, i8 %src2, i32 0
  %sp = shufflevector <16 x i8> %i, <16 x i8> undef, <16 x i32> zeroinitializer
  %c = icmp ult <16 x i8> %sp, %src
  %s = select <16 x i1> %c, <16 x i8> %a, <16 x i8> %b
  ret <16 x i8> %s
}

define arm_aapcs_vfpcc <16 x i8> @vcmp_r_ule_v16i8(<16 x i8> %src, i8 %src2, <16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: vcmp_r_ule_v16i8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcmp.u8 cs, q0, r0
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <16 x i8> undef, i8 %src2, i32 0
  %sp = shufflevector <16 x i8> %i, <16 x i8> undef, <16 x i32> zeroinitializer
  %c = icmp ule <16 x i8> %sp, %src
  %s = select <16 x i1> %c, <16 x i8> %a, <16 x i8> %b
  ret <16 x i8> %s
}


define arm_aapcs_vfpcc <2 x i64> @vcmp_r_eq_v2i64(<2 x i64> %src, i64 %src2, <2 x i64> %a, <2 x i64> %b) {
; CHECK-LABEL: vcmp_r_eq_v2i64:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov r2, r3, d0
; CHECK-NEXT:    eors r3, r1
; CHECK-NEXT:    eors r2, r0
; CHECK-NEXT:    orrs r2, r3
; CHECK-NEXT:    mov.w r3, #0
; CHECK-NEXT:    csetm r2, eq
; CHECK-NEXT:    bfi r3, r2, #0, #8
; CHECK-NEXT:    vmov r12, r2, d1
; CHECK-NEXT:    eors r1, r2
; CHECK-NEXT:    eor.w r0, r0, r12
; CHECK-NEXT:    orrs r0, r1
; CHECK-NEXT:    csetm r0, eq
; CHECK-NEXT:    bfi r3, r0, #8, #8
; CHECK-NEXT:    vmsr p0, r3
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <2 x i64> undef, i64 %src2, i32 0
  %sp = shufflevector <2 x i64> %i, <2 x i64> undef, <2 x i32> zeroinitializer
  %c = icmp eq <2 x i64> %sp, %src
  %s = select <2 x i1> %c, <2 x i64> %a, <2 x i64> %b
  ret <2 x i64> %s
}

define arm_aapcs_vfpcc <2 x i32> @vcmp_r_eq_v2i32(<2 x i64> %src, i64 %src2, <2 x i32> %a, <2 x i32> %b) {
; CHECK-LABEL: vcmp_r_eq_v2i32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmov r2, r3, d0
; CHECK-NEXT:    eors r3, r1
; CHECK-NEXT:    eors r2, r0
; CHECK-NEXT:    orrs r2, r3
; CHECK-NEXT:    mov.w r3, #0
; CHECK-NEXT:    csetm r2, eq
; CHECK-NEXT:    bfi r3, r2, #0, #8
; CHECK-NEXT:    vmov r12, r2, d1
; CHECK-NEXT:    eors r1, r2
; CHECK-NEXT:    eor.w r0, r0, r12
; CHECK-NEXT:    orrs r0, r1
; CHECK-NEXT:    csetm r0, eq
; CHECK-NEXT:    bfi r3, r0, #8, #8
; CHECK-NEXT:    vmsr p0, r3
; CHECK-NEXT:    vpsel q0, q1, q2
; CHECK-NEXT:    bx lr
entry:
  %i = insertelement <2 x i64> undef, i64 %src2, i32 0
  %sp = shufflevector <2 x i64> %i, <2 x i64> undef, <2 x i32> zeroinitializer
  %c = icmp eq <2 x i64> %sp, %src
  %s = select <2 x i1> %c, <2 x i32> %a, <2 x i32> %b
  ret <2 x i32> %s
}

define arm_aapcs_vfpcc <2 x i32> @vcmp_r_multi_v2i32(<2 x i64> %a, <2 x i32> %b, <2 x i32> %c) {
; CHECK-LABEL: vcmp_r_multi_v2i32:
; CHECK:       @ %bb.0:
; CHECK-NEXT:    vmov r0, r1, d0
; CHECK-NEXT:    movs r2, #0
; CHECK-NEXT:    orrs r0, r1
; CHECK-NEXT:    csetm r1, eq
; CHECK-NEXT:    movs r0, #0
; CHECK-NEXT:    bfi r2, r1, #0, #8
; CHECK-NEXT:    vmov r1, r3, d1
; CHECK-NEXT:    vmov.i32 q0, #0x0
; CHECK-NEXT:    orrs r1, r3
; CHECK-NEXT:    vmov r3, s8
; CHECK-NEXT:    csetm r1, eq
; CHECK-NEXT:    bfi r2, r1, #8, #8
; CHECK-NEXT:    vmsr p0, r2
; CHECK-NEXT:    vpsel q0, q0, q2
; CHECK-NEXT:    vmov r1, s0
; CHECK-NEXT:    subs r2, r1, r3
; CHECK-NEXT:    asr.w r12, r1, #31
; CHECK-NEXT:    sbcs.w r2, r12, r3, asr #31
; CHECK-NEXT:    vmov r3, s4
; CHECK-NEXT:    cset r2, lt
; CHECK-NEXT:    cmp r1, #0
; CHECK-NEXT:    cset r1, ne
; CHECK-NEXT:    cmp r3, #0
; CHECK-NEXT:    cset r3, ne
; CHECK-NEXT:    ands r1, r3
; CHECK-NEXT:    vmov r3, s10
; CHECK-NEXT:    ands r1, r2
; CHECK-NEXT:    rsbs r1, r1, #0
; CHECK-NEXT:    bfi r0, r1, #0, #8
; CHECK-NEXT:    vmov r1, s2
; CHECK-NEXT:    subs r2, r1, r3
; CHECK-NEXT:    asr.w r12, r1, #31
; CHECK-NEXT:    sbcs.w r2, r12, r3, asr #31
; CHECK-NEXT:    vmov r3, s6
; CHECK-NEXT:    cset r2, lt
; CHECK-NEXT:    cmp r1, #0
; CHECK-NEXT:    cset r1, ne
; CHECK-NEXT:    cmp r3, #0
; CHECK-NEXT:    cset r3, ne
; CHECK-NEXT:    ands r1, r3
; CHECK-NEXT:    ands r1, r2
; CHECK-NEXT:    rsbs r1, r1, #0
; CHECK-NEXT:    bfi r0, r1, #8, #8
; CHECK-NEXT:    vmsr p0, r0
; CHECK-NEXT:    vpsel q0, q2, q0
; CHECK-NEXT:    bx lr
  %a4 = icmp eq <2 x i64> %a, zeroinitializer
  %a5 = select <2 x i1> %a4, <2 x i32> zeroinitializer, <2 x i32> %c
  %a6 = icmp ne <2 x i32> %b, zeroinitializer
  %a7 = icmp slt <2 x i32> %a5, %c
  %a8 = icmp ne <2 x i32> %a5, zeroinitializer
  %a9 = and <2 x i1> %a6, %a8
  %a10 = and <2 x i1> %a7, %a9
  %a11 = select <2 x i1> %a10, <2 x i32> %c, <2 x i32> %a5
  ret <2 x i32> %a11
}
