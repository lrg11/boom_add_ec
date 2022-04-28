module PTW(
  input         clock,
  input         reset,
  output        io_requestor_0_req_ready,
  input         io_requestor_0_req_valid,
  input         io_requestor_0_req_bits_valid,
  input  [26:0] io_requestor_0_req_bits_bits_addr,
  output        io_requestor_0_resp_valid,
  output        io_requestor_0_resp_bits_ae,
  output [53:0] io_requestor_0_resp_bits_pte_ppn,
  output [1:0]  io_requestor_0_resp_bits_pte_reserved_for_software,
  output        io_requestor_0_resp_bits_pte_d,
  output        io_requestor_0_resp_bits_pte_a,
  output        io_requestor_0_resp_bits_pte_g,
  output        io_requestor_0_resp_bits_pte_u,
  output        io_requestor_0_resp_bits_pte_x,
  output        io_requestor_0_resp_bits_pte_w,
  output        io_requestor_0_resp_bits_pte_r,
  output        io_requestor_0_resp_bits_pte_v,
  output [1:0]  io_requestor_0_resp_bits_level,
  output        io_requestor_0_resp_bits_fragmented_superpage,
  output        io_requestor_0_resp_bits_homogeneous,
  output [3:0]  io_requestor_0_ptbr_mode,
  output [15:0] io_requestor_0_ptbr_asid,
  output [43:0] io_requestor_0_ptbr_ppn,
  output        io_requestor_0_status_debug,
  output        io_requestor_0_status_cease,
  output        io_requestor_0_status_wfi,
  output [31:0] io_requestor_0_status_isa,
  output [1:0]  io_requestor_0_status_dprv,
  output [1:0]  io_requestor_0_status_prv,
  output        io_requestor_0_status_sd,
  output [26:0] io_requestor_0_status_zero2,
  output [1:0]  io_requestor_0_status_sxl,
  output [1:0]  io_requestor_0_status_uxl,
  output        io_requestor_0_status_sd_rv32,
  output [7:0]  io_requestor_0_status_zero1,
  output        io_requestor_0_status_tsr,
  output        io_requestor_0_status_tw,
  output        io_requestor_0_status_tvm,
  output        io_requestor_0_status_mxr,
  output        io_requestor_0_status_sum,
  output        io_requestor_0_status_mprv,
  output [1:0]  io_requestor_0_status_xs,
  output [1:0]  io_requestor_0_status_fs,
  output [1:0]  io_requestor_0_status_mpp,
  output [1:0]  io_requestor_0_status_vs,
  output        io_requestor_0_status_spp,
  output        io_requestor_0_status_mpie,
  output        io_requestor_0_status_hpie,
  output        io_requestor_0_status_spie,
  output        io_requestor_0_status_upie,
  output        io_requestor_0_status_mie,
  output        io_requestor_0_status_hie,
  output        io_requestor_0_status_sie,
  output        io_requestor_0_status_uie,
  output        io_requestor_0_pmp_0_cfg_l,
  output [1:0]  io_requestor_0_pmp_0_cfg_res,
  output [1:0]  io_requestor_0_pmp_0_cfg_a,
  output        io_requestor_0_pmp_0_cfg_x,
  output        io_requestor_0_pmp_0_cfg_w,
  output        io_requestor_0_pmp_0_cfg_r,
  output [29:0] io_requestor_0_pmp_0_addr,
  output [31:0] io_requestor_0_pmp_0_mask,
  output        io_requestor_0_pmp_1_cfg_l,
  output [1:0]  io_requestor_0_pmp_1_cfg_res,
  output [1:0]  io_requestor_0_pmp_1_cfg_a,
  output        io_requestor_0_pmp_1_cfg_x,
  output        io_requestor_0_pmp_1_cfg_w,
  output        io_requestor_0_pmp_1_cfg_r,
  output [29:0] io_requestor_0_pmp_1_addr,
  output [31:0] io_requestor_0_pmp_1_mask,
  output        io_requestor_0_pmp_2_cfg_l,
  output [1:0]  io_requestor_0_pmp_2_cfg_res,
  output [1:0]  io_requestor_0_pmp_2_cfg_a,
  output        io_requestor_0_pmp_2_cfg_x,
  output        io_requestor_0_pmp_2_cfg_w,
  output        io_requestor_0_pmp_2_cfg_r,
  output [29:0] io_requestor_0_pmp_2_addr,
  output [31:0] io_requestor_0_pmp_2_mask,
  output        io_requestor_0_pmp_3_cfg_l,
  output [1:0]  io_requestor_0_pmp_3_cfg_res,
  output [1:0]  io_requestor_0_pmp_3_cfg_a,
  output        io_requestor_0_pmp_3_cfg_x,
  output        io_requestor_0_pmp_3_cfg_w,
  output        io_requestor_0_pmp_3_cfg_r,
  output [29:0] io_requestor_0_pmp_3_addr,
  output [31:0] io_requestor_0_pmp_3_mask,
  output        io_requestor_0_pmp_4_cfg_l,
  output [1:0]  io_requestor_0_pmp_4_cfg_res,
  output [1:0]  io_requestor_0_pmp_4_cfg_a,
  output        io_requestor_0_pmp_4_cfg_x,
  output        io_requestor_0_pmp_4_cfg_w,
  output        io_requestor_0_pmp_4_cfg_r,
  output [29:0] io_requestor_0_pmp_4_addr,
  output [31:0] io_requestor_0_pmp_4_mask,
  output        io_requestor_0_pmp_5_cfg_l,
  output [1:0]  io_requestor_0_pmp_5_cfg_res,
  output [1:0]  io_requestor_0_pmp_5_cfg_a,
  output        io_requestor_0_pmp_5_cfg_x,
  output        io_requestor_0_pmp_5_cfg_w,
  output        io_requestor_0_pmp_5_cfg_r,
  output [29:0] io_requestor_0_pmp_5_addr,
  output [31:0] io_requestor_0_pmp_5_mask,
  output        io_requestor_0_pmp_6_cfg_l,
  output [1:0]  io_requestor_0_pmp_6_cfg_res,
  output [1:0]  io_requestor_0_pmp_6_cfg_a,
  output        io_requestor_0_pmp_6_cfg_x,
  output        io_requestor_0_pmp_6_cfg_w,
  output        io_requestor_0_pmp_6_cfg_r,
  output [29:0] io_requestor_0_pmp_6_addr,
  output [31:0] io_requestor_0_pmp_6_mask,
  output        io_requestor_0_pmp_7_cfg_l,
  output [1:0]  io_requestor_0_pmp_7_cfg_res,
  output [1:0]  io_requestor_0_pmp_7_cfg_a,
  output        io_requestor_0_pmp_7_cfg_x,
  output        io_requestor_0_pmp_7_cfg_w,
  output        io_requestor_0_pmp_7_cfg_r,
  output [29:0] io_requestor_0_pmp_7_addr,
  output [31:0] io_requestor_0_pmp_7_mask,
  output        io_requestor_0_customCSRs_csrs_0_wen,
  output [63:0] io_requestor_0_customCSRs_csrs_0_wdata,
  output [63:0] io_requestor_0_customCSRs_csrs_0_value,
  output        io_requestor_1_req_ready,
  input         io_requestor_1_req_valid,
  input         io_requestor_1_req_bits_valid,
  input  [26:0] io_requestor_1_req_bits_bits_addr,
  output        io_requestor_1_resp_valid,
  output        io_requestor_1_resp_bits_ae,
  output [53:0] io_requestor_1_resp_bits_pte_ppn,
  output [1:0]  io_requestor_1_resp_bits_pte_reserved_for_software,
  output        io_requestor_1_resp_bits_pte_d,
  output        io_requestor_1_resp_bits_pte_a,
  output        io_requestor_1_resp_bits_pte_g,
  output        io_requestor_1_resp_bits_pte_u,
  output        io_requestor_1_resp_bits_pte_x,
  output        io_requestor_1_resp_bits_pte_w,
  output        io_requestor_1_resp_bits_pte_r,
  output        io_requestor_1_resp_bits_pte_v,
  output [1:0]  io_requestor_1_resp_bits_level,
  output        io_requestor_1_resp_bits_fragmented_superpage,
  output        io_requestor_1_resp_bits_homogeneous,
  output [3:0]  io_requestor_1_ptbr_mode,
  output [15:0] io_requestor_1_ptbr_asid,
  output [43:0] io_requestor_1_ptbr_ppn,
  output        io_requestor_1_status_debug,
  output        io_requestor_1_status_cease,
  output        io_requestor_1_status_wfi,
  output [31:0] io_requestor_1_status_isa,
  output [1:0]  io_requestor_1_status_dprv,
  output [1:0]  io_requestor_1_status_prv,
  output        io_requestor_1_status_sd,
  output [26:0] io_requestor_1_status_zero2,
  output [1:0]  io_requestor_1_status_sxl,
  output [1:0]  io_requestor_1_status_uxl,
  output        io_requestor_1_status_sd_rv32,
  output [7:0]  io_requestor_1_status_zero1,
  output        io_requestor_1_status_tsr,
  output        io_requestor_1_status_tw,
  output        io_requestor_1_status_tvm,
  output        io_requestor_1_status_mxr,
  output        io_requestor_1_status_sum,
  output        io_requestor_1_status_mprv,
  output [1:0]  io_requestor_1_status_xs,
  output [1:0]  io_requestor_1_status_fs,
  output [1:0]  io_requestor_1_status_mpp,
  output [1:0]  io_requestor_1_status_vs,
  output        io_requestor_1_status_spp,
  output        io_requestor_1_status_mpie,
  output        io_requestor_1_status_hpie,
  output        io_requestor_1_status_spie,
  output        io_requestor_1_status_upie,
  output        io_requestor_1_status_mie,
  output        io_requestor_1_status_hie,
  output        io_requestor_1_status_sie,
  output        io_requestor_1_status_uie,
  output        io_requestor_1_pmp_0_cfg_l,
  output [1:0]  io_requestor_1_pmp_0_cfg_res,
  output [1:0]  io_requestor_1_pmp_0_cfg_a,
  output        io_requestor_1_pmp_0_cfg_x,
  output        io_requestor_1_pmp_0_cfg_w,
  output        io_requestor_1_pmp_0_cfg_r,
  output [29:0] io_requestor_1_pmp_0_addr,
  output [31:0] io_requestor_1_pmp_0_mask,
  output        io_requestor_1_pmp_1_cfg_l,
  output [1:0]  io_requestor_1_pmp_1_cfg_res,
  output [1:0]  io_requestor_1_pmp_1_cfg_a,
  output        io_requestor_1_pmp_1_cfg_x,
  output        io_requestor_1_pmp_1_cfg_w,
  output        io_requestor_1_pmp_1_cfg_r,
  output [29:0] io_requestor_1_pmp_1_addr,
  output [31:0] io_requestor_1_pmp_1_mask,
  output        io_requestor_1_pmp_2_cfg_l,
  output [1:0]  io_requestor_1_pmp_2_cfg_res,
  output [1:0]  io_requestor_1_pmp_2_cfg_a,
  output        io_requestor_1_pmp_2_cfg_x,
  output        io_requestor_1_pmp_2_cfg_w,
  output        io_requestor_1_pmp_2_cfg_r,
  output [29:0] io_requestor_1_pmp_2_addr,
  output [31:0] io_requestor_1_pmp_2_mask,
  output        io_requestor_1_pmp_3_cfg_l,
  output [1:0]  io_requestor_1_pmp_3_cfg_res,
  output [1:0]  io_requestor_1_pmp_3_cfg_a,
  output        io_requestor_1_pmp_3_cfg_x,
  output        io_requestor_1_pmp_3_cfg_w,
  output        io_requestor_1_pmp_3_cfg_r,
  output [29:0] io_requestor_1_pmp_3_addr,
  output [31:0] io_requestor_1_pmp_3_mask,
  output        io_requestor_1_pmp_4_cfg_l,
  output [1:0]  io_requestor_1_pmp_4_cfg_res,
  output [1:0]  io_requestor_1_pmp_4_cfg_a,
  output        io_requestor_1_pmp_4_cfg_x,
  output        io_requestor_1_pmp_4_cfg_w,
  output        io_requestor_1_pmp_4_cfg_r,
  output [29:0] io_requestor_1_pmp_4_addr,
  output [31:0] io_requestor_1_pmp_4_mask,
  output        io_requestor_1_pmp_5_cfg_l,
  output [1:0]  io_requestor_1_pmp_5_cfg_res,
  output [1:0]  io_requestor_1_pmp_5_cfg_a,
  output        io_requestor_1_pmp_5_cfg_x,
  output        io_requestor_1_pmp_5_cfg_w,
  output        io_requestor_1_pmp_5_cfg_r,
  output [29:0] io_requestor_1_pmp_5_addr,
  output [31:0] io_requestor_1_pmp_5_mask,
  output        io_requestor_1_pmp_6_cfg_l,
  output [1:0]  io_requestor_1_pmp_6_cfg_res,
  output [1:0]  io_requestor_1_pmp_6_cfg_a,
  output        io_requestor_1_pmp_6_cfg_x,
  output        io_requestor_1_pmp_6_cfg_w,
  output        io_requestor_1_pmp_6_cfg_r,
  output [29:0] io_requestor_1_pmp_6_addr,
  output [31:0] io_requestor_1_pmp_6_mask,
  output        io_requestor_1_pmp_7_cfg_l,
  output [1:0]  io_requestor_1_pmp_7_cfg_res,
  output [1:0]  io_requestor_1_pmp_7_cfg_a,
  output        io_requestor_1_pmp_7_cfg_x,
  output        io_requestor_1_pmp_7_cfg_w,
  output        io_requestor_1_pmp_7_cfg_r,
  output [29:0] io_requestor_1_pmp_7_addr,
  output [31:0] io_requestor_1_pmp_7_mask,
  output        io_requestor_1_customCSRs_csrs_0_wen,
  output [63:0] io_requestor_1_customCSRs_csrs_0_wdata,
  output [63:0] io_requestor_1_customCSRs_csrs_0_value,
  output        io_requestor_2_req_ready,
  input         io_requestor_2_req_valid,
  input         io_requestor_2_req_bits_valid,
  input  [26:0] io_requestor_2_req_bits_bits_addr,
  output        io_requestor_2_resp_valid,
  output        io_requestor_2_resp_bits_ae,
  output [53:0] io_requestor_2_resp_bits_pte_ppn,
  output [1:0]  io_requestor_2_resp_bits_pte_reserved_for_software,
  output        io_requestor_2_resp_bits_pte_d,
  output        io_requestor_2_resp_bits_pte_a,
  output        io_requestor_2_resp_bits_pte_g,
  output        io_requestor_2_resp_bits_pte_u,
  output        io_requestor_2_resp_bits_pte_x,
  output        io_requestor_2_resp_bits_pte_w,
  output        io_requestor_2_resp_bits_pte_r,
  output        io_requestor_2_resp_bits_pte_v,
  output [1:0]  io_requestor_2_resp_bits_level,
  output        io_requestor_2_resp_bits_fragmented_superpage,
  output        io_requestor_2_resp_bits_homogeneous,
  output [3:0]  io_requestor_2_ptbr_mode,
  output [15:0] io_requestor_2_ptbr_asid,
  output [43:0] io_requestor_2_ptbr_ppn,
  output        io_requestor_2_status_debug,
  output        io_requestor_2_status_cease,
  output        io_requestor_2_status_wfi,
  output [31:0] io_requestor_2_status_isa,
  output [1:0]  io_requestor_2_status_dprv,
  output [1:0]  io_requestor_2_status_prv,
  output        io_requestor_2_status_sd,
  output [26:0] io_requestor_2_status_zero2,
  output [1:0]  io_requestor_2_status_sxl,
  output [1:0]  io_requestor_2_status_uxl,
  output        io_requestor_2_status_sd_rv32,
  output [7:0]  io_requestor_2_status_zero1,
  output        io_requestor_2_status_tsr,
  output        io_requestor_2_status_tw,
  output        io_requestor_2_status_tvm,
  output        io_requestor_2_status_mxr,
  output        io_requestor_2_status_sum,
  output        io_requestor_2_status_mprv,
  output [1:0]  io_requestor_2_status_xs,
  output [1:0]  io_requestor_2_status_fs,
  output [1:0]  io_requestor_2_status_mpp,
  output [1:0]  io_requestor_2_status_vs,
  output        io_requestor_2_status_spp,
  output        io_requestor_2_status_mpie,
  output        io_requestor_2_status_hpie,
  output        io_requestor_2_status_spie,
  output        io_requestor_2_status_upie,
  output        io_requestor_2_status_mie,
  output        io_requestor_2_status_hie,
  output        io_requestor_2_status_sie,
  output        io_requestor_2_status_uie,
  output        io_requestor_2_pmp_0_cfg_l,
  output [1:0]  io_requestor_2_pmp_0_cfg_res,
  output [1:0]  io_requestor_2_pmp_0_cfg_a,
  output        io_requestor_2_pmp_0_cfg_x,
  output        io_requestor_2_pmp_0_cfg_w,
  output        io_requestor_2_pmp_0_cfg_r,
  output [29:0] io_requestor_2_pmp_0_addr,
  output [31:0] io_requestor_2_pmp_0_mask,
  output        io_requestor_2_pmp_1_cfg_l,
  output [1:0]  io_requestor_2_pmp_1_cfg_res,
  output [1:0]  io_requestor_2_pmp_1_cfg_a,
  output        io_requestor_2_pmp_1_cfg_x,
  output        io_requestor_2_pmp_1_cfg_w,
  output        io_requestor_2_pmp_1_cfg_r,
  output [29:0] io_requestor_2_pmp_1_addr,
  output [31:0] io_requestor_2_pmp_1_mask,
  output        io_requestor_2_pmp_2_cfg_l,
  output [1:0]  io_requestor_2_pmp_2_cfg_res,
  output [1:0]  io_requestor_2_pmp_2_cfg_a,
  output        io_requestor_2_pmp_2_cfg_x,
  output        io_requestor_2_pmp_2_cfg_w,
  output        io_requestor_2_pmp_2_cfg_r,
  output [29:0] io_requestor_2_pmp_2_addr,
  output [31:0] io_requestor_2_pmp_2_mask,
  output        io_requestor_2_pmp_3_cfg_l,
  output [1:0]  io_requestor_2_pmp_3_cfg_res,
  output [1:0]  io_requestor_2_pmp_3_cfg_a,
  output        io_requestor_2_pmp_3_cfg_x,
  output        io_requestor_2_pmp_3_cfg_w,
  output        io_requestor_2_pmp_3_cfg_r,
  output [29:0] io_requestor_2_pmp_3_addr,
  output [31:0] io_requestor_2_pmp_3_mask,
  output        io_requestor_2_pmp_4_cfg_l,
  output [1:0]  io_requestor_2_pmp_4_cfg_res,
  output [1:0]  io_requestor_2_pmp_4_cfg_a,
  output        io_requestor_2_pmp_4_cfg_x,
  output        io_requestor_2_pmp_4_cfg_w,
  output        io_requestor_2_pmp_4_cfg_r,
  output [29:0] io_requestor_2_pmp_4_addr,
  output [31:0] io_requestor_2_pmp_4_mask,
  output        io_requestor_2_pmp_5_cfg_l,
  output [1:0]  io_requestor_2_pmp_5_cfg_res,
  output [1:0]  io_requestor_2_pmp_5_cfg_a,
  output        io_requestor_2_pmp_5_cfg_x,
  output        io_requestor_2_pmp_5_cfg_w,
  output        io_requestor_2_pmp_5_cfg_r,
  output [29:0] io_requestor_2_pmp_5_addr,
  output [31:0] io_requestor_2_pmp_5_mask,
  output        io_requestor_2_pmp_6_cfg_l,
  output [1:0]  io_requestor_2_pmp_6_cfg_res,
  output [1:0]  io_requestor_2_pmp_6_cfg_a,
  output        io_requestor_2_pmp_6_cfg_x,
  output        io_requestor_2_pmp_6_cfg_w,
  output        io_requestor_2_pmp_6_cfg_r,
  output [29:0] io_requestor_2_pmp_6_addr,
  output [31:0] io_requestor_2_pmp_6_mask,
  output        io_requestor_2_pmp_7_cfg_l,
  output [1:0]  io_requestor_2_pmp_7_cfg_res,
  output [1:0]  io_requestor_2_pmp_7_cfg_a,
  output        io_requestor_2_pmp_7_cfg_x,
  output        io_requestor_2_pmp_7_cfg_w,
  output        io_requestor_2_pmp_7_cfg_r,
  output [29:0] io_requestor_2_pmp_7_addr,
  output [31:0] io_requestor_2_pmp_7_mask,
  output        io_requestor_2_customCSRs_csrs_0_wen,
  output [63:0] io_requestor_2_customCSRs_csrs_0_wdata,
  output [63:0] io_requestor_2_customCSRs_csrs_0_value,
  input         io_mem_req_ready,
  output        io_mem_req_valid,
  output [39:0] io_mem_req_bits_addr,
  output [6:0]  io_mem_req_bits_tag,
  output [4:0]  io_mem_req_bits_cmd,
  output [1:0]  io_mem_req_bits_size,
  output        io_mem_req_bits_signed,
  output [1:0]  io_mem_req_bits_dprv,
  output        io_mem_req_bits_phys,
  output        io_mem_req_bits_no_alloc,
  output        io_mem_req_bits_no_xcpt,
  output [63:0] io_mem_req_bits_data,
  output [7:0]  io_mem_req_bits_mask,
  output        io_mem_s1_kill,
  output [63:0] io_mem_s1_data_data,
  output [7:0]  io_mem_s1_data_mask,
  input         io_mem_s2_nack,
  input         io_mem_s2_nack_cause_raw,
  output        io_mem_s2_kill,
  input         io_mem_s2_uncached,
  input  [31:0] io_mem_s2_paddr,
  input         io_mem_resp_valid,
  input  [39:0] io_mem_resp_bits_addr,
  input  [6:0]  io_mem_resp_bits_tag,
  input  [4:0]  io_mem_resp_bits_cmd,
  input  [1:0]  io_mem_resp_bits_size,
  input         io_mem_resp_bits_signed,
  input  [1:0]  io_mem_resp_bits_dprv,
  input  [63:0] io_mem_resp_bits_data,
  input  [7:0]  io_mem_resp_bits_mask,
  input         io_mem_resp_bits_replay,
  input         io_mem_resp_bits_has_data,
  input  [63:0] io_mem_resp_bits_data_word_bypass,
  input  [63:0] io_mem_resp_bits_data_raw,
  input  [63:0] io_mem_resp_bits_store_data,
  input         io_mem_replay_next,
  input         io_mem_s2_xcpt_ma_ld,
  input         io_mem_s2_xcpt_ma_st,
  input         io_mem_s2_xcpt_pf_ld,
  input         io_mem_s2_xcpt_pf_st,
  input         io_mem_s2_xcpt_ae_ld,
  input         io_mem_s2_xcpt_ae_st,
  input         io_mem_ordered,
  input         io_mem_perf_acquire,
  input         io_mem_perf_release,
  input         io_mem_perf_grant,
  input         io_mem_perf_tlbMiss,
  input         io_mem_perf_blocked,
  input         io_mem_perf_canAcceptStoreThenLoad,
  input         io_mem_perf_canAcceptStoreThenRMW,
  input         io_mem_perf_canAcceptLoadThenLoad,
  input         io_mem_perf_storeBufferEmptyAfterLoad,
  input         io_mem_perf_storeBufferEmptyAfterStore,
  output        io_mem_keep_clock_enabled,
  input         io_mem_clock_enabled,
  input  [3:0]  io_dpath_ptbr_mode,
  input  [15:0] io_dpath_ptbr_asid,
  input  [43:0] io_dpath_ptbr_ppn,
  input         io_dpath_sfence_valid,
  input         io_dpath_sfence_bits_rs1,
  input         io_dpath_sfence_bits_rs2,
  input  [38:0] io_dpath_sfence_bits_addr,
  input         io_dpath_sfence_bits_asid,
  input         io_dpath_status_debug,
  input         io_dpath_status_cease,
  input         io_dpath_status_wfi,
  input  [31:0] io_dpath_status_isa,
  input  [1:0]  io_dpath_status_dprv,
  input  [1:0]  io_dpath_status_prv,
  input         io_dpath_status_sd,
  input  [26:0] io_dpath_status_zero2,
  input  [1:0]  io_dpath_status_sxl,
  input  [1:0]  io_dpath_status_uxl,
  input         io_dpath_status_sd_rv32,
  input  [7:0]  io_dpath_status_zero1,
  input         io_dpath_status_tsr,
  input         io_dpath_status_tw,
  input         io_dpath_status_tvm,
  input         io_dpath_status_mxr,
  input         io_dpath_status_sum,
  input         io_dpath_status_mprv,
  input  [1:0]  io_dpath_status_xs,
  input  [1:0]  io_dpath_status_fs,
  input  [1:0]  io_dpath_status_mpp,
  input  [1:0]  io_dpath_status_vs,
  input         io_dpath_status_spp,
  input         io_dpath_status_mpie,
  input         io_dpath_status_hpie,
  input         io_dpath_status_spie,
  input         io_dpath_status_upie,
  input         io_dpath_status_mie,
  input         io_dpath_status_hie,
  input         io_dpath_status_sie,
  input         io_dpath_status_uie,
  input         io_dpath_pmp_0_cfg_l,
  input  [1:0]  io_dpath_pmp_0_cfg_res,
  input  [1:0]  io_dpath_pmp_0_cfg_a,
  input         io_dpath_pmp_0_cfg_x,
  input         io_dpath_pmp_0_cfg_w,
  input         io_dpath_pmp_0_cfg_r,
  input  [29:0] io_dpath_pmp_0_addr,
  input  [31:0] io_dpath_pmp_0_mask,
  input         io_dpath_pmp_1_cfg_l,
  input  [1:0]  io_dpath_pmp_1_cfg_res,
  input  [1:0]  io_dpath_pmp_1_cfg_a,
  input         io_dpath_pmp_1_cfg_x,
  input         io_dpath_pmp_1_cfg_w,
  input         io_dpath_pmp_1_cfg_r,
  input  [29:0] io_dpath_pmp_1_addr,
  input  [31:0] io_dpath_pmp_1_mask,
  input         io_dpath_pmp_2_cfg_l,
  input  [1:0]  io_dpath_pmp_2_cfg_res,
  input  [1:0]  io_dpath_pmp_2_cfg_a,
  input         io_dpath_pmp_2_cfg_x,
  input         io_dpath_pmp_2_cfg_w,
  input         io_dpath_pmp_2_cfg_r,
  input  [29:0] io_dpath_pmp_2_addr,
  input  [31:0] io_dpath_pmp_2_mask,
  input         io_dpath_pmp_3_cfg_l,
  input  [1:0]  io_dpath_pmp_3_cfg_res,
  input  [1:0]  io_dpath_pmp_3_cfg_a,
  input         io_dpath_pmp_3_cfg_x,
  input         io_dpath_pmp_3_cfg_w,
  input         io_dpath_pmp_3_cfg_r,
  input  [29:0] io_dpath_pmp_3_addr,
  input  [31:0] io_dpath_pmp_3_mask,
  input         io_dpath_pmp_4_cfg_l,
  input  [1:0]  io_dpath_pmp_4_cfg_res,
  input  [1:0]  io_dpath_pmp_4_cfg_a,
  input         io_dpath_pmp_4_cfg_x,
  input         io_dpath_pmp_4_cfg_w,
  input         io_dpath_pmp_4_cfg_r,
  input  [29:0] io_dpath_pmp_4_addr,
  input  [31:0] io_dpath_pmp_4_mask,
  input         io_dpath_pmp_5_cfg_l,
  input  [1:0]  io_dpath_pmp_5_cfg_res,
  input  [1:0]  io_dpath_pmp_5_cfg_a,
  input         io_dpath_pmp_5_cfg_x,
  input         io_dpath_pmp_5_cfg_w,
  input         io_dpath_pmp_5_cfg_r,
  input  [29:0] io_dpath_pmp_5_addr,
  input  [31:0] io_dpath_pmp_5_mask,
  input         io_dpath_pmp_6_cfg_l,
  input  [1:0]  io_dpath_pmp_6_cfg_res,
  input  [1:0]  io_dpath_pmp_6_cfg_a,
  input         io_dpath_pmp_6_cfg_x,
  input         io_dpath_pmp_6_cfg_w,
  input         io_dpath_pmp_6_cfg_r,
  input  [29:0] io_dpath_pmp_6_addr,
  input  [31:0] io_dpath_pmp_6_mask,
  input         io_dpath_pmp_7_cfg_l,
  input  [1:0]  io_dpath_pmp_7_cfg_res,
  input  [1:0]  io_dpath_pmp_7_cfg_a,
  input         io_dpath_pmp_7_cfg_x,
  input         io_dpath_pmp_7_cfg_w,
  input         io_dpath_pmp_7_cfg_r,
  input  [29:0] io_dpath_pmp_7_addr,
  input  [31:0] io_dpath_pmp_7_mask,
  output        io_dpath_perf_l2miss,
  output        io_dpath_perf_l2hit,
  output        io_dpath_perf_pte_miss,
  output        io_dpath_perf_pte_hit,
  input         io_dpath_customCSRs_csrs_0_wen,
  input  [63:0] io_dpath_customCSRs_csrs_0_wdata,
  input  [63:0] io_dpath_customCSRs_csrs_0_value,
  output        io_dpath_clock_enabled
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [511:0] _RAND_44;
  reg [511:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [63:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
`endif // RANDOMIZE_REG_INIT
  wire  arb_clock; // @[PTW.scala 112:19]
  wire  arb_reset; // @[PTW.scala 112:19]
  wire  arb_io_in_0_ready; // @[PTW.scala 112:19]
  wire  arb_io_in_0_valid; // @[PTW.scala 112:19]
  wire  arb_io_in_0_bits_valid; // @[PTW.scala 112:19]
  wire [26:0] arb_io_in_0_bits_bits_addr; // @[PTW.scala 112:19]
  wire  arb_io_in_1_ready; // @[PTW.scala 112:19]
  wire  arb_io_in_1_valid; // @[PTW.scala 112:19]
  wire  arb_io_in_1_bits_valid; // @[PTW.scala 112:19]
  wire [26:0] arb_io_in_1_bits_bits_addr; // @[PTW.scala 112:19]
  wire  arb_io_in_2_ready; // @[PTW.scala 112:19]
  wire  arb_io_in_2_valid; // @[PTW.scala 112:19]
  wire  arb_io_in_2_bits_valid; // @[PTW.scala 112:19]
  wire [26:0] arb_io_in_2_bits_bits_addr; // @[PTW.scala 112:19]
  wire  arb_io_out_ready; // @[PTW.scala 112:19]
  wire  arb_io_out_valid; // @[PTW.scala 112:19]
  wire  arb_io_out_bits_valid; // @[PTW.scala 112:19]
  wire [26:0] arb_io_out_bits_bits_addr; // @[PTW.scala 112:19]
  wire [1:0] arb_io_chosen; // @[PTW.scala 112:19]
  reg [44:0] l2_tlb_ram_0 [0:511]; // @[DescribedSRAM.scala 19:26]
  wire [44:0] l2_tlb_ram_0_s1_rdata_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] l2_tlb_ram_0_s1_rdata_addr; // @[DescribedSRAM.scala 19:26]
  wire [44:0] l2_tlb_ram_0_MPORT_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] l2_tlb_ram_0_MPORT_addr; // @[DescribedSRAM.scala 19:26]
  wire  l2_tlb_ram_0_MPORT_mask; // @[DescribedSRAM.scala 19:26]
  wire  l2_tlb_ram_0_MPORT_en; // @[DescribedSRAM.scala 19:26]
  reg  l2_tlb_ram_0_s1_rdata_en_pipe_0;
  reg [8:0] l2_tlb_ram_0_s1_rdata_addr_pipe_0;
  wire  state_barrier_clock; // @[package.scala 258:25]
  wire  state_barrier_reset; // @[package.scala 258:25]
  wire [2:0] state_barrier_io_x; // @[package.scala 258:25]
  wire [2:0] state_barrier_io_y; // @[package.scala 258:25]
  wire  r_pte_barrier_clock; // @[package.scala 258:25]
  wire  r_pte_barrier_reset; // @[package.scala 258:25]
  wire [53:0] r_pte_barrier_io_x_ppn; // @[package.scala 258:25]
  wire [1:0] r_pte_barrier_io_x_reserved_for_software; // @[package.scala 258:25]
  wire  r_pte_barrier_io_x_d; // @[package.scala 258:25]
  wire  r_pte_barrier_io_x_a; // @[package.scala 258:25]
  wire  r_pte_barrier_io_x_g; // @[package.scala 258:25]
  wire  r_pte_barrier_io_x_u; // @[package.scala 258:25]
  wire  r_pte_barrier_io_x_x; // @[package.scala 258:25]
  wire  r_pte_barrier_io_x_w; // @[package.scala 258:25]
  wire  r_pte_barrier_io_x_r; // @[package.scala 258:25]
  wire  r_pte_barrier_io_x_v; // @[package.scala 258:25]
  wire [53:0] r_pte_barrier_io_y_ppn; // @[package.scala 258:25]
  wire [1:0] r_pte_barrier_io_y_reserved_for_software; // @[package.scala 258:25]
  wire  r_pte_barrier_io_y_d; // @[package.scala 258:25]
  wire  r_pte_barrier_io_y_a; // @[package.scala 258:25]
  wire  r_pte_barrier_io_y_g; // @[package.scala 258:25]
  wire  r_pte_barrier_io_y_u; // @[package.scala 258:25]
  wire  r_pte_barrier_io_y_x; // @[package.scala 258:25]
  wire  r_pte_barrier_io_y_w; // @[package.scala 258:25]
  wire  r_pte_barrier_io_y_r; // @[package.scala 258:25]
  wire  r_pte_barrier_io_y_v; // @[package.scala 258:25]
  reg [2:0] state; // @[PTW.scala 109:18]
  reg  l2_refill; // @[PTW.scala 201:26]
  wire  _arb_io_out_ready_T_1 = ~l2_refill; // @[PTW.scala 114:46]
  reg  resp_valid_0; // @[PTW.scala 116:23]
  reg  resp_valid_1; // @[PTW.scala 116:23]
  reg  resp_valid_2; // @[PTW.scala 116:23]
  wire  _clock_en_T = state != 3'h0; // @[PTW.scala 118:24]
  reg  invalidated; // @[PTW.scala 125:24]
  reg [1:0] count; // @[PTW.scala 126:18]
  reg  resp_ae; // @[PTW.scala 127:24]
  reg [26:0] r_req_addr; // @[PTW.scala 130:18]
  reg [1:0] r_req_dest; // @[PTW.scala 131:23]
  reg [53:0] r_pte_ppn; // @[PTW.scala 132:18]
  reg [1:0] r_pte_reserved_for_software; // @[PTW.scala 132:18]
  reg  r_pte_d; // @[PTW.scala 132:18]
  reg  r_pte_a; // @[PTW.scala 132:18]
  reg  r_pte_g; // @[PTW.scala 132:18]
  reg  r_pte_u; // @[PTW.scala 132:18]
  reg  r_pte_x; // @[PTW.scala 132:18]
  reg  r_pte_w; // @[PTW.scala 132:18]
  reg  r_pte_r; // @[PTW.scala 132:18]
  reg  r_pte_v; // @[PTW.scala 132:18]
  reg  mem_resp_valid; // @[PTW.scala 134:31]
  reg [63:0] mem_resp_data; // @[PTW.scala 135:30]
  wire  tmp_v = mem_resp_data[0]; // @[PTW.scala 146:33]
  wire  tmp_r = mem_resp_data[1]; // @[PTW.scala 146:33]
  wire  tmp_w = mem_resp_data[2]; // @[PTW.scala 146:33]
  wire  tmp_x = mem_resp_data[3]; // @[PTW.scala 146:33]
  wire  tmp_u = mem_resp_data[4]; // @[PTW.scala 146:33]
  wire  tmp_g = mem_resp_data[5]; // @[PTW.scala 146:33]
  wire  tmp_a = mem_resp_data[6]; // @[PTW.scala 146:33]
  wire  tmp_d = mem_resp_data[7]; // @[PTW.scala 146:33]
  wire [1:0] tmp_reserved_for_software = mem_resp_data[9:8]; // @[PTW.scala 146:33]
  wire [53:0] tmp_ppn = mem_resp_data[63:10]; // @[PTW.scala 146:33]
  wire  _GEN_0 = count <= 2'h0 & tmp_ppn[17:9] != 9'h0 ? 1'h0 : tmp_v; // @[PTW.scala 152:102 PTW.scala 152:110]
  wire  _GEN_1 = count <= 2'h1 & tmp_ppn[8:0] != 9'h0 ? 1'h0 : _GEN_0; // @[PTW.scala 152:102 PTW.scala 152:110]
  wire  res_v = tmp_r | tmp_w | tmp_x ? _GEN_1 : tmp_v; // @[PTW.scala 149:36]
  wire  invalid_paddr = tmp_ppn[53:20] != 34'h0; // @[PTW.scala 154:32]
  wire  _traverse_T_5 = res_v & ~tmp_r & ~tmp_w & ~tmp_x; // @[PTW.scala 72:45]
  wire  _traverse_T_6 = ~invalid_paddr; // @[PTW.scala 156:33]
  wire  _traverse_T_8 = count < 2'h2; // @[PTW.scala 156:57]
  wire  traverse = _traverse_T_5 & ~invalid_paddr & count < 2'h2; // @[PTW.scala 156:48]
  wire [8:0] vpn_idxs_0 = r_req_addr[26:18]; // @[PTW.scala 158:60]
  wire [8:0] vpn_idxs_1 = r_req_addr[17:9]; // @[PTW.scala 158:90]
  wire [8:0] vpn_idxs_2 = r_req_addr[8:0]; // @[PTW.scala 158:90]
  wire [8:0] _pte_addr_vpn_idx_T_1 = count == 2'h1 ? vpn_idxs_1 : vpn_idxs_0; // @[package.scala 32:76]
  wire  _pte_addr_vpn_idx_T_2 = count == 2'h2; // @[package.scala 32:86]
  wire [8:0] _pte_addr_vpn_idx_T_3 = count == 2'h2 ? vpn_idxs_2 : _pte_addr_vpn_idx_T_1; // @[package.scala 32:76]
  wire [8:0] vpn_idx = count == 2'h3 ? vpn_idxs_2 : _pte_addr_vpn_idx_T_3; // @[package.scala 32:76]
  wire [62:0] _pte_addr_T = {r_pte_ppn,vpn_idx}; // @[Cat.scala 30:58]
  wire [65:0] pte_addr = {_pte_addr_T, 3'h0}; // @[PTW.scala 160:29]
  wire [35:0] fragmented_superpage_ppn_choices_hi = r_pte_ppn[53:18]; // @[PTW.scala 163:69]
  wire [17:0] fragmented_superpage_ppn_choices_lo = r_req_addr[17:0]; // @[PTW.scala 163:99]
  wire [53:0] choices_0 = {fragmented_superpage_ppn_choices_hi,fragmented_superpage_ppn_choices_lo}; // @[Cat.scala 30:58]
  wire [44:0] fragmented_superpage_ppn_choices_hi_1 = r_pte_ppn[53:9]; // @[PTW.scala 163:69]
  wire [53:0] choices_1 = {fragmented_superpage_ppn_choices_hi_1,vpn_idxs_2}; // @[Cat.scala 30:58]
  wire  fragmented_superpage_ppn_truncIdx = count[0]; // @[package.scala 31:49]
  wire [53:0] fragmented_superpage_ppn = fragmented_superpage_ppn_truncIdx ? choices_1 : choices_0; // @[package.scala 32:76]
  wire  _T_22 = arb_io_out_ready & arb_io_out_valid; // @[Decoupled.scala 40:37]
  reg [6:0] state_reg; // @[Replacement.scala 168:70]
  reg [7:0] valid; // @[PTW.scala 175:24]
  reg [31:0] tags_0; // @[PTW.scala 176:19]
  reg [31:0] tags_1; // @[PTW.scala 176:19]
  reg [31:0] tags_2; // @[PTW.scala 176:19]
  reg [31:0] tags_3; // @[PTW.scala 176:19]
  reg [31:0] tags_4; // @[PTW.scala 176:19]
  reg [31:0] tags_5; // @[PTW.scala 176:19]
  reg [31:0] tags_6; // @[PTW.scala 176:19]
  reg [31:0] tags_7; // @[PTW.scala 176:19]
  reg [19:0] data_0; // @[PTW.scala 177:19]
  reg [19:0] data_1; // @[PTW.scala 177:19]
  reg [19:0] data_2; // @[PTW.scala 177:19]
  reg [19:0] data_3; // @[PTW.scala 177:19]
  reg [19:0] data_4; // @[PTW.scala 177:19]
  reg [19:0] data_5; // @[PTW.scala 177:19]
  reg [19:0] data_6; // @[PTW.scala 177:19]
  reg [19:0] data_7; // @[PTW.scala 177:19]
  wire [65:0] _GEN_60 = {{34'd0}, tags_0}; // @[PTW.scala 179:27]
  wire  lo_lo_lo = _GEN_60 == pte_addr; // @[PTW.scala 179:27]
  wire [65:0] _GEN_61 = {{34'd0}, tags_1}; // @[PTW.scala 179:27]
  wire  lo_lo_hi = _GEN_61 == pte_addr; // @[PTW.scala 179:27]
  wire [65:0] _GEN_62 = {{34'd0}, tags_2}; // @[PTW.scala 179:27]
  wire  lo_hi_lo = _GEN_62 == pte_addr; // @[PTW.scala 179:27]
  wire [65:0] _GEN_63 = {{34'd0}, tags_3}; // @[PTW.scala 179:27]
  wire  lo_hi_hi = _GEN_63 == pte_addr; // @[PTW.scala 179:27]
  wire [65:0] _GEN_64 = {{34'd0}, tags_4}; // @[PTW.scala 179:27]
  wire  hi_lo_lo = _GEN_64 == pte_addr; // @[PTW.scala 179:27]
  wire [65:0] _GEN_65 = {{34'd0}, tags_5}; // @[PTW.scala 179:27]
  wire  hi_lo_hi = _GEN_65 == pte_addr; // @[PTW.scala 179:27]
  wire [65:0] _GEN_66 = {{34'd0}, tags_6}; // @[PTW.scala 179:27]
  wire  hi_hi_lo = _GEN_66 == pte_addr; // @[PTW.scala 179:27]
  wire [65:0] _GEN_67 = {{34'd0}, tags_7}; // @[PTW.scala 179:27]
  wire  hi_hi_hi = _GEN_67 == pte_addr; // @[PTW.scala 179:27]
  wire [7:0] _T_23 = {hi_hi_hi,hi_hi_lo,hi_lo_hi,hi_lo_lo,lo_hi_hi,lo_hi_lo,lo_lo_hi,lo_lo_lo}; // @[Cat.scala 30:58]
  wire [7:0] hits = _T_23 & valid; // @[PTW.scala 179:48]
  wire  hit = |hits; // @[PTW.scala 180:20]
  wire  _T_27 = ~invalidated; // @[PTW.scala 181:49]
  wire  hi_1 = state_reg[6]; // @[Replacement.scala 243:38]
  wire [2:0] left_subtree_state = state_reg[5:3]; // @[package.scala 154:13]
  wire [2:0] right_subtree_state = state_reg[2:0]; // @[Replacement.scala 245:38]
  wire  hi_2 = left_subtree_state[2]; // @[Replacement.scala 243:38]
  wire  left_subtree_state_1 = left_subtree_state[1]; // @[package.scala 154:13]
  wire  right_subtree_state_1 = left_subtree_state[0]; // @[Replacement.scala 245:38]
  wire  lo_1 = hi_2 ? left_subtree_state_1 : right_subtree_state_1; // @[Replacement.scala 250:16]
  wire [1:0] _T_32 = {hi_2,lo_1}; // @[Cat.scala 30:58]
  wire  hi_3 = right_subtree_state[2]; // @[Replacement.scala 243:38]
  wire  left_subtree_state_2 = right_subtree_state[1]; // @[package.scala 154:13]
  wire  right_subtree_state_2 = right_subtree_state[0]; // @[Replacement.scala 245:38]
  wire  lo_2 = hi_3 ? left_subtree_state_2 : right_subtree_state_2; // @[Replacement.scala 250:16]
  wire [1:0] _T_35 = {hi_3,lo_2}; // @[Cat.scala 30:58]
  wire [1:0] lo_3 = hi_1 ? _T_32 : _T_35; // @[Replacement.scala 250:16]
  wire [2:0] _T_36 = {hi_1,lo_3}; // @[Cat.scala 30:58]
  wire [7:0] _T_37 = ~valid; // @[PTW.scala 182:57]
  wire [2:0] _T_46 = _T_37[6] ? 3'h6 : 3'h7; // @[Mux.scala 47:69]
  wire [2:0] _T_47 = _T_37[5] ? 3'h5 : _T_46; // @[Mux.scala 47:69]
  wire [2:0] _T_48 = _T_37[4] ? 3'h4 : _T_47; // @[Mux.scala 47:69]
  wire [2:0] _T_49 = _T_37[3] ? 3'h3 : _T_48; // @[Mux.scala 47:69]
  wire [2:0] _T_50 = _T_37[2] ? 3'h2 : _T_49; // @[Mux.scala 47:69]
  wire [2:0] _T_51 = _T_37[1] ? 3'h1 : _T_50; // @[Mux.scala 47:69]
  wire [2:0] _T_52 = _T_37[0] ? 3'h0 : _T_51; // @[Mux.scala 47:69]
  wire [2:0] r = &valid ? _T_36 : _T_52; // @[PTW.scala 182:18]
  wire [7:0] _T_53 = 8'h1 << r; // @[OneHot.scala 58:35]
  wire [7:0] _T_54 = valid | _T_53; // @[PTW.scala 183:22]
  wire [53:0] res_ppn = {{34'd0}, tmp_ppn[19:0]};
  wire  _T_55 = state == 3'h1; // @[PTW.scala 187:24]
  wire [3:0] hi_4 = hits[7:4]; // @[OneHot.scala 30:18]
  wire [3:0] lo_4 = hits[3:0]; // @[OneHot.scala 31:18]
  wire  hi_5 = |hi_4; // @[OneHot.scala 32:14]
  wire [3:0] _T_57 = hi_4 | lo_4; // @[OneHot.scala 32:28]
  wire [1:0] hi_6 = _T_57[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] lo_5 = _T_57[1:0]; // @[OneHot.scala 31:18]
  wire  hi_7 = |hi_6; // @[OneHot.scala 32:14]
  wire [1:0] _T_58 = hi_6 | lo_5; // @[OneHot.scala 32:28]
  wire  lo_6 = _T_58[1]; // @[CircuitMath.scala 30:8]
  wire [2:0] state_reg_touch_way_sized = {hi_5,hi_7,lo_6}; // @[Cat.scala 30:58]
  wire  state_reg_hi_hi = ~state_reg_touch_way_sized[2]; // @[Replacement.scala 196:33]
  wire  state_reg_hi_hi_1 = ~state_reg_touch_way_sized[1]; // @[Replacement.scala 196:33]
  wire  _state_reg_T_3 = ~state_reg_touch_way_sized[0]; // @[Replacement.scala 218:7]
  wire  state_reg_hi_lo = state_reg_hi_hi_1 ? left_subtree_state_1 : _state_reg_T_3; // @[Replacement.scala 203:16]
  wire  state_reg_lo = state_reg_hi_hi_1 ? _state_reg_T_3 : right_subtree_state_1; // @[Replacement.scala 206:16]
  wire [2:0] _state_reg_T_7 = {state_reg_hi_hi_1,state_reg_hi_lo,state_reg_lo}; // @[Cat.scala 30:58]
  wire [2:0] state_reg_hi_lo_1 = state_reg_hi_hi ? left_subtree_state : _state_reg_T_7; // @[Replacement.scala 203:16]
  wire  state_reg_hi_lo_2 = state_reg_hi_hi_1 ? left_subtree_state_2 : _state_reg_T_3; // @[Replacement.scala 203:16]
  wire  state_reg_lo_1 = state_reg_hi_hi_1 ? _state_reg_T_3 : right_subtree_state_2; // @[Replacement.scala 206:16]
  wire [2:0] _state_reg_T_15 = {state_reg_hi_hi_1,state_reg_hi_lo_2,state_reg_lo_1}; // @[Cat.scala 30:58]
  wire [2:0] state_reg_lo_2 = state_reg_hi_hi ? _state_reg_T_15 : right_subtree_state; // @[Replacement.scala 206:16]
  wire [6:0] _state_reg_T_16 = {state_reg_hi_hi,state_reg_hi_lo_1,state_reg_lo_2}; // @[Cat.scala 30:58]
  wire  pte_cache_hit = hit & _traverse_T_8; // @[PTW.scala 193:10]
  wire [19:0] _T_79 = hits[0] ? data_0 : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _T_80 = hits[1] ? data_1 : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _T_81 = hits[2] ? data_2 : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _T_82 = hits[3] ? data_3 : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _T_83 = hits[4] ? data_4 : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _T_84 = hits[5] ? data_5 : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _T_85 = hits[6] ? data_6 : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _T_86 = hits[7] ? data_7 : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _T_87 = _T_79 | _T_80; // @[Mux.scala 27:72]
  wire [19:0] _T_88 = _T_87 | _T_81; // @[Mux.scala 27:72]
  wire [19:0] _T_89 = _T_88 | _T_82; // @[Mux.scala 27:72]
  wire [19:0] _T_90 = _T_89 | _T_83; // @[Mux.scala 27:72]
  wire [19:0] _T_91 = _T_90 | _T_84; // @[Mux.scala 27:72]
  wire [19:0] _T_92 = _T_91 | _T_85; // @[Mux.scala 27:72]
  wire [19:0] pte_cache_data = _T_92 | _T_86; // @[Mux.scala 27:72]
  reg  pte_hit; // @[PTW.scala 195:24]
  reg [511:0] g_0; // @[PTW.scala 223:16]
  reg [511:0] valid_1_0; // @[PTW.scala 224:24]
  wire [17:0] r_tag = r_req_addr[26:9]; // @[package.scala 154:13]
  wire [511:0] _T_100 = valid_1_0 >> vpn_idxs_2; // @[PTW.scala 226:34]
  wire  r_valid_vec = _T_100[0]; // @[PTW.scala 226:34]
  wire [19:0] entry_ppn = r_pte_ppn[19:0]; // @[PTW.scala 228:23 PTW.scala 231:13]
  wire [43:0] lo_9 = {r_tag,entry_ppn,r_pte_d,r_pte_a,r_pte_u,r_pte_x,r_pte_w,r_pte_r}; // @[PTW.scala 233:78]
  wire  hi_9 = ^lo_9; // @[ECC.scala 71:59]
  wire [511:0] mask = 512'h1 << vpn_idxs_2; // @[OneHot.scala 58:35]
  wire [511:0] _T_105 = valid_1_0 | mask; // @[PTW.scala 238:36]
  wire [511:0] _T_106 = g_0 | mask; // @[PTW.scala 239:41]
  wire [511:0] _T_107 = ~mask; // @[PTW.scala 239:58]
  wire [511:0] _T_108 = g_0 & _T_107; // @[PTW.scala 239:56]
  wire [511:0] _T_111 = 512'h1 << io_dpath_sfence_bits_addr[20:12]; // @[OneHot.scala 58:35]
  wire [511:0] _T_112 = ~_T_111; // @[PTW.scala 246:54]
  wire [511:0] _T_113 = valid_1_0 & _T_112; // @[PTW.scala 246:52]
  wire [511:0] _T_114 = valid_1_0 & g_0; // @[PTW.scala 247:52]
  wire [511:0] _T_115 = io_dpath_sfence_bits_rs2 ? _T_114 : 512'h0; // @[PTW.scala 247:14]
  wire  s0_valid = _arb_io_out_ready_T_1 & _T_22; // @[PTW.scala 251:31]
  reg  s1_valid; // @[PTW.scala 252:27]
  reg  s2_valid; // @[PTW.scala 253:27]
  reg [44:0] r_1; // @[Reg.scala 15:16]
  wire [43:0] uncorrected = r_1[43:0]; // @[ECC.scala 74:24]
  wire  uncorrectable = ^r_1; // @[ECC.scala 77:27]
  reg  s2_valid_vec; // @[Reg.scala 15:16]
  wire [511:0] _T_123 = g_0 >> vpn_idxs_2; // @[PTW.scala 257:41]
  reg  s2_g_vec_0; // @[Reg.scala 15:16]
  wire  s2_error = s2_valid_vec & uncorrectable; // @[PTW.scala 258:81]
  wire  s2_entry_vec_0_r = uncorrected[0]; // @[PTW.scala 261:59]
  wire  s2_entry_vec_0_w = uncorrected[1]; // @[PTW.scala 261:59]
  wire  s2_entry_vec_0_x = uncorrected[2]; // @[PTW.scala 261:59]
  wire  s2_entry_vec_0_u = uncorrected[3]; // @[PTW.scala 261:59]
  wire  s2_entry_vec_0_a = uncorrected[4]; // @[PTW.scala 261:59]
  wire  s2_entry_vec_0_d = uncorrected[5]; // @[PTW.scala 261:59]
  wire [19:0] s2_entry_vec_0_ppn = uncorrected[25:6]; // @[PTW.scala 261:59]
  wire [17:0] s2_entry_vec_0_tag = uncorrected[43:26]; // @[PTW.scala 261:59]
  wire  s2_hit_vec_0 = s2_valid_vec & r_tag == s2_entry_vec_0_tag; // @[PTW.scala 262:83]
  wire  s2_hit = s2_valid & s2_hit_vec_0; // @[PTW.scala 263:27]
  wire [65:0] _pmaPgLevelHomogeneous_T_6 = pte_addr ^ 66'hc000000; // @[Parameters.scala 137:31]
  wire [66:0] _pmaPgLevelHomogeneous_T_7 = {1'b0,$signed(_pmaPgLevelHomogeneous_T_6)}; // @[Parameters.scala 137:49]
  wire [66:0] _pmaPgLevelHomogeneous_T_9 = $signed(_pmaPgLevelHomogeneous_T_7) & -67'sh4000000; // @[Parameters.scala 137:52]
  wire  _pmaPgLevelHomogeneous_T_10 = $signed(_pmaPgLevelHomogeneous_T_9) == 67'sh0; // @[Parameters.scala 137:67]
  wire [65:0] _pmaPgLevelHomogeneous_T_11 = pte_addr ^ 66'h80000000; // @[Parameters.scala 137:31]
  wire [66:0] _pmaPgLevelHomogeneous_T_12 = {1'b0,$signed(_pmaPgLevelHomogeneous_T_11)}; // @[Parameters.scala 137:49]
  wire [66:0] _pmaPgLevelHomogeneous_T_14 = $signed(_pmaPgLevelHomogeneous_T_12) & -67'sh10000000; // @[Parameters.scala 137:52]
  wire  _pmaPgLevelHomogeneous_T_15 = $signed(_pmaPgLevelHomogeneous_T_14) == 67'sh0; // @[Parameters.scala 137:67]
  wire  pmaPgLevelHomogeneous_1 = _pmaPgLevelHomogeneous_T_10 | _pmaPgLevelHomogeneous_T_15; // @[TLBPermissions.scala 98:65]
  wire [66:0] _pmaPgLevelHomogeneous_T_20 = {1'b0,$signed(pte_addr)}; // @[Parameters.scala 137:49]
  wire [66:0] _pmaPgLevelHomogeneous_T_50 = $signed(_pmaPgLevelHomogeneous_T_20) & -67'sh5000; // @[Parameters.scala 137:52]
  wire  _pmaPgLevelHomogeneous_T_51 = $signed(_pmaPgLevelHomogeneous_T_50) == 67'sh0; // @[Parameters.scala 137:67]
  wire [65:0] _pmaPgLevelHomogeneous_T_52 = pte_addr ^ 66'h3000; // @[Parameters.scala 137:31]
  wire [66:0] _pmaPgLevelHomogeneous_T_53 = {1'b0,$signed(_pmaPgLevelHomogeneous_T_52)}; // @[Parameters.scala 137:49]
  wire [66:0] _pmaPgLevelHomogeneous_T_55 = $signed(_pmaPgLevelHomogeneous_T_53) & -67'sh1000; // @[Parameters.scala 137:52]
  wire  _pmaPgLevelHomogeneous_T_56 = $signed(_pmaPgLevelHomogeneous_T_55) == 67'sh0; // @[Parameters.scala 137:67]
  wire [65:0] _pmaPgLevelHomogeneous_T_57 = pte_addr ^ 66'h10000; // @[Parameters.scala 137:31]
  wire [66:0] _pmaPgLevelHomogeneous_T_58 = {1'b0,$signed(_pmaPgLevelHomogeneous_T_57)}; // @[Parameters.scala 137:49]
  wire [66:0] _pmaPgLevelHomogeneous_T_60 = $signed(_pmaPgLevelHomogeneous_T_58) & -67'sh10000; // @[Parameters.scala 137:52]
  wire  _pmaPgLevelHomogeneous_T_61 = $signed(_pmaPgLevelHomogeneous_T_60) == 67'sh0; // @[Parameters.scala 137:67]
  wire [65:0] _pmaPgLevelHomogeneous_T_62 = pte_addr ^ 66'h20000; // @[Parameters.scala 137:31]
  wire [66:0] _pmaPgLevelHomogeneous_T_63 = {1'b0,$signed(_pmaPgLevelHomogeneous_T_62)}; // @[Parameters.scala 137:49]
  wire [66:0] _pmaPgLevelHomogeneous_T_65 = $signed(_pmaPgLevelHomogeneous_T_63) & -67'sh10000; // @[Parameters.scala 137:52]
  wire  _pmaPgLevelHomogeneous_T_66 = $signed(_pmaPgLevelHomogeneous_T_65) == 67'sh0; // @[Parameters.scala 137:67]
  wire [65:0] _pmaPgLevelHomogeneous_T_67 = pte_addr ^ 66'h100000; // @[Parameters.scala 137:31]
  wire [66:0] _pmaPgLevelHomogeneous_T_68 = {1'b0,$signed(_pmaPgLevelHomogeneous_T_67)}; // @[Parameters.scala 137:49]
  wire [66:0] _pmaPgLevelHomogeneous_T_70 = $signed(_pmaPgLevelHomogeneous_T_68) & -67'sh1000; // @[Parameters.scala 137:52]
  wire  _pmaPgLevelHomogeneous_T_71 = $signed(_pmaPgLevelHomogeneous_T_70) == 67'sh0; // @[Parameters.scala 137:67]
  wire [65:0] _pmaPgLevelHomogeneous_T_72 = pte_addr ^ 66'h2000000; // @[Parameters.scala 137:31]
  wire [66:0] _pmaPgLevelHomogeneous_T_73 = {1'b0,$signed(_pmaPgLevelHomogeneous_T_72)}; // @[Parameters.scala 137:49]
  wire [66:0] _pmaPgLevelHomogeneous_T_75 = $signed(_pmaPgLevelHomogeneous_T_73) & -67'sh10000; // @[Parameters.scala 137:52]
  wire  _pmaPgLevelHomogeneous_T_76 = $signed(_pmaPgLevelHomogeneous_T_75) == 67'sh0; // @[Parameters.scala 137:67]
  wire [65:0] _pmaPgLevelHomogeneous_T_82 = pte_addr ^ 66'h10000000; // @[Parameters.scala 137:31]
  wire [66:0] _pmaPgLevelHomogeneous_T_83 = {1'b0,$signed(_pmaPgLevelHomogeneous_T_82)}; // @[Parameters.scala 137:49]
  wire [66:0] _pmaPgLevelHomogeneous_T_85 = $signed(_pmaPgLevelHomogeneous_T_83) & -67'sh1000; // @[Parameters.scala 137:52]
  wire  _pmaPgLevelHomogeneous_T_86 = $signed(_pmaPgLevelHomogeneous_T_85) == 67'sh0; // @[Parameters.scala 137:67]
  wire [65:0] _pmaPgLevelHomogeneous_T_87 = pte_addr ^ 66'h54000000; // @[Parameters.scala 137:31]
  wire [66:0] _pmaPgLevelHomogeneous_T_88 = {1'b0,$signed(_pmaPgLevelHomogeneous_T_87)}; // @[Parameters.scala 137:49]
  wire [66:0] _pmaPgLevelHomogeneous_T_90 = $signed(_pmaPgLevelHomogeneous_T_88) & -67'sh1000; // @[Parameters.scala 137:52]
  wire  _pmaPgLevelHomogeneous_T_91 = $signed(_pmaPgLevelHomogeneous_T_90) == 67'sh0; // @[Parameters.scala 137:67]
  wire  pmaPgLevelHomogeneous_2 = _pmaPgLevelHomogeneous_T_51 | _pmaPgLevelHomogeneous_T_56 |
    _pmaPgLevelHomogeneous_T_61 | _pmaPgLevelHomogeneous_T_66 | _pmaPgLevelHomogeneous_T_71 |
    _pmaPgLevelHomogeneous_T_76 | _pmaPgLevelHomogeneous_T_10 | _pmaPgLevelHomogeneous_T_86 |
    _pmaPgLevelHomogeneous_T_91 | _pmaPgLevelHomogeneous_T_15; // @[TLBPermissions.scala 98:65]
  wire  _pmaHomogeneous_T_3 = count == 2'h2 ? pmaPgLevelHomogeneous_2 : count == 2'h1 & pmaPgLevelHomogeneous_1; // @[package.scala 32:76]
  wire  pmaHomogeneous = count == 2'h3 ? pmaPgLevelHomogeneous_2 : _pmaHomogeneous_T_3; // @[package.scala 32:76]
  wire [65:0] _pmpHomogeneous_T_1 = {pte_addr[65:12], 12'h0}; // @[PTW.scala 309:92]
  wire  _pmpHomogeneous_maskHomogeneous_T_4 = count == 2'h1 ? io_dpath_pmp_0_mask[20] : io_dpath_pmp_0_mask[29]; // @[package.scala 32:76]
  wire  _pmpHomogeneous_maskHomogeneous_T_6 = count == 2'h2 ? io_dpath_pmp_0_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_4; // @[package.scala 32:76]
  wire  pmpHomogeneous_maskHomogeneous = count == 2'h3 ? io_dpath_pmp_0_mask[11] : _pmpHomogeneous_maskHomogeneous_T_6; // @[package.scala 32:76]
  wire [31:0] _pmpHomogeneous_T_3 = {io_dpath_pmp_0_addr, 2'h0}; // @[PMP.scala 62:36]
  wire [31:0] _pmpHomogeneous_T_4 = ~_pmpHomogeneous_T_3; // @[PMP.scala 62:29]
  wire [31:0] _pmpHomogeneous_T_5 = _pmpHomogeneous_T_4 | 32'h3; // @[PMP.scala 62:48]
  wire [31:0] _pmpHomogeneous_T_6 = ~_pmpHomogeneous_T_5; // @[PMP.scala 62:27]
  wire [65:0] _GEN_68 = {{34'd0}, _pmpHomogeneous_T_6}; // @[PMP.scala 100:53]
  wire [65:0] _pmpHomogeneous_T_7 = _pmpHomogeneous_T_1 ^ _GEN_68; // @[PMP.scala 100:53]
  wire  _pmpHomogeneous_T_9 = _pmpHomogeneous_T_7[65:30] != 36'h0; // @[PMP.scala 100:78]
  wire  _pmpHomogeneous_T_16 = _pmpHomogeneous_T_7[65:21] != 45'h0; // @[PMP.scala 100:78]
  wire  _pmpHomogeneous_T_23 = _pmpHomogeneous_T_7[65:12] != 54'h0; // @[PMP.scala 100:78]
  wire  _pmpHomogeneous_T_25 = count == 2'h1 ? _pmpHomogeneous_T_16 : _pmpHomogeneous_T_9; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_27 = count == 2'h2 ? _pmpHomogeneous_T_23 : _pmpHomogeneous_T_25; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_29 = count == 2'h3 ? _pmpHomogeneous_T_23 : _pmpHomogeneous_T_27; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_30 = pmpHomogeneous_maskHomogeneous | _pmpHomogeneous_T_29; // @[PMP.scala 100:21]
  wire  pmpHomogeneous_beginsAfterUpper = ~(_pmpHomogeneous_T_1 < _GEN_68); // @[PMP.scala 109:28]
  wire [31:0] _pmpHomogeneous_pgMask_T_1 = count == 2'h1 ? 32'hffe00000 : 32'hc0000000; // @[package.scala 32:76]
  wire [31:0] _pmpHomogeneous_pgMask_T_3 = count == 2'h2 ? 32'hfffff000 : _pmpHomogeneous_pgMask_T_1; // @[package.scala 32:76]
  wire [31:0] pmpHomogeneous_pgMask = count == 2'h3 ? 32'hfffff000 : _pmpHomogeneous_pgMask_T_3; // @[package.scala 32:76]
  wire [65:0] _GEN_72 = {{34'd0}, pmpHomogeneous_pgMask}; // @[PMP.scala 112:30]
  wire [65:0] _pmpHomogeneous_endsBeforeLower_T = _pmpHomogeneous_T_1 & _GEN_72; // @[PMP.scala 112:30]
  wire [31:0] _pmpHomogeneous_endsBeforeUpper_T_5 = _pmpHomogeneous_T_6 & pmpHomogeneous_pgMask; // @[PMP.scala 113:53]
  wire [65:0] _GEN_74 = {{34'd0}, _pmpHomogeneous_endsBeforeUpper_T_5}; // @[PMP.scala 113:40]
  wire  pmpHomogeneous_endsBeforeUpper = _pmpHomogeneous_endsBeforeLower_T < _GEN_74; // @[PMP.scala 113:40]
  wire  _pmpHomogeneous_T_35 = pmpHomogeneous_beginsAfterUpper | pmpHomogeneous_endsBeforeUpper; // @[PMP.scala 115:41]
  wire  _pmpHomogeneous_T_37 = io_dpath_pmp_0_cfg_a[1] ? _pmpHomogeneous_T_30 : ~io_dpath_pmp_0_cfg_a[0] |
    _pmpHomogeneous_T_35; // @[PMP.scala 120:8]
  wire  _pmpHomogeneous_maskHomogeneous_T_12 = count == 2'h1 ? io_dpath_pmp_1_mask[20] : io_dpath_pmp_1_mask[29]; // @[package.scala 32:76]
  wire  _pmpHomogeneous_maskHomogeneous_T_14 = count == 2'h2 ? io_dpath_pmp_1_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_12; // @[package.scala 32:76]
  wire  pmpHomogeneous_maskHomogeneous_1 = count == 2'h3 ? io_dpath_pmp_1_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_14; // @[package.scala 32:76]
  wire [31:0] _pmpHomogeneous_T_40 = {io_dpath_pmp_1_addr, 2'h0}; // @[PMP.scala 62:36]
  wire [31:0] _pmpHomogeneous_T_41 = ~_pmpHomogeneous_T_40; // @[PMP.scala 62:29]
  wire [31:0] _pmpHomogeneous_T_42 = _pmpHomogeneous_T_41 | 32'h3; // @[PMP.scala 62:48]
  wire [31:0] _pmpHomogeneous_T_43 = ~_pmpHomogeneous_T_42; // @[PMP.scala 62:27]
  wire [65:0] _GEN_75 = {{34'd0}, _pmpHomogeneous_T_43}; // @[PMP.scala 100:53]
  wire [65:0] _pmpHomogeneous_T_44 = _pmpHomogeneous_T_1 ^ _GEN_75; // @[PMP.scala 100:53]
  wire  _pmpHomogeneous_T_46 = _pmpHomogeneous_T_44[65:30] != 36'h0; // @[PMP.scala 100:78]
  wire  _pmpHomogeneous_T_53 = _pmpHomogeneous_T_44[65:21] != 45'h0; // @[PMP.scala 100:78]
  wire  _pmpHomogeneous_T_60 = _pmpHomogeneous_T_44[65:12] != 54'h0; // @[PMP.scala 100:78]
  wire  _pmpHomogeneous_T_62 = count == 2'h1 ? _pmpHomogeneous_T_53 : _pmpHomogeneous_T_46; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_64 = count == 2'h2 ? _pmpHomogeneous_T_60 : _pmpHomogeneous_T_62; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_66 = count == 2'h3 ? _pmpHomogeneous_T_60 : _pmpHomogeneous_T_64; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_67 = pmpHomogeneous_maskHomogeneous_1 | _pmpHomogeneous_T_66; // @[PMP.scala 100:21]
  wire  pmpHomogeneous_beginsAfterUpper_1 = ~(_pmpHomogeneous_T_1 < _GEN_75); // @[PMP.scala 109:28]
  wire [31:0] _pmpHomogeneous_endsBeforeUpper_T_11 = _pmpHomogeneous_T_43 & pmpHomogeneous_pgMask; // @[PMP.scala 113:53]
  wire [65:0] _GEN_83 = {{34'd0}, _pmpHomogeneous_endsBeforeUpper_T_11}; // @[PMP.scala 113:40]
  wire  pmpHomogeneous_endsBeforeUpper_1 = _pmpHomogeneous_endsBeforeLower_T < _GEN_83; // @[PMP.scala 113:40]
  wire  _pmpHomogeneous_T_72 = pmpHomogeneous_endsBeforeUpper | pmpHomogeneous_beginsAfterUpper_1 |
    pmpHomogeneous_beginsAfterUpper & pmpHomogeneous_endsBeforeUpper_1; // @[PMP.scala 115:41]
  wire  _pmpHomogeneous_T_74 = io_dpath_pmp_1_cfg_a[1] ? _pmpHomogeneous_T_67 : ~io_dpath_pmp_1_cfg_a[0] |
    _pmpHomogeneous_T_72; // @[PMP.scala 120:8]
  wire  _pmpHomogeneous_maskHomogeneous_T_20 = count == 2'h1 ? io_dpath_pmp_2_mask[20] : io_dpath_pmp_2_mask[29]; // @[package.scala 32:76]
  wire  _pmpHomogeneous_maskHomogeneous_T_22 = count == 2'h2 ? io_dpath_pmp_2_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_20; // @[package.scala 32:76]
  wire  pmpHomogeneous_maskHomogeneous_2 = count == 2'h3 ? io_dpath_pmp_2_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_22; // @[package.scala 32:76]
  wire [31:0] _pmpHomogeneous_T_77 = {io_dpath_pmp_2_addr, 2'h0}; // @[PMP.scala 62:36]
  wire [31:0] _pmpHomogeneous_T_78 = ~_pmpHomogeneous_T_77; // @[PMP.scala 62:29]
  wire [31:0] _pmpHomogeneous_T_79 = _pmpHomogeneous_T_78 | 32'h3; // @[PMP.scala 62:48]
  wire [31:0] _pmpHomogeneous_T_80 = ~_pmpHomogeneous_T_79; // @[PMP.scala 62:27]
  wire [65:0] _GEN_84 = {{34'd0}, _pmpHomogeneous_T_80}; // @[PMP.scala 100:53]
  wire [65:0] _pmpHomogeneous_T_81 = _pmpHomogeneous_T_1 ^ _GEN_84; // @[PMP.scala 100:53]
  wire  _pmpHomogeneous_T_83 = _pmpHomogeneous_T_81[65:30] != 36'h0; // @[PMP.scala 100:78]
  wire  _pmpHomogeneous_T_90 = _pmpHomogeneous_T_81[65:21] != 45'h0; // @[PMP.scala 100:78]
  wire  _pmpHomogeneous_T_97 = _pmpHomogeneous_T_81[65:12] != 54'h0; // @[PMP.scala 100:78]
  wire  _pmpHomogeneous_T_99 = count == 2'h1 ? _pmpHomogeneous_T_90 : _pmpHomogeneous_T_83; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_101 = count == 2'h2 ? _pmpHomogeneous_T_97 : _pmpHomogeneous_T_99; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_103 = count == 2'h3 ? _pmpHomogeneous_T_97 : _pmpHomogeneous_T_101; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_104 = pmpHomogeneous_maskHomogeneous_2 | _pmpHomogeneous_T_103; // @[PMP.scala 100:21]
  wire  pmpHomogeneous_beginsAfterUpper_2 = ~(_pmpHomogeneous_T_1 < _GEN_84); // @[PMP.scala 109:28]
  wire [31:0] _pmpHomogeneous_endsBeforeUpper_T_17 = _pmpHomogeneous_T_80 & pmpHomogeneous_pgMask; // @[PMP.scala 113:53]
  wire [65:0] _GEN_92 = {{34'd0}, _pmpHomogeneous_endsBeforeUpper_T_17}; // @[PMP.scala 113:40]
  wire  pmpHomogeneous_endsBeforeUpper_2 = _pmpHomogeneous_endsBeforeLower_T < _GEN_92; // @[PMP.scala 113:40]
  wire  _pmpHomogeneous_T_109 = pmpHomogeneous_endsBeforeUpper_1 | pmpHomogeneous_beginsAfterUpper_2 |
    pmpHomogeneous_beginsAfterUpper_1 & pmpHomogeneous_endsBeforeUpper_2; // @[PMP.scala 115:41]
  wire  _pmpHomogeneous_T_111 = io_dpath_pmp_2_cfg_a[1] ? _pmpHomogeneous_T_104 : ~io_dpath_pmp_2_cfg_a[0] |
    _pmpHomogeneous_T_109; // @[PMP.scala 120:8]
  wire  _pmpHomogeneous_maskHomogeneous_T_28 = count == 2'h1 ? io_dpath_pmp_3_mask[20] : io_dpath_pmp_3_mask[29]; // @[package.scala 32:76]
  wire  _pmpHomogeneous_maskHomogeneous_T_30 = count == 2'h2 ? io_dpath_pmp_3_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_28; // @[package.scala 32:76]
  wire  pmpHomogeneous_maskHomogeneous_3 = count == 2'h3 ? io_dpath_pmp_3_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_30; // @[package.scala 32:76]
  wire [31:0] _pmpHomogeneous_T_114 = {io_dpath_pmp_3_addr, 2'h0}; // @[PMP.scala 62:36]
  wire [31:0] _pmpHomogeneous_T_115 = ~_pmpHomogeneous_T_114; // @[PMP.scala 62:29]
  wire [31:0] _pmpHomogeneous_T_116 = _pmpHomogeneous_T_115 | 32'h3; // @[PMP.scala 62:48]
  wire [31:0] _pmpHomogeneous_T_117 = ~_pmpHomogeneous_T_116; // @[PMP.scala 62:27]
  wire [65:0] _GEN_93 = {{34'd0}, _pmpHomogeneous_T_117}; // @[PMP.scala 100:53]
  wire [65:0] _pmpHomogeneous_T_118 = _pmpHomogeneous_T_1 ^ _GEN_93; // @[PMP.scala 100:53]
  wire  _pmpHomogeneous_T_120 = _pmpHomogeneous_T_118[65:30] != 36'h0; // @[PMP.scala 100:78]
  wire  _pmpHomogeneous_T_127 = _pmpHomogeneous_T_118[65:21] != 45'h0; // @[PMP.scala 100:78]
  wire  _pmpHomogeneous_T_134 = _pmpHomogeneous_T_118[65:12] != 54'h0; // @[PMP.scala 100:78]
  wire  _pmpHomogeneous_T_136 = count == 2'h1 ? _pmpHomogeneous_T_127 : _pmpHomogeneous_T_120; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_138 = count == 2'h2 ? _pmpHomogeneous_T_134 : _pmpHomogeneous_T_136; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_140 = count == 2'h3 ? _pmpHomogeneous_T_134 : _pmpHomogeneous_T_138; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_141 = pmpHomogeneous_maskHomogeneous_3 | _pmpHomogeneous_T_140; // @[PMP.scala 100:21]
  wire  pmpHomogeneous_beginsAfterUpper_3 = ~(_pmpHomogeneous_T_1 < _GEN_93); // @[PMP.scala 109:28]
  wire [31:0] _pmpHomogeneous_endsBeforeUpper_T_23 = _pmpHomogeneous_T_117 & pmpHomogeneous_pgMask; // @[PMP.scala 113:53]
  wire [65:0] _GEN_101 = {{34'd0}, _pmpHomogeneous_endsBeforeUpper_T_23}; // @[PMP.scala 113:40]
  wire  pmpHomogeneous_endsBeforeUpper_3 = _pmpHomogeneous_endsBeforeLower_T < _GEN_101; // @[PMP.scala 113:40]
  wire  _pmpHomogeneous_T_146 = pmpHomogeneous_endsBeforeUpper_2 | pmpHomogeneous_beginsAfterUpper_3 |
    pmpHomogeneous_beginsAfterUpper_2 & pmpHomogeneous_endsBeforeUpper_3; // @[PMP.scala 115:41]
  wire  _pmpHomogeneous_T_148 = io_dpath_pmp_3_cfg_a[1] ? _pmpHomogeneous_T_141 : ~io_dpath_pmp_3_cfg_a[0] |
    _pmpHomogeneous_T_146; // @[PMP.scala 120:8]
  wire  _pmpHomogeneous_maskHomogeneous_T_36 = count == 2'h1 ? io_dpath_pmp_4_mask[20] : io_dpath_pmp_4_mask[29]; // @[package.scala 32:76]
  wire  _pmpHomogeneous_maskHomogeneous_T_38 = count == 2'h2 ? io_dpath_pmp_4_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_36; // @[package.scala 32:76]
  wire  pmpHomogeneous_maskHomogeneous_4 = count == 2'h3 ? io_dpath_pmp_4_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_38; // @[package.scala 32:76]
  wire [31:0] _pmpHomogeneous_T_151 = {io_dpath_pmp_4_addr, 2'h0}; // @[PMP.scala 62:36]
  wire [31:0] _pmpHomogeneous_T_152 = ~_pmpHomogeneous_T_151; // @[PMP.scala 62:29]
  wire [31:0] _pmpHomogeneous_T_153 = _pmpHomogeneous_T_152 | 32'h3; // @[PMP.scala 62:48]
  wire [31:0] _pmpHomogeneous_T_154 = ~_pmpHomogeneous_T_153; // @[PMP.scala 62:27]
  wire [65:0] _GEN_102 = {{34'd0}, _pmpHomogeneous_T_154}; // @[PMP.scala 100:53]
  wire [65:0] _pmpHomogeneous_T_155 = _pmpHomogeneous_T_1 ^ _GEN_102; // @[PMP.scala 100:53]
  wire  _pmpHomogeneous_T_157 = _pmpHomogeneous_T_155[65:30] != 36'h0; // @[PMP.scala 100:78]
  wire  _pmpHomogeneous_T_164 = _pmpHomogeneous_T_155[65:21] != 45'h0; // @[PMP.scala 100:78]
  wire  _pmpHomogeneous_T_171 = _pmpHomogeneous_T_155[65:12] != 54'h0; // @[PMP.scala 100:78]
  wire  _pmpHomogeneous_T_173 = count == 2'h1 ? _pmpHomogeneous_T_164 : _pmpHomogeneous_T_157; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_175 = count == 2'h2 ? _pmpHomogeneous_T_171 : _pmpHomogeneous_T_173; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_177 = count == 2'h3 ? _pmpHomogeneous_T_171 : _pmpHomogeneous_T_175; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_178 = pmpHomogeneous_maskHomogeneous_4 | _pmpHomogeneous_T_177; // @[PMP.scala 100:21]
  wire  pmpHomogeneous_beginsAfterUpper_4 = ~(_pmpHomogeneous_T_1 < _GEN_102); // @[PMP.scala 109:28]
  wire [31:0] _pmpHomogeneous_endsBeforeUpper_T_29 = _pmpHomogeneous_T_154 & pmpHomogeneous_pgMask; // @[PMP.scala 113:53]
  wire [65:0] _GEN_110 = {{34'd0}, _pmpHomogeneous_endsBeforeUpper_T_29}; // @[PMP.scala 113:40]
  wire  pmpHomogeneous_endsBeforeUpper_4 = _pmpHomogeneous_endsBeforeLower_T < _GEN_110; // @[PMP.scala 113:40]
  wire  _pmpHomogeneous_T_183 = pmpHomogeneous_endsBeforeUpper_3 | pmpHomogeneous_beginsAfterUpper_4 |
    pmpHomogeneous_beginsAfterUpper_3 & pmpHomogeneous_endsBeforeUpper_4; // @[PMP.scala 115:41]
  wire  _pmpHomogeneous_T_185 = io_dpath_pmp_4_cfg_a[1] ? _pmpHomogeneous_T_178 : ~io_dpath_pmp_4_cfg_a[0] |
    _pmpHomogeneous_T_183; // @[PMP.scala 120:8]
  wire  _pmpHomogeneous_maskHomogeneous_T_44 = count == 2'h1 ? io_dpath_pmp_5_mask[20] : io_dpath_pmp_5_mask[29]; // @[package.scala 32:76]
  wire  _pmpHomogeneous_maskHomogeneous_T_46 = count == 2'h2 ? io_dpath_pmp_5_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_44; // @[package.scala 32:76]
  wire  pmpHomogeneous_maskHomogeneous_5 = count == 2'h3 ? io_dpath_pmp_5_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_46; // @[package.scala 32:76]
  wire [31:0] _pmpHomogeneous_T_188 = {io_dpath_pmp_5_addr, 2'h0}; // @[PMP.scala 62:36]
  wire [31:0] _pmpHomogeneous_T_189 = ~_pmpHomogeneous_T_188; // @[PMP.scala 62:29]
  wire [31:0] _pmpHomogeneous_T_190 = _pmpHomogeneous_T_189 | 32'h3; // @[PMP.scala 62:48]
  wire [31:0] _pmpHomogeneous_T_191 = ~_pmpHomogeneous_T_190; // @[PMP.scala 62:27]
  wire [65:0] _GEN_111 = {{34'd0}, _pmpHomogeneous_T_191}; // @[PMP.scala 100:53]
  wire [65:0] _pmpHomogeneous_T_192 = _pmpHomogeneous_T_1 ^ _GEN_111; // @[PMP.scala 100:53]
  wire  _pmpHomogeneous_T_194 = _pmpHomogeneous_T_192[65:30] != 36'h0; // @[PMP.scala 100:78]
  wire  _pmpHomogeneous_T_201 = _pmpHomogeneous_T_192[65:21] != 45'h0; // @[PMP.scala 100:78]
  wire  _pmpHomogeneous_T_208 = _pmpHomogeneous_T_192[65:12] != 54'h0; // @[PMP.scala 100:78]
  wire  _pmpHomogeneous_T_210 = count == 2'h1 ? _pmpHomogeneous_T_201 : _pmpHomogeneous_T_194; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_212 = count == 2'h2 ? _pmpHomogeneous_T_208 : _pmpHomogeneous_T_210; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_214 = count == 2'h3 ? _pmpHomogeneous_T_208 : _pmpHomogeneous_T_212; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_215 = pmpHomogeneous_maskHomogeneous_5 | _pmpHomogeneous_T_214; // @[PMP.scala 100:21]
  wire  pmpHomogeneous_beginsAfterUpper_5 = ~(_pmpHomogeneous_T_1 < _GEN_111); // @[PMP.scala 109:28]
  wire [31:0] _pmpHomogeneous_endsBeforeUpper_T_35 = _pmpHomogeneous_T_191 & pmpHomogeneous_pgMask; // @[PMP.scala 113:53]
  wire [65:0] _GEN_119 = {{34'd0}, _pmpHomogeneous_endsBeforeUpper_T_35}; // @[PMP.scala 113:40]
  wire  pmpHomogeneous_endsBeforeUpper_5 = _pmpHomogeneous_endsBeforeLower_T < _GEN_119; // @[PMP.scala 113:40]
  wire  _pmpHomogeneous_T_220 = pmpHomogeneous_endsBeforeUpper_4 | pmpHomogeneous_beginsAfterUpper_5 |
    pmpHomogeneous_beginsAfterUpper_4 & pmpHomogeneous_endsBeforeUpper_5; // @[PMP.scala 115:41]
  wire  _pmpHomogeneous_T_222 = io_dpath_pmp_5_cfg_a[1] ? _pmpHomogeneous_T_215 : ~io_dpath_pmp_5_cfg_a[0] |
    _pmpHomogeneous_T_220; // @[PMP.scala 120:8]
  wire  _pmpHomogeneous_maskHomogeneous_T_52 = count == 2'h1 ? io_dpath_pmp_6_mask[20] : io_dpath_pmp_6_mask[29]; // @[package.scala 32:76]
  wire  _pmpHomogeneous_maskHomogeneous_T_54 = count == 2'h2 ? io_dpath_pmp_6_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_52; // @[package.scala 32:76]
  wire  pmpHomogeneous_maskHomogeneous_6 = count == 2'h3 ? io_dpath_pmp_6_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_54; // @[package.scala 32:76]
  wire [31:0] _pmpHomogeneous_T_225 = {io_dpath_pmp_6_addr, 2'h0}; // @[PMP.scala 62:36]
  wire [31:0] _pmpHomogeneous_T_226 = ~_pmpHomogeneous_T_225; // @[PMP.scala 62:29]
  wire [31:0] _pmpHomogeneous_T_227 = _pmpHomogeneous_T_226 | 32'h3; // @[PMP.scala 62:48]
  wire [31:0] _pmpHomogeneous_T_228 = ~_pmpHomogeneous_T_227; // @[PMP.scala 62:27]
  wire [65:0] _GEN_120 = {{34'd0}, _pmpHomogeneous_T_228}; // @[PMP.scala 100:53]
  wire [65:0] _pmpHomogeneous_T_229 = _pmpHomogeneous_T_1 ^ _GEN_120; // @[PMP.scala 100:53]
  wire  _pmpHomogeneous_T_231 = _pmpHomogeneous_T_229[65:30] != 36'h0; // @[PMP.scala 100:78]
  wire  _pmpHomogeneous_T_238 = _pmpHomogeneous_T_229[65:21] != 45'h0; // @[PMP.scala 100:78]
  wire  _pmpHomogeneous_T_245 = _pmpHomogeneous_T_229[65:12] != 54'h0; // @[PMP.scala 100:78]
  wire  _pmpHomogeneous_T_247 = count == 2'h1 ? _pmpHomogeneous_T_238 : _pmpHomogeneous_T_231; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_249 = count == 2'h2 ? _pmpHomogeneous_T_245 : _pmpHomogeneous_T_247; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_251 = count == 2'h3 ? _pmpHomogeneous_T_245 : _pmpHomogeneous_T_249; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_252 = pmpHomogeneous_maskHomogeneous_6 | _pmpHomogeneous_T_251; // @[PMP.scala 100:21]
  wire  pmpHomogeneous_beginsAfterUpper_6 = ~(_pmpHomogeneous_T_1 < _GEN_120); // @[PMP.scala 109:28]
  wire [31:0] _pmpHomogeneous_endsBeforeUpper_T_41 = _pmpHomogeneous_T_228 & pmpHomogeneous_pgMask; // @[PMP.scala 113:53]
  wire [65:0] _GEN_128 = {{34'd0}, _pmpHomogeneous_endsBeforeUpper_T_41}; // @[PMP.scala 113:40]
  wire  pmpHomogeneous_endsBeforeUpper_6 = _pmpHomogeneous_endsBeforeLower_T < _GEN_128; // @[PMP.scala 113:40]
  wire  _pmpHomogeneous_T_257 = pmpHomogeneous_endsBeforeUpper_5 | pmpHomogeneous_beginsAfterUpper_6 |
    pmpHomogeneous_beginsAfterUpper_5 & pmpHomogeneous_endsBeforeUpper_6; // @[PMP.scala 115:41]
  wire  _pmpHomogeneous_T_259 = io_dpath_pmp_6_cfg_a[1] ? _pmpHomogeneous_T_252 : ~io_dpath_pmp_6_cfg_a[0] |
    _pmpHomogeneous_T_257; // @[PMP.scala 120:8]
  wire  _pmpHomogeneous_maskHomogeneous_T_60 = count == 2'h1 ? io_dpath_pmp_7_mask[20] : io_dpath_pmp_7_mask[29]; // @[package.scala 32:76]
  wire  _pmpHomogeneous_maskHomogeneous_T_62 = count == 2'h2 ? io_dpath_pmp_7_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_60; // @[package.scala 32:76]
  wire  pmpHomogeneous_maskHomogeneous_7 = count == 2'h3 ? io_dpath_pmp_7_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_62; // @[package.scala 32:76]
  wire [31:0] _pmpHomogeneous_T_262 = {io_dpath_pmp_7_addr, 2'h0}; // @[PMP.scala 62:36]
  wire [31:0] _pmpHomogeneous_T_263 = ~_pmpHomogeneous_T_262; // @[PMP.scala 62:29]
  wire [31:0] _pmpHomogeneous_T_264 = _pmpHomogeneous_T_263 | 32'h3; // @[PMP.scala 62:48]
  wire [31:0] _pmpHomogeneous_T_265 = ~_pmpHomogeneous_T_264; // @[PMP.scala 62:27]
  wire [65:0] _GEN_129 = {{34'd0}, _pmpHomogeneous_T_265}; // @[PMP.scala 100:53]
  wire [65:0] _pmpHomogeneous_T_266 = _pmpHomogeneous_T_1 ^ _GEN_129; // @[PMP.scala 100:53]
  wire  _pmpHomogeneous_T_268 = _pmpHomogeneous_T_266[65:30] != 36'h0; // @[PMP.scala 100:78]
  wire  _pmpHomogeneous_T_275 = _pmpHomogeneous_T_266[65:21] != 45'h0; // @[PMP.scala 100:78]
  wire  _pmpHomogeneous_T_282 = _pmpHomogeneous_T_266[65:12] != 54'h0; // @[PMP.scala 100:78]
  wire  _pmpHomogeneous_T_284 = count == 2'h1 ? _pmpHomogeneous_T_275 : _pmpHomogeneous_T_268; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_286 = count == 2'h2 ? _pmpHomogeneous_T_282 : _pmpHomogeneous_T_284; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_288 = count == 2'h3 ? _pmpHomogeneous_T_282 : _pmpHomogeneous_T_286; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_289 = pmpHomogeneous_maskHomogeneous_7 | _pmpHomogeneous_T_288; // @[PMP.scala 100:21]
  wire  pmpHomogeneous_beginsAfterUpper_7 = ~(_pmpHomogeneous_T_1 < _GEN_129); // @[PMP.scala 109:28]
  wire [31:0] _pmpHomogeneous_endsBeforeUpper_T_47 = _pmpHomogeneous_T_265 & pmpHomogeneous_pgMask; // @[PMP.scala 113:53]
  wire [65:0] _GEN_137 = {{34'd0}, _pmpHomogeneous_endsBeforeUpper_T_47}; // @[PMP.scala 113:40]
  wire  pmpHomogeneous_endsBeforeUpper_7 = _pmpHomogeneous_endsBeforeLower_T < _GEN_137; // @[PMP.scala 113:40]
  wire  _pmpHomogeneous_T_294 = pmpHomogeneous_endsBeforeUpper_6 | pmpHomogeneous_beginsAfterUpper_7 |
    pmpHomogeneous_beginsAfterUpper_6 & pmpHomogeneous_endsBeforeUpper_7; // @[PMP.scala 115:41]
  wire  _pmpHomogeneous_T_296 = io_dpath_pmp_7_cfg_a[1] ? _pmpHomogeneous_T_289 : ~io_dpath_pmp_7_cfg_a[0] |
    _pmpHomogeneous_T_294; // @[PMP.scala 120:8]
  wire  pmpHomogeneous = _pmpHomogeneous_T_37 & _pmpHomogeneous_T_74 & _pmpHomogeneous_T_111 & _pmpHomogeneous_T_148 &
    _pmpHomogeneous_T_185 & _pmpHomogeneous_T_222 & _pmpHomogeneous_T_259 & _pmpHomogeneous_T_296; // @[PMP.scala 140:10]
  wire  homogeneous = pmaHomogeneous & pmpHomogeneous; // @[PTW.scala 310:36]
  wire  _T_144 = 3'h0 == state; // @[Conditional.scala 37:30]
  wire [2:0] _next_state_T = arb_io_out_bits_valid ? 3'h1 : 3'h0; // @[PTW.scala 332:26]
  wire [2:0] _GEN_1084 = _T_22 ? _next_state_T : state; // @[PTW.scala 331:32 PTW.scala 332:20]
  wire  _T_146 = 3'h1 == state; // @[Conditional.scala 37:30]
  wire [1:0] _count_T_3 = count + 2'h1; // @[PTW.scala 338:24]
  wire [2:0] _next_state_T_1 = io_mem_req_ready ? 3'h2 : 3'h1; // @[PTW.scala 341:26]
  wire [1:0] _GEN_1085 = pte_cache_hit ? _count_T_3 : count; // @[PTW.scala 337:28 PTW.scala 338:15 PTW.scala 126:18]
  wire [2:0] _GEN_1087 = pte_cache_hit ? state : _next_state_T_1; // @[PTW.scala 337:28 PTW.scala 341:20]
  wire  _T_147 = 3'h2 == state; // @[Conditional.scala 37:30]
  wire [2:0] _next_state_T_2 = s2_hit ? 3'h1 : 3'h4; // @[PTW.scala 346:24]
  wire  _T_148 = 3'h4 == state; // @[Conditional.scala 37:30]
  wire  _GEN_1088 = 2'h0 == r_req_dest; // @[PTW.scala 354:32 PTW.scala 354:32 PTW.scala 116:23]
  wire  _GEN_1089 = 2'h1 == r_req_dest; // @[PTW.scala 354:32 PTW.scala 354:32 PTW.scala 116:23]
  wire  _GEN_1090 = 2'h2 == r_req_dest; // @[PTW.scala 354:32 PTW.scala 354:32 PTW.scala 116:23]
  wire [2:0] _GEN_1092 = io_mem_s2_xcpt_ae_ld ? 3'h0 : 3'h5; // @[PTW.scala 351:35 PTW.scala 353:20 PTW.scala 349:18]
  wire  _GEN_1093 = io_mem_s2_xcpt_ae_ld & _GEN_1088; // @[PTW.scala 351:35 PTW.scala 116:23]
  wire  _GEN_1094 = io_mem_s2_xcpt_ae_ld & _GEN_1089; // @[PTW.scala 351:35 PTW.scala 116:23]
  wire  _GEN_1095 = io_mem_s2_xcpt_ae_ld & _GEN_1090; // @[PTW.scala 351:35 PTW.scala 116:23]
  wire  _T_151 = 3'h7 == state; // @[Conditional.scala 37:30]
  wire  _T_154 = ~homogeneous; // @[PTW.scala 361:13]
  wire [1:0] _GEN_1099 = ~homogeneous ? 2'h2 : count; // @[PTW.scala 361:27 PTW.scala 362:15 PTW.scala 126:18]
  wire [2:0] _GEN_1101 = _T_151 ? 3'h0 : state; // @[Conditional.scala 39:67 PTW.scala 358:18]
  wire  _GEN_1102 = _T_151 & _GEN_1088; // @[Conditional.scala 39:67 PTW.scala 116:23]
  wire  _GEN_1103 = _T_151 & _GEN_1089; // @[Conditional.scala 39:67 PTW.scala 116:23]
  wire  _GEN_1104 = _T_151 & _GEN_1090; // @[Conditional.scala 39:67 PTW.scala 116:23]
  wire [1:0] _GEN_1106 = _T_151 ? _GEN_1099 : count; // @[Conditional.scala 39:67 PTW.scala 126:18]
  wire [2:0] _GEN_1108 = _T_148 ? _GEN_1092 : _GEN_1101; // @[Conditional.scala 39:67]
  wire  _GEN_1109 = _T_148 & _traverse_T_8; // @[Conditional.scala 39:67 PTW.scala 350:30 PTW.scala 196:26]
  wire  _GEN_1111 = _T_148 ? _GEN_1093 : _GEN_1102; // @[Conditional.scala 39:67]
  wire  _GEN_1112 = _T_148 ? _GEN_1094 : _GEN_1103; // @[Conditional.scala 39:67]
  wire  _GEN_1113 = _T_148 ? _GEN_1095 : _GEN_1104; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_1114 = _T_148 ? count : _GEN_1106; // @[Conditional.scala 39:67 PTW.scala 126:18]
  wire [2:0] _GEN_1116 = _T_147 ? _next_state_T_2 : _GEN_1108; // @[Conditional.scala 39:67 PTW.scala 346:18]
  wire  _GEN_1117 = _T_147 ? 1'h0 : _GEN_1109; // @[Conditional.scala 39:67 PTW.scala 196:26]
  wire  _GEN_1118 = _T_147 ? 1'h0 : _T_148 & io_mem_s2_xcpt_ae_ld; // @[Conditional.scala 39:67 PTW.scala 127:24]
  wire  _GEN_1119 = _T_147 ? 1'h0 : _GEN_1111; // @[Conditional.scala 39:67 PTW.scala 116:23]
  wire  _GEN_1120 = _T_147 ? 1'h0 : _GEN_1112; // @[Conditional.scala 39:67 PTW.scala 116:23]
  wire  _GEN_1121 = _T_147 ? 1'h0 : _GEN_1113; // @[Conditional.scala 39:67 PTW.scala 116:23]
  wire [1:0] _GEN_1122 = _T_147 ? count : _GEN_1114; // @[Conditional.scala 39:67 PTW.scala 126:18]
  wire [1:0] _GEN_1124 = _T_146 ? _GEN_1085 : _GEN_1122; // @[Conditional.scala 39:67]
  wire  _GEN_1125 = _T_146 & pte_cache_hit; // @[Conditional.scala 39:67 PTW.scala 195:24]
  wire [2:0] _GEN_1126 = _T_146 ? _GEN_1087 : _GEN_1116; // @[Conditional.scala 39:67]
  wire  _GEN_1127 = _T_146 ? 1'h0 : _GEN_1117; // @[Conditional.scala 39:67 PTW.scala 196:26]
  wire  _GEN_1128 = _T_146 ? 1'h0 : _GEN_1118; // @[Conditional.scala 39:67 PTW.scala 127:24]
  wire  _GEN_1129 = _T_146 ? 1'h0 : _GEN_1119; // @[Conditional.scala 39:67 PTW.scala 116:23]
  wire  _GEN_1130 = _T_146 ? 1'h0 : _GEN_1120; // @[Conditional.scala 39:67 PTW.scala 116:23]
  wire  _GEN_1131 = _T_146 ? 1'h0 : _GEN_1121; // @[Conditional.scala 39:67 PTW.scala 116:23]
  wire [2:0] _GEN_1133 = _T_144 ? _GEN_1084 : _GEN_1126; // @[Conditional.scala 40:58]
  wire [1:0] _GEN_1134 = _T_144 ? 2'h0 : _GEN_1124; // @[Conditional.scala 40:58 PTW.scala 334:13]
  wire  _GEN_1137 = _T_144 ? 1'h0 : _GEN_1128; // @[Conditional.scala 40:58 PTW.scala 127:24]
  wire  _GEN_1138 = _T_144 ? 1'h0 : _GEN_1129; // @[Conditional.scala 40:58 PTW.scala 116:23]
  wire  _GEN_1139 = _T_144 ? 1'h0 : _GEN_1130; // @[Conditional.scala 40:58 PTW.scala 116:23]
  wire  _GEN_1140 = _T_144 ? 1'h0 : _GEN_1131; // @[Conditional.scala 40:58 PTW.scala 116:23]
  wire  _r_pte_T_1 = s2_hit & ~s2_error; // @[PTW.scala 375:16]
  wire [53:0] pte_2_ppn = {{10'd0}, io_dpath_ptbr_ppn};
  wire [53:0] _r_pte_T_8_ppn = _T_22 ? pte_2_ppn : r_pte_ppn; // @[PTW.scala 378:8]
  wire [53:0] pte_1_ppn = {{34'd0}, pte_cache_data};
  wire [53:0] _r_pte_T_9_ppn = _T_55 & pte_cache_hit ? pte_1_ppn : _r_pte_T_8_ppn; // @[PTW.scala 377:8]
  wire [1:0] _r_pte_T_9_reserved_for_software = _T_55 & pte_cache_hit ? 2'h0 : r_pte_reserved_for_software; // @[PTW.scala 377:8]
  wire  _r_pte_T_9_d = _T_55 & pte_cache_hit ? s2_entry_vec_0_d : r_pte_d; // @[PTW.scala 377:8]
  wire  _r_pte_T_9_a = _T_55 & pte_cache_hit ? s2_entry_vec_0_a : r_pte_a; // @[PTW.scala 377:8]
  wire  _r_pte_T_9_g = _T_55 & pte_cache_hit ? s2_g_vec_0 : r_pte_g; // @[PTW.scala 377:8]
  wire  _r_pte_T_9_u = _T_55 & pte_cache_hit ? s2_entry_vec_0_u : r_pte_u; // @[PTW.scala 377:8]
  wire  _r_pte_T_9_x = _T_55 & pte_cache_hit ? s2_entry_vec_0_x : r_pte_x; // @[PTW.scala 377:8]
  wire  _r_pte_T_9_w = _T_55 & pte_cache_hit ? s2_entry_vec_0_w : r_pte_w; // @[PTW.scala 377:8]
  wire  _r_pte_T_9_r = _T_55 & pte_cache_hit ? s2_entry_vec_0_r : r_pte_r; // @[PTW.scala 377:8]
  wire  _r_pte_T_9_v = _T_55 & pte_cache_hit | r_pte_v; // @[PTW.scala 377:8]
  wire [53:0] _r_pte_T_10_ppn = state == 3'h7 & _T_154 ? fragmented_superpage_ppn : _r_pte_T_9_ppn; // @[PTW.scala 376:8]
  wire [1:0] _r_pte_T_10_reserved_for_software = state == 3'h7 & _T_154 ? r_pte_reserved_for_software :
    _r_pte_T_9_reserved_for_software; // @[PTW.scala 376:8]
  wire  _r_pte_T_10_d = state == 3'h7 & _T_154 ? r_pte_d : _r_pte_T_9_d; // @[PTW.scala 376:8]
  wire  _r_pte_T_10_a = state == 3'h7 & _T_154 ? r_pte_a : _r_pte_T_9_a; // @[PTW.scala 376:8]
  wire  _r_pte_T_10_g = state == 3'h7 & _T_154 ? r_pte_g : _r_pte_T_9_g; // @[PTW.scala 376:8]
  wire  _r_pte_T_10_u = state == 3'h7 & _T_154 ? r_pte_u : _r_pte_T_9_u; // @[PTW.scala 376:8]
  wire  _r_pte_T_10_x = state == 3'h7 & _T_154 ? r_pte_x : _r_pte_T_9_x; // @[PTW.scala 376:8]
  wire  _r_pte_T_10_w = state == 3'h7 & _T_154 ? r_pte_w : _r_pte_T_9_w; // @[PTW.scala 376:8]
  wire  _r_pte_T_10_r = state == 3'h7 & _T_154 ? r_pte_r : _r_pte_T_9_r; // @[PTW.scala 376:8]
  wire  _r_pte_T_10_v = state == 3'h7 & _T_154 ? r_pte_v : _r_pte_T_9_v; // @[PTW.scala 376:8]
  wire [53:0] s2_pte_ppn = {{34'd0}, s2_entry_vec_0_ppn}; // @[PTW.scala 271:22 PTW.scala 272:14]
  wire [53:0] _r_pte_T_11_ppn = s2_hit & ~s2_error ? s2_pte_ppn : _r_pte_T_10_ppn; // @[PTW.scala 375:8]
  wire [1:0] _r_pte_T_11_reserved_for_software = s2_hit & ~s2_error ? 2'h0 : _r_pte_T_10_reserved_for_software; // @[PTW.scala 375:8]
  wire  _r_pte_T_11_d = s2_hit & ~s2_error ? s2_entry_vec_0_d : _r_pte_T_10_d; // @[PTW.scala 375:8]
  wire  _r_pte_T_11_a = s2_hit & ~s2_error ? s2_entry_vec_0_a : _r_pte_T_10_a; // @[PTW.scala 375:8]
  wire  _r_pte_T_11_g = s2_hit & ~s2_error ? s2_g_vec_0 : _r_pte_T_10_g; // @[PTW.scala 375:8]
  wire  _r_pte_T_11_u = s2_hit & ~s2_error ? s2_entry_vec_0_u : _r_pte_T_10_u; // @[PTW.scala 375:8]
  wire  _r_pte_T_11_x = s2_hit & ~s2_error ? s2_entry_vec_0_x : _r_pte_T_10_x; // @[PTW.scala 375:8]
  wire  _r_pte_T_11_w = s2_hit & ~s2_error ? s2_entry_vec_0_w : _r_pte_T_10_w; // @[PTW.scala 375:8]
  wire  _r_pte_T_11_r = s2_hit & ~s2_error ? s2_entry_vec_0_r : _r_pte_T_10_r; // @[PTW.scala 375:8]
  wire  _r_pte_T_11_v = s2_hit & ~s2_error | _r_pte_T_10_v; // @[PTW.scala 375:8]
  wire  _GEN_1142 = _GEN_1088 | _GEN_1138; // @[PTW.scala 384:28 PTW.scala 384:28]
  wire  _GEN_1143 = _GEN_1089 | _GEN_1139; // @[PTW.scala 384:28 PTW.scala 384:28]
  wire  _GEN_1144 = _GEN_1090 | _GEN_1140; // @[PTW.scala 384:28 PTW.scala 384:28]
  wire [2:0] _GEN_1145 = _r_pte_T_1 ? 3'h0 : _GEN_1133; // @[PTW.scala 381:30 PTW.scala 383:16]
  wire  _GEN_1146 = _r_pte_T_1 ? _GEN_1142 : _GEN_1138; // @[PTW.scala 381:30]
  wire  _GEN_1147 = _r_pte_T_1 ? _GEN_1143 : _GEN_1139; // @[PTW.scala 381:30]
  wire  _GEN_1148 = _r_pte_T_1 ? _GEN_1144 : _GEN_1140; // @[PTW.scala 381:30]
  wire  _GEN_1149 = _r_pte_T_1 ? 1'h0 : _GEN_1137; // @[PTW.scala 381:30 PTW.scala 385:13]
  wire [1:0] _GEN_1150 = _r_pte_T_1 ? 2'h2 : _GEN_1134; // @[PTW.scala 381:30 PTW.scala 386:11]
  wire  ae = res_v & invalid_paddr; // @[PTW.scala 395:22]
  wire  _GEN_1151 = _GEN_1088 | _GEN_1146; // @[PTW.scala 401:32 PTW.scala 401:32]
  wire  _GEN_1152 = _GEN_1089 | _GEN_1147; // @[PTW.scala 401:32 PTW.scala 401:32]
  wire  _GEN_1153 = _GEN_1090 | _GEN_1148; // @[PTW.scala 401:32 PTW.scala 401:32]
  wire [2:0] _GEN_1158 = traverse ? 3'h1 : 3'h0; // @[PTW.scala 390:21 PTW.scala 391:18]
  wire  _GEN_1160 = traverse ? 1'h0 : res_v & _traverse_T_6 & _pte_addr_vpn_idx_T_2; // @[PTW.scala 390:21 PTW.scala 201:26 PTW.scala 394:17]
  wire [2:0] _GEN_1165 = mem_resp_valid ? _GEN_1158 : _GEN_1145; // @[PTW.scala 388:25]
  Arbiter_20 arb ( // @[PTW.scala 112:19]
    .clock(arb_clock),
    .reset(arb_reset),
    .io_in_0_ready(arb_io_in_0_ready),
    .io_in_0_valid(arb_io_in_0_valid),
    .io_in_0_bits_valid(arb_io_in_0_bits_valid),
    .io_in_0_bits_bits_addr(arb_io_in_0_bits_bits_addr),
    .io_in_1_ready(arb_io_in_1_ready),
    .io_in_1_valid(arb_io_in_1_valid),
    .io_in_1_bits_valid(arb_io_in_1_bits_valid),
    .io_in_1_bits_bits_addr(arb_io_in_1_bits_bits_addr),
    .io_in_2_ready(arb_io_in_2_ready),
    .io_in_2_valid(arb_io_in_2_valid),
    .io_in_2_bits_valid(arb_io_in_2_bits_valid),
    .io_in_2_bits_bits_addr(arb_io_in_2_bits_bits_addr),
    .io_out_ready(arb_io_out_ready),
    .io_out_valid(arb_io_out_valid),
    .io_out_bits_valid(arb_io_out_bits_valid),
    .io_out_bits_bits_addr(arb_io_out_bits_bits_addr),
    .io_chosen(arb_io_chosen)
  );
  OptimizationBarrier_36 state_barrier ( // @[package.scala 258:25]
    .clock(state_barrier_clock),
    .reset(state_barrier_reset),
    .io_x(state_barrier_io_x),
    .io_y(state_barrier_io_y)
  );
  OptimizationBarrier_37 r_pte_barrier ( // @[package.scala 258:25]
    .clock(r_pte_barrier_clock),
    .reset(r_pte_barrier_reset),
    .io_x_ppn(r_pte_barrier_io_x_ppn),
    .io_x_reserved_for_software(r_pte_barrier_io_x_reserved_for_software),
    .io_x_d(r_pte_barrier_io_x_d),
    .io_x_a(r_pte_barrier_io_x_a),
    .io_x_g(r_pte_barrier_io_x_g),
    .io_x_u(r_pte_barrier_io_x_u),
    .io_x_x(r_pte_barrier_io_x_x),
    .io_x_w(r_pte_barrier_io_x_w),
    .io_x_r(r_pte_barrier_io_x_r),
    .io_x_v(r_pte_barrier_io_x_v),
    .io_y_ppn(r_pte_barrier_io_y_ppn),
    .io_y_reserved_for_software(r_pte_barrier_io_y_reserved_for_software),
    .io_y_d(r_pte_barrier_io_y_d),
    .io_y_a(r_pte_barrier_io_y_a),
    .io_y_g(r_pte_barrier_io_y_g),
    .io_y_u(r_pte_barrier_io_y_u),
    .io_y_x(r_pte_barrier_io_y_x),
    .io_y_w(r_pte_barrier_io_y_w),
    .io_y_r(r_pte_barrier_io_y_r),
    .io_y_v(r_pte_barrier_io_y_v)
  );
  assign l2_tlb_ram_0_s1_rdata_addr = l2_tlb_ram_0_s1_rdata_addr_pipe_0;
  assign l2_tlb_ram_0_s1_rdata_data = l2_tlb_ram_0[l2_tlb_ram_0_s1_rdata_addr]; // @[DescribedSRAM.scala 19:26]
  assign l2_tlb_ram_0_MPORT_data = {hi_9,lo_9};
  assign l2_tlb_ram_0_MPORT_addr = r_req_addr[8:0];
  assign l2_tlb_ram_0_MPORT_mask = 1'h1;
  assign l2_tlb_ram_0_MPORT_en = l2_refill & _T_27;
  assign io_requestor_0_req_ready = arb_io_in_0_ready; // @[PTW.scala 113:13]
  assign io_requestor_0_resp_valid = resp_valid_0; // @[PTW.scala 313:32]
  assign io_requestor_0_resp_bits_ae = resp_ae; // @[PTW.scala 314:34]
  assign io_requestor_0_resp_bits_pte_ppn = r_pte_ppn; // @[PTW.scala 315:35]
  assign io_requestor_0_resp_bits_pte_reserved_for_software = r_pte_reserved_for_software; // @[PTW.scala 315:35]
  assign io_requestor_0_resp_bits_pte_d = r_pte_d; // @[PTW.scala 315:35]
  assign io_requestor_0_resp_bits_pte_a = r_pte_a; // @[PTW.scala 315:35]
  assign io_requestor_0_resp_bits_pte_g = r_pte_g; // @[PTW.scala 315:35]
  assign io_requestor_0_resp_bits_pte_u = r_pte_u; // @[PTW.scala 315:35]
  assign io_requestor_0_resp_bits_pte_x = r_pte_x; // @[PTW.scala 315:35]
  assign io_requestor_0_resp_bits_pte_w = r_pte_w; // @[PTW.scala 315:35]
  assign io_requestor_0_resp_bits_pte_r = r_pte_r; // @[PTW.scala 315:35]
  assign io_requestor_0_resp_bits_pte_v = r_pte_v; // @[PTW.scala 315:35]
  assign io_requestor_0_resp_bits_level = count; // @[PTW.scala 316:37]
  assign io_requestor_0_resp_bits_fragmented_superpage = 1'h0; // @[PTW.scala 318:81]
  assign io_requestor_0_resp_bits_homogeneous = pmaHomogeneous & pmpHomogeneous; // @[PTW.scala 310:36]
  assign io_requestor_0_ptbr_mode = io_dpath_ptbr_mode; // @[PTW.scala 319:26]
  assign io_requestor_0_ptbr_asid = io_dpath_ptbr_asid; // @[PTW.scala 319:26]
  assign io_requestor_0_ptbr_ppn = io_dpath_ptbr_ppn; // @[PTW.scala 319:26]
  assign io_requestor_0_status_debug = io_dpath_status_debug; // @[PTW.scala 321:28]
  assign io_requestor_0_status_cease = io_dpath_status_cease; // @[PTW.scala 321:28]
  assign io_requestor_0_status_wfi = io_dpath_status_wfi; // @[PTW.scala 321:28]
  assign io_requestor_0_status_isa = io_dpath_status_isa; // @[PTW.scala 321:28]
  assign io_requestor_0_status_dprv = io_dpath_status_dprv; // @[PTW.scala 321:28]
  assign io_requestor_0_status_prv = io_dpath_status_prv; // @[PTW.scala 321:28]
  assign io_requestor_0_status_sd = io_dpath_status_sd; // @[PTW.scala 321:28]
  assign io_requestor_0_status_zero2 = io_dpath_status_zero2; // @[PTW.scala 321:28]
  assign io_requestor_0_status_sxl = io_dpath_status_sxl; // @[PTW.scala 321:28]
  assign io_requestor_0_status_uxl = io_dpath_status_uxl; // @[PTW.scala 321:28]
  assign io_requestor_0_status_sd_rv32 = io_dpath_status_sd_rv32; // @[PTW.scala 321:28]
  assign io_requestor_0_status_zero1 = io_dpath_status_zero1; // @[PTW.scala 321:28]
  assign io_requestor_0_status_tsr = io_dpath_status_tsr; // @[PTW.scala 321:28]
  assign io_requestor_0_status_tw = io_dpath_status_tw; // @[PTW.scala 321:28]
  assign io_requestor_0_status_tvm = io_dpath_status_tvm; // @[PTW.scala 321:28]
  assign io_requestor_0_status_mxr = io_dpath_status_mxr; // @[PTW.scala 321:28]
  assign io_requestor_0_status_sum = io_dpath_status_sum; // @[PTW.scala 321:28]
  assign io_requestor_0_status_mprv = io_dpath_status_mprv; // @[PTW.scala 321:28]
  assign io_requestor_0_status_xs = io_dpath_status_xs; // @[PTW.scala 321:28]
  assign io_requestor_0_status_fs = io_dpath_status_fs; // @[PTW.scala 321:28]
  assign io_requestor_0_status_mpp = io_dpath_status_mpp; // @[PTW.scala 321:28]
  assign io_requestor_0_status_vs = io_dpath_status_vs; // @[PTW.scala 321:28]
  assign io_requestor_0_status_spp = io_dpath_status_spp; // @[PTW.scala 321:28]
  assign io_requestor_0_status_mpie = io_dpath_status_mpie; // @[PTW.scala 321:28]
  assign io_requestor_0_status_hpie = io_dpath_status_hpie; // @[PTW.scala 321:28]
  assign io_requestor_0_status_spie = io_dpath_status_spie; // @[PTW.scala 321:28]
  assign io_requestor_0_status_upie = io_dpath_status_upie; // @[PTW.scala 321:28]
  assign io_requestor_0_status_mie = io_dpath_status_mie; // @[PTW.scala 321:28]
  assign io_requestor_0_status_hie = io_dpath_status_hie; // @[PTW.scala 321:28]
  assign io_requestor_0_status_sie = io_dpath_status_sie; // @[PTW.scala 321:28]
  assign io_requestor_0_status_uie = io_dpath_status_uie; // @[PTW.scala 321:28]
  assign io_requestor_0_pmp_0_cfg_l = io_dpath_pmp_0_cfg_l; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_0_cfg_res = io_dpath_pmp_0_cfg_res; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_0_cfg_a = io_dpath_pmp_0_cfg_a; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_0_cfg_x = io_dpath_pmp_0_cfg_x; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_0_cfg_w = io_dpath_pmp_0_cfg_w; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_0_cfg_r = io_dpath_pmp_0_cfg_r; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_0_addr = io_dpath_pmp_0_addr; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_0_mask = io_dpath_pmp_0_mask; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_1_cfg_l = io_dpath_pmp_1_cfg_l; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_1_cfg_res = io_dpath_pmp_1_cfg_res; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_1_cfg_a = io_dpath_pmp_1_cfg_a; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_1_cfg_x = io_dpath_pmp_1_cfg_x; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_1_cfg_w = io_dpath_pmp_1_cfg_w; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_1_cfg_r = io_dpath_pmp_1_cfg_r; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_1_addr = io_dpath_pmp_1_addr; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_1_mask = io_dpath_pmp_1_mask; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_2_cfg_l = io_dpath_pmp_2_cfg_l; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_2_cfg_res = io_dpath_pmp_2_cfg_res; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_2_cfg_a = io_dpath_pmp_2_cfg_a; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_2_cfg_x = io_dpath_pmp_2_cfg_x; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_2_cfg_w = io_dpath_pmp_2_cfg_w; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_2_cfg_r = io_dpath_pmp_2_cfg_r; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_2_addr = io_dpath_pmp_2_addr; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_2_mask = io_dpath_pmp_2_mask; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_3_cfg_l = io_dpath_pmp_3_cfg_l; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_3_cfg_res = io_dpath_pmp_3_cfg_res; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_3_cfg_a = io_dpath_pmp_3_cfg_a; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_3_cfg_x = io_dpath_pmp_3_cfg_x; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_3_cfg_w = io_dpath_pmp_3_cfg_w; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_3_cfg_r = io_dpath_pmp_3_cfg_r; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_3_addr = io_dpath_pmp_3_addr; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_3_mask = io_dpath_pmp_3_mask; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_4_cfg_l = io_dpath_pmp_4_cfg_l; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_4_cfg_res = io_dpath_pmp_4_cfg_res; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_4_cfg_a = io_dpath_pmp_4_cfg_a; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_4_cfg_x = io_dpath_pmp_4_cfg_x; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_4_cfg_w = io_dpath_pmp_4_cfg_w; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_4_cfg_r = io_dpath_pmp_4_cfg_r; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_4_addr = io_dpath_pmp_4_addr; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_4_mask = io_dpath_pmp_4_mask; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_5_cfg_l = io_dpath_pmp_5_cfg_l; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_5_cfg_res = io_dpath_pmp_5_cfg_res; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_5_cfg_a = io_dpath_pmp_5_cfg_a; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_5_cfg_x = io_dpath_pmp_5_cfg_x; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_5_cfg_w = io_dpath_pmp_5_cfg_w; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_5_cfg_r = io_dpath_pmp_5_cfg_r; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_5_addr = io_dpath_pmp_5_addr; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_5_mask = io_dpath_pmp_5_mask; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_6_cfg_l = io_dpath_pmp_6_cfg_l; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_6_cfg_res = io_dpath_pmp_6_cfg_res; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_6_cfg_a = io_dpath_pmp_6_cfg_a; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_6_cfg_x = io_dpath_pmp_6_cfg_x; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_6_cfg_w = io_dpath_pmp_6_cfg_w; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_6_cfg_r = io_dpath_pmp_6_cfg_r; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_6_addr = io_dpath_pmp_6_addr; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_6_mask = io_dpath_pmp_6_mask; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_7_cfg_l = io_dpath_pmp_7_cfg_l; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_7_cfg_res = io_dpath_pmp_7_cfg_res; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_7_cfg_a = io_dpath_pmp_7_cfg_a; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_7_cfg_x = io_dpath_pmp_7_cfg_x; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_7_cfg_w = io_dpath_pmp_7_cfg_w; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_7_cfg_r = io_dpath_pmp_7_cfg_r; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_7_addr = io_dpath_pmp_7_addr; // @[PTW.scala 322:25]
  assign io_requestor_0_pmp_7_mask = io_dpath_pmp_7_mask; // @[PTW.scala 322:25]
  assign io_requestor_0_customCSRs_csrs_0_wen = io_dpath_customCSRs_csrs_0_wen; // @[PTW.scala 320:32]
  assign io_requestor_0_customCSRs_csrs_0_wdata = io_dpath_customCSRs_csrs_0_wdata; // @[PTW.scala 320:32]
  assign io_requestor_0_customCSRs_csrs_0_value = io_dpath_customCSRs_csrs_0_value; // @[PTW.scala 320:32]
  assign io_requestor_1_req_ready = arb_io_in_1_ready; // @[PTW.scala 113:13]
  assign io_requestor_1_resp_valid = resp_valid_1; // @[PTW.scala 313:32]
  assign io_requestor_1_resp_bits_ae = resp_ae; // @[PTW.scala 314:34]
  assign io_requestor_1_resp_bits_pte_ppn = r_pte_ppn; // @[PTW.scala 315:35]
  assign io_requestor_1_resp_bits_pte_reserved_for_software = r_pte_reserved_for_software; // @[PTW.scala 315:35]
  assign io_requestor_1_resp_bits_pte_d = r_pte_d; // @[PTW.scala 315:35]
  assign io_requestor_1_resp_bits_pte_a = r_pte_a; // @[PTW.scala 315:35]
  assign io_requestor_1_resp_bits_pte_g = r_pte_g; // @[PTW.scala 315:35]
  assign io_requestor_1_resp_bits_pte_u = r_pte_u; // @[PTW.scala 315:35]
  assign io_requestor_1_resp_bits_pte_x = r_pte_x; // @[PTW.scala 315:35]
  assign io_requestor_1_resp_bits_pte_w = r_pte_w; // @[PTW.scala 315:35]
  assign io_requestor_1_resp_bits_pte_r = r_pte_r; // @[PTW.scala 315:35]
  assign io_requestor_1_resp_bits_pte_v = r_pte_v; // @[PTW.scala 315:35]
  assign io_requestor_1_resp_bits_level = count; // @[PTW.scala 316:37]
  assign io_requestor_1_resp_bits_fragmented_superpage = 1'h0; // @[PTW.scala 318:81]
  assign io_requestor_1_resp_bits_homogeneous = pmaHomogeneous & pmpHomogeneous; // @[PTW.scala 310:36]
  assign io_requestor_1_ptbr_mode = io_dpath_ptbr_mode; // @[PTW.scala 319:26]
  assign io_requestor_1_ptbr_asid = io_dpath_ptbr_asid; // @[PTW.scala 319:26]
  assign io_requestor_1_ptbr_ppn = io_dpath_ptbr_ppn; // @[PTW.scala 319:26]
  assign io_requestor_1_status_debug = io_dpath_status_debug; // @[PTW.scala 321:28]
  assign io_requestor_1_status_cease = io_dpath_status_cease; // @[PTW.scala 321:28]
  assign io_requestor_1_status_wfi = io_dpath_status_wfi; // @[PTW.scala 321:28]
  assign io_requestor_1_status_isa = io_dpath_status_isa; // @[PTW.scala 321:28]
  assign io_requestor_1_status_dprv = io_dpath_status_dprv; // @[PTW.scala 321:28]
  assign io_requestor_1_status_prv = io_dpath_status_prv; // @[PTW.scala 321:28]
  assign io_requestor_1_status_sd = io_dpath_status_sd; // @[PTW.scala 321:28]
  assign io_requestor_1_status_zero2 = io_dpath_status_zero2; // @[PTW.scala 321:28]
  assign io_requestor_1_status_sxl = io_dpath_status_sxl; // @[PTW.scala 321:28]
  assign io_requestor_1_status_uxl = io_dpath_status_uxl; // @[PTW.scala 321:28]
  assign io_requestor_1_status_sd_rv32 = io_dpath_status_sd_rv32; // @[PTW.scala 321:28]
  assign io_requestor_1_status_zero1 = io_dpath_status_zero1; // @[PTW.scala 321:28]
  assign io_requestor_1_status_tsr = io_dpath_status_tsr; // @[PTW.scala 321:28]
  assign io_requestor_1_status_tw = io_dpath_status_tw; // @[PTW.scala 321:28]
  assign io_requestor_1_status_tvm = io_dpath_status_tvm; // @[PTW.scala 321:28]
  assign io_requestor_1_status_mxr = io_dpath_status_mxr; // @[PTW.scala 321:28]
  assign io_requestor_1_status_sum = io_dpath_status_sum; // @[PTW.scala 321:28]
  assign io_requestor_1_status_mprv = io_dpath_status_mprv; // @[PTW.scala 321:28]
  assign io_requestor_1_status_xs = io_dpath_status_xs; // @[PTW.scala 321:28]
  assign io_requestor_1_status_fs = io_dpath_status_fs; // @[PTW.scala 321:28]
  assign io_requestor_1_status_mpp = io_dpath_status_mpp; // @[PTW.scala 321:28]
  assign io_requestor_1_status_vs = io_dpath_status_vs; // @[PTW.scala 321:28]
  assign io_requestor_1_status_spp = io_dpath_status_spp; // @[PTW.scala 321:28]
  assign io_requestor_1_status_mpie = io_dpath_status_mpie; // @[PTW.scala 321:28]
  assign io_requestor_1_status_hpie = io_dpath_status_hpie; // @[PTW.scala 321:28]
  assign io_requestor_1_status_spie = io_dpath_status_spie; // @[PTW.scala 321:28]
  assign io_requestor_1_status_upie = io_dpath_status_upie; // @[PTW.scala 321:28]
  assign io_requestor_1_status_mie = io_dpath_status_mie; // @[PTW.scala 321:28]
  assign io_requestor_1_status_hie = io_dpath_status_hie; // @[PTW.scala 321:28]
  assign io_requestor_1_status_sie = io_dpath_status_sie; // @[PTW.scala 321:28]
  assign io_requestor_1_status_uie = io_dpath_status_uie; // @[PTW.scala 321:28]
  assign io_requestor_1_pmp_0_cfg_l = io_dpath_pmp_0_cfg_l; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_0_cfg_res = io_dpath_pmp_0_cfg_res; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_0_cfg_a = io_dpath_pmp_0_cfg_a; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_0_cfg_x = io_dpath_pmp_0_cfg_x; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_0_cfg_w = io_dpath_pmp_0_cfg_w; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_0_cfg_r = io_dpath_pmp_0_cfg_r; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_0_addr = io_dpath_pmp_0_addr; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_0_mask = io_dpath_pmp_0_mask; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_1_cfg_l = io_dpath_pmp_1_cfg_l; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_1_cfg_res = io_dpath_pmp_1_cfg_res; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_1_cfg_a = io_dpath_pmp_1_cfg_a; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_1_cfg_x = io_dpath_pmp_1_cfg_x; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_1_cfg_w = io_dpath_pmp_1_cfg_w; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_1_cfg_r = io_dpath_pmp_1_cfg_r; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_1_addr = io_dpath_pmp_1_addr; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_1_mask = io_dpath_pmp_1_mask; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_2_cfg_l = io_dpath_pmp_2_cfg_l; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_2_cfg_res = io_dpath_pmp_2_cfg_res; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_2_cfg_a = io_dpath_pmp_2_cfg_a; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_2_cfg_x = io_dpath_pmp_2_cfg_x; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_2_cfg_w = io_dpath_pmp_2_cfg_w; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_2_cfg_r = io_dpath_pmp_2_cfg_r; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_2_addr = io_dpath_pmp_2_addr; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_2_mask = io_dpath_pmp_2_mask; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_3_cfg_l = io_dpath_pmp_3_cfg_l; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_3_cfg_res = io_dpath_pmp_3_cfg_res; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_3_cfg_a = io_dpath_pmp_3_cfg_a; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_3_cfg_x = io_dpath_pmp_3_cfg_x; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_3_cfg_w = io_dpath_pmp_3_cfg_w; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_3_cfg_r = io_dpath_pmp_3_cfg_r; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_3_addr = io_dpath_pmp_3_addr; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_3_mask = io_dpath_pmp_3_mask; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_4_cfg_l = io_dpath_pmp_4_cfg_l; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_4_cfg_res = io_dpath_pmp_4_cfg_res; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_4_cfg_a = io_dpath_pmp_4_cfg_a; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_4_cfg_x = io_dpath_pmp_4_cfg_x; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_4_cfg_w = io_dpath_pmp_4_cfg_w; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_4_cfg_r = io_dpath_pmp_4_cfg_r; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_4_addr = io_dpath_pmp_4_addr; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_4_mask = io_dpath_pmp_4_mask; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_5_cfg_l = io_dpath_pmp_5_cfg_l; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_5_cfg_res = io_dpath_pmp_5_cfg_res; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_5_cfg_a = io_dpath_pmp_5_cfg_a; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_5_cfg_x = io_dpath_pmp_5_cfg_x; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_5_cfg_w = io_dpath_pmp_5_cfg_w; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_5_cfg_r = io_dpath_pmp_5_cfg_r; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_5_addr = io_dpath_pmp_5_addr; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_5_mask = io_dpath_pmp_5_mask; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_6_cfg_l = io_dpath_pmp_6_cfg_l; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_6_cfg_res = io_dpath_pmp_6_cfg_res; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_6_cfg_a = io_dpath_pmp_6_cfg_a; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_6_cfg_x = io_dpath_pmp_6_cfg_x; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_6_cfg_w = io_dpath_pmp_6_cfg_w; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_6_cfg_r = io_dpath_pmp_6_cfg_r; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_6_addr = io_dpath_pmp_6_addr; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_6_mask = io_dpath_pmp_6_mask; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_7_cfg_l = io_dpath_pmp_7_cfg_l; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_7_cfg_res = io_dpath_pmp_7_cfg_res; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_7_cfg_a = io_dpath_pmp_7_cfg_a; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_7_cfg_x = io_dpath_pmp_7_cfg_x; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_7_cfg_w = io_dpath_pmp_7_cfg_w; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_7_cfg_r = io_dpath_pmp_7_cfg_r; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_7_addr = io_dpath_pmp_7_addr; // @[PTW.scala 322:25]
  assign io_requestor_1_pmp_7_mask = io_dpath_pmp_7_mask; // @[PTW.scala 322:25]
  assign io_requestor_1_customCSRs_csrs_0_wen = io_dpath_customCSRs_csrs_0_wen; // @[PTW.scala 320:32]
  assign io_requestor_1_customCSRs_csrs_0_wdata = io_dpath_customCSRs_csrs_0_wdata; // @[PTW.scala 320:32]
  assign io_requestor_1_customCSRs_csrs_0_value = io_dpath_customCSRs_csrs_0_value; // @[PTW.scala 320:32]
  assign io_requestor_2_req_ready = arb_io_in_2_ready; // @[PTW.scala 113:13]
  assign io_requestor_2_resp_valid = resp_valid_2; // @[PTW.scala 313:32]
  assign io_requestor_2_resp_bits_ae = resp_ae; // @[PTW.scala 314:34]
  assign io_requestor_2_resp_bits_pte_ppn = r_pte_ppn; // @[PTW.scala 315:35]
  assign io_requestor_2_resp_bits_pte_reserved_for_software = r_pte_reserved_for_software; // @[PTW.scala 315:35]
  assign io_requestor_2_resp_bits_pte_d = r_pte_d; // @[PTW.scala 315:35]
  assign io_requestor_2_resp_bits_pte_a = r_pte_a; // @[PTW.scala 315:35]
  assign io_requestor_2_resp_bits_pte_g = r_pte_g; // @[PTW.scala 315:35]
  assign io_requestor_2_resp_bits_pte_u = r_pte_u; // @[PTW.scala 315:35]
  assign io_requestor_2_resp_bits_pte_x = r_pte_x; // @[PTW.scala 315:35]
  assign io_requestor_2_resp_bits_pte_w = r_pte_w; // @[PTW.scala 315:35]
  assign io_requestor_2_resp_bits_pte_r = r_pte_r; // @[PTW.scala 315:35]
  assign io_requestor_2_resp_bits_pte_v = r_pte_v; // @[PTW.scala 315:35]
  assign io_requestor_2_resp_bits_level = count; // @[PTW.scala 316:37]
  assign io_requestor_2_resp_bits_fragmented_superpage = 1'h0; // @[PTW.scala 318:81]
  assign io_requestor_2_resp_bits_homogeneous = pmaHomogeneous & pmpHomogeneous; // @[PTW.scala 310:36]
  assign io_requestor_2_ptbr_mode = io_dpath_ptbr_mode; // @[PTW.scala 319:26]
  assign io_requestor_2_ptbr_asid = io_dpath_ptbr_asid; // @[PTW.scala 319:26]
  assign io_requestor_2_ptbr_ppn = io_dpath_ptbr_ppn; // @[PTW.scala 319:26]
  assign io_requestor_2_status_debug = io_dpath_status_debug; // @[PTW.scala 321:28]
  assign io_requestor_2_status_cease = io_dpath_status_cease; // @[PTW.scala 321:28]
  assign io_requestor_2_status_wfi = io_dpath_status_wfi; // @[PTW.scala 321:28]
  assign io_requestor_2_status_isa = io_dpath_status_isa; // @[PTW.scala 321:28]
  assign io_requestor_2_status_dprv = io_dpath_status_dprv; // @[PTW.scala 321:28]
  assign io_requestor_2_status_prv = io_dpath_status_prv; // @[PTW.scala 321:28]
  assign io_requestor_2_status_sd = io_dpath_status_sd; // @[PTW.scala 321:28]
  assign io_requestor_2_status_zero2 = io_dpath_status_zero2; // @[PTW.scala 321:28]
  assign io_requestor_2_status_sxl = io_dpath_status_sxl; // @[PTW.scala 321:28]
  assign io_requestor_2_status_uxl = io_dpath_status_uxl; // @[PTW.scala 321:28]
  assign io_requestor_2_status_sd_rv32 = io_dpath_status_sd_rv32; // @[PTW.scala 321:28]
  assign io_requestor_2_status_zero1 = io_dpath_status_zero1; // @[PTW.scala 321:28]
  assign io_requestor_2_status_tsr = io_dpath_status_tsr; // @[PTW.scala 321:28]
  assign io_requestor_2_status_tw = io_dpath_status_tw; // @[PTW.scala 321:28]
  assign io_requestor_2_status_tvm = io_dpath_status_tvm; // @[PTW.scala 321:28]
  assign io_requestor_2_status_mxr = io_dpath_status_mxr; // @[PTW.scala 321:28]
  assign io_requestor_2_status_sum = io_dpath_status_sum; // @[PTW.scala 321:28]
  assign io_requestor_2_status_mprv = io_dpath_status_mprv; // @[PTW.scala 321:28]
  assign io_requestor_2_status_xs = io_dpath_status_xs; // @[PTW.scala 321:28]
  assign io_requestor_2_status_fs = io_dpath_status_fs; // @[PTW.scala 321:28]
  assign io_requestor_2_status_mpp = io_dpath_status_mpp; // @[PTW.scala 321:28]
  assign io_requestor_2_status_vs = io_dpath_status_vs; // @[PTW.scala 321:28]
  assign io_requestor_2_status_spp = io_dpath_status_spp; // @[PTW.scala 321:28]
  assign io_requestor_2_status_mpie = io_dpath_status_mpie; // @[PTW.scala 321:28]
  assign io_requestor_2_status_hpie = io_dpath_status_hpie; // @[PTW.scala 321:28]
  assign io_requestor_2_status_spie = io_dpath_status_spie; // @[PTW.scala 321:28]
  assign io_requestor_2_status_upie = io_dpath_status_upie; // @[PTW.scala 321:28]
  assign io_requestor_2_status_mie = io_dpath_status_mie; // @[PTW.scala 321:28]
  assign io_requestor_2_status_hie = io_dpath_status_hie; // @[PTW.scala 321:28]
  assign io_requestor_2_status_sie = io_dpath_status_sie; // @[PTW.scala 321:28]
  assign io_requestor_2_status_uie = io_dpath_status_uie; // @[PTW.scala 321:28]
  assign io_requestor_2_pmp_0_cfg_l = io_dpath_pmp_0_cfg_l; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_0_cfg_res = io_dpath_pmp_0_cfg_res; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_0_cfg_a = io_dpath_pmp_0_cfg_a; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_0_cfg_x = io_dpath_pmp_0_cfg_x; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_0_cfg_w = io_dpath_pmp_0_cfg_w; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_0_cfg_r = io_dpath_pmp_0_cfg_r; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_0_addr = io_dpath_pmp_0_addr; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_0_mask = io_dpath_pmp_0_mask; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_1_cfg_l = io_dpath_pmp_1_cfg_l; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_1_cfg_res = io_dpath_pmp_1_cfg_res; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_1_cfg_a = io_dpath_pmp_1_cfg_a; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_1_cfg_x = io_dpath_pmp_1_cfg_x; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_1_cfg_w = io_dpath_pmp_1_cfg_w; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_1_cfg_r = io_dpath_pmp_1_cfg_r; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_1_addr = io_dpath_pmp_1_addr; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_1_mask = io_dpath_pmp_1_mask; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_2_cfg_l = io_dpath_pmp_2_cfg_l; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_2_cfg_res = io_dpath_pmp_2_cfg_res; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_2_cfg_a = io_dpath_pmp_2_cfg_a; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_2_cfg_x = io_dpath_pmp_2_cfg_x; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_2_cfg_w = io_dpath_pmp_2_cfg_w; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_2_cfg_r = io_dpath_pmp_2_cfg_r; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_2_addr = io_dpath_pmp_2_addr; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_2_mask = io_dpath_pmp_2_mask; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_3_cfg_l = io_dpath_pmp_3_cfg_l; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_3_cfg_res = io_dpath_pmp_3_cfg_res; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_3_cfg_a = io_dpath_pmp_3_cfg_a; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_3_cfg_x = io_dpath_pmp_3_cfg_x; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_3_cfg_w = io_dpath_pmp_3_cfg_w; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_3_cfg_r = io_dpath_pmp_3_cfg_r; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_3_addr = io_dpath_pmp_3_addr; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_3_mask = io_dpath_pmp_3_mask; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_4_cfg_l = io_dpath_pmp_4_cfg_l; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_4_cfg_res = io_dpath_pmp_4_cfg_res; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_4_cfg_a = io_dpath_pmp_4_cfg_a; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_4_cfg_x = io_dpath_pmp_4_cfg_x; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_4_cfg_w = io_dpath_pmp_4_cfg_w; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_4_cfg_r = io_dpath_pmp_4_cfg_r; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_4_addr = io_dpath_pmp_4_addr; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_4_mask = io_dpath_pmp_4_mask; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_5_cfg_l = io_dpath_pmp_5_cfg_l; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_5_cfg_res = io_dpath_pmp_5_cfg_res; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_5_cfg_a = io_dpath_pmp_5_cfg_a; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_5_cfg_x = io_dpath_pmp_5_cfg_x; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_5_cfg_w = io_dpath_pmp_5_cfg_w; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_5_cfg_r = io_dpath_pmp_5_cfg_r; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_5_addr = io_dpath_pmp_5_addr; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_5_mask = io_dpath_pmp_5_mask; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_6_cfg_l = io_dpath_pmp_6_cfg_l; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_6_cfg_res = io_dpath_pmp_6_cfg_res; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_6_cfg_a = io_dpath_pmp_6_cfg_a; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_6_cfg_x = io_dpath_pmp_6_cfg_x; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_6_cfg_w = io_dpath_pmp_6_cfg_w; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_6_cfg_r = io_dpath_pmp_6_cfg_r; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_6_addr = io_dpath_pmp_6_addr; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_6_mask = io_dpath_pmp_6_mask; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_7_cfg_l = io_dpath_pmp_7_cfg_l; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_7_cfg_res = io_dpath_pmp_7_cfg_res; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_7_cfg_a = io_dpath_pmp_7_cfg_a; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_7_cfg_x = io_dpath_pmp_7_cfg_x; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_7_cfg_w = io_dpath_pmp_7_cfg_w; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_7_cfg_r = io_dpath_pmp_7_cfg_r; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_7_addr = io_dpath_pmp_7_addr; // @[PTW.scala 322:25]
  assign io_requestor_2_pmp_7_mask = io_dpath_pmp_7_mask; // @[PTW.scala 322:25]
  assign io_requestor_2_customCSRs_csrs_0_wen = io_dpath_customCSRs_csrs_0_wen; // @[PTW.scala 320:32]
  assign io_requestor_2_customCSRs_csrs_0_wdata = io_dpath_customCSRs_csrs_0_wdata; // @[PTW.scala 320:32]
  assign io_requestor_2_customCSRs_csrs_0_value = io_dpath_customCSRs_csrs_0_value; // @[PTW.scala 320:32]
  assign io_mem_req_valid = _T_55 | state == 3'h3; // @[PTW.scala 287:39]
  assign io_mem_req_bits_addr = pte_addr[39:0]; // @[PTW.scala 292:24]
  assign io_mem_req_bits_tag = 7'h0;
  assign io_mem_req_bits_cmd = 5'h0; // @[PTW.scala 289:24]
  assign io_mem_req_bits_size = 2'h3; // @[PTW.scala 290:24]
  assign io_mem_req_bits_signed = 1'h0; // @[PTW.scala 291:26]
  assign io_mem_req_bits_dprv = 2'h1; // @[PTW.scala 294:24]
  assign io_mem_req_bits_phys = 1'h1; // @[PTW.scala 288:24]
  assign io_mem_req_bits_no_alloc = 1'h0;
  assign io_mem_req_bits_no_xcpt = 1'h0;
  assign io_mem_req_bits_data = 64'h0;
  assign io_mem_req_bits_mask = 8'h0;
  assign io_mem_s1_kill = s2_hit | state != 3'h2; // @[PTW.scala 295:28]
  assign io_mem_s1_data_data = 64'h0;
  assign io_mem_s1_data_mask = 8'h0;
  assign io_mem_s2_kill = 1'h0; // @[PTW.scala 296:18]
  assign io_mem_keep_clock_enabled = 1'h0;
  assign io_dpath_perf_l2miss = s2_valid & ~s2_hit_vec_0; // @[PTW.scala 264:38]
  assign io_dpath_perf_l2hit = s2_valid & s2_hit_vec_0; // @[PTW.scala 263:27]
  assign io_dpath_perf_pte_miss = _T_144 ? 1'h0 : _GEN_1127; // @[Conditional.scala 40:58 PTW.scala 196:26]
  assign io_dpath_perf_pte_hit = pte_hit & _T_55 & ~io_dpath_perf_l2hit; // @[PTW.scala 197:57]
  assign io_dpath_clock_enabled = state != 3'h0 | l2_refill | arb_io_out_valid | io_dpath_sfence_valid |
    io_dpath_customCSRs_csrs_0_value[0]; // @[PTW.scala 118:99]
  assign arb_clock = clock;
  assign arb_reset = reset;
  assign arb_io_in_0_valid = io_requestor_0_req_valid; // @[PTW.scala 113:13]
  assign arb_io_in_0_bits_valid = io_requestor_0_req_bits_valid; // @[PTW.scala 113:13]
  assign arb_io_in_0_bits_bits_addr = io_requestor_0_req_bits_bits_addr; // @[PTW.scala 113:13]
  assign arb_io_in_1_valid = io_requestor_1_req_valid; // @[PTW.scala 113:13]
  assign arb_io_in_1_bits_valid = io_requestor_1_req_bits_valid; // @[PTW.scala 113:13]
  assign arb_io_in_1_bits_bits_addr = io_requestor_1_req_bits_bits_addr; // @[PTW.scala 113:13]
  assign arb_io_in_2_valid = io_requestor_2_req_valid; // @[PTW.scala 113:13]
  assign arb_io_in_2_bits_valid = io_requestor_2_req_bits_valid; // @[PTW.scala 113:13]
  assign arb_io_in_2_bits_bits_addr = io_requestor_2_req_bits_bits_addr; // @[PTW.scala 113:13]
  assign arb_io_out_ready = state == 3'h0 & ~l2_refill; // @[PTW.scala 114:43]
  assign state_barrier_clock = clock;
  assign state_barrier_reset = reset;
  assign state_barrier_io_x = io_mem_s2_nack ? 3'h1 : _GEN_1165; // @[PTW.scala 405:25 PTW.scala 407:16]
  assign r_pte_barrier_clock = clock;
  assign r_pte_barrier_reset = reset;
  assign r_pte_barrier_io_x_ppn = mem_resp_valid ? res_ppn : _r_pte_T_11_ppn; // @[PTW.scala 374:8]
  assign r_pte_barrier_io_x_reserved_for_software = mem_resp_valid ? tmp_reserved_for_software :
    _r_pte_T_11_reserved_for_software; // @[PTW.scala 374:8]
  assign r_pte_barrier_io_x_d = mem_resp_valid ? tmp_d : _r_pte_T_11_d; // @[PTW.scala 374:8]
  assign r_pte_barrier_io_x_a = mem_resp_valid ? tmp_a : _r_pte_T_11_a; // @[PTW.scala 374:8]
  assign r_pte_barrier_io_x_g = mem_resp_valid ? tmp_g : _r_pte_T_11_g; // @[PTW.scala 374:8]
  assign r_pte_barrier_io_x_u = mem_resp_valid ? tmp_u : _r_pte_T_11_u; // @[PTW.scala 374:8]
  assign r_pte_barrier_io_x_x = mem_resp_valid ? tmp_x : _r_pte_T_11_x; // @[PTW.scala 374:8]
  assign r_pte_barrier_io_x_w = mem_resp_valid ? tmp_w : _r_pte_T_11_w; // @[PTW.scala 374:8]
  assign r_pte_barrier_io_x_r = mem_resp_valid ? tmp_r : _r_pte_T_11_r; // @[PTW.scala 374:8]
  assign r_pte_barrier_io_x_v = mem_resp_valid ? res_v : _r_pte_T_11_v; // @[PTW.scala 374:8]
  always @(posedge clock) begin
    if(l2_tlb_ram_0_MPORT_en & l2_tlb_ram_0_MPORT_mask) begin
      l2_tlb_ram_0[l2_tlb_ram_0_MPORT_addr] <= l2_tlb_ram_0_MPORT_data; // @[DescribedSRAM.scala 19:26]
    end
    l2_tlb_ram_0_s1_rdata_en_pipe_0 <= _arb_io_out_ready_T_1 & _T_22;
    if (_arb_io_out_ready_T_1 & _T_22) begin
      l2_tlb_ram_0_s1_rdata_addr_pipe_0 <= arb_io_out_bits_bits_addr[8:0];
    end
    if (reset) begin // @[PTW.scala 109:18]
      state <= 3'h0; // @[PTW.scala 109:18]
    end else begin
      state <= state_barrier_io_y; // @[PTW.scala 327:9]
    end
    l2_refill <= mem_resp_valid & _GEN_1160; // @[PTW.scala 388:25 PTW.scala 201:26]
    if (mem_resp_valid) begin // @[PTW.scala 388:25]
      if (traverse) begin // @[PTW.scala 390:21]
        resp_valid_0 <= _GEN_1146;
      end else begin
        resp_valid_0 <= _GEN_1151;
      end
    end else begin
      resp_valid_0 <= _GEN_1146;
    end
    if (mem_resp_valid) begin // @[PTW.scala 388:25]
      if (traverse) begin // @[PTW.scala 390:21]
        resp_valid_1 <= _GEN_1147;
      end else begin
        resp_valid_1 <= _GEN_1152;
      end
    end else begin
      resp_valid_1 <= _GEN_1147;
    end
    if (mem_resp_valid) begin // @[PTW.scala 388:25]
      if (traverse) begin // @[PTW.scala 390:21]
        resp_valid_2 <= _GEN_1148;
      end else begin
        resp_valid_2 <= _GEN_1153;
      end
    end else begin
      resp_valid_2 <= _GEN_1148;
    end
    invalidated <= io_dpath_sfence_valid | invalidated & _clock_en_T; // @[PTW.scala 285:40]
    if (mem_resp_valid) begin // @[PTW.scala 388:25]
      if (traverse) begin // @[PTW.scala 390:21]
        count <= _count_T_3; // @[PTW.scala 392:13]
      end else begin
        count <= _GEN_1150;
      end
    end else begin
      count <= _GEN_1150;
    end
    if (mem_resp_valid) begin // @[PTW.scala 388:25]
      if (traverse) begin // @[PTW.scala 390:21]
        resp_ae <= _GEN_1149;
      end else begin
        resp_ae <= ae; // @[PTW.scala 396:15]
      end
    end else begin
      resp_ae <= _GEN_1149;
    end
    if (_T_22) begin // @[PTW.scala 167:28]
      r_req_addr <= arb_io_out_bits_bits_addr; // @[PTW.scala 168:11]
    end
    if (_T_22) begin // @[PTW.scala 167:28]
      r_req_dest <= arb_io_chosen; // @[PTW.scala 169:16]
    end
    r_pte_ppn <= r_pte_barrier_io_y_ppn; // @[PTW.scala 373:9]
    r_pte_reserved_for_software <= r_pte_barrier_io_y_reserved_for_software; // @[PTW.scala 373:9]
    r_pte_d <= r_pte_barrier_io_y_d; // @[PTW.scala 373:9]
    r_pte_a <= r_pte_barrier_io_y_a; // @[PTW.scala 373:9]
    r_pte_g <= r_pte_barrier_io_y_g; // @[PTW.scala 373:9]
    r_pte_u <= r_pte_barrier_io_y_u; // @[PTW.scala 373:9]
    r_pte_x <= r_pte_barrier_io_y_x; // @[PTW.scala 373:9]
    r_pte_w <= r_pte_barrier_io_y_w; // @[PTW.scala 373:9]
    r_pte_r <= r_pte_barrier_io_y_r; // @[PTW.scala 373:9]
    r_pte_v <= r_pte_barrier_io_y_v; // @[PTW.scala 373:9]
    mem_resp_valid <= io_mem_resp_valid; // @[PTW.scala 134:31]
    mem_resp_data <= io_mem_resp_bits_data; // @[PTW.scala 135:30]
    if (reset) begin // @[Replacement.scala 168:70]
      state_reg <= 7'h0; // @[Replacement.scala 168:70]
    end else if (hit & state == 3'h1) begin // @[PTW.scala 187:35]
      state_reg <= _state_reg_T_16; // @[Replacement.scala 172:15]
    end
    if (reset) begin // @[PTW.scala 175:24]
      valid <= 8'h0; // @[PTW.scala 175:24]
    end else if (io_dpath_sfence_valid & ~io_dpath_sfence_bits_rs1) begin // @[PTW.scala 188:63]
      valid <= 8'h0; // @[PTW.scala 188:71]
    end else if (mem_resp_valid & traverse & ~hit & ~invalidated) begin // @[PTW.scala 181:63]
      valid <= _T_54; // @[PTW.scala 183:13]
    end
    if (mem_resp_valid & traverse & ~hit & ~invalidated) begin // @[PTW.scala 181:63]
      if (3'h0 == r) begin // @[PTW.scala 184:15]
        tags_0 <= pte_addr[31:0]; // @[PTW.scala 184:15]
      end
    end
    if (mem_resp_valid & traverse & ~hit & ~invalidated) begin // @[PTW.scala 181:63]
      if (3'h1 == r) begin // @[PTW.scala 184:15]
        tags_1 <= pte_addr[31:0]; // @[PTW.scala 184:15]
      end
    end
    if (mem_resp_valid & traverse & ~hit & ~invalidated) begin // @[PTW.scala 181:63]
      if (3'h2 == r) begin // @[PTW.scala 184:15]
        tags_2 <= pte_addr[31:0]; // @[PTW.scala 184:15]
      end
    end
    if (mem_resp_valid & traverse & ~hit & ~invalidated) begin // @[PTW.scala 181:63]
      if (3'h3 == r) begin // @[PTW.scala 184:15]
        tags_3 <= pte_addr[31:0]; // @[PTW.scala 184:15]
      end
    end
    if (mem_resp_valid & traverse & ~hit & ~invalidated) begin // @[PTW.scala 181:63]
      if (3'h4 == r) begin // @[PTW.scala 184:15]
        tags_4 <= pte_addr[31:0]; // @[PTW.scala 184:15]
      end
    end
    if (mem_resp_valid & traverse & ~hit & ~invalidated) begin // @[PTW.scala 181:63]
      if (3'h5 == r) begin // @[PTW.scala 184:15]
        tags_5 <= pte_addr[31:0]; // @[PTW.scala 184:15]
      end
    end
    if (mem_resp_valid & traverse & ~hit & ~invalidated) begin // @[PTW.scala 181:63]
      if (3'h6 == r) begin // @[PTW.scala 184:15]
        tags_6 <= pte_addr[31:0]; // @[PTW.scala 184:15]
      end
    end
    if (mem_resp_valid & traverse & ~hit & ~invalidated) begin // @[PTW.scala 181:63]
      if (3'h7 == r) begin // @[PTW.scala 184:15]
        tags_7 <= pte_addr[31:0]; // @[PTW.scala 184:15]
      end
    end
    if (mem_resp_valid & traverse & ~hit & ~invalidated) begin // @[PTW.scala 181:63]
      if (3'h0 == r) begin // @[PTW.scala 185:15]
        data_0 <= res_ppn[19:0]; // @[PTW.scala 185:15]
      end
    end
    if (mem_resp_valid & traverse & ~hit & ~invalidated) begin // @[PTW.scala 181:63]
      if (3'h1 == r) begin // @[PTW.scala 185:15]
        data_1 <= res_ppn[19:0]; // @[PTW.scala 185:15]
      end
    end
    if (mem_resp_valid & traverse & ~hit & ~invalidated) begin // @[PTW.scala 181:63]
      if (3'h2 == r) begin // @[PTW.scala 185:15]
        data_2 <= res_ppn[19:0]; // @[PTW.scala 185:15]
      end
    end
    if (mem_resp_valid & traverse & ~hit & ~invalidated) begin // @[PTW.scala 181:63]
      if (3'h3 == r) begin // @[PTW.scala 185:15]
        data_3 <= res_ppn[19:0]; // @[PTW.scala 185:15]
      end
    end
    if (mem_resp_valid & traverse & ~hit & ~invalidated) begin // @[PTW.scala 181:63]
      if (3'h4 == r) begin // @[PTW.scala 185:15]
        data_4 <= res_ppn[19:0]; // @[PTW.scala 185:15]
      end
    end
    if (mem_resp_valid & traverse & ~hit & ~invalidated) begin // @[PTW.scala 181:63]
      if (3'h5 == r) begin // @[PTW.scala 185:15]
        data_5 <= res_ppn[19:0]; // @[PTW.scala 185:15]
      end
    end
    if (mem_resp_valid & traverse & ~hit & ~invalidated) begin // @[PTW.scala 181:63]
      if (3'h6 == r) begin // @[PTW.scala 185:15]
        data_6 <= res_ppn[19:0]; // @[PTW.scala 185:15]
      end
    end
    if (mem_resp_valid & traverse & ~hit & ~invalidated) begin // @[PTW.scala 181:63]
      if (3'h7 == r) begin // @[PTW.scala 185:15]
        data_7 <= res_ppn[19:0]; // @[PTW.scala 185:15]
      end
    end
    if (_T_144) begin // @[Conditional.scala 40:58]
      pte_hit <= 1'h0; // @[PTW.scala 195:24]
    end else begin
      pte_hit <= _GEN_1125;
    end
    if (l2_refill & _T_27) begin // @[PTW.scala 227:38]
      if (r_pte_g) begin // @[PTW.scala 239:24]
        g_0 <= _T_106;
      end else begin
        g_0 <= _T_108;
      end
    end
    if (reset) begin // @[PTW.scala 224:24]
      valid_1_0 <= 512'h0; // @[PTW.scala 224:24]
    end else if (s2_valid & s2_error) begin // @[PTW.scala 259:33]
      valid_1_0 <= 512'h0; // @[PTW.scala 259:53]
    end else if (io_dpath_sfence_valid) begin // @[PTW.scala 243:34]
      if (io_dpath_sfence_bits_rs1) begin // @[PTW.scala 246:14]
        valid_1_0 <= _T_113;
      end else begin
        valid_1_0 <= _T_115;
      end
    end else if (l2_refill & _T_27) begin // @[PTW.scala 227:38]
      valid_1_0 <= _T_105;
    end
    s1_valid <= s0_valid & arb_io_out_bits_valid; // @[PTW.scala 252:37]
    s2_valid <= s1_valid; // @[PTW.scala 253:27]
    if (s1_valid) begin // @[Reg.scala 16:19]
      r_1 <= l2_tlb_ram_0_s1_rdata_data; // @[Reg.scala 16:23]
    end
    if (s1_valid) begin // @[Reg.scala 16:19]
      s2_valid_vec <= r_valid_vec; // @[Reg.scala 16:23]
    end
    if (s1_valid) begin // @[Reg.scala 16:19]
      s2_g_vec_0 <= _T_123[0]; // @[Reg.scala 16:23]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(io_dpath_perf_l2hit & (io_dpath_perf_pte_miss | io_dpath_perf_pte_hit)) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: PTE Cache Hit/Miss Performance Monitor Events are lower priority than L2TLB Hit event\n    at PTW.scala:198 assert(!(io.dpath.perf.l2hit && (io.dpath.perf.pte_miss || io.dpath.perf.pte_hit)),\n"
            ); // @[PTW.scala 198:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(io_dpath_perf_l2hit & (io_dpath_perf_pte_miss | io_dpath_perf_pte_hit)) | reset)) begin
          $fatal; // @[PTW.scala 198:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (s2_hit & ~(s2_hit_vec_0 | s2_error | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: L2 TLB multi-hit\n    at PTW.scala:268 assert((PopCount(s2_hit_vec) === 1.U) || s2_error, \"L2 TLB multi-hit\")\n"
            ); // @[PTW.scala 268:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (s2_hit & ~(s2_hit_vec_0 | s2_error | reset)) begin
          $fatal; // @[PTW.scala 268:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_r_pte_T_1 & ~(_T_55 | state == 3'h2 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at PTW.scala:382 assert(state === s_req || state === s_wait1)\n"); // @[PTW.scala 382:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_r_pte_T_1 & ~(_T_55 | state == 3'h2 | reset)) begin
          $fatal; // @[PTW.scala 382:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (mem_resp_valid & ~(state == 3'h5 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at PTW.scala:389 assert(state === s_wait3)\n"); // @[PTW.scala 389:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (mem_resp_valid & ~(state == 3'h5 | reset)) begin
          $fatal; // @[PTW.scala 389:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_mem_s2_nack & ~(state == 3'h4 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at PTW.scala:406 assert(state === s_wait2)\n"); // @[PTW.scala 406:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_mem_s2_nack & ~(state == 3'h4 | reset)) begin
          $fatal; // @[PTW.scala 406:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    l2_tlb_ram_0[initvar] = _RAND_0[44:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  l2_tlb_ram_0_s1_rdata_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  l2_tlb_ram_0_s1_rdata_addr_pipe_0 = _RAND_2[8:0];
  _RAND_3 = {1{`RANDOM}};
  state = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  l2_refill = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  resp_valid_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  resp_valid_1 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  resp_valid_2 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  invalidated = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  count = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  resp_ae = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  r_req_addr = _RAND_11[26:0];
  _RAND_12 = {1{`RANDOM}};
  r_req_dest = _RAND_12[1:0];
  _RAND_13 = {2{`RANDOM}};
  r_pte_ppn = _RAND_13[53:0];
  _RAND_14 = {1{`RANDOM}};
  r_pte_reserved_for_software = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  r_pte_d = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  r_pte_a = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  r_pte_g = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  r_pte_u = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  r_pte_x = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  r_pte_w = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  r_pte_r = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  r_pte_v = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  mem_resp_valid = _RAND_23[0:0];
  _RAND_24 = {2{`RANDOM}};
  mem_resp_data = _RAND_24[63:0];
  _RAND_25 = {1{`RANDOM}};
  state_reg = _RAND_25[6:0];
  _RAND_26 = {1{`RANDOM}};
  valid = _RAND_26[7:0];
  _RAND_27 = {1{`RANDOM}};
  tags_0 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  tags_1 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  tags_2 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  tags_3 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  tags_4 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  tags_5 = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  tags_6 = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  tags_7 = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  data_0 = _RAND_35[19:0];
  _RAND_36 = {1{`RANDOM}};
  data_1 = _RAND_36[19:0];
  _RAND_37 = {1{`RANDOM}};
  data_2 = _RAND_37[19:0];
  _RAND_38 = {1{`RANDOM}};
  data_3 = _RAND_38[19:0];
  _RAND_39 = {1{`RANDOM}};
  data_4 = _RAND_39[19:0];
  _RAND_40 = {1{`RANDOM}};
  data_5 = _RAND_40[19:0];
  _RAND_41 = {1{`RANDOM}};
  data_6 = _RAND_41[19:0];
  _RAND_42 = {1{`RANDOM}};
  data_7 = _RAND_42[19:0];
  _RAND_43 = {1{`RANDOM}};
  pte_hit = _RAND_43[0:0];
  _RAND_44 = {16{`RANDOM}};
  g_0 = _RAND_44[511:0];
  _RAND_45 = {16{`RANDOM}};
  valid_1_0 = _RAND_45[511:0];
  _RAND_46 = {1{`RANDOM}};
  s1_valid = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  s2_valid = _RAND_47[0:0];
  _RAND_48 = {2{`RANDOM}};
  r_1 = _RAND_48[44:0];
  _RAND_49 = {1{`RANDOM}};
  s2_valid_vec = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  s2_g_vec_0 = _RAND_50[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
