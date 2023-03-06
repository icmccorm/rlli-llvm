; NOTE: Assertions have been autogenerated by utils/update_analyze_test_checks.py
; RUN: opt -passes='print<cost-model>' 2>&1 -disable-output -mtriple=amdgcn-unknown-amdhsa -mcpu=gfx90a -mattr=+half-rate-64-ops < %s | FileCheck -check-prefixes=GFX9,GFX90A-FASTF64 %s
; RUN: opt -passes='print<cost-model>' 2>&1 -disable-output -mtriple=amdgcn-unknown-amdhsa -mcpu=gfx900 -mattr=+half-rate-64-ops < %s | FileCheck -check-prefixes=GFX9,F32,FASTF64 %s
; RUN: opt -passes='print<cost-model>' 2>&1 -disable-output -mtriple=amdgcn-unknown-amdhsa -mattr=-half-rate-64-ops < %s | FileCheck -check-prefixes=F32,SLOW %s
; RUN: opt -passes='print<cost-model>' -cost-kind=code-size 2>&1 -disable-output -mtriple=amdgcn-unknown-amdhsa -mcpu=gfx90a -mattr=+half-rate-64-ops < %s | FileCheck -check-prefixes=GFX9-SIZE,GFX90A-SIZE %s
; RUN: opt -passes='print<cost-model>' -cost-kind=code-size 2>&1 -disable-output -mtriple=amdgcn-unknown-amdhsa -mcpu=gfx900 -mattr=+half-rate-64-ops < %s | FileCheck -check-prefixes=SIZE,GFX9-SIZE %s
; RUN: opt -passes='print<cost-model>' -cost-kind=code-size 2>&1 -disable-output -mtriple=amdgcn-unknown-amdhsa -mattr=-half-rate-64-ops < %s | FileCheck -check-prefixes=SIZE,SLOW-SIZE %s
; END.

define amdgpu_kernel void @fmul_f32() #0 {
; GFX90A-FASTF64-LABEL: 'fmul_f32'
; GFX90A-FASTF64-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %f32 = fmul float undef, undef
; GFX90A-FASTF64-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v2f32 = fmul <2 x float> undef, undef
; GFX90A-FASTF64-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v3f32 = fmul <3 x float> undef, undef
; GFX90A-FASTF64-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v4f32 = fmul <4 x float> undef, undef
; GFX90A-FASTF64-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v5f32 = fmul <5 x float> undef, undef
; GFX90A-FASTF64-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v8f32 = fmul <8 x float> undef, undef
; GFX90A-FASTF64-NEXT:  Cost Model: Found an estimated cost of 24 for instruction: %v9f32 = fmul <9 x float> undef, undef
; GFX90A-FASTF64-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; F32-LABEL: 'fmul_f32'
; F32-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %f32 = fmul float undef, undef
; F32-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2f32 = fmul <2 x float> undef, undef
; F32-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3f32 = fmul <3 x float> undef, undef
; F32-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4f32 = fmul <4 x float> undef, undef
; F32-NEXT:  Cost Model: Found an estimated cost of 5 for instruction: %v5f32 = fmul <5 x float> undef, undef
; F32-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v8f32 = fmul <8 x float> undef, undef
; F32-NEXT:  Cost Model: Found an estimated cost of 48 for instruction: %v9f32 = fmul <9 x float> undef, undef
; F32-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; GFX90A-SIZE-LABEL: 'fmul_f32'
; GFX90A-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %f32 = fmul float undef, undef
; GFX90A-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v2f32 = fmul <2 x float> undef, undef
; GFX90A-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v3f32 = fmul <3 x float> undef, undef
; GFX90A-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v4f32 = fmul <4 x float> undef, undef
; GFX90A-SIZE-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v5f32 = fmul <5 x float> undef, undef
; GFX90A-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v8f32 = fmul <8 x float> undef, undef
; GFX90A-SIZE-NEXT:  Cost Model: Found an estimated cost of 24 for instruction: %v9f32 = fmul <9 x float> undef, undef
; GFX90A-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
; SIZE-LABEL: 'fmul_f32'
; SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %f32 = fmul float undef, undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2f32 = fmul <2 x float> undef, undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3f32 = fmul <3 x float> undef, undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4f32 = fmul <4 x float> undef, undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 5 for instruction: %v5f32 = fmul <5 x float> undef, undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v8f32 = fmul <8 x float> undef, undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 48 for instruction: %v9f32 = fmul <9 x float> undef, undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  %f32 = fmul float undef, undef
  %v2f32 = fmul <2 x float> undef, undef
  %v3f32 = fmul <3 x float> undef, undef
  %v4f32 = fmul <4 x float> undef, undef
  %v5f32 = fmul <5 x float> undef, undef
  %v8f32 = fmul <8 x float> undef, undef
  %v9f32 = fmul <9 x float> undef, undef
  ret void
}

define amdgpu_kernel void @fmul_f64() #0 {
; GFX90A-FASTF64-LABEL: 'fmul_f64'
; GFX90A-FASTF64-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %f64 = fmul double undef, undef
; GFX90A-FASTF64-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2f64 = fmul <2 x double> undef, undef
; GFX90A-FASTF64-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3f64 = fmul <3 x double> undef, undef
; GFX90A-FASTF64-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4f64 = fmul <4 x double> undef, undef
; GFX90A-FASTF64-NEXT:  Cost Model: Found an estimated cost of 24 for instruction: %v5f64 = fmul <5 x double> undef, undef
; GFX90A-FASTF64-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; FASTF64-LABEL: 'fmul_f64'
; FASTF64-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %f64 = fmul double undef, undef
; FASTF64-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v2f64 = fmul <2 x double> undef, undef
; FASTF64-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %v3f64 = fmul <3 x double> undef, undef
; FASTF64-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v4f64 = fmul <4 x double> undef, undef
; FASTF64-NEXT:  Cost Model: Found an estimated cost of 48 for instruction: %v5f64 = fmul <5 x double> undef, undef
; FASTF64-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; SLOW-LABEL: 'fmul_f64'
; SLOW-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %f64 = fmul double undef, undef
; SLOW-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v2f64 = fmul <2 x double> undef, undef
; SLOW-NEXT:  Cost Model: Found an estimated cost of 12 for instruction: %v3f64 = fmul <3 x double> undef, undef
; SLOW-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %v4f64 = fmul <4 x double> undef, undef
; SLOW-NEXT:  Cost Model: Found an estimated cost of 96 for instruction: %v5f64 = fmul <5 x double> undef, undef
; SLOW-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; GFX90A-SIZE-LABEL: 'fmul_f64'
; GFX90A-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %f64 = fmul double undef, undef
; GFX90A-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2f64 = fmul <2 x double> undef, undef
; GFX90A-SIZE-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v3f64 = fmul <3 x double> undef, undef
; GFX90A-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4f64 = fmul <4 x double> undef, undef
; GFX90A-SIZE-NEXT:  Cost Model: Found an estimated cost of 24 for instruction: %v5f64 = fmul <5 x double> undef, undef
; GFX90A-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
; SIZE-LABEL: 'fmul_f64'
; SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %f64 = fmul double undef, undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v2f64 = fmul <2 x double> undef, undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %v3f64 = fmul <3 x double> undef, undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v4f64 = fmul <4 x double> undef, undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 48 for instruction: %v5f64 = fmul <5 x double> undef, undef
; SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  %f64 = fmul double undef, undef
  %v2f64 = fmul <2 x double> undef, undef
  %v3f64 = fmul <3 x double> undef, undef
  %v4f64 = fmul <4 x double> undef, undef
  %v5f64 = fmul <5 x double> undef, undef
  ret void
}

define amdgpu_kernel void @fmul_f16() #0 {
; GFX9-LABEL: 'fmul_f16'
; GFX9-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %f16 = fmul half undef, undef
; GFX9-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v2f16 = fmul <2 x half> undef, undef
; GFX9-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v3f16 = fmul <3 x half> undef, undef
; GFX9-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v4f16 = fmul <4 x half> undef, undef
; GFX9-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v5f16 = fmul <5 x half> undef, undef
; GFX9-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v16f16 = fmul <16 x half> undef, undef
; GFX9-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %v17f16 = fmul <17 x half> undef, undef
; GFX9-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; SLOW-LABEL: 'fmul_f16'
; SLOW-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %f16 = fmul half undef, undef
; SLOW-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2f16 = fmul <2 x half> undef, undef
; SLOW-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3f16 = fmul <3 x half> undef, undef
; SLOW-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4f16 = fmul <4 x half> undef, undef
; SLOW-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v5f16 = fmul <5 x half> undef, undef
; SLOW-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %v16f16 = fmul <16 x half> undef, undef
; SLOW-NEXT:  Cost Model: Found an estimated cost of 34 for instruction: %v17f16 = fmul <17 x half> undef, undef
; SLOW-NEXT:  Cost Model: Found an estimated cost of 10 for instruction: ret void
;
; GFX9-SIZE-LABEL: 'fmul_f16'
; GFX9-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %f16 = fmul half undef, undef
; GFX9-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v2f16 = fmul <2 x half> undef, undef
; GFX9-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v3f16 = fmul <3 x half> undef, undef
; GFX9-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v4f16 = fmul <4 x half> undef, undef
; GFX9-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v5f16 = fmul <5 x half> undef, undef
; GFX9-SIZE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v16f16 = fmul <16 x half> undef, undef
; GFX9-SIZE-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %v17f16 = fmul <17 x half> undef, undef
; GFX9-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
; SLOW-SIZE-LABEL: 'fmul_f16'
; SLOW-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %f16 = fmul half undef, undef
; SLOW-SIZE-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v2f16 = fmul <2 x half> undef, undef
; SLOW-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v3f16 = fmul <3 x half> undef, undef
; SLOW-SIZE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v4f16 = fmul <4 x half> undef, undef
; SLOW-SIZE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v5f16 = fmul <5 x half> undef, undef
; SLOW-SIZE-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %v16f16 = fmul <16 x half> undef, undef
; SLOW-SIZE-NEXT:  Cost Model: Found an estimated cost of 34 for instruction: %v17f16 = fmul <17 x half> undef, undef
; SLOW-SIZE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: ret void
;
  %f16 = fmul half undef, undef
  %v2f16 = fmul <2 x half> undef, undef
  %v3f16 = fmul <3 x half> undef, undef
  %v4f16 = fmul <4 x half> undef, undef
  %v5f16 = fmul <5 x half> undef, undef
  %v16f16 = fmul <16 x half> undef, undef
  %v17f16 = fmul <17 x half> undef, undef
  ret void
}

attributes #0 = { nounwind }
