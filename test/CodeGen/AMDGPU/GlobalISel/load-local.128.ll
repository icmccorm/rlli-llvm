; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -global-isel -mtriple=amdgcn-amd-amdpal -mcpu=gfx900 -verify-machineinstrs < %s | FileCheck --check-prefix=GFX9 %s
; RUN: llc -global-isel -mtriple=amdgcn-amd-amdpal -mcpu=hawaii -verify-machineinstrs < %s | FileCheck --check-prefix=GFX7 %s
; RUN: llc -global-isel -mtriple=amdgcn-amd-amdpal -mcpu=gfx1010 -verify-machineinstrs < %s | FileCheck --check-prefix=GFX10 %s
; RUN: llc -global-isel -mtriple=amdgcn-amd-amdpal -mcpu=gfx1100 -verify-machineinstrs < %s | FileCheck --check-prefix=GFX11 %s

; FIXME:
; XUN: llc -global-isel -mtriple=amdgcn-amd-amdpal -mcpu=tahiti -verify-machineinstrs < %s | FileCheck --check-prefix=GFX6 %s

define <4 x i32> @load_lds_v4i32(<4 x i32> addrspace(3)* %ptr) {
; GFX9-LABEL: load_lds_v4i32:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    ds_read_b128 v[0:3], v0
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    s_setpc_b64 s[30:31]
;
; GFX7-LABEL: load_lds_v4i32:
; GFX7:       ; %bb.0:
; GFX7-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX7-NEXT:    s_mov_b32 m0, -1
; GFX7-NEXT:    ds_read_b128 v[0:3], v0
; GFX7-NEXT:    s_waitcnt lgkmcnt(0)
; GFX7-NEXT:    s_setpc_b64 s[30:31]
;
; GFX10-LABEL: load_lds_v4i32:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX10-NEXT:    ds_read_b128 v[0:3], v0
; GFX10-NEXT:    s_waitcnt lgkmcnt(0)
; GFX10-NEXT:    s_setpc_b64 s[30:31]
;
; GFX11-LABEL: load_lds_v4i32:
; GFX11:       ; %bb.0:
; GFX11-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX11-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX11-NEXT:    ds_load_b128 v[0:3], v0
; GFX11-NEXT:    s_waitcnt lgkmcnt(0)
; GFX11-NEXT:    s_setpc_b64 s[30:31]
  %load = load <4 x i32>, <4 x i32> addrspace(3)* %ptr
  ret <4 x i32> %load
}

define <4 x i32> @load_lds_v4i32_align1(<4 x i32> addrspace(3)* %ptr) {
; GFX9-LABEL: load_lds_v4i32_align1:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    ds_read_u8 v1, v0
; GFX9-NEXT:    ds_read_u8 v2, v0 offset:1
; GFX9-NEXT:    ds_read_u8 v3, v0 offset:2
; GFX9-NEXT:    ds_read_u8 v4, v0 offset:3
; GFX9-NEXT:    ds_read_u8 v5, v0 offset:4
; GFX9-NEXT:    ds_read_u8 v6, v0 offset:5
; GFX9-NEXT:    ds_read_u8 v7, v0 offset:6
; GFX9-NEXT:    ds_read_u8 v8, v0 offset:7
; GFX9-NEXT:    s_waitcnt lgkmcnt(6)
; GFX9-NEXT:    v_lshl_or_b32 v1, v2, 8, v1
; GFX9-NEXT:    s_waitcnt lgkmcnt(4)
; GFX9-NEXT:    v_lshlrev_b32_e32 v2, 24, v4
; GFX9-NEXT:    v_lshlrev_b32_e32 v3, 16, v3
; GFX9-NEXT:    v_or3_b32 v4, v2, v3, v1
; GFX9-NEXT:    s_waitcnt lgkmcnt(2)
; GFX9-NEXT:    v_lshl_or_b32 v1, v6, 8, v5
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    v_lshlrev_b32_e32 v2, 24, v8
; GFX9-NEXT:    v_lshlrev_b32_e32 v3, 16, v7
; GFX9-NEXT:    v_or3_b32 v1, v2, v3, v1
; GFX9-NEXT:    ds_read_u8 v2, v0 offset:8
; GFX9-NEXT:    ds_read_u8 v3, v0 offset:9
; GFX9-NEXT:    ds_read_u8 v5, v0 offset:10
; GFX9-NEXT:    ds_read_u8 v6, v0 offset:11
; GFX9-NEXT:    ds_read_u8 v7, v0 offset:12
; GFX9-NEXT:    ds_read_u8 v8, v0 offset:13
; GFX9-NEXT:    ds_read_u8 v9, v0 offset:14
; GFX9-NEXT:    ds_read_u8 v0, v0 offset:15
; GFX9-NEXT:    s_waitcnt lgkmcnt(6)
; GFX9-NEXT:    v_lshl_or_b32 v2, v3, 8, v2
; GFX9-NEXT:    s_waitcnt lgkmcnt(4)
; GFX9-NEXT:    v_lshlrev_b32_e32 v3, 24, v6
; GFX9-NEXT:    v_lshlrev_b32_e32 v5, 16, v5
; GFX9-NEXT:    v_or3_b32 v2, v3, v5, v2
; GFX9-NEXT:    s_waitcnt lgkmcnt(2)
; GFX9-NEXT:    v_lshl_or_b32 v3, v8, 8, v7
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    v_lshlrev_b32_e32 v0, 24, v0
; GFX9-NEXT:    v_lshlrev_b32_e32 v5, 16, v9
; GFX9-NEXT:    v_or3_b32 v3, v0, v5, v3
; GFX9-NEXT:    v_mov_b32_e32 v0, v4
; GFX9-NEXT:    s_setpc_b64 s[30:31]
;
; GFX7-LABEL: load_lds_v4i32_align1:
; GFX7:       ; %bb.0:
; GFX7-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX7-NEXT:    ds_read_u8 v1, v0 offset:1
; GFX7-NEXT:    ds_read_u8 v2, v0
; GFX7-NEXT:    ds_read_u8 v3, v0 offset:2
; GFX7-NEXT:    s_mov_b32 m0, -1
; GFX7-NEXT:    s_waitcnt lgkmcnt(2)
; GFX7-NEXT:    v_lshlrev_b32_e32 v1, 8, v1
; GFX7-NEXT:    s_waitcnt lgkmcnt(1)
; GFX7-NEXT:    v_or_b32_e32 v1, v1, v2
; GFX7-NEXT:    ds_read_u8 v2, v0 offset:3
; GFX7-NEXT:    ds_read_u8 v5, v0 offset:4
; GFX7-NEXT:    ds_read_u8 v6, v0 offset:5
; GFX7-NEXT:    ds_read_u8 v7, v0 offset:6
; GFX7-NEXT:    ds_read_u8 v8, v0 offset:7
; GFX7-NEXT:    ds_read_u8 v9, v0 offset:8
; GFX7-NEXT:    ds_read_u8 v10, v0 offset:9
; GFX7-NEXT:    ds_read_u8 v11, v0 offset:10
; GFX7-NEXT:    s_waitcnt lgkmcnt(7)
; GFX7-NEXT:    v_lshlrev_b32_e32 v2, 24, v2
; GFX7-NEXT:    v_lshlrev_b32_e32 v3, 16, v3
; GFX7-NEXT:    v_or_b32_e32 v2, v2, v3
; GFX7-NEXT:    v_or_b32_e32 v4, v2, v1
; GFX7-NEXT:    s_waitcnt lgkmcnt(5)
; GFX7-NEXT:    v_lshlrev_b32_e32 v1, 8, v6
; GFX7-NEXT:    s_waitcnt lgkmcnt(3)
; GFX7-NEXT:    v_lshlrev_b32_e32 v2, 24, v8
; GFX7-NEXT:    v_lshlrev_b32_e32 v3, 16, v7
; GFX7-NEXT:    v_or_b32_e32 v1, v1, v5
; GFX7-NEXT:    v_or_b32_e32 v2, v2, v3
; GFX7-NEXT:    ds_read_u8 v3, v0 offset:11
; GFX7-NEXT:    ds_read_u8 v5, v0 offset:12
; GFX7-NEXT:    ds_read_u8 v6, v0 offset:13
; GFX7-NEXT:    ds_read_u8 v7, v0 offset:14
; GFX7-NEXT:    ds_read_u8 v0, v0 offset:15
; GFX7-NEXT:    v_or_b32_e32 v1, v2, v1
; GFX7-NEXT:    s_waitcnt lgkmcnt(6)
; GFX7-NEXT:    v_lshlrev_b32_e32 v2, 8, v10
; GFX7-NEXT:    s_waitcnt lgkmcnt(4)
; GFX7-NEXT:    v_lshlrev_b32_e32 v3, 24, v3
; GFX7-NEXT:    v_lshlrev_b32_e32 v8, 16, v11
; GFX7-NEXT:    v_or_b32_e32 v2, v2, v9
; GFX7-NEXT:    v_or_b32_e32 v3, v3, v8
; GFX7-NEXT:    v_or_b32_e32 v2, v3, v2
; GFX7-NEXT:    s_waitcnt lgkmcnt(2)
; GFX7-NEXT:    v_lshlrev_b32_e32 v3, 8, v6
; GFX7-NEXT:    v_or_b32_e32 v3, v3, v5
; GFX7-NEXT:    s_waitcnt lgkmcnt(0)
; GFX7-NEXT:    v_lshlrev_b32_e32 v0, 24, v0
; GFX7-NEXT:    v_lshlrev_b32_e32 v5, 16, v7
; GFX7-NEXT:    v_or_b32_e32 v0, v0, v5
; GFX7-NEXT:    v_or_b32_e32 v3, v0, v3
; GFX7-NEXT:    v_mov_b32_e32 v0, v4
; GFX7-NEXT:    s_setpc_b64 s[30:31]
;
; GFX10-LABEL: load_lds_v4i32_align1:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX10-NEXT:    ds_read_u8 v1, v0
; GFX10-NEXT:    ds_read_u8 v2, v0 offset:1
; GFX10-NEXT:    ds_read_u8 v3, v0 offset:2
; GFX10-NEXT:    ds_read_u8 v4, v0 offset:3
; GFX10-NEXT:    ds_read_u8 v5, v0 offset:4
; GFX10-NEXT:    ds_read_u8 v6, v0 offset:5
; GFX10-NEXT:    ds_read_u8 v7, v0 offset:6
; GFX10-NEXT:    ds_read_u8 v8, v0 offset:7
; GFX10-NEXT:    ds_read_u8 v9, v0 offset:8
; GFX10-NEXT:    ds_read_u8 v10, v0 offset:9
; GFX10-NEXT:    ds_read_u8 v11, v0 offset:10
; GFX10-NEXT:    ds_read_u8 v12, v0 offset:11
; GFX10-NEXT:    ds_read_u8 v13, v0 offset:12
; GFX10-NEXT:    ds_read_u8 v14, v0 offset:13
; GFX10-NEXT:    ds_read_u8 v15, v0 offset:15
; GFX10-NEXT:    ds_read_u8 v0, v0 offset:14
; GFX10-NEXT:    s_waitcnt lgkmcnt(14)
; GFX10-NEXT:    v_lshl_or_b32 v1, v2, 8, v1
; GFX10-NEXT:    s_waitcnt lgkmcnt(13)
; GFX10-NEXT:    v_lshlrev_b32_e32 v3, 16, v3
; GFX10-NEXT:    s_waitcnt lgkmcnt(12)
; GFX10-NEXT:    v_lshlrev_b32_e32 v2, 24, v4
; GFX10-NEXT:    s_waitcnt lgkmcnt(10)
; GFX10-NEXT:    v_lshl_or_b32 v4, v6, 8, v5
; GFX10-NEXT:    s_waitcnt lgkmcnt(9)
; GFX10-NEXT:    v_lshlrev_b32_e32 v6, 16, v7
; GFX10-NEXT:    s_waitcnt lgkmcnt(8)
; GFX10-NEXT:    v_lshlrev_b32_e32 v5, 24, v8
; GFX10-NEXT:    s_waitcnt lgkmcnt(6)
; GFX10-NEXT:    v_lshl_or_b32 v7, v10, 8, v9
; GFX10-NEXT:    s_waitcnt lgkmcnt(5)
; GFX10-NEXT:    v_lshlrev_b32_e32 v9, 16, v11
; GFX10-NEXT:    s_waitcnt lgkmcnt(4)
; GFX10-NEXT:    v_lshlrev_b32_e32 v8, 24, v12
; GFX10-NEXT:    s_waitcnt lgkmcnt(2)
; GFX10-NEXT:    v_lshl_or_b32 v10, v14, 8, v13
; GFX10-NEXT:    s_waitcnt lgkmcnt(1)
; GFX10-NEXT:    v_lshlrev_b32_e32 v11, 24, v15
; GFX10-NEXT:    s_waitcnt lgkmcnt(0)
; GFX10-NEXT:    v_lshlrev_b32_e32 v12, 16, v0
; GFX10-NEXT:    v_or3_b32 v0, v2, v3, v1
; GFX10-NEXT:    v_or3_b32 v1, v5, v6, v4
; GFX10-NEXT:    v_or3_b32 v2, v8, v9, v7
; GFX10-NEXT:    v_or3_b32 v3, v11, v12, v10
; GFX10-NEXT:    s_setpc_b64 s[30:31]
;
; GFX11-LABEL: load_lds_v4i32_align1:
; GFX11:       ; %bb.0:
; GFX11-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX11-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX11-NEXT:    ds_load_u8 v1, v0
; GFX11-NEXT:    ds_load_u8 v2, v0 offset:1
; GFX11-NEXT:    ds_load_u8 v3, v0 offset:2
; GFX11-NEXT:    ds_load_u8 v4, v0 offset:3
; GFX11-NEXT:    ds_load_u8 v5, v0 offset:4
; GFX11-NEXT:    ds_load_u8 v6, v0 offset:5
; GFX11-NEXT:    ds_load_u8 v7, v0 offset:6
; GFX11-NEXT:    ds_load_u8 v8, v0 offset:7
; GFX11-NEXT:    ds_load_u8 v9, v0 offset:8
; GFX11-NEXT:    ds_load_u8 v10, v0 offset:9
; GFX11-NEXT:    ds_load_u8 v11, v0 offset:10
; GFX11-NEXT:    ds_load_u8 v12, v0 offset:11
; GFX11-NEXT:    ds_load_u8 v13, v0 offset:12
; GFX11-NEXT:    ds_load_u8 v14, v0 offset:13
; GFX11-NEXT:    ds_load_u8 v15, v0 offset:15
; GFX11-NEXT:    ds_load_u8 v0, v0 offset:14
; GFX11-NEXT:    s_waitcnt lgkmcnt(14)
; GFX11-NEXT:    v_lshl_or_b32 v1, v2, 8, v1
; GFX11-NEXT:    s_waitcnt lgkmcnt(13)
; GFX11-NEXT:    v_lshlrev_b32_e32 v3, 16, v3
; GFX11-NEXT:    s_waitcnt lgkmcnt(12)
; GFX11-NEXT:    v_lshlrev_b32_e32 v2, 24, v4
; GFX11-NEXT:    s_waitcnt lgkmcnt(10)
; GFX11-NEXT:    v_lshl_or_b32 v4, v6, 8, v5
; GFX11-NEXT:    s_waitcnt lgkmcnt(9)
; GFX11-NEXT:    v_lshlrev_b32_e32 v6, 16, v7
; GFX11-NEXT:    s_waitcnt lgkmcnt(8)
; GFX11-NEXT:    v_lshlrev_b32_e32 v5, 24, v8
; GFX11-NEXT:    s_waitcnt lgkmcnt(6)
; GFX11-NEXT:    v_lshl_or_b32 v7, v10, 8, v9
; GFX11-NEXT:    s_waitcnt lgkmcnt(5)
; GFX11-NEXT:    v_lshlrev_b32_e32 v9, 16, v11
; GFX11-NEXT:    s_waitcnt lgkmcnt(4)
; GFX11-NEXT:    v_lshlrev_b32_e32 v8, 24, v12
; GFX11-NEXT:    s_waitcnt lgkmcnt(2)
; GFX11-NEXT:    v_lshl_or_b32 v10, v14, 8, v13
; GFX11-NEXT:    s_waitcnt lgkmcnt(1)
; GFX11-NEXT:    v_lshlrev_b32_e32 v11, 24, v15
; GFX11-NEXT:    s_waitcnt lgkmcnt(0)
; GFX11-NEXT:    v_lshlrev_b32_e32 v12, 16, v0
; GFX11-NEXT:    v_or3_b32 v0, v2, v3, v1
; GFX11-NEXT:    v_or3_b32 v1, v5, v6, v4
; GFX11-NEXT:    v_or3_b32 v2, v8, v9, v7
; GFX11-NEXT:    s_delay_alu instid0(VALU_DEP_4)
; GFX11-NEXT:    v_or3_b32 v3, v11, v12, v10
; GFX11-NEXT:    s_setpc_b64 s[30:31]
  %load = load <4 x i32>, <4 x i32> addrspace(3)* %ptr, align 1
  ret <4 x i32> %load
}

define <4 x i32> @load_lds_v4i32_align2(<4 x i32> addrspace(3)* %ptr) {
; GFX9-LABEL: load_lds_v4i32_align2:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    ds_read_u16 v1, v0
; GFX9-NEXT:    ds_read_u16 v2, v0 offset:2
; GFX9-NEXT:    ds_read_u16 v3, v0 offset:4
; GFX9-NEXT:    ds_read_u16 v4, v0 offset:6
; GFX9-NEXT:    ds_read_u16 v5, v0 offset:8
; GFX9-NEXT:    ds_read_u16 v6, v0 offset:10
; GFX9-NEXT:    ds_read_u16 v7, v0 offset:12
; GFX9-NEXT:    ds_read_u16 v8, v0 offset:14
; GFX9-NEXT:    s_waitcnt lgkmcnt(6)
; GFX9-NEXT:    v_lshl_or_b32 v0, v2, 16, v1
; GFX9-NEXT:    s_waitcnt lgkmcnt(4)
; GFX9-NEXT:    v_lshl_or_b32 v1, v4, 16, v3
; GFX9-NEXT:    s_waitcnt lgkmcnt(2)
; GFX9-NEXT:    v_lshl_or_b32 v2, v6, 16, v5
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    v_lshl_or_b32 v3, v8, 16, v7
; GFX9-NEXT:    s_setpc_b64 s[30:31]
;
; GFX7-LABEL: load_lds_v4i32_align2:
; GFX7:       ; %bb.0:
; GFX7-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX7-NEXT:    ds_read_u16 v1, v0
; GFX7-NEXT:    s_mov_b32 m0, -1
; GFX7-NEXT:    ds_read_u16 v2, v0 offset:2
; GFX7-NEXT:    ds_read_u16 v3, v0 offset:4
; GFX7-NEXT:    ds_read_u16 v4, v0 offset:6
; GFX7-NEXT:    ds_read_u16 v5, v0 offset:8
; GFX7-NEXT:    ds_read_u16 v6, v0 offset:10
; GFX7-NEXT:    ds_read_u16 v7, v0 offset:12
; GFX7-NEXT:    ds_read_u16 v8, v0 offset:14
; GFX7-NEXT:    s_waitcnt lgkmcnt(6)
; GFX7-NEXT:    v_lshlrev_b32_e32 v0, 16, v2
; GFX7-NEXT:    s_waitcnt lgkmcnt(2)
; GFX7-NEXT:    v_lshlrev_b32_e32 v2, 16, v6
; GFX7-NEXT:    v_or_b32_e32 v0, v0, v1
; GFX7-NEXT:    v_lshlrev_b32_e32 v1, 16, v4
; GFX7-NEXT:    v_or_b32_e32 v1, v1, v3
; GFX7-NEXT:    s_waitcnt lgkmcnt(0)
; GFX7-NEXT:    v_lshlrev_b32_e32 v3, 16, v8
; GFX7-NEXT:    v_or_b32_e32 v2, v2, v5
; GFX7-NEXT:    v_or_b32_e32 v3, v3, v7
; GFX7-NEXT:    s_setpc_b64 s[30:31]
;
; GFX10-LABEL: load_lds_v4i32_align2:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX10-NEXT:    ds_read_u16 v1, v0
; GFX10-NEXT:    ds_read_u16 v2, v0 offset:2
; GFX10-NEXT:    ds_read_u16 v3, v0 offset:4
; GFX10-NEXT:    ds_read_u16 v4, v0 offset:6
; GFX10-NEXT:    ds_read_u16 v5, v0 offset:8
; GFX10-NEXT:    ds_read_u16 v6, v0 offset:10
; GFX10-NEXT:    ds_read_u16 v7, v0 offset:12
; GFX10-NEXT:    ds_read_u16 v8, v0 offset:14
; GFX10-NEXT:    s_waitcnt lgkmcnt(6)
; GFX10-NEXT:    v_lshl_or_b32 v0, v2, 16, v1
; GFX10-NEXT:    s_waitcnt lgkmcnt(4)
; GFX10-NEXT:    v_lshl_or_b32 v1, v4, 16, v3
; GFX10-NEXT:    s_waitcnt lgkmcnt(2)
; GFX10-NEXT:    v_lshl_or_b32 v2, v6, 16, v5
; GFX10-NEXT:    s_waitcnt lgkmcnt(0)
; GFX10-NEXT:    v_lshl_or_b32 v3, v8, 16, v7
; GFX10-NEXT:    s_setpc_b64 s[30:31]
;
; GFX11-LABEL: load_lds_v4i32_align2:
; GFX11:       ; %bb.0:
; GFX11-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX11-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX11-NEXT:    ds_load_u16 v1, v0
; GFX11-NEXT:    ds_load_u16 v2, v0 offset:2
; GFX11-NEXT:    ds_load_u16 v3, v0 offset:4
; GFX11-NEXT:    ds_load_u16 v4, v0 offset:6
; GFX11-NEXT:    ds_load_u16 v5, v0 offset:8
; GFX11-NEXT:    ds_load_u16 v6, v0 offset:10
; GFX11-NEXT:    ds_load_u16 v7, v0 offset:12
; GFX11-NEXT:    ds_load_u16 v8, v0 offset:14
; GFX11-NEXT:    s_waitcnt lgkmcnt(6)
; GFX11-NEXT:    v_lshl_or_b32 v0, v2, 16, v1
; GFX11-NEXT:    s_waitcnt lgkmcnt(4)
; GFX11-NEXT:    v_lshl_or_b32 v1, v4, 16, v3
; GFX11-NEXT:    s_waitcnt lgkmcnt(2)
; GFX11-NEXT:    v_lshl_or_b32 v2, v6, 16, v5
; GFX11-NEXT:    s_waitcnt lgkmcnt(0)
; GFX11-NEXT:    v_lshl_or_b32 v3, v8, 16, v7
; GFX11-NEXT:    s_setpc_b64 s[30:31]
  %load = load <4 x i32>, <4 x i32> addrspace(3)* %ptr, align 2
  ret <4 x i32> %load
}

define <4 x i32> @load_lds_v4i32_align4(<4 x i32> addrspace(3)* %ptr) {
; GFX9-LABEL: load_lds_v4i32_align4:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    v_mov_b32_e32 v2, v0
; GFX9-NEXT:    ds_read2_b32 v[0:1], v0 offset1:1
; GFX9-NEXT:    ds_read2_b32 v[2:3], v2 offset0:2 offset1:3
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    s_setpc_b64 s[30:31]
;
; GFX7-LABEL: load_lds_v4i32_align4:
; GFX7:       ; %bb.0:
; GFX7-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX7-NEXT:    v_mov_b32_e32 v2, v0
; GFX7-NEXT:    s_mov_b32 m0, -1
; GFX7-NEXT:    ds_read2_b32 v[0:1], v0 offset1:1
; GFX7-NEXT:    ds_read2_b32 v[2:3], v2 offset0:2 offset1:3
; GFX7-NEXT:    s_waitcnt lgkmcnt(0)
; GFX7-NEXT:    s_setpc_b64 s[30:31]
;
; GFX10-LABEL: load_lds_v4i32_align4:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX10-NEXT:    v_mov_b32_e32 v2, v0
; GFX10-NEXT:    ds_read2_b32 v[0:1], v0 offset1:1
; GFX10-NEXT:    ds_read2_b32 v[2:3], v2 offset0:2 offset1:3
; GFX10-NEXT:    s_waitcnt lgkmcnt(0)
; GFX10-NEXT:    s_setpc_b64 s[30:31]
;
; GFX11-LABEL: load_lds_v4i32_align4:
; GFX11:       ; %bb.0:
; GFX11-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX11-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX11-NEXT:    v_mov_b32_e32 v2, v0
; GFX11-NEXT:    ds_load_2addr_b32 v[0:1], v0 offset1:1
; GFX11-NEXT:    ds_load_2addr_b32 v[2:3], v2 offset0:2 offset1:3
; GFX11-NEXT:    s_waitcnt lgkmcnt(0)
; GFX11-NEXT:    s_setpc_b64 s[30:31]
  %load = load <4 x i32>, <4 x i32> addrspace(3)* %ptr, align 4
  ret <4 x i32> %load
}

define <4 x i32> @load_lds_v4i32_align8(<4 x i32> addrspace(3)* %ptr) {
; GFX9-LABEL: load_lds_v4i32_align8:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    ds_read2_b64 v[0:3], v0 offset1:1
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    s_setpc_b64 s[30:31]
;
; GFX7-LABEL: load_lds_v4i32_align8:
; GFX7:       ; %bb.0:
; GFX7-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX7-NEXT:    s_mov_b32 m0, -1
; GFX7-NEXT:    ds_read2_b64 v[0:3], v0 offset1:1
; GFX7-NEXT:    s_waitcnt lgkmcnt(0)
; GFX7-NEXT:    s_setpc_b64 s[30:31]
;
; GFX10-LABEL: load_lds_v4i32_align8:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX10-NEXT:    v_mov_b32_e32 v2, v0
; GFX10-NEXT:    ds_read2_b32 v[0:1], v0 offset1:1
; GFX10-NEXT:    ds_read2_b32 v[2:3], v2 offset0:2 offset1:3
; GFX10-NEXT:    s_waitcnt lgkmcnt(0)
; GFX10-NEXT:    s_setpc_b64 s[30:31]
;
; GFX11-LABEL: load_lds_v4i32_align8:
; GFX11:       ; %bb.0:
; GFX11-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX11-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX11-NEXT:    ds_load_2addr_b64 v[0:3], v0 offset1:1
; GFX11-NEXT:    s_waitcnt lgkmcnt(0)
; GFX11-NEXT:    s_setpc_b64 s[30:31]
  %load = load <4 x i32>, <4 x i32> addrspace(3)* %ptr, align 8
  ret <4 x i32> %load
}

define <4 x i32> @load_lds_v4i32_align16(<4 x i32> addrspace(3)* %ptr) {
; GFX9-LABEL: load_lds_v4i32_align16:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    ds_read_b128 v[0:3], v0
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    s_setpc_b64 s[30:31]
;
; GFX7-LABEL: load_lds_v4i32_align16:
; GFX7:       ; %bb.0:
; GFX7-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX7-NEXT:    s_mov_b32 m0, -1
; GFX7-NEXT:    ds_read_b128 v[0:3], v0
; GFX7-NEXT:    s_waitcnt lgkmcnt(0)
; GFX7-NEXT:    s_setpc_b64 s[30:31]
;
; GFX10-LABEL: load_lds_v4i32_align16:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX10-NEXT:    ds_read_b128 v[0:3], v0
; GFX10-NEXT:    s_waitcnt lgkmcnt(0)
; GFX10-NEXT:    s_setpc_b64 s[30:31]
;
; GFX11-LABEL: load_lds_v4i32_align16:
; GFX11:       ; %bb.0:
; GFX11-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX11-NEXT:    s_waitcnt_vscnt null, 0x0
; GFX11-NEXT:    ds_load_b128 v[0:3], v0
; GFX11-NEXT:    s_waitcnt lgkmcnt(0)
; GFX11-NEXT:    s_setpc_b64 s[30:31]
  %load = load <4 x i32>, <4 x i32> addrspace(3)* %ptr, align 16
  ret <4 x i32> %load
}
