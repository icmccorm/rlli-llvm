; NOTE: Assertions have been autogenerated by utils/update_analyze_test_checks.py
; RUN: opt -passes='print<cost-model>' 2>&1 -disable-output -mtriple=riscv64 -mattr=+v,+f,+d,+zfh,+experimental-zvfh -riscv-v-vector-bits-min=128 -riscv-v-fixed-length-vector-lmul-max=1 < %s | FileCheck %s
; Check that we don't crash querying costs when vectors are not enabled.
; RUN: opt -passes='print<cost-model>' 2>&1 -disable-output -mtriple=riscv64

define void @select() {
; CHECK-LABEL: 'select'
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %1 = select i1 undef, i1 undef, i1 undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %2 = select <1 x i1> undef, <1 x i1> undef, <1 x i1> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %3 = select <2 x i1> undef, <2 x i1> undef, <2 x i1> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %4 = select <4 x i1> undef, <4 x i1> undef, <4 x i1> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %5 = select <8 x i1> undef, <8 x i1> undef, <8 x i1> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %6 = select <16 x i1> undef, <16 x i1> undef, <16 x i1> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 64 for instruction: %7 = select <32 x i1> undef, <32 x i1> undef, <32 x i1> undef
; CHECK-NEXT:  Cost Model: Invalid cost for instruction: %8 = select <vscale x 1 x i1> undef, <vscale x 1 x i1> undef, <vscale x 1 x i1> undef
; CHECK-NEXT:  Cost Model: Invalid cost for instruction: %9 = select <vscale x 2 x i1> undef, <vscale x 2 x i1> undef, <vscale x 2 x i1> undef
; CHECK-NEXT:  Cost Model: Invalid cost for instruction: %10 = select <vscale x 4 x i1> undef, <vscale x 4 x i1> undef, <vscale x 4 x i1> undef
; CHECK-NEXT:  Cost Model: Invalid cost for instruction: %11 = select <vscale x 8 x i1> undef, <vscale x 8 x i1> undef, <vscale x 8 x i1> undef
; CHECK-NEXT:  Cost Model: Invalid cost for instruction: %12 = select <vscale x 16 x i1> undef, <vscale x 16 x i1> undef, <vscale x 16 x i1> undef
; CHECK-NEXT:  Cost Model: Invalid cost for instruction: %13 = select <vscale x 32 x i1> undef, <vscale x 32 x i1> undef, <vscale x 32 x i1> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %14 = select i1 undef, i8 undef, i8 undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %15 = select <1 x i1> undef, <1 x i8> undef, <1 x i8> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %16 = select <2 x i1> undef, <2 x i8> undef, <2 x i8> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %17 = select <4 x i1> undef, <4 x i8> undef, <4 x i8> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %18 = select <8 x i1> undef, <8 x i8> undef, <8 x i8> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %19 = select <16 x i1> undef, <16 x i8> undef, <16 x i8> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %20 = select <32 x i1> undef, <32 x i8> undef, <32 x i8> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %21 = select <vscale x 1 x i1> undef, <vscale x 1 x i8> undef, <vscale x 1 x i8> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %22 = select <vscale x 2 x i1> undef, <vscale x 2 x i8> undef, <vscale x 2 x i8> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %23 = select <vscale x 4 x i1> undef, <vscale x 4 x i8> undef, <vscale x 4 x i8> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %24 = select <vscale x 8 x i1> undef, <vscale x 8 x i8> undef, <vscale x 8 x i8> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %25 = select <vscale x 16 x i1> undef, <vscale x 16 x i8> undef, <vscale x 16 x i8> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %26 = select <vscale x 32 x i1> undef, <vscale x 32 x i8> undef, <vscale x 32 x i8> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %27 = select i1 undef, i16 undef, i16 undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %28 = select <1 x i1> undef, <1 x i16> undef, <1 x i16> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %29 = select <2 x i1> undef, <2 x i16> undef, <2 x i16> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %30 = select <4 x i1> undef, <4 x i16> undef, <4 x i16> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %31 = select <8 x i1> undef, <8 x i16> undef, <8 x i16> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %32 = select <16 x i1> undef, <16 x i16> undef, <16 x i16> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %33 = select <32 x i1> undef, <32 x i16> undef, <32 x i16> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %34 = select <vscale x 1 x i1> undef, <vscale x 1 x i16> undef, <vscale x 1 x i16> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %35 = select <vscale x 2 x i1> undef, <vscale x 2 x i16> undef, <vscale x 2 x i16> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %36 = select <vscale x 4 x i1> undef, <vscale x 4 x i16> undef, <vscale x 4 x i16> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %37 = select <vscale x 8 x i1> undef, <vscale x 8 x i16> undef, <vscale x 8 x i16> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %38 = select <vscale x 16 x i1> undef, <vscale x 16 x i16> undef, <vscale x 16 x i16> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %39 = select <vscale x 32 x i1> undef, <vscale x 32 x i16> undef, <vscale x 32 x i16> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %40 = select i1 undef, i32 undef, i32 undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %41 = select <1 x i1> undef, <1 x i32> undef, <1 x i32> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %42 = select <2 x i1> undef, <2 x i32> undef, <2 x i32> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %43 = select <4 x i1> undef, <4 x i32> undef, <4 x i32> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %44 = select <8 x i1> undef, <8 x i32> undef, <8 x i32> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %45 = select <16 x i1> undef, <16 x i32> undef, <16 x i32> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %46 = select <32 x i1> undef, <32 x i32> undef, <32 x i32> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %47 = select <vscale x 1 x i1> undef, <vscale x 1 x i32> undef, <vscale x 1 x i32> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %48 = select <vscale x 2 x i1> undef, <vscale x 2 x i32> undef, <vscale x 2 x i32> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %49 = select <vscale x 4 x i1> undef, <vscale x 4 x i32> undef, <vscale x 4 x i32> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %50 = select <vscale x 8 x i1> undef, <vscale x 8 x i32> undef, <vscale x 8 x i32> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %51 = select <vscale x 16 x i1> undef, <vscale x 16 x i32> undef, <vscale x 16 x i32> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %52 = select <vscale x 32 x i1> undef, <vscale x 32 x i32> undef, <vscale x 32 x i32> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %53 = select i1 undef, i64 undef, i64 undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %54 = select <1 x i1> undef, <1 x i64> undef, <1 x i64> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %55 = select <2 x i1> undef, <2 x i64> undef, <2 x i64> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %56 = select <4 x i1> undef, <4 x i64> undef, <4 x i64> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %57 = select <8 x i1> undef, <8 x i64> undef, <8 x i64> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %58 = select <16 x i1> undef, <16 x i64> undef, <16 x i64> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %59 = select <32 x i1> undef, <32 x i64> undef, <32 x i64> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %60 = select <vscale x 1 x i1> undef, <vscale x 1 x i64> undef, <vscale x 1 x i64> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %61 = select <vscale x 2 x i1> undef, <vscale x 2 x i64> undef, <vscale x 2 x i64> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %62 = select <vscale x 4 x i1> undef, <vscale x 4 x i64> undef, <vscale x 4 x i64> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %63 = select <vscale x 8 x i1> undef, <vscale x 8 x i64> undef, <vscale x 8 x i64> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %64 = select <vscale x 16 x i1> undef, <vscale x 16 x i64> undef, <vscale x 16 x i64> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %65 = select <vscale x 32 x i1> undef, <vscale x 32 x i64> undef, <vscale x 32 x i64> undef
; CHECK-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  select i1 undef, i1 undef, i1 undef
  select <1 x i1> undef, <1 x i1> undef, <1 x i1> undef
  select <2 x i1> undef, <2 x i1> undef, <2 x i1> undef
  select <4 x i1> undef, <4 x i1> undef, <4 x i1> undef
  select <8 x i1> undef, <8 x i1> undef, <8 x i1> undef
  select <16 x i1> undef, <16 x i1> undef, <16 x i1> undef
  select <32 x i1> undef, <32 x i1> undef, <32 x i1> undef
  select <vscale x 1 x i1> undef, <vscale x 1 x i1> undef, <vscale x 1 x i1> undef
  select <vscale x 2 x i1> undef, <vscale x 2 x i1> undef, <vscale x 2 x i1> undef
  select <vscale x 4 x i1> undef, <vscale x 4 x i1> undef, <vscale x 4 x i1> undef
  select <vscale x 8 x i1> undef, <vscale x 8 x i1> undef, <vscale x 8 x i1> undef
  select <vscale x 16 x i1> undef, <vscale x 16 x i1> undef, <vscale x 16 x i1> undef
  select <vscale x 32 x i1> undef, <vscale x 32 x i1> undef, <vscale x 32 x i1> undef

  select i1 undef, i8 undef, i8 undef
  select <1 x i1> undef, <1 x i8> undef, <1 x i8> undef
  select <2 x i1> undef, <2 x i8> undef, <2 x i8> undef
  select <4 x i1> undef, <4 x i8> undef, <4 x i8> undef
  select <8 x i1> undef, <8 x i8> undef, <8 x i8> undef
  select <16 x i1> undef, <16 x i8> undef, <16 x i8> undef
  select <32 x i1> undef, <32 x i8> undef, <32 x i8> undef
  select <vscale x 1 x i1> undef, <vscale x 1 x i8> undef, <vscale x 1 x i8> undef
  select <vscale x 2 x i1> undef, <vscale x 2 x i8> undef, <vscale x 2 x i8> undef
  select <vscale x 4 x i1> undef, <vscale x 4 x i8> undef, <vscale x 4 x i8> undef
  select <vscale x 8 x i1> undef, <vscale x 8 x i8> undef, <vscale x 8 x i8> undef
  select <vscale x 16 x i1> undef, <vscale x 16 x i8> undef, <vscale x 16 x i8> undef
  select <vscale x 32 x i1> undef, <vscale x 32 x i8> undef, <vscale x 32 x i8> undef

  select i1 undef, i16 undef, i16 undef
  select <1 x i1> undef, <1 x i16> undef, <1 x i16> undef
  select <2 x i1> undef, <2 x i16> undef, <2 x i16> undef
  select <4 x i1> undef, <4 x i16> undef, <4 x i16> undef
  select <8 x i1> undef, <8 x i16> undef, <8 x i16> undef
  select <16 x i1> undef, <16 x i16> undef, <16 x i16> undef
  select <32 x i1> undef, <32 x i16> undef, <32 x i16> undef
  select <vscale x 1 x i1> undef, <vscale x 1 x i16> undef, <vscale x 1 x i16> undef
  select <vscale x 2 x i1> undef, <vscale x 2 x i16> undef, <vscale x 2 x i16> undef
  select <vscale x 4 x i1> undef, <vscale x 4 x i16> undef, <vscale x 4 x i16> undef
  select <vscale x 8 x i1> undef, <vscale x 8 x i16> undef, <vscale x 8 x i16> undef
  select <vscale x 16 x i1> undef, <vscale x 16 x i16> undef, <vscale x 16 x i16> undef
  select <vscale x 32 x i1> undef, <vscale x 32 x i16> undef, <vscale x 32 x i16> undef

  select i1 undef, i32 undef, i32 undef
  select <1 x i1> undef, <1 x i32> undef, <1 x i32> undef
  select <2 x i1> undef, <2 x i32> undef, <2 x i32> undef
  select <4 x i1> undef, <4 x i32> undef, <4 x i32> undef
  select <8 x i1> undef, <8 x i32> undef, <8 x i32> undef
  select <16 x i1> undef, <16 x i32> undef, <16 x i32> undef
  select <32 x i1> undef, <32 x i32> undef, <32 x i32> undef
  select <vscale x 1 x i1> undef, <vscale x 1 x i32> undef, <vscale x 1 x i32> undef
  select <vscale x 2 x i1> undef, <vscale x 2 x i32> undef, <vscale x 2 x i32> undef
  select <vscale x 4 x i1> undef, <vscale x 4 x i32> undef, <vscale x 4 x i32> undef
  select <vscale x 8 x i1> undef, <vscale x 8 x i32> undef, <vscale x 8 x i32> undef
  select <vscale x 16 x i1> undef, <vscale x 16 x i32> undef, <vscale x 16 x i32> undef
  select <vscale x 32 x i1> undef, <vscale x 32 x i32> undef, <vscale x 32 x i32> undef


  select i1 undef, i64 undef, i64 undef
  select <1 x i1> undef, <1 x i64> undef, <1 x i64> undef
  select <2 x i1> undef, <2 x i64> undef, <2 x i64> undef
  select <4 x i1> undef, <4 x i64> undef, <4 x i64> undef
  select <8 x i1> undef, <8 x i64> undef, <8 x i64> undef
  select <16 x i1> undef, <16 x i64> undef, <16 x i64> undef
  select <32 x i1> undef, <32 x i64> undef, <32 x i64> undef
  select <vscale x 1 x i1> undef, <vscale x 1 x i64> undef, <vscale x 1 x i64> undef
  select <vscale x 2 x i1> undef, <vscale x 2 x i64> undef, <vscale x 2 x i64> undef
  select <vscale x 4 x i1> undef, <vscale x 4 x i64> undef, <vscale x 4 x i64> undef
  select <vscale x 8 x i1> undef, <vscale x 8 x i64> undef, <vscale x 8 x i64> undef
  select <vscale x 16 x i1> undef, <vscale x 16 x i64> undef, <vscale x 16 x i64> undef
  select <vscale x 32 x i1> undef, <vscale x 32 x i64> undef, <vscale x 32 x i64> undef

  ret void
}
