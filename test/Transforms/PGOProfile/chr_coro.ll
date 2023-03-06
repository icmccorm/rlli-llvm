; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
;RUN: opt < %s -passes='require<profile-summary>,function(chr,instcombine,simplifycfg)' -S | FileCheck %s

declare void @foo()
declare void @bar()

declare token @llvm.coro.id(i32, ptr, ptr, ptr)
declare i1 @llvm.coro.alloc(token)
declare ptr @llvm.coro.begin(token, ptr)
declare noalias ptr @malloc(i32)

%f.Frame = type { ptr, ptr, i1 }

; resume part of the coroutine
define fastcc void @f.resume(ptr noalias nonnull align 8 dereferenceable(24) %FramePtr) {
    tail call void @bar()
    ret void
}

; destroy part of the coroutine
define fastcc void @f.destroy(ptr noalias nonnull align 8 dereferenceable(24) %FramePtr) {
    tail call void @bar()
    ret void
}

; cleanup part of the coroutine
define fastcc void @f.cleanup(ptr noalias nonnull align 8 dereferenceable(24) %FramePtr) {
    tail call void @bar()
    ret void
}

@f.resumers = private constant [3 x ptr] [ptr @f.resume, ptr @f.destroy, ptr @f.cleanup]

; Test that chr will skip block containing llvm.coro.id.
define ptr @test_chr_with_coro_id(ptr %i) !prof !14 {
; CHECK-LABEL: @test_chr_with_coro_id(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = load i32, ptr [[I:%.*]], align 4
; CHECK-NEXT:    [[TMP1:%.*]] = and i32 [[TMP0]], 3
; CHECK-NEXT:    [[TMP2:%.*]] = icmp eq i32 [[TMP1]], 3
; CHECK-NEXT:    br i1 [[TMP2]], label %[[BB0:.*]], label %[[ENTRY_SPLIT_NONCHR:.*]], !prof !15
; CHECK:       [[BB0]]:
; CHECK-NEXT:    call void @foo()
; CHECK-NEXT:    br label %[[BB_CORO_ID:.*]]
; CHECK:       bb1.nonchr:
; CHECK-NEXT:    [[TMP4:%.*]] = and i32 [[TMP0]], 2
; CHECK-NEXT:    [[TMP5:%.*]] = icmp eq i32 [[TMP4]], 0
; CHECK-NEXT:    br i1 [[TMP5]], label %[[BB2_NONCHR:.*]], label %[[BB_CORO_ID]], !prof !16
; CHECK:       [[BB2_NONCHR]]:
; CHECK-NEXT:    call void @foo()
; CHECK-NEXT:    br label %[[BB_CORO_ID]]
; CHECK:       [[BB_CORO_ID]]:
; CHECK-NEXT:    [[ID:%.*]] = call token @llvm.coro.id
; CHECK-NEXT:    [[NEED_DYN_ALLOC:%.*]] = call i1 @llvm.coro.alloc(token [[ID]])
; CHECK-NEXT:    br i1 [[NEED_DYN_ALLOC]], label %[[BB_CORO_DYN_ALLOC:.*]], label %[[BB_CORO_BEGIN:.*]]
; CHECK:       [[BB_CORO_BEGIN]]:
; CHECK-NEXT:    [[PHI:%.*]] = phi ptr [ null, %[[BB_CORO_ID]] ], [ %alloc, %[[BB_CORO_DYN_ALLOC]] ]
; CHECK-NEXT:    [[HDL:%.*]] = call noalias nonnull ptr @llvm.coro.begin(token [[ID]], ptr [[PHI]])
;
entry:
  %0 = load i32, ptr %i
  %1 = and i32 %0, 1
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %bb1, label %bb0, !prof !15

bb0:
  call void @foo()
  br label %bb1

bb1:
  %3 = and i32 %0, 2
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %bb2, label %bb.coro.id, !prof !15

bb2:
  call void @foo()
  br label %bb.coro.id

bb.coro.id:
  %id = call token @llvm.coro.id(i32 0, ptr null, ptr null, ptr @f.resumers)
  %need.dyn.alloc = call i1 @llvm.coro.alloc(token %id)
  br i1 %need.dyn.alloc, label %bb.coro.dyn.alloc, label %bb.coro.begin

bb.coro.dyn.alloc:
  %alloc = call ptr @malloc(i32 24)
  br label %bb.coro.begin

bb.coro.begin:
  %phi = phi ptr [ null, %bb.coro.id ], [ %alloc, %bb.coro.dyn.alloc ]
  %hdl = call noalias nonnull ptr @llvm.coro.begin(token %id, ptr %phi)
  ret ptr %hdl
}

!llvm.module.flags = !{!0}
!0 = !{i32 1, !"ProfileSummary", !1}
!1 = !{!2, !3, !4, !5, !6, !7, !8, !9}
!2 = !{!"ProfileFormat", !"InstrProf"}
!3 = !{!"TotalCount", i64 10000}
!4 = !{!"MaxCount", i64 10}
!5 = !{!"MaxInternalCount", i64 1}
!6 = !{!"MaxFunctionCount", i64 1000}
!7 = !{!"NumCounts", i64 3}
!8 = !{!"NumFunctions", i64 3}
!9 = !{!"DetailedSummary", !10}
!10 = !{!11, !12, !13}
!11 = !{i32 10000, i64 100, i32 1}
!12 = !{i32 999000, i64 100, i32 1}
!13 = !{i32 999999, i64 1, i32 2}

!14 = !{!"function_entry_count", i64 100}
!15 = !{!"branch_weights", i32 0, i32 1}
!16 = !{!"branch_weights", i32 1, i32 1}
!17 = !{!"branch_weights", i32 0, i32 0}
; CHECK: !15 = !{!"branch_weights", i32 1000, i32 0}
; CHECK: !16 = !{!"branch_weights", i32 0, i32 1}
