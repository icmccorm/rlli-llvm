; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -O3 -x86-asm-syntax=intel -mtriple=x86_64 -mcpu=skylake-avx512 < %s | FileCheck %s

declare <7 x i1> @llvm.get.active.lane.mask.v7i1.i64(i64, i64)
declare <16 x i1> @llvm.get.active.lane.mask.v16i1.i64(i64, i64)
declare <32 x i1> @llvm.get.active.lane.mask.v32i1.i64(i64, i64)
declare <64 x i1> @llvm.get.active.lane.mask.v64i1.i64(i64, i64)
declare <16 x i1> @llvm.get.active.lane.mask.v16i1.i32(i32, i32)
declare <64 x i1> @llvm.get.active.lane.mask.v64i1.i32(i32, i32)

define <7 x i1> @create_mask7(i64 %0) {
; CHECK-LABEL: create_mask7:
; CHECK:       # %bb.0:
; CHECK-NEXT:    mov rax, rdi
; CHECK-NEXT:    vpbroadcastq zmm0, rsi
; CHECK-NEXT:    vpcmpnleuq k0, zmm0, zmmword ptr [rip + {{\.?LCPI[0-9]+_[0-9]+}}]
; CHECK-NEXT:    kshiftrb k1, k0, 6
; CHECK-NEXT:    kmovd r8d, k1
; CHECK-NEXT:    kshiftrb k1, k0, 5
; CHECK-NEXT:    kmovd r9d, k1
; CHECK-NEXT:    kshiftrb k1, k0, 4
; CHECK-NEXT:    kmovd r10d, k1
; CHECK-NEXT:    kshiftrb k1, k0, 3
; CHECK-NEXT:    kmovd edi, k1
; CHECK-NEXT:    kshiftrb k1, k0, 2
; CHECK-NEXT:    kmovd ecx, k1
; CHECK-NEXT:    kshiftrb k1, k0, 1
; CHECK-NEXT:    kmovd edx, k1
; CHECK-NEXT:    kmovd esi, k0
; CHECK-NEXT:    and sil, 1
; CHECK-NEXT:    and dl, 1
; CHECK-NEXT:    add dl, dl
; CHECK-NEXT:    or dl, sil
; CHECK-NEXT:    and cl, 1
; CHECK-NEXT:    shl cl, 2
; CHECK-NEXT:    or cl, dl
; CHECK-NEXT:    and dil, 1
; CHECK-NEXT:    shl dil, 3
; CHECK-NEXT:    or dil, cl
; CHECK-NEXT:    and r10b, 1
; CHECK-NEXT:    shl r10b, 4
; CHECK-NEXT:    or r10b, dil
; CHECK-NEXT:    and r9b, 1
; CHECK-NEXT:    shl r9b, 5
; CHECK-NEXT:    or r9b, r10b
; CHECK-NEXT:    shl r8b, 6
; CHECK-NEXT:    or r8b, r9b
; CHECK-NEXT:    and r8b, 127
; CHECK-NEXT:    mov byte ptr [rax], r8b
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    ret
  %2 = call <7 x i1> @llvm.get.active.lane.mask.v7i1.i64(i64 0, i64 %0)
  ret <7 x i1> %2
}

define <16 x i1> @create_mask16(i64 %0) {
; CHECK-LABEL: create_mask16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpbroadcastq zmm0, rdi
; CHECK-NEXT:    vpcmpnleuq k0, zmm0, zmmword ptr [rip + {{\.?LCPI[0-9]+_[0-9]+}}]
; CHECK-NEXT:    vpcmpnleuq k1, zmm0, zmmword ptr [rip + {{\.?LCPI[0-9]+_[0-9]+}}]
; CHECK-NEXT:    kunpckbw k0, k1, k0
; CHECK-NEXT:    vpmovm2b xmm0, k0
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    ret
  %2 = call <16 x i1> @llvm.get.active.lane.mask.v16i1.i64(i64 0, i64 %0)
  ret <16 x i1> %2
}

define <32 x i1> @create_mask32(i64 %0) {
; CHECK-LABEL: create_mask32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpbroadcastq zmm0, rdi
; CHECK-NEXT:    vpcmpnleuq k0, zmm0, zmmword ptr [rip + {{\.?LCPI[0-9]+_[0-9]+}}]
; CHECK-NEXT:    vpcmpnleuq k1, zmm0, zmmword ptr [rip + {{\.?LCPI[0-9]+_[0-9]+}}]
; CHECK-NEXT:    vpcmpnleuq k2, zmm0, zmmword ptr [rip + {{\.?LCPI[0-9]+_[0-9]+}}]
; CHECK-NEXT:    kunpckbw k0, k1, k0
; CHECK-NEXT:    vpcmpnleuq k1, zmm0, zmmword ptr [rip + {{\.?LCPI[0-9]+_[0-9]+}}]
; CHECK-NEXT:    kunpckbw k1, k1, k2
; CHECK-NEXT:    kunpckwd k0, k1, k0
; CHECK-NEXT:    vpmovm2b ymm0, k0
; CHECK-NEXT:    ret
  %2 = call <32 x i1> @llvm.get.active.lane.mask.v32i1.i64(i64 0, i64 %0)
  ret <32 x i1> %2
}

define <64 x i1> @create_mask64(i64 %0) {
; CHECK-LABEL: create_mask64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpbroadcastq zmm0, rdi
; CHECK-NEXT:    vpcmpnleuq k0, zmm0, zmmword ptr [rip + {{\.?LCPI[0-9]+_[0-9]+}}]
; CHECK-NEXT:    vpcmpnleuq k1, zmm0, zmmword ptr [rip + {{\.?LCPI[0-9]+_[0-9]+}}]
; CHECK-NEXT:    vpcmpnleuq k2, zmm0, zmmword ptr [rip + {{\.?LCPI[0-9]+_[0-9]+}}]
; CHECK-NEXT:    kunpckbw k0, k1, k0
; CHECK-NEXT:    vpcmpnleuq k1, zmm0, zmmword ptr [rip + {{\.?LCPI[0-9]+_[0-9]+}}]
; CHECK-NEXT:    kunpckbw k1, k1, k2
; CHECK-NEXT:    vpcmpnleuq k2, zmm0, zmmword ptr [rip + {{\.?LCPI[0-9]+_[0-9]+}}]
; CHECK-NEXT:    kunpckwd k0, k1, k0
; CHECK-NEXT:    vpcmpnleuq k1, zmm0, zmmword ptr [rip + {{\.?LCPI[0-9]+_[0-9]+}}]
; CHECK-NEXT:    kunpckbw k1, k1, k2
; CHECK-NEXT:    vpcmpnleuq k2, zmm0, zmmword ptr [rip + {{\.?LCPI[0-9]+_[0-9]+}}]
; CHECK-NEXT:    vpcmpnleuq k3, zmm0, zmmword ptr [rip + {{\.?LCPI[0-9]+_[0-9]+}}]
; CHECK-NEXT:    kunpckbw k2, k3, k2
; CHECK-NEXT:    kunpckwd k1, k2, k1
; CHECK-NEXT:    kunpckdq k0, k1, k0
; CHECK-NEXT:    vpmovm2b zmm0, k0
; CHECK-NEXT:    ret
  %2 = call <64 x i1> @llvm.get.active.lane.mask.v64i1.i64(i64 0, i64 %0)
  ret <64 x i1> %2
}

define <16 x i1> @create_mask16_i32(i32 %0) {
; CHECK-LABEL: create_mask16_i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpbroadcastd zmm0, edi
; CHECK-NEXT:    vpcmpnleud k0, zmm0, zmmword ptr [rip + {{\.?LCPI[0-9]+_[0-9]+}}]
; CHECK-NEXT:    vpmovm2b xmm0, k0
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    ret
  %2 = call <16 x i1> @llvm.get.active.lane.mask.v16i1.i32(i32 0, i32 %0)
  ret <16 x i1> %2
}

define <64 x i1> @create_mask64_i32(i32 %0) {
; CHECK-LABEL: create_mask64_i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpbroadcastd zmm0, edi
; CHECK-NEXT:    vpcmpnleud k0, zmm0, zmmword ptr [rip + {{\.?LCPI[0-9]+_[0-9]+}}]
; CHECK-NEXT:    vpcmpnleud k1, zmm0, zmmword ptr [rip + {{\.?LCPI[0-9]+_[0-9]+}}]
; CHECK-NEXT:    vpcmpnleud k2, zmm0, zmmword ptr [rip + {{\.?LCPI[0-9]+_[0-9]+}}]
; CHECK-NEXT:    kunpckwd k0, k1, k0
; CHECK-NEXT:    vpcmpnleud k1, zmm0, zmmword ptr [rip + {{\.?LCPI[0-9]+_[0-9]+}}]
; CHECK-NEXT:    kunpckwd k1, k1, k2
; CHECK-NEXT:    kunpckdq k0, k1, k0
; CHECK-NEXT:    vpmovm2b zmm0, k0
; CHECK-NEXT:    ret
  %2 = call <64 x i1> @llvm.get.active.lane.mask.v64i1.i32(i32 0, i32 %0)
  ret <64 x i1> %2
}
