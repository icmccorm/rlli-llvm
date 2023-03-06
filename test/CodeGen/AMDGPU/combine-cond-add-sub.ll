; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -march=amdgcn -verify-machineinstrs < %s | FileCheck -enable-var-scope -check-prefix=GCN %s
; RUN: llc -march=amdgcn -mcpu=gfx902  -verify-machineinstrs < %s | FileCheck -enable-var-scope -check-prefix=GFX9 %s

define amdgpu_kernel void @add1(i32 addrspace(1)* nocapture %arg) {
; GCN-LABEL: add1:
; GCN:       ; %bb.0: ; %bb
; GCN-NEXT:    s_load_dwordx2 s[0:1], s[0:1], 0x9
; GCN-NEXT:    s_mov_b32 s3, 0xf000
; GCN-NEXT:    s_mov_b32 s2, 0
; GCN-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GCN-NEXT:    v_mov_b32_e32 v3, 0
; GCN-NEXT:    s_waitcnt lgkmcnt(0)
; GCN-NEXT:    buffer_load_dword v4, v[2:3], s[0:3], 0 addr64
; GCN-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GCN-NEXT:    s_waitcnt vmcnt(0)
; GCN-NEXT:    v_addc_u32_e32 v0, vcc, 0, v4, vcc
; GCN-NEXT:    buffer_store_dword v0, v[2:3], s[0:3], 0 addr64
; GCN-NEXT:    s_endpgm
;
; GFX9-LABEL: add1:
; GFX9:       ; %bb.0: ; %bb
; GFX9-NEXT:    s_load_dwordx2 s[0:1], s[0:1], 0x24
; GFX9-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GFX9-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    global_load_dword v3, v2, s[0:1]
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    v_addc_co_u32_e32 v0, vcc, 0, v3, vcc
; GFX9-NEXT:    global_store_dword v2, v0, s[0:1]
; GFX9-NEXT:    s_endpgm
bb:
  %x = tail call i32 @llvm.amdgcn.workitem.id.x()
  %y = tail call i32 @llvm.amdgcn.workitem.id.y()
  %gep = getelementptr inbounds i32, i32 addrspace(1)* %arg, i32 %x
  %v = load i32, i32 addrspace(1)* %gep, align 4
  %cmp = icmp ugt i32 %x, %y
  %ext = zext i1 %cmp to i32
  %add = add i32 %v, %ext
  store i32 %add, i32 addrspace(1)* %gep, align 4
  ret void
}

define i16 @add1_i16(i32 addrspace(1)* nocapture %arg, i16 addrspace(1)* nocapture %dst) {
; GCN-LABEL: add1_i16:
; GCN:       ; %bb.0: ; %bb
; GCN-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GCN-NEXT:    v_and_b32_e32 v2, 0x3ff, v31
; GCN-NEXT:    s_mov_b32 s6, 0
; GCN-NEXT:    v_lshlrev_b32_e32 v3, 2, v2
; GCN-NEXT:    v_add_i32_e32 v0, vcc, v0, v3
; GCN-NEXT:    v_addc_u32_e32 v1, vcc, 0, v1, vcc
; GCN-NEXT:    s_mov_b32 s7, 0xf000
; GCN-NEXT:    s_mov_b32 s4, s6
; GCN-NEXT:    s_mov_b32 s5, s6
; GCN-NEXT:    buffer_load_dword v0, v[0:1], s[4:7], 0 addr64
; GCN-NEXT:    v_bfe_u32 v1, v31, 10, 10
; GCN-NEXT:    v_cmp_gt_u32_e32 vcc, v2, v1
; GCN-NEXT:    s_waitcnt vmcnt(0)
; GCN-NEXT:    v_addc_u32_e32 v0, vcc, 0, v0, vcc
; GCN-NEXT:    s_setpc_b64 s[30:31]
;
; GFX9-LABEL: add1_i16:
; GFX9:       ; %bb.0: ; %bb
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    v_and_b32_e32 v2, 0x3ff, v31
; GFX9-NEXT:    v_lshlrev_b32_e32 v3, 2, v2
; GFX9-NEXT:    v_add_co_u32_e32 v0, vcc, v0, v3
; GFX9-NEXT:    v_addc_co_u32_e32 v1, vcc, 0, v1, vcc
; GFX9-NEXT:    global_load_dword v0, v[0:1], off
; GFX9-NEXT:    v_bfe_u32 v1, v31, 10, 10
; GFX9-NEXT:    v_cmp_gt_u32_e32 vcc, v2, v1
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    v_addc_co_u32_e32 v0, vcc, 0, v0, vcc
; GFX9-NEXT:    s_setpc_b64 s[30:31]
bb:
  %x = tail call i32 @llvm.amdgcn.workitem.id.x()
  %y = tail call i32 @llvm.amdgcn.workitem.id.y()
  %gep = getelementptr inbounds i32, i32 addrspace(1)* %arg, i32 %x
  %v = load i32, i32 addrspace(1)* %gep, align 4
  %cmp = icmp ugt i32 %x, %y
  %ext = zext i1 %cmp to i32
  %add = add i32 %v, %ext
  %trunc = trunc i32 %add to i16
  ret i16 %trunc
}

define amdgpu_kernel void @sub1(i32 addrspace(1)* nocapture %arg) {
; GCN-LABEL: sub1:
; GCN:       ; %bb.0: ; %bb
; GCN-NEXT:    s_load_dwordx2 s[0:1], s[0:1], 0x9
; GCN-NEXT:    s_mov_b32 s3, 0xf000
; GCN-NEXT:    s_mov_b32 s2, 0
; GCN-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GCN-NEXT:    v_mov_b32_e32 v3, 0
; GCN-NEXT:    s_waitcnt lgkmcnt(0)
; GCN-NEXT:    buffer_load_dword v4, v[2:3], s[0:3], 0 addr64
; GCN-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GCN-NEXT:    s_waitcnt vmcnt(0)
; GCN-NEXT:    v_subbrev_u32_e32 v0, vcc, 0, v4, vcc
; GCN-NEXT:    buffer_store_dword v0, v[2:3], s[0:3], 0 addr64
; GCN-NEXT:    s_endpgm
;
; GFX9-LABEL: sub1:
; GFX9:       ; %bb.0: ; %bb
; GFX9-NEXT:    s_load_dwordx2 s[0:1], s[0:1], 0x24
; GFX9-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GFX9-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    global_load_dword v3, v2, s[0:1]
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    v_subbrev_co_u32_e32 v0, vcc, 0, v3, vcc
; GFX9-NEXT:    global_store_dword v2, v0, s[0:1]
; GFX9-NEXT:    s_endpgm
bb:
  %x = tail call i32 @llvm.amdgcn.workitem.id.x()
  %y = tail call i32 @llvm.amdgcn.workitem.id.y()
  %gep = getelementptr inbounds i32, i32 addrspace(1)* %arg, i32 %x
  %v = load i32, i32 addrspace(1)* %gep, align 4
  %cmp = icmp ugt i32 %x, %y
  %ext = sext i1 %cmp to i32
  %add = add i32 %v, %ext
  store i32 %add, i32 addrspace(1)* %gep, align 4
  ret void
}

define amdgpu_kernel void @add_adde(i32 addrspace(1)* nocapture %arg, i32 %a) {
; GCN-LABEL: add_adde:
; GCN:       ; %bb.0: ; %bb
; GCN-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x9
; GCN-NEXT:    s_load_dword s0, s[0:1], 0xb
; GCN-NEXT:    s_mov_b32 s7, 0xf000
; GCN-NEXT:    s_mov_b32 s6, 0
; GCN-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GCN-NEXT:    v_mov_b32_e32 v3, 0
; GCN-NEXT:    s_waitcnt lgkmcnt(0)
; GCN-NEXT:    buffer_load_dword v4, v[2:3], s[4:7], 0 addr64
; GCN-NEXT:    v_mov_b32_e32 v5, s0
; GCN-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GCN-NEXT:    s_waitcnt vmcnt(0)
; GCN-NEXT:    v_addc_u32_e32 v0, vcc, v5, v4, vcc
; GCN-NEXT:    buffer_store_dword v0, v[2:3], s[4:7], 0 addr64
; GCN-NEXT:    s_endpgm
;
; GFX9-LABEL: add_adde:
; GFX9:       ; %bb.0: ; %bb
; GFX9-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x24
; GFX9-NEXT:    s_load_dword s4, s[0:1], 0x2c
; GFX9-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GFX9-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    global_load_dword v3, v2, s[2:3]
; GFX9-NEXT:    v_mov_b32_e32 v4, s4
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    v_addc_co_u32_e32 v0, vcc, v4, v3, vcc
; GFX9-NEXT:    global_store_dword v2, v0, s[2:3]
; GFX9-NEXT:    s_endpgm
bb:
  %x = tail call i32 @llvm.amdgcn.workitem.id.x()
  %y = tail call i32 @llvm.amdgcn.workitem.id.y()
  %gep = getelementptr inbounds i32, i32 addrspace(1)* %arg, i32 %x
  %v = load i32, i32 addrspace(1)* %gep, align 4
  %cmp = icmp ugt i32 %x, %y
  %ext = zext i1 %cmp to i32
  %adde = add i32 %v, %ext
  %add2 = add i32 %adde, %a
  store i32 %add2, i32 addrspace(1)* %gep, align 4
  ret void
}

define amdgpu_kernel void @adde_add(i32 addrspace(1)* nocapture %arg, i32 %a) {
; GCN-LABEL: adde_add:
; GCN:       ; %bb.0: ; %bb
; GCN-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x9
; GCN-NEXT:    s_load_dword s0, s[0:1], 0xb
; GCN-NEXT:    s_mov_b32 s7, 0xf000
; GCN-NEXT:    s_mov_b32 s6, 0
; GCN-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GCN-NEXT:    v_mov_b32_e32 v3, 0
; GCN-NEXT:    s_waitcnt lgkmcnt(0)
; GCN-NEXT:    buffer_load_dword v4, v[2:3], s[4:7], 0 addr64
; GCN-NEXT:    v_mov_b32_e32 v5, s0
; GCN-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GCN-NEXT:    s_waitcnt vmcnt(0)
; GCN-NEXT:    v_addc_u32_e32 v0, vcc, v4, v5, vcc
; GCN-NEXT:    buffer_store_dword v0, v[2:3], s[4:7], 0 addr64
; GCN-NEXT:    s_endpgm
;
; GFX9-LABEL: adde_add:
; GFX9:       ; %bb.0: ; %bb
; GFX9-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x24
; GFX9-NEXT:    s_load_dword s4, s[0:1], 0x2c
; GFX9-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GFX9-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    global_load_dword v3, v2, s[2:3]
; GFX9-NEXT:    v_mov_b32_e32 v4, s4
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    v_addc_co_u32_e32 v0, vcc, v3, v4, vcc
; GFX9-NEXT:    global_store_dword v2, v0, s[2:3]
; GFX9-NEXT:    s_endpgm
bb:
  %x = tail call i32 @llvm.amdgcn.workitem.id.x()
  %y = tail call i32 @llvm.amdgcn.workitem.id.y()
  %gep = getelementptr inbounds i32, i32 addrspace(1)* %arg, i32 %x
  %v = load i32, i32 addrspace(1)* %gep, align 4
  %cmp = icmp ugt i32 %x, %y
  %ext = zext i1 %cmp to i32
  %add = add i32 %v, %a
  %adde = add i32 %add, %ext
  store i32 %adde, i32 addrspace(1)* %gep, align 4
  ret void
}

define amdgpu_kernel void @sub_sube(i32 addrspace(1)* nocapture %arg, i32 %a) {
; GCN-LABEL: sub_sube:
; GCN:       ; %bb.0: ; %bb
; GCN-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x9
; GCN-NEXT:    s_load_dword s0, s[0:1], 0xb
; GCN-NEXT:    s_mov_b32 s7, 0xf000
; GCN-NEXT:    s_mov_b32 s6, 0
; GCN-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GCN-NEXT:    v_mov_b32_e32 v3, 0
; GCN-NEXT:    s_waitcnt lgkmcnt(0)
; GCN-NEXT:    buffer_load_dword v4, v[2:3], s[4:7], 0 addr64
; GCN-NEXT:    v_mov_b32_e32 v5, s0
; GCN-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GCN-NEXT:    s_waitcnt vmcnt(0)
; GCN-NEXT:    v_subb_u32_e32 v0, vcc, v4, v5, vcc
; GCN-NEXT:    buffer_store_dword v0, v[2:3], s[4:7], 0 addr64
; GCN-NEXT:    s_endpgm
;
; GFX9-LABEL: sub_sube:
; GFX9:       ; %bb.0: ; %bb
; GFX9-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x24
; GFX9-NEXT:    s_load_dword s4, s[0:1], 0x2c
; GFX9-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GFX9-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    global_load_dword v3, v2, s[2:3]
; GFX9-NEXT:    v_mov_b32_e32 v4, s4
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    v_subb_co_u32_e32 v0, vcc, v3, v4, vcc
; GFX9-NEXT:    global_store_dword v2, v0, s[2:3]
; GFX9-NEXT:    s_endpgm
bb:
  %x = tail call i32 @llvm.amdgcn.workitem.id.x()
  %y = tail call i32 @llvm.amdgcn.workitem.id.y()
  %gep = getelementptr inbounds i32, i32 addrspace(1)* %arg, i32 %x
  %v = load i32, i32 addrspace(1)* %gep, align 4
  %cmp = icmp ugt i32 %x, %y
  %ext = sext i1 %cmp to i32
  %adde = add i32 %v, %ext
  %sub = sub i32 %adde, %a
  store i32 %sub, i32 addrspace(1)* %gep, align 4
  ret void
}

define amdgpu_kernel void @sub_sube_commuted(i32 addrspace(1)* nocapture %arg, i32 %a) {
; GCN-LABEL: sub_sube_commuted:
; GCN:       ; %bb.0: ; %bb
; GCN-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x9
; GCN-NEXT:    s_load_dword s0, s[0:1], 0xb
; GCN-NEXT:    s_mov_b32 s7, 0xf000
; GCN-NEXT:    s_mov_b32 s6, 0
; GCN-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GCN-NEXT:    v_mov_b32_e32 v3, 0
; GCN-NEXT:    s_waitcnt lgkmcnt(0)
; GCN-NEXT:    buffer_load_dword v4, v[2:3], s[4:7], 0 addr64
; GCN-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GCN-NEXT:    v_cndmask_b32_e64 v0, 0, 1, vcc
; GCN-NEXT:    s_waitcnt vmcnt(0)
; GCN-NEXT:    v_sub_i32_e32 v0, vcc, v0, v4
; GCN-NEXT:    v_add_i32_e32 v0, vcc, s0, v0
; GCN-NEXT:    v_add_i32_e32 v0, vcc, 0x64, v0
; GCN-NEXT:    buffer_store_dword v0, v[2:3], s[4:7], 0 addr64
; GCN-NEXT:    s_endpgm
;
; GFX9-LABEL: sub_sube_commuted:
; GFX9:       ; %bb.0: ; %bb
; GFX9-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x24
; GFX9-NEXT:    s_load_dword s4, s[0:1], 0x2c
; GFX9-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GFX9-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GFX9-NEXT:    v_cndmask_b32_e64 v0, 0, 1, vcc
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    global_load_dword v3, v2, s[2:3]
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    v_sub_u32_e32 v0, v0, v3
; GFX9-NEXT:    v_add_u32_e32 v0, s4, v0
; GFX9-NEXT:    v_add_u32_e32 v0, 0x64, v0
; GFX9-NEXT:    global_store_dword v2, v0, s[2:3]
; GFX9-NEXT:    s_endpgm
bb:
  %x = tail call i32 @llvm.amdgcn.workitem.id.x()
  %y = tail call i32 @llvm.amdgcn.workitem.id.y()
  %gep = getelementptr inbounds i32, i32 addrspace(1)* %arg, i32 %x
  %v = load i32, i32 addrspace(1)* %gep, align 4
  %cmp = icmp ugt i32 %x, %y
  %ext = sext i1 %cmp to i32
  %adde = add i32 %v, %ext
  %sub = sub i32 %adde, %a
  %sub2 = sub i32 100, %sub
  store i32 %sub2, i32 addrspace(1)* %gep, align 4
  ret void
}

define amdgpu_kernel void @sube_sub(i32 addrspace(1)* nocapture %arg, i32 %a) {
; GCN-LABEL: sube_sub:
; GCN:       ; %bb.0: ; %bb
; GCN-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x9
; GCN-NEXT:    s_load_dword s0, s[0:1], 0xb
; GCN-NEXT:    s_mov_b32 s7, 0xf000
; GCN-NEXT:    s_mov_b32 s6, 0
; GCN-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GCN-NEXT:    v_mov_b32_e32 v3, 0
; GCN-NEXT:    s_waitcnt lgkmcnt(0)
; GCN-NEXT:    buffer_load_dword v4, v[2:3], s[4:7], 0 addr64
; GCN-NEXT:    v_mov_b32_e32 v5, s0
; GCN-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GCN-NEXT:    s_waitcnt vmcnt(0)
; GCN-NEXT:    v_subb_u32_e32 v0, vcc, v4, v5, vcc
; GCN-NEXT:    buffer_store_dword v0, v[2:3], s[4:7], 0 addr64
; GCN-NEXT:    s_endpgm
;
; GFX9-LABEL: sube_sub:
; GFX9:       ; %bb.0: ; %bb
; GFX9-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x24
; GFX9-NEXT:    s_load_dword s4, s[0:1], 0x2c
; GFX9-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GFX9-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    global_load_dword v3, v2, s[2:3]
; GFX9-NEXT:    v_mov_b32_e32 v4, s4
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    v_subb_co_u32_e32 v0, vcc, v3, v4, vcc
; GFX9-NEXT:    global_store_dword v2, v0, s[2:3]
; GFX9-NEXT:    s_endpgm
bb:
  %x = tail call i32 @llvm.amdgcn.workitem.id.x()
  %y = tail call i32 @llvm.amdgcn.workitem.id.y()
  %gep = getelementptr inbounds i32, i32 addrspace(1)* %arg, i32 %x
  %v = load i32, i32 addrspace(1)* %gep, align 4
  %cmp = icmp ugt i32 %x, %y
  %ext = sext i1 %cmp to i32
  %sub = sub i32 %v, %a
  %adde = add i32 %sub, %ext
  store i32 %adde, i32 addrspace(1)* %gep, align 4
  ret void
}

define amdgpu_kernel void @zext_flclass(i32 addrspace(1)* nocapture %arg, float %x) {
; GCN-LABEL: zext_flclass:
; GCN:       ; %bb.0: ; %bb
; GCN-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x9
; GCN-NEXT:    s_load_dword s0, s[0:1], 0xb
; GCN-NEXT:    s_mov_b32 s7, 0xf000
; GCN-NEXT:    s_mov_b32 s6, 0
; GCN-NEXT:    v_lshlrev_b32_e32 v0, 2, v0
; GCN-NEXT:    v_mov_b32_e32 v1, 0
; GCN-NEXT:    s_waitcnt lgkmcnt(0)
; GCN-NEXT:    buffer_load_dword v2, v[0:1], s[4:7], 0 addr64
; GCN-NEXT:    v_mov_b32_e32 v3, 0x260
; GCN-NEXT:    v_cmp_class_f32_e32 vcc, s0, v3
; GCN-NEXT:    s_waitcnt vmcnt(0)
; GCN-NEXT:    v_addc_u32_e32 v2, vcc, 0, v2, vcc
; GCN-NEXT:    buffer_store_dword v2, v[0:1], s[4:7], 0 addr64
; GCN-NEXT:    s_endpgm
;
; GFX9-LABEL: zext_flclass:
; GFX9:       ; %bb.0: ; %bb
; GFX9-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x24
; GFX9-NEXT:    s_load_dword s4, s[0:1], 0x2c
; GFX9-NEXT:    v_lshlrev_b32_e32 v0, 2, v0
; GFX9-NEXT:    v_mov_b32_e32 v2, 0x260
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    global_load_dword v1, v0, s[2:3]
; GFX9-NEXT:    v_cmp_class_f32_e32 vcc, s4, v2
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    v_addc_co_u32_e32 v1, vcc, 0, v1, vcc
; GFX9-NEXT:    global_store_dword v0, v1, s[2:3]
; GFX9-NEXT:    s_endpgm
bb:
  %id = tail call i32 @llvm.amdgcn.workitem.id.x()
  %gep = getelementptr inbounds i32, i32 addrspace(1)* %arg, i32 %id
  %v = load i32, i32 addrspace(1)* %gep, align 4
  %cmp = tail call zeroext i1 @llvm.amdgcn.class.f32(float %x, i32 608)
  %ext = zext i1 %cmp to i32
  %add = add i32 %v, %ext
  store i32 %add, i32 addrspace(1)* %gep, align 4
  ret void
}

define amdgpu_kernel void @sext_flclass(i32 addrspace(1)* nocapture %arg, float %x) {
; GCN-LABEL: sext_flclass:
; GCN:       ; %bb.0: ; %bb
; GCN-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x9
; GCN-NEXT:    s_load_dword s0, s[0:1], 0xb
; GCN-NEXT:    s_mov_b32 s7, 0xf000
; GCN-NEXT:    s_mov_b32 s6, 0
; GCN-NEXT:    v_lshlrev_b32_e32 v0, 2, v0
; GCN-NEXT:    v_mov_b32_e32 v1, 0
; GCN-NEXT:    s_waitcnt lgkmcnt(0)
; GCN-NEXT:    buffer_load_dword v2, v[0:1], s[4:7], 0 addr64
; GCN-NEXT:    v_mov_b32_e32 v3, 0x260
; GCN-NEXT:    v_cmp_class_f32_e32 vcc, s0, v3
; GCN-NEXT:    s_waitcnt vmcnt(0)
; GCN-NEXT:    v_subbrev_u32_e32 v2, vcc, 0, v2, vcc
; GCN-NEXT:    buffer_store_dword v2, v[0:1], s[4:7], 0 addr64
; GCN-NEXT:    s_endpgm
;
; GFX9-LABEL: sext_flclass:
; GFX9:       ; %bb.0: ; %bb
; GFX9-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x24
; GFX9-NEXT:    s_load_dword s4, s[0:1], 0x2c
; GFX9-NEXT:    v_lshlrev_b32_e32 v0, 2, v0
; GFX9-NEXT:    v_mov_b32_e32 v2, 0x260
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    global_load_dword v1, v0, s[2:3]
; GFX9-NEXT:    v_cmp_class_f32_e32 vcc, s4, v2
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    v_subbrev_co_u32_e32 v1, vcc, 0, v1, vcc
; GFX9-NEXT:    global_store_dword v0, v1, s[2:3]
; GFX9-NEXT:    s_endpgm
bb:
  %id = tail call i32 @llvm.amdgcn.workitem.id.x()
  %gep = getelementptr inbounds i32, i32 addrspace(1)* %arg, i32 %id
  %v = load i32, i32 addrspace(1)* %gep, align 4
  %cmp = tail call zeroext i1 @llvm.amdgcn.class.f32(float %x, i32 608)
  %ext = sext i1 %cmp to i32
  %add = add i32 %v, %ext
  store i32 %add, i32 addrspace(1)* %gep, align 4
  ret void
}

define amdgpu_kernel void @add_and(i32 addrspace(1)* nocapture %arg) {
; GCN-LABEL: add_and:
; GCN:       ; %bb.0: ; %bb
; GCN-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x9
; GCN-NEXT:    s_mov_b32 s7, 0xf000
; GCN-NEXT:    s_mov_b32 s6, 0
; GCN-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GCN-NEXT:    v_mov_b32_e32 v3, 0
; GCN-NEXT:    s_waitcnt lgkmcnt(0)
; GCN-NEXT:    buffer_load_dword v4, v[2:3], s[4:7], 0 addr64
; GCN-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GCN-NEXT:    v_cmp_lt_u32_e64 s[0:1], 1, v0
; GCN-NEXT:    s_and_b64 vcc, vcc, s[0:1]
; GCN-NEXT:    s_waitcnt vmcnt(0)
; GCN-NEXT:    v_addc_u32_e32 v0, vcc, 0, v4, vcc
; GCN-NEXT:    buffer_store_dword v0, v[2:3], s[4:7], 0 addr64
; GCN-NEXT:    s_endpgm
;
; GFX9-LABEL: add_and:
; GFX9:       ; %bb.0: ; %bb
; GFX9-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x24
; GFX9-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GFX9-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GFX9-NEXT:    v_cmp_lt_u32_e64 s[0:1], 1, v0
; GFX9-NEXT:    s_and_b64 vcc, vcc, s[0:1]
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    global_load_dword v3, v2, s[2:3]
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    v_addc_co_u32_e32 v0, vcc, 0, v3, vcc
; GFX9-NEXT:    global_store_dword v2, v0, s[2:3]
; GFX9-NEXT:    s_endpgm
bb:
  %x = tail call i32 @llvm.amdgcn.workitem.id.x()
  %y = tail call i32 @llvm.amdgcn.workitem.id.y()
  %gep = getelementptr inbounds i32, i32 addrspace(1)* %arg, i32 %x
  %v = load i32, i32 addrspace(1)* %gep, align 4
  %cmp1 = icmp ugt i32 %x, %y
  %cmp2 = icmp ugt i32 %x, 1
  %cmp = and i1 %cmp1, %cmp2
  %ext = zext i1 %cmp to i32
  %add = add i32 %v, %ext
  store i32 %add, i32 addrspace(1)* %gep, align 4
  ret void
}

; sub x, sext (setcc) => addcarry x, 0, setcc
define amdgpu_kernel void @cmp_sub_sext(i32 addrspace(1)* nocapture %arg) {
; GCN-LABEL: cmp_sub_sext:
; GCN:       ; %bb.0: ; %bb
; GCN-NEXT:    s_load_dwordx2 s[0:1], s[0:1], 0x9
; GCN-NEXT:    s_mov_b32 s3, 0xf000
; GCN-NEXT:    s_mov_b32 s2, 0
; GCN-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GCN-NEXT:    v_mov_b32_e32 v3, 0
; GCN-NEXT:    s_waitcnt lgkmcnt(0)
; GCN-NEXT:    buffer_load_dword v4, v[2:3], s[0:3], 0 addr64
; GCN-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GCN-NEXT:    s_waitcnt vmcnt(0)
; GCN-NEXT:    v_addc_u32_e32 v0, vcc, 0, v4, vcc
; GCN-NEXT:    buffer_store_dword v0, v[2:3], s[0:3], 0 addr64
; GCN-NEXT:    s_endpgm
;
; GFX9-LABEL: cmp_sub_sext:
; GFX9:       ; %bb.0: ; %bb
; GFX9-NEXT:    s_load_dwordx2 s[0:1], s[0:1], 0x24
; GFX9-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GFX9-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    global_load_dword v3, v2, s[0:1]
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    v_addc_co_u32_e32 v0, vcc, 0, v3, vcc
; GFX9-NEXT:    global_store_dword v2, v0, s[0:1]
; GFX9-NEXT:    s_endpgm
bb:
  %x = tail call i32 @llvm.amdgcn.workitem.id.x()
  %y = tail call i32 @llvm.amdgcn.workitem.id.y()
  %gep = getelementptr inbounds i32, i32 addrspace(1)* %arg, i32 %x
  %v = load i32, i32 addrspace(1)* %gep, align 4
  %cmp = icmp ugt i32 %x, %y
  %ext = sext i1 %cmp to i32
  %add = sub i32 %v, %ext
  store i32 %add, i32 addrspace(1)* %gep, align 4
  ret void
}

; sub x, zext (setcc) => subcarry x, 0, setcc
define amdgpu_kernel void @cmp_sub_zext(i32 addrspace(1)* nocapture %arg) {
; GCN-LABEL: cmp_sub_zext:
; GCN:       ; %bb.0: ; %bb
; GCN-NEXT:    s_load_dwordx2 s[0:1], s[0:1], 0x9
; GCN-NEXT:    s_mov_b32 s3, 0xf000
; GCN-NEXT:    s_mov_b32 s2, 0
; GCN-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GCN-NEXT:    v_mov_b32_e32 v3, 0
; GCN-NEXT:    s_waitcnt lgkmcnt(0)
; GCN-NEXT:    buffer_load_dword v4, v[2:3], s[0:3], 0 addr64
; GCN-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GCN-NEXT:    s_waitcnt vmcnt(0)
; GCN-NEXT:    v_subbrev_u32_e32 v0, vcc, 0, v4, vcc
; GCN-NEXT:    buffer_store_dword v0, v[2:3], s[0:3], 0 addr64
; GCN-NEXT:    s_endpgm
;
; GFX9-LABEL: cmp_sub_zext:
; GFX9:       ; %bb.0: ; %bb
; GFX9-NEXT:    s_load_dwordx2 s[0:1], s[0:1], 0x24
; GFX9-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GFX9-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    global_load_dword v3, v2, s[0:1]
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    v_subbrev_co_u32_e32 v0, vcc, 0, v3, vcc
; GFX9-NEXT:    global_store_dword v2, v0, s[0:1]
; GFX9-NEXT:    s_endpgm
bb:
  %x = tail call i32 @llvm.amdgcn.workitem.id.x()
  %y = tail call i32 @llvm.amdgcn.workitem.id.y()
  %gep = getelementptr inbounds i32, i32 addrspace(1)* %arg, i32 %x
  %v = load i32, i32 addrspace(1)* %gep, align 4
  %cmp = icmp ugt i32 %x, %y
  %ext = zext i1 %cmp to i32
  %add = sub i32 %v, %ext
  store i32 %add, i32 addrspace(1)* %gep, align 4
  ret void
}

define amdgpu_kernel void @sub_addcarry(i32 addrspace(1)* nocapture %arg, i32 %a) {
; GCN-LABEL: sub_addcarry:
; GCN:       ; %bb.0: ; %bb
; GCN-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x9
; GCN-NEXT:    s_load_dword s0, s[0:1], 0xb
; GCN-NEXT:    s_mov_b32 s7, 0xf000
; GCN-NEXT:    s_mov_b32 s6, 0
; GCN-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GCN-NEXT:    v_mov_b32_e32 v3, 0
; GCN-NEXT:    s_waitcnt lgkmcnt(0)
; GCN-NEXT:    buffer_load_dword v4, v[2:3], s[4:7], 0 addr64
; GCN-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GCN-NEXT:    s_waitcnt vmcnt(0)
; GCN-NEXT:    v_addc_u32_e32 v0, vcc, 0, v4, vcc
; GCN-NEXT:    v_subrev_i32_e32 v0, vcc, s0, v0
; GCN-NEXT:    buffer_store_dword v0, v[2:3], s[4:7], 0 addr64
; GCN-NEXT:    s_endpgm
;
; GFX9-LABEL: sub_addcarry:
; GFX9:       ; %bb.0: ; %bb
; GFX9-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x24
; GFX9-NEXT:    s_load_dword s4, s[0:1], 0x2c
; GFX9-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GFX9-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    global_load_dword v3, v2, s[2:3]
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    v_addc_co_u32_e32 v0, vcc, 0, v3, vcc
; GFX9-NEXT:    v_subrev_u32_e32 v0, s4, v0
; GFX9-NEXT:    global_store_dword v2, v0, s[2:3]
; GFX9-NEXT:    s_endpgm
bb:
  %x = tail call i32 @llvm.amdgcn.workitem.id.x()
  %y = tail call i32 @llvm.amdgcn.workitem.id.y()
  %gep = getelementptr inbounds i32, i32 addrspace(1)* %arg, i32 %x
  %v = load i32, i32 addrspace(1)* %gep, align 4
  %cmp = icmp ugt i32 %x, %y
  %ext = zext i1 %cmp to i32
  %adde = add i32 %v, %ext
  %add2 = sub i32 %adde, %a
  store i32 %add2, i32 addrspace(1)* %gep, align 4
  ret void
}

define amdgpu_kernel void @sub_subcarry(i32 addrspace(1)* nocapture %arg, i32 %a) {
; GCN-LABEL: sub_subcarry:
; GCN:       ; %bb.0: ; %bb
; GCN-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x9
; GCN-NEXT:    s_load_dword s0, s[0:1], 0xb
; GCN-NEXT:    s_mov_b32 s7, 0xf000
; GCN-NEXT:    s_mov_b32 s6, 0
; GCN-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GCN-NEXT:    v_mov_b32_e32 v3, 0
; GCN-NEXT:    s_waitcnt lgkmcnt(0)
; GCN-NEXT:    buffer_load_dword v4, v[2:3], s[4:7], 0 addr64
; GCN-NEXT:    v_mov_b32_e32 v5, s0
; GCN-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GCN-NEXT:    s_waitcnt vmcnt(0)
; GCN-NEXT:    v_subb_u32_e32 v0, vcc, v4, v5, vcc
; GCN-NEXT:    buffer_store_dword v0, v[2:3], s[4:7], 0 addr64
; GCN-NEXT:    s_endpgm
;
; GFX9-LABEL: sub_subcarry:
; GFX9:       ; %bb.0: ; %bb
; GFX9-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x24
; GFX9-NEXT:    s_load_dword s4, s[0:1], 0x2c
; GFX9-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GFX9-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    global_load_dword v3, v2, s[2:3]
; GFX9-NEXT:    v_mov_b32_e32 v4, s4
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    v_subb_co_u32_e32 v0, vcc, v3, v4, vcc
; GFX9-NEXT:    global_store_dword v2, v0, s[2:3]
; GFX9-NEXT:    s_endpgm
bb:
  %x = tail call i32 @llvm.amdgcn.workitem.id.x()
  %y = tail call i32 @llvm.amdgcn.workitem.id.y()
  %gep = getelementptr inbounds i32, i32 addrspace(1)* %arg, i32 %x
  %v = load i32, i32 addrspace(1)* %gep, align 4
  %cmp = icmp ugt i32 %x, %y
  %ext = zext i1 %cmp to i32
  %adde = sub i32 %v, %ext
  %add2 = sub i32 %adde, %a
  store i32 %add2, i32 addrspace(1)* %gep, align 4
  ret void
}

; Check case where sub is commuted with zext
define amdgpu_kernel void @sub_zext_setcc_commute(i32 addrspace(1)* nocapture %arg, i32 %a, i32%b) {
; GCN-LABEL: sub_zext_setcc_commute:
; GCN:       ; %bb.0: ; %bb
; GCN-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x9
; GCN-NEXT:    s_load_dwordx2 s[0:1], s[0:1], 0xb
; GCN-NEXT:    s_mov_b32 s7, 0xf000
; GCN-NEXT:    s_mov_b32 s6, 0
; GCN-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GCN-NEXT:    v_mov_b32_e32 v3, 0
; GCN-NEXT:    s_waitcnt lgkmcnt(0)
; GCN-NEXT:    buffer_load_dword v4, v[2:3], s[4:7], 0 addr64
; GCN-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GCN-NEXT:    v_cndmask_b32_e64 v0, 0, 1, vcc
; GCN-NEXT:    s_waitcnt vmcnt(0)
; GCN-NEXT:    v_sub_i32_e32 v0, vcc, v0, v4
; GCN-NEXT:    v_add_i32_e32 v0, vcc, s0, v0
; GCN-NEXT:    v_subrev_i32_e32 v0, vcc, s1, v0
; GCN-NEXT:    buffer_store_dword v0, v[2:3], s[4:7], 0 addr64
; GCN-NEXT:    s_endpgm
;
; GFX9-LABEL: sub_zext_setcc_commute:
; GFX9:       ; %bb.0: ; %bb
; GFX9-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x24
; GFX9-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x2c
; GFX9-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GFX9-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GFX9-NEXT:    v_cndmask_b32_e64 v0, 0, 1, vcc
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    global_load_dword v3, v2, s[2:3]
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    v_sub_u32_e32 v0, v0, v3
; GFX9-NEXT:    v_add_u32_e32 v0, s4, v0
; GFX9-NEXT:    v_subrev_u32_e32 v0, s5, v0
; GFX9-NEXT:    global_store_dword v2, v0, s[2:3]
; GFX9-NEXT:    s_endpgm
bb:
  %x = tail call i32 @llvm.amdgcn.workitem.id.x()
  %y = tail call i32 @llvm.amdgcn.workitem.id.y()
  %gep = getelementptr inbounds i32, i32 addrspace(1)* %arg, i32 %x
  %v = load i32, i32 addrspace(1)* %gep, align 4
  %cmp = icmp ugt i32 %x, %y
  %ext = zext i1 %cmp to i32
  %adde = sub i32 %v, %ext
  %sub = sub i32 %a, %adde
  %sub2 = sub i32 %sub, %b
  store i32 %sub2, i32 addrspace(1)* %gep, align 4
  ret void
}

; Check case where sub is commuted with sext
define amdgpu_kernel void @sub_sext_setcc_commute(i32 addrspace(1)* nocapture %arg, i32 %a, i32%b) {
; GCN-LABEL: sub_sext_setcc_commute:
; GCN:       ; %bb.0: ; %bb
; GCN-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x9
; GCN-NEXT:    s_load_dwordx2 s[0:1], s[0:1], 0xb
; GCN-NEXT:    s_mov_b32 s7, 0xf000
; GCN-NEXT:    s_mov_b32 s6, 0
; GCN-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GCN-NEXT:    v_mov_b32_e32 v3, 0
; GCN-NEXT:    s_waitcnt lgkmcnt(0)
; GCN-NEXT:    buffer_load_dword v4, v[2:3], s[4:7], 0 addr64
; GCN-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GCN-NEXT:    v_cndmask_b32_e64 v0, 0, -1, vcc
; GCN-NEXT:    s_waitcnt vmcnt(0)
; GCN-NEXT:    v_sub_i32_e32 v0, vcc, v0, v4
; GCN-NEXT:    v_add_i32_e32 v0, vcc, s0, v0
; GCN-NEXT:    v_subrev_i32_e32 v0, vcc, s1, v0
; GCN-NEXT:    buffer_store_dword v0, v[2:3], s[4:7], 0 addr64
; GCN-NEXT:    s_endpgm
;
; GFX9-LABEL: sub_sext_setcc_commute:
; GFX9:       ; %bb.0: ; %bb
; GFX9-NEXT:    s_load_dwordx2 s[2:3], s[0:1], 0x24
; GFX9-NEXT:    s_load_dwordx2 s[4:5], s[0:1], 0x2c
; GFX9-NEXT:    v_lshlrev_b32_e32 v2, 2, v0
; GFX9-NEXT:    v_cmp_gt_u32_e32 vcc, v0, v1
; GFX9-NEXT:    v_cndmask_b32_e64 v0, 0, -1, vcc
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    global_load_dword v3, v2, s[2:3]
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    v_sub_u32_e32 v0, v0, v3
; GFX9-NEXT:    v_add_u32_e32 v0, s4, v0
; GFX9-NEXT:    v_subrev_u32_e32 v0, s5, v0
; GFX9-NEXT:    global_store_dword v2, v0, s[2:3]
; GFX9-NEXT:    s_endpgm
bb:
  %x = tail call i32 @llvm.amdgcn.workitem.id.x()
  %y = tail call i32 @llvm.amdgcn.workitem.id.y()
  %gep = getelementptr inbounds i32, i32 addrspace(1)* %arg, i32 %x
  %v = load i32, i32 addrspace(1)* %gep, align 4
  %cmp = icmp ugt i32 %x, %y
  %ext = sext i1 %cmp to i32
  %adde = sub i32 %v, %ext
  %sub = sub i32 %a, %adde
  %sub2 = sub i32 %sub, %b
  store i32 %sub2, i32 addrspace(1)* %gep, align 4
  ret void
}

declare i1 @llvm.amdgcn.class.f32(float, i32) #0

declare i32 @llvm.amdgcn.workitem.id.x() #0

declare i32 @llvm.amdgcn.workitem.id.y() #0

attributes #0 = { nounwind readnone speculatable }
