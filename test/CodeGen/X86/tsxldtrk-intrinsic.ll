; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+tsxldtrk | FileCheck %s --check-prefix=X64
; RUN: llc < %s -mtriple=i386-unknown-unknown -mattr=+tsxldtrk | FileCheck %s --check-prefix=X86
; RUN: llc < %s -mtriple=x86_64-linux-gnux32 -mattr=+tsxldtrk | FileCheck %s --check-prefix=X32

define void @test_tsxldtrk() {
; X64-LABEL: test_tsxldtrk:
; X64:       # %bb.0: # %entry
; X64-NEXT:    xsusldtrk
; X64-NEXT:    xresldtrk
; X64-NEXT:    retq
;
; X86-LABEL: test_tsxldtrk:
; X86:       # %bb.0: # %entry
; X86-NEXT:    xsusldtrk
; X86-NEXT:    xresldtrk
; X86-NEXT:    retl
;
; X32-LABEL: test_tsxldtrk:
; X32:       # %bb.0: # %entry
; X32-NEXT:    xsusldtrk
; X32-NEXT:    xresldtrk
; X32-NEXT:    retq
entry:
   call void @llvm.x86.xsusldtrk()
   call void @llvm.x86.xresldtrk()
   ret void
}

declare void @llvm.x86.xsusldtrk()
declare void @llvm.x86.xresldtrk()
