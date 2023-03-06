; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -passes=ipsccp -S %s | FileCheck %s

declare void @use(i1)

define i1 @freeze_undef_i1() {
; CHECK-LABEL: @freeze_undef_i1(
; CHECK-NEXT:    [[FR:%.*]] = freeze i1 undef
; CHECK-NEXT:    ret i1 [[FR]]
;
  %fr = freeze i1 undef
  ret i1 %fr
}

define ptr @freeze_undef_ptr() {
; CHECK-LABEL: @freeze_undef_ptr(
; CHECK-NEXT:    [[FR:%.*]] = freeze ptr undef
; CHECK-NEXT:    ret ptr [[FR]]
;
  %fr = freeze ptr undef
  ret ptr %fr
}

define float @freeze_undef_float() {
; CHECK-LABEL: @freeze_undef_float(
; CHECK-NEXT:    [[FR:%.*]] = freeze float undef
; CHECK-NEXT:    ret float [[FR]]
;
  %fr = freeze float undef
  ret float %fr
}

define <2 x i32> @freeze_undef_vector() {
; CHECK-LABEL: @freeze_undef_vector(
; CHECK-NEXT:    [[FR:%.*]] = freeze <2 x i32> undef
; CHECK-NEXT:    ret <2 x i32> [[FR]]
;
  %fr = freeze <2 x i32> undef
  ret <2 x i32> %fr
}

define i1 @propagate_range_from_and_through_freeze(i32 %x, i32 %y) {
; CHECK-LABEL: @propagate_range_from_and_through_freeze(
; CHECK-NEXT:    [[AND:%.*]] = and i32 [[X:%.*]], 3
; CHECK-NEXT:    [[AND_FR:%.*]] = freeze i32 [[AND]]
; CHECK-NEXT:    [[F_1:%.*]] = icmp eq i32 [[AND_FR]], 100
; CHECK-NEXT:    call void @use(i1 [[F_1]])
; CHECK-NEXT:    [[T_1:%.*]] = icmp ule i32 [[AND_FR]], 3
; CHECK-NEXT:    call void @use(i1 [[T_1]])
; CHECK-NEXT:    [[F_2:%.*]] = icmp ugt i32 [[AND_FR]], 3
; CHECK-NEXT:    call void @use(i1 [[F_2]])
; CHECK-NEXT:    [[C_1:%.*]] = icmp eq i32 [[AND_FR]], [[Y:%.*]]
; CHECK-NEXT:    call void @use(i1 [[C_1]])
; CHECK-NEXT:    [[R_1:%.*]] = xor i1 [[T_1]], [[F_1]]
; CHECK-NEXT:    [[R_2:%.*]] = xor i1 [[R_1]], [[F_2]]
; CHECK-NEXT:    [[R_3:%.*]] = xor i1 [[R_2]], [[C_1]]
; CHECK-NEXT:    ret i1 [[R_3]]
;
  %and = and i32 %x, 3
  %and.fr = freeze i32 %and
  %f.1 = icmp eq i32 %and.fr, 100
  call void @use(i1 %f.1)
  %t.1 = icmp ule i32 %and.fr, 3
  call void @use(i1 %t.1)
  %f.2 = icmp ugt i32 %and.fr, 3
  call void @use(i1 %f.2)
  %c.1 = icmp eq i32 %and.fr, %y
  call void @use(i1 %c.1)
  %r.1 = xor i1 %t.1, %f.1
  %r.2 = xor i1 %r.1, %f.2
  %r.3 = xor i1 %r.2, %c.1
  ret i1 %r.3
}

define i1 @range_from_phi_with_undef(i1 %c.1, i1 %c.2) {
; CHECK-LABEL: @range_from_phi_with_undef(
; CHECK-NEXT:    br i1 [[C_1:%.*]], label [[TRUE_1:%.*]], label [[FALSE:%.*]]
; CHECK:       true.1:
; CHECK-NEXT:    br i1 [[C_2:%.*]], label [[TRUE_2:%.*]], label [[EXIT:%.*]]
; CHECK:       true.2:
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       false:
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    [[P:%.*]] = phi i32 [ 10, [[TRUE_1]] ], [ 20, [[TRUE_2]] ], [ undef, [[FALSE]] ]
; CHECK-NEXT:    [[P_FR:%.*]] = freeze i32 [[P]]
; CHECK-NEXT:    [[T_1:%.*]] = icmp ule i32 [[P_FR]], 20
; CHECK-NEXT:    [[T_2:%.*]] = icmp uge i32 [[P_FR]], 10
; CHECK-NEXT:    [[RES:%.*]] = xor i1 [[T_1]], [[T_2]]
; CHECK-NEXT:    ret i1 [[RES]]
;
  br i1 %c.1, label %true.1, label %false

true.1:
  br i1 %c.2, label %true.2, label %exit

true.2:
  br label %exit

false:
  br label %exit

exit:
  %p = phi i32 [ 10, %true.1 ], [ 20, %true.2], [ undef, %false ]
  %p.fr = freeze i32 %p
  %t.1 = icmp ule i32 %p.fr, 20
  %t.2 = icmp uge i32 %p.fr, 10
  %res = xor i1 %t.1, %t.2
  ret i1 %res
}

define i32 @propagate_info_from_predicate_through_freeze(i32 %x) {
; CHECK-LABEL: @propagate_info_from_predicate_through_freeze(
; CHECK-NEXT:    [[CMP:%.*]] = icmp eq i32 [[X:%.*]], 10
; CHECK-NEXT:    [[X_FR:%.*]] = freeze i32 [[X]]
; CHECK-NEXT:    br i1 [[CMP]], label [[THEN:%.*]], label [[ELSE:%.*]]
; CHECK:       then:
; CHECK-NEXT:    [[ADD_1:%.*]] = add i32 [[X_FR]], 10
; CHECK-NEXT:    [[ADD_2:%.*]] = add i32 [[X_FR]], 1
; CHECK-NEXT:    ret i32 [[ADD_2]]
; CHECK:       else:
; CHECK-NEXT:    [[ADD_3:%.*]] = add i32 [[X_FR]], 1
; CHECK-NEXT:    ret i32 [[ADD_3]]
;
  %cmp = icmp eq i32 %x, 10
  %x.fr = freeze i32 %x
  br i1 %cmp, label %then, label %else

then:
  %add.1 = add i32 %x.fr, %x
  %add.2 = add i32 %x.fr, 1
  ret i32 %add.2

else:
  %add.3 = add i32 %x.fr, 1
  ret i32 %add.3
}
