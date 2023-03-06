;; Check that we don't emit the runtime hooks if the user provided them.

; RUN: opt < %s -passes=instrprof -S | FileCheck %s
; CHECK-NOT: define {{.*}} @__llvm_profile_runtime_user()
; CHECK-NOT: load i32, ptr @__llvm_profile_runtime

@__llvm_profile_runtime = global i32 0, align 4

@__profn_foo = private constant [3 x i8] c"foo"

define void @foo() {
  call void @llvm.instrprof.increment(ptr @__profn_foo, i64 0, i32 1, i32 0)
  ret void
}

declare void @llvm.instrprof.increment(ptr, i64, i32, i32)
