; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --function-signature --check-attributes --check-globals
; RUN: opt -attributor -enable-new-pm=0 -attributor-manifest-internal  -attributor-max-iterations-verify -attributor-annotate-decl-cs -attributor-max-iterations=2 -S < %s | FileCheck %s --check-prefixes=CHECK,NOT_CGSCC_NPM,NOT_CGSCC_OPM,NOT_TUNIT_NPM,IS__TUNIT____,IS________OPM,IS__TUNIT_OPM
; RUN: opt -aa-pipeline=basic-aa -passes=attributor -attributor-manifest-internal  -attributor-max-iterations-verify -attributor-annotate-decl-cs -attributor-max-iterations=2 -S < %s | FileCheck %s --check-prefixes=CHECK,NOT_CGSCC_OPM,NOT_CGSCC_NPM,NOT_TUNIT_OPM,IS__TUNIT____,IS________NPM,IS__TUNIT_NPM
; RUN: opt -attributor-cgscc -enable-new-pm=0 -attributor-manifest-internal  -attributor-annotate-decl-cs -S < %s | FileCheck %s --check-prefixes=CHECK,NOT_TUNIT_NPM,NOT_TUNIT_OPM,NOT_CGSCC_NPM,IS__CGSCC____,IS________OPM,IS__CGSCC_OPM
; RUN: opt -aa-pipeline=basic-aa -passes=attributor-cgscc -attributor-manifest-internal  -attributor-annotate-decl-cs -S < %s | FileCheck %s --check-prefixes=CHECK,NOT_TUNIT_NPM,NOT_TUNIT_OPM,NOT_CGSCC_OPM,IS__CGSCC____,IS________NPM,IS__CGSCC_NPM
;
; FIXME: The GEP + BC + GEP solution we create is not great but correct.

declare void @use(i32* nocapture readonly %arg)

define void @caller() {
; IS________OPM-LABEL: define {{[^@]+}}@caller() {
; IS________OPM-NEXT:  entry:
; IS________OPM-NEXT:    [[LEFT:%.*]] = alloca [3 x i32], align 4
; IS________OPM-NEXT:    [[ARRAYDECAY:%.*]] = getelementptr inbounds [3 x i32], [3 x i32]* [[LEFT]], i64 0, i64 0
; IS________OPM-NEXT:    call void @callee(i32* noalias nocapture noundef nonnull readonly align 4 dereferenceable(12) [[ARRAYDECAY]])
; IS________OPM-NEXT:    ret void
;
; IS__TUNIT_NPM-LABEL: define {{[^@]+}}@caller() {
; IS__TUNIT_NPM-NEXT:  entry:
; IS__TUNIT_NPM-NEXT:    [[LEFT:%.*]] = alloca [3 x i32], align 4
; IS__TUNIT_NPM-NEXT:    [[ARRAYDECAY:%.*]] = getelementptr inbounds [3 x i32], [3 x i32]* [[LEFT]], i64 0, i64 0
; IS__TUNIT_NPM-NEXT:    [[TMP0:%.*]] = bitcast i32* [[ARRAYDECAY]] to [3 x i32]*
; IS__TUNIT_NPM-NEXT:    [[DOTCAST:%.*]] = bitcast [3 x i32]* [[TMP0]] to i32*
; IS__TUNIT_NPM-NEXT:    [[TMP1:%.*]] = load i32, i32* [[DOTCAST]], align 4
; IS__TUNIT_NPM-NEXT:    [[DOT0_1:%.*]] = getelementptr [3 x i32], [3 x i32]* [[TMP0]], i64 0, i64 1
; IS__TUNIT_NPM-NEXT:    [[TMP2:%.*]] = load i32, i32* [[DOT0_1]], align 4
; IS__TUNIT_NPM-NEXT:    [[DOT0_2:%.*]] = getelementptr [3 x i32], [3 x i32]* [[TMP0]], i64 0, i64 2
; IS__TUNIT_NPM-NEXT:    [[TMP3:%.*]] = load i32, i32* [[DOT0_2]], align 4
; IS__TUNIT_NPM-NEXT:    call void @callee(i32 [[TMP1]], i32 [[TMP2]], i32 [[TMP3]])
; IS__TUNIT_NPM-NEXT:    ret void
;
; IS__CGSCC_NPM-LABEL: define {{[^@]+}}@caller() {
; IS__CGSCC_NPM-NEXT:  entry:
; IS__CGSCC_NPM-NEXT:    call void @callee(i32 undef, i32 undef, i32 undef)
; IS__CGSCC_NPM-NEXT:    ret void
;
entry:
  %left = alloca [3 x i32], align 4
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %left, i64 0, i64 0
  call void @callee(i32* %arraydecay)
  ret void
}

define internal void @callee(i32* noalias %arg) {
; IS________OPM-LABEL: define {{[^@]+}}@callee
; IS________OPM-SAME: (i32* noalias nocapture noundef nonnull readonly align 4 dereferenceable(12) [[ARG:%.*]]) {
; IS________OPM-NEXT:  entry:
; IS________OPM-NEXT:    call void @use(i32* noalias nocapture noundef nonnull readonly align 4 dereferenceable(12) [[ARG]])
; IS________OPM-NEXT:    ret void
;
; IS________NPM-LABEL: define {{[^@]+}}@callee
; IS________NPM-SAME: (i32 [[TMP0:%.*]], i32 [[TMP1:%.*]], i32 [[TMP2:%.*]]) {
; IS________NPM-NEXT:  entry:
; IS________NPM-NEXT:    [[ARG_PRIV:%.*]] = alloca [3 x i32], align 4
; IS________NPM-NEXT:    [[ARG_PRIV_CAST:%.*]] = bitcast [3 x i32]* [[ARG_PRIV]] to i32*
; IS________NPM-NEXT:    store i32 [[TMP0]], i32* [[ARG_PRIV_CAST]], align 4
; IS________NPM-NEXT:    [[ARG_PRIV_0_1:%.*]] = getelementptr [3 x i32], [3 x i32]* [[ARG_PRIV]], i64 0, i64 1
; IS________NPM-NEXT:    store i32 [[TMP1]], i32* [[ARG_PRIV_0_1]], align 4
; IS________NPM-NEXT:    [[ARG_PRIV_0_2:%.*]] = getelementptr [3 x i32], [3 x i32]* [[ARG_PRIV]], i64 0, i64 2
; IS________NPM-NEXT:    store i32 [[TMP2]], i32* [[ARG_PRIV_0_2]], align 4
; IS________NPM-NEXT:    [[TMP3:%.*]] = bitcast [3 x i32]* [[ARG_PRIV]] to i32*
; IS________NPM-NEXT:    call void @use(i32* noalias nocapture noundef nonnull readonly align 4 dereferenceable(12) [[TMP3]])
; IS________NPM-NEXT:    ret void
;
entry:
  call void @use(i32* %arg)
  ret void
}
