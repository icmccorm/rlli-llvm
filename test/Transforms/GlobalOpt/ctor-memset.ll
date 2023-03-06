; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --check-globals
; RUN: opt -S -globalopt < %s | FileCheck %s

target datalayout = "p1:32:32"

@llvm.global_ctors = appending global [9 x { i32, ptr, ptr }] [
  { i32, ptr, ptr } { i32 65535, ptr @ctor0, ptr null },
  { i32, ptr, ptr } { i32 65535, ptr @ctor1, ptr null },
  { i32, ptr, ptr } { i32 65535, ptr @ctor2, ptr null },
  { i32, ptr, ptr } { i32 65535, ptr @ctor3, ptr null },
  { i32, ptr, ptr } { i32 65535, ptr @ctor4, ptr null },
  { i32, ptr, ptr } { i32 65535, ptr @ctor5, ptr null },
  { i32, ptr, ptr } { i32 65535, ptr @ctor6, ptr null },
  { i32, ptr, ptr } { i32 65535, ptr @ctor7, ptr null },
  { i32, ptr, ptr } { i32 65535, ptr @ctor8, ptr null }
]

;.
; CHECK: @[[LLVM_GLOBAL_CTORS:[a-zA-Z0-9_$"\\.-]+]] = appending global [3 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @ctor3, ptr null }, { i32, ptr, ptr } { i32 65535, ptr @ctor4, ptr null }, { i32, ptr, ptr } { i32 65535, ptr @ctor7, ptr null }]
; CHECK: @[[G0:[a-zA-Z0-9_$"\\.-]+]] = local_unnamed_addr global { i32, i32 } zeroinitializer
; CHECK: @[[G1:[a-zA-Z0-9_$"\\.-]+]] = local_unnamed_addr global { i32, i32, i32 } { i32 0, i32 0, i32 1 }
; CHECK: @[[G2:[a-zA-Z0-9_$"\\.-]+]] = local_unnamed_addr global { i32, i32, i32 } { i32 1, i32 0, i32 0 }
; CHECK: @[[G3:[a-zA-Z0-9_$"\\.-]+]] = local_unnamed_addr global { i32, i32 } { i32 0, i32 1 }
; CHECK: @[[G4:[a-zA-Z0-9_$"\\.-]+]] = local_unnamed_addr global { i32, i32 } { i32 0, i32 undef }
; CHECK: @[[G5:[a-zA-Z0-9_$"\\.-]+]] = local_unnamed_addr global { i16, i32 } { i16 0, i32 1 }
; CHECK: @[[G6:[a-zA-Z0-9_$"\\.-]+]] = local_unnamed_addr global { i32, i32 } { i32 -1, i32 -1 }
; CHECK: @[[G7:[a-zA-Z0-9_$"\\.-]+]] = local_unnamed_addr global { i32, i32 } { i32 -1, i32 1 }
; CHECK: @[[G8:[a-zA-Z0-9_$"\\.-]+]] = local_unnamed_addr addrspace(1) global { i32, i32 } zeroinitializer
;.

; memset of all-zero global
@g0 = global { i32, i32 } zeroinitializer
define internal void @ctor0() {
  call void @llvm.memset.p0.i64(ptr @g0, i8 0, i64 8, i1 false)
  ret void
}

; memset of zero prefix
@g1 = global { i32, i32, i32 } { i32 0, i32 0, i32 1 }

define internal void @ctor1() {
  call void @llvm.memset.p0.i64(ptr @g1, i8 0, i64 8, i1 false)
  ret void
}

; memset of zero suffix
@g2 = global { i32, i32, i32 } { i32 1, i32 0, i32 0 }

define internal void @ctor2() {
  call void @llvm.memset.p0.i64(ptr getelementptr (i32, ptr @g2, i64 1), i8 0, i64 8, i1 false)
  ret void
}

; memset of some non-zero bytes
@g3 = global { i32, i32 } { i32 0, i32 1 }

define internal void @ctor3() {
; CHECK-LABEL: @ctor3(
; CHECK-NEXT:    call void @llvm.memset.p0.i64(ptr @g3, i8 0, i64 8, i1 false)
; CHECK-NEXT:    ret void
;
  call void @llvm.memset.p0.i64(ptr @g3, i8 0, i64 8, i1 false)
  ret void
}

; memset of some undef bytes
@g4 = global { i32, i32 } { i32 0, i32 undef }

define internal void @ctor4() {
; CHECK-LABEL: @ctor4(
; CHECK-NEXT:    call void @llvm.memset.p0.i64(ptr @g4, i8 0, i64 8, i1 false)
; CHECK-NEXT:    ret void
;
  call void @llvm.memset.p0.i64(ptr @g4, i8 0, i64 8, i1 false)
  ret void
}

; memset including padding bytes
; FIXME: We still incorrectly optimize the memset away here, even though code
; might access the padding.
@g5 = global { i16, i32 } { i16 0, i32 1 }

define internal void @ctor5() {
  call void @llvm.memset.p0.i64(ptr @g5, i8 0, i64 4, i1 false)
  ret void
}

; memset of non-zero value (matching initializer)
@g6 = global { i32, i32 } { i32 -1, i32 -1 }

define internal void @ctor6() {
  call void @llvm.memset.p0.i64(ptr @g6, i8 -1, i64 8, i1 false)
  ret void
}

; memset of non-zero value (not matching initializer)
@g7 = global { i32, i32 } { i32 -1, i32 1 }

define internal void @ctor7() {
; CHECK-LABEL: @ctor7(
; CHECK-NEXT:    call void @llvm.memset.p0.i64(ptr @g7, i8 -1, i64 8, i1 false)
; CHECK-NEXT:    ret void
;
  call void @llvm.memset.p0.i64(ptr @g7, i8 -1, i64 8, i1 false)
  ret void
}

; memset of zero value in differently-sized address space
@g8 = addrspace(1) global { i32, i32 } zeroinitializer

define internal void @ctor8() {
  call void @llvm.memset.p0.i64(ptr addrspacecast (ptr addrspace(1) @g8 to ptr), i8 0, i64 8, i1 false)
  ret void
}

declare void @llvm.memset.p0.i64(ptr, i8, i64, i1)
;.
; CHECK: attributes #[[ATTR0:[0-9]+]] = { argmemonly nocallback nofree nounwind willreturn writeonly }
;.
