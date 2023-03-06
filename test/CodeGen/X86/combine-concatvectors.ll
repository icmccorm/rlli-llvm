; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+avx  | FileCheck %s --check-prefixes=CHECK,AVX1
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+avx2 | FileCheck %s --check-prefixes=CHECK,AVX2

define void @PR32957(ptr %in, ptr %out) {
; CHECK-LABEL: PR32957:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmovsd {{.*#+}} xmm0 = mem[0],zero
; CHECK-NEXT:    vmovaps %ymm0, (%rsi)
; CHECK-NEXT:    vzeroupper
; CHECK-NEXT:    retq
  %ld = load <2 x float>, ptr %in, align 8
  %ext = extractelement <2 x float> %ld, i64 0
  %ext2 = extractelement <2 x float> %ld, i64 1
  %ins = insertelement <8 x float> <float undef, float undef, float 0.0, float 0.0, float 0.0, float 0.0, float 0.0, float 0.0>, float %ext, i64 0
  %ins2 = insertelement <8 x float> %ins, float %ext2, i64 1
  store <8 x float> %ins2, ptr %out, align 32
  ret void
}

declare { i8, double } @fun()

; Check that this does not fail to combine concat_vectors of a value from
; merge_values through a bitcast.
define void @d(i1 %cmp) {
; CHECK-LABEL: d:
; CHECK:       # %bb.0: # %bar
; CHECK-NEXT:    pushq %rax
; CHECK-NEXT:    .cfi_def_cfa_offset 16
; CHECK-NEXT:    callq fun@PLT
bar:
  %val = call { i8, double } @fun()
  %extr = extractvalue { i8, double } %val, 1
  %bc = bitcast double %extr to <2 x float>
  br label %baz

baz:
  %extr1 = extractelement <2 x float> %bc, i64 0
  unreachable
}

@qa_ = external unnamed_addr global [49216 x i8], align 32

define void @concat_of_broadcast_v2f64_v4f64() {
; AVX1-LABEL: concat_of_broadcast_v2f64_v4f64:
; AVX1:       # %bb.0: # %alloca_0
; AVX1-NEXT:    movq qa_@GOTPCREL(%rip), %rax
; AVX1-NEXT:    movl $1091567616, 30256(%rax) # imm = 0x41100000
; AVX1-NEXT:    movabsq $4294967297, %rcx # imm = 0x100000001
; AVX1-NEXT:    movq %rcx, 46348(%rax)
; AVX1-NEXT:    vbroadcastf128 {{.*#+}} ymm0 = [7.812501848093234E-3,7.812501848093234E-3,7.812501848093234E-3,7.812501848093234E-3]
; AVX1-NEXT:    # ymm0 = mem[0,1,0,1]
; AVX1-NEXT:    vmovups %ymm0, 48296(%rax)
; AVX1-NEXT:    vmovsd {{.*#+}} xmm0 = mem[0],zero
; AVX1-NEXT:    vmovsd %xmm0, 47372(%rax)
; AVX1-NEXT:    vzeroupper
; AVX1-NEXT:    retq
;
; AVX2-LABEL: concat_of_broadcast_v2f64_v4f64:
; AVX2:       # %bb.0: # %alloca_0
; AVX2-NEXT:    movq qa_@GOTPCREL(%rip), %rax
; AVX2-NEXT:    movl $1091567616, 30256(%rax) # imm = 0x41100000
; AVX2-NEXT:    movabsq $4294967297, %rcx # imm = 0x100000001
; AVX2-NEXT:    movq %rcx, 46348(%rax)
; AVX2-NEXT:    vbroadcastss {{.*#+}} xmm0 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0]
; AVX2-NEXT:    vbroadcastsd %xmm0, %ymm1
; AVX2-NEXT:    vmovups %ymm1, 48296(%rax)
; AVX2-NEXT:    vmovlps %xmm0, 47372(%rax)
; AVX2-NEXT:    vzeroupper
; AVX2-NEXT:    retq
alloca_0:
  store float 9.000000e+00, ptr getelementptr inbounds ([49216 x i8], ptr @qa_, i64 0, i64 30256), align 16
  store <2 x i32> <i32 1, i32 1>, ptr getelementptr inbounds ([49216 x i8], ptr @qa_, i64 0, i64 46348), align 4
  br label %loop.4942

loop.4942:                                        ; preds = %loop.4942, %alloca_0
  br i1 undef, label %loop.4942, label %ifmerge.1298

ifmerge.1298:                                     ; preds = %loop.4942
  %gepload4638 = load float, ptr getelementptr inbounds ([49216 x i8], ptr @qa_, i64 0, i64 28324), align 4
  store <2 x float> <float 1.000000e+00, float 1.000000e+00>, ptr getelementptr inbounds ([49216 x i8], ptr @qa_, i64 0, i64 48296), align 8
  store <2 x float> <float 1.000000e+00, float 1.000000e+00>, ptr getelementptr inbounds ([49216 x i8], ptr @qa_, i64 0, i64 48304), align 16
  store <2 x float> <float 1.000000e+00, float 1.000000e+00>, ptr getelementptr inbounds ([49216 x i8], ptr @qa_, i64 0, i64 48312), align 8
  store <2 x float> <float 1.000000e+00, float 1.000000e+00>, ptr getelementptr inbounds ([49216 x i8], ptr @qa_, i64 0, i64 48320), align 32
  store <2 x float> <float 1.000000e+00, float 1.000000e+00>, ptr getelementptr inbounds ([49216 x i8], ptr @qa_, i64 0, i64 47372), align 4
  ret void
}

define <4 x float> @concat_of_broadcast_v4f32_v8f32(ptr %a0, ptr %a1, ptr %a2) {
; AVX1-LABEL: concat_of_broadcast_v4f32_v8f32:
; AVX1:       # %bb.0:
; AVX1-NEXT:    vmovaps (%rdi), %ymm0
; AVX1-NEXT:    vmovaps (%rsi), %ymm1
; AVX1-NEXT:    vmovaps (%rdx), %ymm2
; AVX1-NEXT:    vpermilps {{.*#+}} xmm1 = xmm1[0,0,0,0]
; AVX1-NEXT:    vinsertf128 $1, %xmm1, %ymm1, %ymm1
; AVX1-NEXT:    vblendps {{.*#+}} ymm0 = ymm0[0,1,2,3,4,5],ymm1[6,7]
; AVX1-NEXT:    vblendps {{.*#+}} ymm0 = ymm2[0,1,2,3],ymm0[4],ymm2[5,6],ymm0[7]
; AVX1-NEXT:    vextractf128 $1, %ymm0, %xmm0
; AVX1-NEXT:    vshufps {{.*#+}} xmm1 = xmm2[3,0],xmm0[0,0]
; AVX1-NEXT:    vshufps {{.*#+}} xmm0 = xmm0[2,3],xmm1[2,0]
; AVX1-NEXT:    vzeroupper
; AVX1-NEXT:    retq
;
; AVX2-LABEL: concat_of_broadcast_v4f32_v8f32:
; AVX2:       # %bb.0:
; AVX2-NEXT:    vmovaps (%rdi), %ymm0
; AVX2-NEXT:    vunpcklps {{.*#+}} ymm0 = ymm0[0],mem[0],ymm0[1],mem[1],ymm0[4],mem[4],ymm0[5],mem[5]
; AVX2-NEXT:    vpermpd {{.*#+}} ymm0 = ymm0[0,1,2,0]
; AVX2-NEXT:    vmovaps {{.*#+}} xmm1 = [6,7,4,3]
; AVX2-NEXT:    vblendps {{.*#+}} ymm0 = mem[0,1,2,3],ymm0[4],mem[5,6],ymm0[7]
; AVX2-NEXT:    vpermps %ymm0, %ymm1, %ymm0
; AVX2-NEXT:    # kill: def $xmm0 killed $xmm0 killed $ymm0
; AVX2-NEXT:    vzeroupper
; AVX2-NEXT:    retq
  %ld0 = load volatile <8 x float>, ptr %a0
  %ld1 = load volatile <8 x float>, ptr %a1
  %ld2 = load volatile <8 x float>, ptr %a2
  %shuffle = shufflevector <8 x float> %ld0, <8 x float> %ld1, <8 x i32> <i32 undef, i32 undef, i32 undef, i32 undef, i32 4, i32 undef, i32 undef, i32 8>
  %shuffle1 = shufflevector <8 x float> %ld2, <8 x float> %shuffle, <4 x i32> <i32 6, i32 15, i32 12, i32 3>
  ret <4 x float> %shuffle1
}
