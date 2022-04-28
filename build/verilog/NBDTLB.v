module NBDTLB(
  input         clock,
  input         reset,
  output        io_req_0_ready,
  input         io_req_0_valid,
  input  [39:0] io_req_0_bits_vaddr,
  input         io_req_0_bits_passthrough,
  input  [1:0]  io_req_0_bits_size,
  input  [4:0]  io_req_0_bits_cmd,
  output        io_miss_rdy,
  output        io_resp_0_miss,
  output [31:0] io_resp_0_paddr,
  output        io_resp_0_pf_ld,
  output        io_resp_0_pf_st,
  output        io_resp_0_pf_inst,
  output        io_resp_0_ae_ld,
  output        io_resp_0_ae_st,
  output        io_resp_0_ae_inst,
  output        io_resp_0_ma_ld,
  output        io_resp_0_ma_st,
  output        io_resp_0_ma_inst,
  output        io_resp_0_cacheable,
  output        io_resp_0_must_alloc,
  output        io_resp_0_prefetchable,
  input         io_sfence_valid,
  input         io_sfence_bits_rs1,
  input         io_sfence_bits_rs2,
  input  [38:0] io_sfence_bits_addr,
  input         io_sfence_bits_asid,
  input         io_ptw_req_ready,
  output        io_ptw_req_valid,
  output        io_ptw_req_bits_valid,
  output [26:0] io_ptw_req_bits_bits_addr,
  input         io_ptw_resp_valid,
  input         io_ptw_resp_bits_ae,
  input  [53:0] io_ptw_resp_bits_pte_ppn,
  input  [1:0]  io_ptw_resp_bits_pte_reserved_for_software,
  input         io_ptw_resp_bits_pte_d,
  input         io_ptw_resp_bits_pte_a,
  input         io_ptw_resp_bits_pte_g,
  input         io_ptw_resp_bits_pte_u,
  input         io_ptw_resp_bits_pte_x,
  input         io_ptw_resp_bits_pte_w,
  input         io_ptw_resp_bits_pte_r,
  input         io_ptw_resp_bits_pte_v,
  input  [1:0]  io_ptw_resp_bits_level,
  input         io_ptw_resp_bits_fragmented_superpage,
  input         io_ptw_resp_bits_homogeneous,
  input  [3:0]  io_ptw_ptbr_mode,
  input  [15:0] io_ptw_ptbr_asid,
  input  [43:0] io_ptw_ptbr_ppn,
  input         io_ptw_status_debug,
  input         io_ptw_status_cease,
  input         io_ptw_status_wfi,
  input  [31:0] io_ptw_status_isa,
  input  [1:0]  io_ptw_status_dprv,
  input  [1:0]  io_ptw_status_prv,
  input         io_ptw_status_sd,
  input  [26:0] io_ptw_status_zero2,
  input  [1:0]  io_ptw_status_sxl,
  input  [1:0]  io_ptw_status_uxl,
  input         io_ptw_status_sd_rv32,
  input  [7:0]  io_ptw_status_zero1,
  input         io_ptw_status_tsr,
  input         io_ptw_status_tw,
  input         io_ptw_status_tvm,
  input         io_ptw_status_mxr,
  input         io_ptw_status_sum,
  input         io_ptw_status_mprv,
  input  [1:0]  io_ptw_status_xs,
  input  [1:0]  io_ptw_status_fs,
  input  [1:0]  io_ptw_status_mpp,
  input  [1:0]  io_ptw_status_vs,
  input         io_ptw_status_spp,
  input         io_ptw_status_mpie,
  input         io_ptw_status_hpie,
  input         io_ptw_status_spie,
  input         io_ptw_status_upie,
  input         io_ptw_status_mie,
  input         io_ptw_status_hie,
  input         io_ptw_status_sie,
  input         io_ptw_status_uie,
  input         io_ptw_pmp_0_cfg_l,
  input  [1:0]  io_ptw_pmp_0_cfg_res,
  input  [1:0]  io_ptw_pmp_0_cfg_a,
  input         io_ptw_pmp_0_cfg_x,
  input         io_ptw_pmp_0_cfg_w,
  input         io_ptw_pmp_0_cfg_r,
  input  [29:0] io_ptw_pmp_0_addr,
  input  [31:0] io_ptw_pmp_0_mask,
  input         io_ptw_pmp_1_cfg_l,
  input  [1:0]  io_ptw_pmp_1_cfg_res,
  input  [1:0]  io_ptw_pmp_1_cfg_a,
  input         io_ptw_pmp_1_cfg_x,
  input         io_ptw_pmp_1_cfg_w,
  input         io_ptw_pmp_1_cfg_r,
  input  [29:0] io_ptw_pmp_1_addr,
  input  [31:0] io_ptw_pmp_1_mask,
  input         io_ptw_pmp_2_cfg_l,
  input  [1:0]  io_ptw_pmp_2_cfg_res,
  input  [1:0]  io_ptw_pmp_2_cfg_a,
  input         io_ptw_pmp_2_cfg_x,
  input         io_ptw_pmp_2_cfg_w,
  input         io_ptw_pmp_2_cfg_r,
  input  [29:0] io_ptw_pmp_2_addr,
  input  [31:0] io_ptw_pmp_2_mask,
  input         io_ptw_pmp_3_cfg_l,
  input  [1:0]  io_ptw_pmp_3_cfg_res,
  input  [1:0]  io_ptw_pmp_3_cfg_a,
  input         io_ptw_pmp_3_cfg_x,
  input         io_ptw_pmp_3_cfg_w,
  input         io_ptw_pmp_3_cfg_r,
  input  [29:0] io_ptw_pmp_3_addr,
  input  [31:0] io_ptw_pmp_3_mask,
  input         io_ptw_pmp_4_cfg_l,
  input  [1:0]  io_ptw_pmp_4_cfg_res,
  input  [1:0]  io_ptw_pmp_4_cfg_a,
  input         io_ptw_pmp_4_cfg_x,
  input         io_ptw_pmp_4_cfg_w,
  input         io_ptw_pmp_4_cfg_r,
  input  [29:0] io_ptw_pmp_4_addr,
  input  [31:0] io_ptw_pmp_4_mask,
  input         io_ptw_pmp_5_cfg_l,
  input  [1:0]  io_ptw_pmp_5_cfg_res,
  input  [1:0]  io_ptw_pmp_5_cfg_a,
  input         io_ptw_pmp_5_cfg_x,
  input         io_ptw_pmp_5_cfg_w,
  input         io_ptw_pmp_5_cfg_r,
  input  [29:0] io_ptw_pmp_5_addr,
  input  [31:0] io_ptw_pmp_5_mask,
  input         io_ptw_pmp_6_cfg_l,
  input  [1:0]  io_ptw_pmp_6_cfg_res,
  input  [1:0]  io_ptw_pmp_6_cfg_a,
  input         io_ptw_pmp_6_cfg_x,
  input         io_ptw_pmp_6_cfg_w,
  input         io_ptw_pmp_6_cfg_r,
  input  [29:0] io_ptw_pmp_6_addr,
  input  [31:0] io_ptw_pmp_6_mask,
  input         io_ptw_pmp_7_cfg_l,
  input  [1:0]  io_ptw_pmp_7_cfg_res,
  input  [1:0]  io_ptw_pmp_7_cfg_a,
  input         io_ptw_pmp_7_cfg_x,
  input         io_ptw_pmp_7_cfg_w,
  input         io_ptw_pmp_7_cfg_r,
  input  [29:0] io_ptw_pmp_7_addr,
  input  [31:0] io_ptw_pmp_7_mask,
  input         io_ptw_customCSRs_csrs_0_wen,
  input  [63:0] io_ptw_customCSRs_csrs_0_wdata,
  input  [63:0] io_ptw_customCSRs_csrs_0_value,
  input         io_kill
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
`endif // RANDOMIZE_REG_INIT
  wire  barrier_clock; // @[package.scala 258:25]
  wire  barrier_reset; // @[package.scala 258:25]
  wire [19:0] barrier_io_x_ppn; // @[package.scala 258:25]
  wire  barrier_io_x_u; // @[package.scala 258:25]
  wire  barrier_io_x_g; // @[package.scala 258:25]
  wire  barrier_io_x_ae; // @[package.scala 258:25]
  wire  barrier_io_x_sw; // @[package.scala 258:25]
  wire  barrier_io_x_sx; // @[package.scala 258:25]
  wire  barrier_io_x_sr; // @[package.scala 258:25]
  wire  barrier_io_x_pw; // @[package.scala 258:25]
  wire  barrier_io_x_px; // @[package.scala 258:25]
  wire  barrier_io_x_pr; // @[package.scala 258:25]
  wire  barrier_io_x_pal; // @[package.scala 258:25]
  wire  barrier_io_x_paa; // @[package.scala 258:25]
  wire  barrier_io_x_eff; // @[package.scala 258:25]
  wire  barrier_io_x_c; // @[package.scala 258:25]
  wire  barrier_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] barrier_io_y_ppn; // @[package.scala 258:25]
  wire  barrier_io_y_u; // @[package.scala 258:25]
  wire  barrier_io_y_g; // @[package.scala 258:25]
  wire  barrier_io_y_ae; // @[package.scala 258:25]
  wire  barrier_io_y_sw; // @[package.scala 258:25]
  wire  barrier_io_y_sx; // @[package.scala 258:25]
  wire  barrier_io_y_sr; // @[package.scala 258:25]
  wire  barrier_io_y_pw; // @[package.scala 258:25]
  wire  barrier_io_y_px; // @[package.scala 258:25]
  wire  barrier_io_y_pr; // @[package.scala 258:25]
  wire  barrier_io_y_pal; // @[package.scala 258:25]
  wire  barrier_io_y_paa; // @[package.scala 258:25]
  wire  barrier_io_y_eff; // @[package.scala 258:25]
  wire  barrier_io_y_c; // @[package.scala 258:25]
  wire  barrier_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  pmp_0_clock; // @[tlb.scala 150:40]
  wire  pmp_0_reset; // @[tlb.scala 150:40]
  wire [1:0] pmp_0_io_prv; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_0_cfg_l; // @[tlb.scala 150:40]
  wire [1:0] pmp_0_io_pmp_0_cfg_res; // @[tlb.scala 150:40]
  wire [1:0] pmp_0_io_pmp_0_cfg_a; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_0_cfg_x; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_0_cfg_w; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_0_cfg_r; // @[tlb.scala 150:40]
  wire [29:0] pmp_0_io_pmp_0_addr; // @[tlb.scala 150:40]
  wire [31:0] pmp_0_io_pmp_0_mask; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_1_cfg_l; // @[tlb.scala 150:40]
  wire [1:0] pmp_0_io_pmp_1_cfg_res; // @[tlb.scala 150:40]
  wire [1:0] pmp_0_io_pmp_1_cfg_a; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_1_cfg_x; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_1_cfg_w; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_1_cfg_r; // @[tlb.scala 150:40]
  wire [29:0] pmp_0_io_pmp_1_addr; // @[tlb.scala 150:40]
  wire [31:0] pmp_0_io_pmp_1_mask; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_2_cfg_l; // @[tlb.scala 150:40]
  wire [1:0] pmp_0_io_pmp_2_cfg_res; // @[tlb.scala 150:40]
  wire [1:0] pmp_0_io_pmp_2_cfg_a; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_2_cfg_x; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_2_cfg_w; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_2_cfg_r; // @[tlb.scala 150:40]
  wire [29:0] pmp_0_io_pmp_2_addr; // @[tlb.scala 150:40]
  wire [31:0] pmp_0_io_pmp_2_mask; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_3_cfg_l; // @[tlb.scala 150:40]
  wire [1:0] pmp_0_io_pmp_3_cfg_res; // @[tlb.scala 150:40]
  wire [1:0] pmp_0_io_pmp_3_cfg_a; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_3_cfg_x; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_3_cfg_w; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_3_cfg_r; // @[tlb.scala 150:40]
  wire [29:0] pmp_0_io_pmp_3_addr; // @[tlb.scala 150:40]
  wire [31:0] pmp_0_io_pmp_3_mask; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_4_cfg_l; // @[tlb.scala 150:40]
  wire [1:0] pmp_0_io_pmp_4_cfg_res; // @[tlb.scala 150:40]
  wire [1:0] pmp_0_io_pmp_4_cfg_a; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_4_cfg_x; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_4_cfg_w; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_4_cfg_r; // @[tlb.scala 150:40]
  wire [29:0] pmp_0_io_pmp_4_addr; // @[tlb.scala 150:40]
  wire [31:0] pmp_0_io_pmp_4_mask; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_5_cfg_l; // @[tlb.scala 150:40]
  wire [1:0] pmp_0_io_pmp_5_cfg_res; // @[tlb.scala 150:40]
  wire [1:0] pmp_0_io_pmp_5_cfg_a; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_5_cfg_x; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_5_cfg_w; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_5_cfg_r; // @[tlb.scala 150:40]
  wire [29:0] pmp_0_io_pmp_5_addr; // @[tlb.scala 150:40]
  wire [31:0] pmp_0_io_pmp_5_mask; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_6_cfg_l; // @[tlb.scala 150:40]
  wire [1:0] pmp_0_io_pmp_6_cfg_res; // @[tlb.scala 150:40]
  wire [1:0] pmp_0_io_pmp_6_cfg_a; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_6_cfg_x; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_6_cfg_w; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_6_cfg_r; // @[tlb.scala 150:40]
  wire [29:0] pmp_0_io_pmp_6_addr; // @[tlb.scala 150:40]
  wire [31:0] pmp_0_io_pmp_6_mask; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_7_cfg_l; // @[tlb.scala 150:40]
  wire [1:0] pmp_0_io_pmp_7_cfg_res; // @[tlb.scala 150:40]
  wire [1:0] pmp_0_io_pmp_7_cfg_a; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_7_cfg_x; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_7_cfg_w; // @[tlb.scala 150:40]
  wire  pmp_0_io_pmp_7_cfg_r; // @[tlb.scala 150:40]
  wire [29:0] pmp_0_io_pmp_7_addr; // @[tlb.scala 150:40]
  wire [31:0] pmp_0_io_pmp_7_mask; // @[tlb.scala 150:40]
  wire [31:0] pmp_0_io_addr; // @[tlb.scala 150:40]
  wire [1:0] pmp_0_io_size; // @[tlb.scala 150:40]
  wire  pmp_0_io_r; // @[tlb.scala 150:40]
  wire  pmp_0_io_w; // @[tlb.scala 150:40]
  wire  pmp_0_io_x; // @[tlb.scala 150:40]
  wire  barrier_1_clock; // @[package.scala 258:25]
  wire  barrier_1_reset; // @[package.scala 258:25]
  wire [19:0] barrier_1_io_x_ppn; // @[package.scala 258:25]
  wire  barrier_1_io_x_u; // @[package.scala 258:25]
  wire  barrier_1_io_x_g; // @[package.scala 258:25]
  wire  barrier_1_io_x_ae; // @[package.scala 258:25]
  wire  barrier_1_io_x_sw; // @[package.scala 258:25]
  wire  barrier_1_io_x_sx; // @[package.scala 258:25]
  wire  barrier_1_io_x_sr; // @[package.scala 258:25]
  wire  barrier_1_io_x_pw; // @[package.scala 258:25]
  wire  barrier_1_io_x_px; // @[package.scala 258:25]
  wire  barrier_1_io_x_pr; // @[package.scala 258:25]
  wire  barrier_1_io_x_pal; // @[package.scala 258:25]
  wire  barrier_1_io_x_paa; // @[package.scala 258:25]
  wire  barrier_1_io_x_eff; // @[package.scala 258:25]
  wire  barrier_1_io_x_c; // @[package.scala 258:25]
  wire  barrier_1_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] barrier_1_io_y_ppn; // @[package.scala 258:25]
  wire  barrier_1_io_y_u; // @[package.scala 258:25]
  wire  barrier_1_io_y_g; // @[package.scala 258:25]
  wire  barrier_1_io_y_ae; // @[package.scala 258:25]
  wire  barrier_1_io_y_sw; // @[package.scala 258:25]
  wire  barrier_1_io_y_sx; // @[package.scala 258:25]
  wire  barrier_1_io_y_sr; // @[package.scala 258:25]
  wire  barrier_1_io_y_pw; // @[package.scala 258:25]
  wire  barrier_1_io_y_px; // @[package.scala 258:25]
  wire  barrier_1_io_y_pr; // @[package.scala 258:25]
  wire  barrier_1_io_y_pal; // @[package.scala 258:25]
  wire  barrier_1_io_y_paa; // @[package.scala 258:25]
  wire  barrier_1_io_y_eff; // @[package.scala 258:25]
  wire  barrier_1_io_y_c; // @[package.scala 258:25]
  wire  barrier_1_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  barrier_2_clock; // @[package.scala 258:25]
  wire  barrier_2_reset; // @[package.scala 258:25]
  wire [19:0] barrier_2_io_x_ppn; // @[package.scala 258:25]
  wire  barrier_2_io_x_u; // @[package.scala 258:25]
  wire  barrier_2_io_x_g; // @[package.scala 258:25]
  wire  barrier_2_io_x_ae; // @[package.scala 258:25]
  wire  barrier_2_io_x_sw; // @[package.scala 258:25]
  wire  barrier_2_io_x_sx; // @[package.scala 258:25]
  wire  barrier_2_io_x_sr; // @[package.scala 258:25]
  wire  barrier_2_io_x_pw; // @[package.scala 258:25]
  wire  barrier_2_io_x_px; // @[package.scala 258:25]
  wire  barrier_2_io_x_pr; // @[package.scala 258:25]
  wire  barrier_2_io_x_pal; // @[package.scala 258:25]
  wire  barrier_2_io_x_paa; // @[package.scala 258:25]
  wire  barrier_2_io_x_eff; // @[package.scala 258:25]
  wire  barrier_2_io_x_c; // @[package.scala 258:25]
  wire  barrier_2_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] barrier_2_io_y_ppn; // @[package.scala 258:25]
  wire  barrier_2_io_y_u; // @[package.scala 258:25]
  wire  barrier_2_io_y_g; // @[package.scala 258:25]
  wire  barrier_2_io_y_ae; // @[package.scala 258:25]
  wire  barrier_2_io_y_sw; // @[package.scala 258:25]
  wire  barrier_2_io_y_sx; // @[package.scala 258:25]
  wire  barrier_2_io_y_sr; // @[package.scala 258:25]
  wire  barrier_2_io_y_pw; // @[package.scala 258:25]
  wire  barrier_2_io_y_px; // @[package.scala 258:25]
  wire  barrier_2_io_y_pr; // @[package.scala 258:25]
  wire  barrier_2_io_y_pal; // @[package.scala 258:25]
  wire  barrier_2_io_y_paa; // @[package.scala 258:25]
  wire  barrier_2_io_y_eff; // @[package.scala 258:25]
  wire  barrier_2_io_y_c; // @[package.scala 258:25]
  wire  barrier_2_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  barrier_3_clock; // @[package.scala 258:25]
  wire  barrier_3_reset; // @[package.scala 258:25]
  wire [19:0] barrier_3_io_x_ppn; // @[package.scala 258:25]
  wire  barrier_3_io_x_u; // @[package.scala 258:25]
  wire  barrier_3_io_x_g; // @[package.scala 258:25]
  wire  barrier_3_io_x_ae; // @[package.scala 258:25]
  wire  barrier_3_io_x_sw; // @[package.scala 258:25]
  wire  barrier_3_io_x_sx; // @[package.scala 258:25]
  wire  barrier_3_io_x_sr; // @[package.scala 258:25]
  wire  barrier_3_io_x_pw; // @[package.scala 258:25]
  wire  barrier_3_io_x_px; // @[package.scala 258:25]
  wire  barrier_3_io_x_pr; // @[package.scala 258:25]
  wire  barrier_3_io_x_pal; // @[package.scala 258:25]
  wire  barrier_3_io_x_paa; // @[package.scala 258:25]
  wire  barrier_3_io_x_eff; // @[package.scala 258:25]
  wire  barrier_3_io_x_c; // @[package.scala 258:25]
  wire  barrier_3_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] barrier_3_io_y_ppn; // @[package.scala 258:25]
  wire  barrier_3_io_y_u; // @[package.scala 258:25]
  wire  barrier_3_io_y_g; // @[package.scala 258:25]
  wire  barrier_3_io_y_ae; // @[package.scala 258:25]
  wire  barrier_3_io_y_sw; // @[package.scala 258:25]
  wire  barrier_3_io_y_sx; // @[package.scala 258:25]
  wire  barrier_3_io_y_sr; // @[package.scala 258:25]
  wire  barrier_3_io_y_pw; // @[package.scala 258:25]
  wire  barrier_3_io_y_px; // @[package.scala 258:25]
  wire  barrier_3_io_y_pr; // @[package.scala 258:25]
  wire  barrier_3_io_y_pal; // @[package.scala 258:25]
  wire  barrier_3_io_y_paa; // @[package.scala 258:25]
  wire  barrier_3_io_y_eff; // @[package.scala 258:25]
  wire  barrier_3_io_y_c; // @[package.scala 258:25]
  wire  barrier_3_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  barrier_4_clock; // @[package.scala 258:25]
  wire  barrier_4_reset; // @[package.scala 258:25]
  wire [19:0] barrier_4_io_x_ppn; // @[package.scala 258:25]
  wire  barrier_4_io_x_u; // @[package.scala 258:25]
  wire  barrier_4_io_x_g; // @[package.scala 258:25]
  wire  barrier_4_io_x_ae; // @[package.scala 258:25]
  wire  barrier_4_io_x_sw; // @[package.scala 258:25]
  wire  barrier_4_io_x_sx; // @[package.scala 258:25]
  wire  barrier_4_io_x_sr; // @[package.scala 258:25]
  wire  barrier_4_io_x_pw; // @[package.scala 258:25]
  wire  barrier_4_io_x_px; // @[package.scala 258:25]
  wire  barrier_4_io_x_pr; // @[package.scala 258:25]
  wire  barrier_4_io_x_pal; // @[package.scala 258:25]
  wire  barrier_4_io_x_paa; // @[package.scala 258:25]
  wire  barrier_4_io_x_eff; // @[package.scala 258:25]
  wire  barrier_4_io_x_c; // @[package.scala 258:25]
  wire  barrier_4_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] barrier_4_io_y_ppn; // @[package.scala 258:25]
  wire  barrier_4_io_y_u; // @[package.scala 258:25]
  wire  barrier_4_io_y_g; // @[package.scala 258:25]
  wire  barrier_4_io_y_ae; // @[package.scala 258:25]
  wire  barrier_4_io_y_sw; // @[package.scala 258:25]
  wire  barrier_4_io_y_sx; // @[package.scala 258:25]
  wire  barrier_4_io_y_sr; // @[package.scala 258:25]
  wire  barrier_4_io_y_pw; // @[package.scala 258:25]
  wire  barrier_4_io_y_px; // @[package.scala 258:25]
  wire  barrier_4_io_y_pr; // @[package.scala 258:25]
  wire  barrier_4_io_y_pal; // @[package.scala 258:25]
  wire  barrier_4_io_y_paa; // @[package.scala 258:25]
  wire  barrier_4_io_y_eff; // @[package.scala 258:25]
  wire  barrier_4_io_y_c; // @[package.scala 258:25]
  wire  barrier_4_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  barrier_5_clock; // @[package.scala 258:25]
  wire  barrier_5_reset; // @[package.scala 258:25]
  wire [19:0] barrier_5_io_x_ppn; // @[package.scala 258:25]
  wire  barrier_5_io_x_u; // @[package.scala 258:25]
  wire  barrier_5_io_x_g; // @[package.scala 258:25]
  wire  barrier_5_io_x_ae; // @[package.scala 258:25]
  wire  barrier_5_io_x_sw; // @[package.scala 258:25]
  wire  barrier_5_io_x_sx; // @[package.scala 258:25]
  wire  barrier_5_io_x_sr; // @[package.scala 258:25]
  wire  barrier_5_io_x_pw; // @[package.scala 258:25]
  wire  barrier_5_io_x_px; // @[package.scala 258:25]
  wire  barrier_5_io_x_pr; // @[package.scala 258:25]
  wire  barrier_5_io_x_pal; // @[package.scala 258:25]
  wire  barrier_5_io_x_paa; // @[package.scala 258:25]
  wire  barrier_5_io_x_eff; // @[package.scala 258:25]
  wire  barrier_5_io_x_c; // @[package.scala 258:25]
  wire  barrier_5_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] barrier_5_io_y_ppn; // @[package.scala 258:25]
  wire  barrier_5_io_y_u; // @[package.scala 258:25]
  wire  barrier_5_io_y_g; // @[package.scala 258:25]
  wire  barrier_5_io_y_ae; // @[package.scala 258:25]
  wire  barrier_5_io_y_sw; // @[package.scala 258:25]
  wire  barrier_5_io_y_sx; // @[package.scala 258:25]
  wire  barrier_5_io_y_sr; // @[package.scala 258:25]
  wire  barrier_5_io_y_pw; // @[package.scala 258:25]
  wire  barrier_5_io_y_px; // @[package.scala 258:25]
  wire  barrier_5_io_y_pr; // @[package.scala 258:25]
  wire  barrier_5_io_y_pal; // @[package.scala 258:25]
  wire  barrier_5_io_y_paa; // @[package.scala 258:25]
  wire  barrier_5_io_y_eff; // @[package.scala 258:25]
  wire  barrier_5_io_y_c; // @[package.scala 258:25]
  wire  barrier_5_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  barrier_6_clock; // @[package.scala 258:25]
  wire  barrier_6_reset; // @[package.scala 258:25]
  wire [19:0] barrier_6_io_x_ppn; // @[package.scala 258:25]
  wire  barrier_6_io_x_u; // @[package.scala 258:25]
  wire  barrier_6_io_x_g; // @[package.scala 258:25]
  wire  barrier_6_io_x_ae; // @[package.scala 258:25]
  wire  barrier_6_io_x_sw; // @[package.scala 258:25]
  wire  barrier_6_io_x_sx; // @[package.scala 258:25]
  wire  barrier_6_io_x_sr; // @[package.scala 258:25]
  wire  barrier_6_io_x_pw; // @[package.scala 258:25]
  wire  barrier_6_io_x_px; // @[package.scala 258:25]
  wire  barrier_6_io_x_pr; // @[package.scala 258:25]
  wire  barrier_6_io_x_pal; // @[package.scala 258:25]
  wire  barrier_6_io_x_paa; // @[package.scala 258:25]
  wire  barrier_6_io_x_eff; // @[package.scala 258:25]
  wire  barrier_6_io_x_c; // @[package.scala 258:25]
  wire  barrier_6_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] barrier_6_io_y_ppn; // @[package.scala 258:25]
  wire  barrier_6_io_y_u; // @[package.scala 258:25]
  wire  barrier_6_io_y_g; // @[package.scala 258:25]
  wire  barrier_6_io_y_ae; // @[package.scala 258:25]
  wire  barrier_6_io_y_sw; // @[package.scala 258:25]
  wire  barrier_6_io_y_sx; // @[package.scala 258:25]
  wire  barrier_6_io_y_sr; // @[package.scala 258:25]
  wire  barrier_6_io_y_pw; // @[package.scala 258:25]
  wire  barrier_6_io_y_px; // @[package.scala 258:25]
  wire  barrier_6_io_y_pr; // @[package.scala 258:25]
  wire  barrier_6_io_y_pal; // @[package.scala 258:25]
  wire  barrier_6_io_y_paa; // @[package.scala 258:25]
  wire  barrier_6_io_y_eff; // @[package.scala 258:25]
  wire  barrier_6_io_y_c; // @[package.scala 258:25]
  wire  barrier_6_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  barrier_7_clock; // @[package.scala 258:25]
  wire  barrier_7_reset; // @[package.scala 258:25]
  wire [19:0] barrier_7_io_x_ppn; // @[package.scala 258:25]
  wire  barrier_7_io_x_u; // @[package.scala 258:25]
  wire  barrier_7_io_x_g; // @[package.scala 258:25]
  wire  barrier_7_io_x_ae; // @[package.scala 258:25]
  wire  barrier_7_io_x_sw; // @[package.scala 258:25]
  wire  barrier_7_io_x_sx; // @[package.scala 258:25]
  wire  barrier_7_io_x_sr; // @[package.scala 258:25]
  wire  barrier_7_io_x_pw; // @[package.scala 258:25]
  wire  barrier_7_io_x_px; // @[package.scala 258:25]
  wire  barrier_7_io_x_pr; // @[package.scala 258:25]
  wire  barrier_7_io_x_pal; // @[package.scala 258:25]
  wire  barrier_7_io_x_paa; // @[package.scala 258:25]
  wire  barrier_7_io_x_eff; // @[package.scala 258:25]
  wire  barrier_7_io_x_c; // @[package.scala 258:25]
  wire  barrier_7_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] barrier_7_io_y_ppn; // @[package.scala 258:25]
  wire  barrier_7_io_y_u; // @[package.scala 258:25]
  wire  barrier_7_io_y_g; // @[package.scala 258:25]
  wire  barrier_7_io_y_ae; // @[package.scala 258:25]
  wire  barrier_7_io_y_sw; // @[package.scala 258:25]
  wire  barrier_7_io_y_sx; // @[package.scala 258:25]
  wire  barrier_7_io_y_sr; // @[package.scala 258:25]
  wire  barrier_7_io_y_pw; // @[package.scala 258:25]
  wire  barrier_7_io_y_px; // @[package.scala 258:25]
  wire  barrier_7_io_y_pr; // @[package.scala 258:25]
  wire  barrier_7_io_y_pal; // @[package.scala 258:25]
  wire  barrier_7_io_y_paa; // @[package.scala 258:25]
  wire  barrier_7_io_y_eff; // @[package.scala 258:25]
  wire  barrier_7_io_y_c; // @[package.scala 258:25]
  wire  barrier_7_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  barrier_8_clock; // @[package.scala 258:25]
  wire  barrier_8_reset; // @[package.scala 258:25]
  wire [19:0] barrier_8_io_x_ppn; // @[package.scala 258:25]
  wire  barrier_8_io_x_u; // @[package.scala 258:25]
  wire  barrier_8_io_x_g; // @[package.scala 258:25]
  wire  barrier_8_io_x_ae; // @[package.scala 258:25]
  wire  barrier_8_io_x_sw; // @[package.scala 258:25]
  wire  barrier_8_io_x_sx; // @[package.scala 258:25]
  wire  barrier_8_io_x_sr; // @[package.scala 258:25]
  wire  barrier_8_io_x_pw; // @[package.scala 258:25]
  wire  barrier_8_io_x_px; // @[package.scala 258:25]
  wire  barrier_8_io_x_pr; // @[package.scala 258:25]
  wire  barrier_8_io_x_pal; // @[package.scala 258:25]
  wire  barrier_8_io_x_paa; // @[package.scala 258:25]
  wire  barrier_8_io_x_eff; // @[package.scala 258:25]
  wire  barrier_8_io_x_c; // @[package.scala 258:25]
  wire  barrier_8_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] barrier_8_io_y_ppn; // @[package.scala 258:25]
  wire  barrier_8_io_y_u; // @[package.scala 258:25]
  wire  barrier_8_io_y_g; // @[package.scala 258:25]
  wire  barrier_8_io_y_ae; // @[package.scala 258:25]
  wire  barrier_8_io_y_sw; // @[package.scala 258:25]
  wire  barrier_8_io_y_sx; // @[package.scala 258:25]
  wire  barrier_8_io_y_sr; // @[package.scala 258:25]
  wire  barrier_8_io_y_pw; // @[package.scala 258:25]
  wire  barrier_8_io_y_px; // @[package.scala 258:25]
  wire  barrier_8_io_y_pr; // @[package.scala 258:25]
  wire  barrier_8_io_y_pal; // @[package.scala 258:25]
  wire  barrier_8_io_y_paa; // @[package.scala 258:25]
  wire  barrier_8_io_y_eff; // @[package.scala 258:25]
  wire  barrier_8_io_y_c; // @[package.scala 258:25]
  wire  barrier_8_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  barrier_9_clock; // @[package.scala 258:25]
  wire  barrier_9_reset; // @[package.scala 258:25]
  wire [19:0] barrier_9_io_x_ppn; // @[package.scala 258:25]
  wire  barrier_9_io_x_u; // @[package.scala 258:25]
  wire  barrier_9_io_x_g; // @[package.scala 258:25]
  wire  barrier_9_io_x_ae; // @[package.scala 258:25]
  wire  barrier_9_io_x_sw; // @[package.scala 258:25]
  wire  barrier_9_io_x_sx; // @[package.scala 258:25]
  wire  barrier_9_io_x_sr; // @[package.scala 258:25]
  wire  barrier_9_io_x_pw; // @[package.scala 258:25]
  wire  barrier_9_io_x_px; // @[package.scala 258:25]
  wire  barrier_9_io_x_pr; // @[package.scala 258:25]
  wire  barrier_9_io_x_pal; // @[package.scala 258:25]
  wire  barrier_9_io_x_paa; // @[package.scala 258:25]
  wire  barrier_9_io_x_eff; // @[package.scala 258:25]
  wire  barrier_9_io_x_c; // @[package.scala 258:25]
  wire  barrier_9_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] barrier_9_io_y_ppn; // @[package.scala 258:25]
  wire  barrier_9_io_y_u; // @[package.scala 258:25]
  wire  barrier_9_io_y_g; // @[package.scala 258:25]
  wire  barrier_9_io_y_ae; // @[package.scala 258:25]
  wire  barrier_9_io_y_sw; // @[package.scala 258:25]
  wire  barrier_9_io_y_sx; // @[package.scala 258:25]
  wire  barrier_9_io_y_sr; // @[package.scala 258:25]
  wire  barrier_9_io_y_pw; // @[package.scala 258:25]
  wire  barrier_9_io_y_px; // @[package.scala 258:25]
  wire  barrier_9_io_y_pr; // @[package.scala 258:25]
  wire  barrier_9_io_y_pal; // @[package.scala 258:25]
  wire  barrier_9_io_y_paa; // @[package.scala 258:25]
  wire  barrier_9_io_y_eff; // @[package.scala 258:25]
  wire  barrier_9_io_y_c; // @[package.scala 258:25]
  wire  barrier_9_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  barrier_10_clock; // @[package.scala 258:25]
  wire  barrier_10_reset; // @[package.scala 258:25]
  wire [19:0] barrier_10_io_x_ppn; // @[package.scala 258:25]
  wire  barrier_10_io_x_u; // @[package.scala 258:25]
  wire  barrier_10_io_x_g; // @[package.scala 258:25]
  wire  barrier_10_io_x_ae; // @[package.scala 258:25]
  wire  barrier_10_io_x_sw; // @[package.scala 258:25]
  wire  barrier_10_io_x_sx; // @[package.scala 258:25]
  wire  barrier_10_io_x_sr; // @[package.scala 258:25]
  wire  barrier_10_io_x_pw; // @[package.scala 258:25]
  wire  barrier_10_io_x_px; // @[package.scala 258:25]
  wire  barrier_10_io_x_pr; // @[package.scala 258:25]
  wire  barrier_10_io_x_pal; // @[package.scala 258:25]
  wire  barrier_10_io_x_paa; // @[package.scala 258:25]
  wire  barrier_10_io_x_eff; // @[package.scala 258:25]
  wire  barrier_10_io_x_c; // @[package.scala 258:25]
  wire  barrier_10_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] barrier_10_io_y_ppn; // @[package.scala 258:25]
  wire  barrier_10_io_y_u; // @[package.scala 258:25]
  wire  barrier_10_io_y_g; // @[package.scala 258:25]
  wire  barrier_10_io_y_ae; // @[package.scala 258:25]
  wire  barrier_10_io_y_sw; // @[package.scala 258:25]
  wire  barrier_10_io_y_sx; // @[package.scala 258:25]
  wire  barrier_10_io_y_sr; // @[package.scala 258:25]
  wire  barrier_10_io_y_pw; // @[package.scala 258:25]
  wire  barrier_10_io_y_px; // @[package.scala 258:25]
  wire  barrier_10_io_y_pr; // @[package.scala 258:25]
  wire  barrier_10_io_y_pal; // @[package.scala 258:25]
  wire  barrier_10_io_y_paa; // @[package.scala 258:25]
  wire  barrier_10_io_y_eff; // @[package.scala 258:25]
  wire  barrier_10_io_y_c; // @[package.scala 258:25]
  wire  barrier_10_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  barrier_11_clock; // @[package.scala 258:25]
  wire  barrier_11_reset; // @[package.scala 258:25]
  wire [19:0] barrier_11_io_x_ppn; // @[package.scala 258:25]
  wire  barrier_11_io_x_u; // @[package.scala 258:25]
  wire  barrier_11_io_x_g; // @[package.scala 258:25]
  wire  barrier_11_io_x_ae; // @[package.scala 258:25]
  wire  barrier_11_io_x_sw; // @[package.scala 258:25]
  wire  barrier_11_io_x_sx; // @[package.scala 258:25]
  wire  barrier_11_io_x_sr; // @[package.scala 258:25]
  wire  barrier_11_io_x_pw; // @[package.scala 258:25]
  wire  barrier_11_io_x_px; // @[package.scala 258:25]
  wire  barrier_11_io_x_pr; // @[package.scala 258:25]
  wire  barrier_11_io_x_pal; // @[package.scala 258:25]
  wire  barrier_11_io_x_paa; // @[package.scala 258:25]
  wire  barrier_11_io_x_eff; // @[package.scala 258:25]
  wire  barrier_11_io_x_c; // @[package.scala 258:25]
  wire  barrier_11_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] barrier_11_io_y_ppn; // @[package.scala 258:25]
  wire  barrier_11_io_y_u; // @[package.scala 258:25]
  wire  barrier_11_io_y_g; // @[package.scala 258:25]
  wire  barrier_11_io_y_ae; // @[package.scala 258:25]
  wire  barrier_11_io_y_sw; // @[package.scala 258:25]
  wire  barrier_11_io_y_sx; // @[package.scala 258:25]
  wire  barrier_11_io_y_sr; // @[package.scala 258:25]
  wire  barrier_11_io_y_pw; // @[package.scala 258:25]
  wire  barrier_11_io_y_px; // @[package.scala 258:25]
  wire  barrier_11_io_y_pr; // @[package.scala 258:25]
  wire  barrier_11_io_y_pal; // @[package.scala 258:25]
  wire  barrier_11_io_y_paa; // @[package.scala 258:25]
  wire  barrier_11_io_y_eff; // @[package.scala 258:25]
  wire  barrier_11_io_y_c; // @[package.scala 258:25]
  wire  barrier_11_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  barrier_12_clock; // @[package.scala 258:25]
  wire  barrier_12_reset; // @[package.scala 258:25]
  wire [19:0] barrier_12_io_x_ppn; // @[package.scala 258:25]
  wire  barrier_12_io_x_u; // @[package.scala 258:25]
  wire  barrier_12_io_x_g; // @[package.scala 258:25]
  wire  barrier_12_io_x_ae; // @[package.scala 258:25]
  wire  barrier_12_io_x_sw; // @[package.scala 258:25]
  wire  barrier_12_io_x_sx; // @[package.scala 258:25]
  wire  barrier_12_io_x_sr; // @[package.scala 258:25]
  wire  barrier_12_io_x_pw; // @[package.scala 258:25]
  wire  barrier_12_io_x_px; // @[package.scala 258:25]
  wire  barrier_12_io_x_pr; // @[package.scala 258:25]
  wire  barrier_12_io_x_pal; // @[package.scala 258:25]
  wire  barrier_12_io_x_paa; // @[package.scala 258:25]
  wire  barrier_12_io_x_eff; // @[package.scala 258:25]
  wire  barrier_12_io_x_c; // @[package.scala 258:25]
  wire  barrier_12_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] barrier_12_io_y_ppn; // @[package.scala 258:25]
  wire  barrier_12_io_y_u; // @[package.scala 258:25]
  wire  barrier_12_io_y_g; // @[package.scala 258:25]
  wire  barrier_12_io_y_ae; // @[package.scala 258:25]
  wire  barrier_12_io_y_sw; // @[package.scala 258:25]
  wire  barrier_12_io_y_sx; // @[package.scala 258:25]
  wire  barrier_12_io_y_sr; // @[package.scala 258:25]
  wire  barrier_12_io_y_pw; // @[package.scala 258:25]
  wire  barrier_12_io_y_px; // @[package.scala 258:25]
  wire  barrier_12_io_y_pr; // @[package.scala 258:25]
  wire  barrier_12_io_y_pal; // @[package.scala 258:25]
  wire  barrier_12_io_y_paa; // @[package.scala 258:25]
  wire  barrier_12_io_y_eff; // @[package.scala 258:25]
  wire  barrier_12_io_y_c; // @[package.scala 258:25]
  wire  barrier_12_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  barrier_13_clock; // @[package.scala 258:25]
  wire  barrier_13_reset; // @[package.scala 258:25]
  wire [19:0] barrier_13_io_x_ppn; // @[package.scala 258:25]
  wire  barrier_13_io_x_u; // @[package.scala 258:25]
  wire  barrier_13_io_x_g; // @[package.scala 258:25]
  wire  barrier_13_io_x_ae; // @[package.scala 258:25]
  wire  barrier_13_io_x_sw; // @[package.scala 258:25]
  wire  barrier_13_io_x_sx; // @[package.scala 258:25]
  wire  barrier_13_io_x_sr; // @[package.scala 258:25]
  wire  barrier_13_io_x_pw; // @[package.scala 258:25]
  wire  barrier_13_io_x_px; // @[package.scala 258:25]
  wire  barrier_13_io_x_pr; // @[package.scala 258:25]
  wire  barrier_13_io_x_pal; // @[package.scala 258:25]
  wire  barrier_13_io_x_paa; // @[package.scala 258:25]
  wire  barrier_13_io_x_eff; // @[package.scala 258:25]
  wire  barrier_13_io_x_c; // @[package.scala 258:25]
  wire  barrier_13_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] barrier_13_io_y_ppn; // @[package.scala 258:25]
  wire  barrier_13_io_y_u; // @[package.scala 258:25]
  wire  barrier_13_io_y_g; // @[package.scala 258:25]
  wire  barrier_13_io_y_ae; // @[package.scala 258:25]
  wire  barrier_13_io_y_sw; // @[package.scala 258:25]
  wire  barrier_13_io_y_sx; // @[package.scala 258:25]
  wire  barrier_13_io_y_sr; // @[package.scala 258:25]
  wire  barrier_13_io_y_pw; // @[package.scala 258:25]
  wire  barrier_13_io_y_px; // @[package.scala 258:25]
  wire  barrier_13_io_y_pr; // @[package.scala 258:25]
  wire  barrier_13_io_y_pal; // @[package.scala 258:25]
  wire  barrier_13_io_y_paa; // @[package.scala 258:25]
  wire  barrier_13_io_y_eff; // @[package.scala 258:25]
  wire  barrier_13_io_y_c; // @[package.scala 258:25]
  wire  barrier_13_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  barrier_14_clock; // @[package.scala 258:25]
  wire  barrier_14_reset; // @[package.scala 258:25]
  wire [19:0] barrier_14_io_x_ppn; // @[package.scala 258:25]
  wire  barrier_14_io_x_u; // @[package.scala 258:25]
  wire  barrier_14_io_x_g; // @[package.scala 258:25]
  wire  barrier_14_io_x_ae; // @[package.scala 258:25]
  wire  barrier_14_io_x_sw; // @[package.scala 258:25]
  wire  barrier_14_io_x_sx; // @[package.scala 258:25]
  wire  barrier_14_io_x_sr; // @[package.scala 258:25]
  wire  barrier_14_io_x_pw; // @[package.scala 258:25]
  wire  barrier_14_io_x_px; // @[package.scala 258:25]
  wire  barrier_14_io_x_pr; // @[package.scala 258:25]
  wire  barrier_14_io_x_pal; // @[package.scala 258:25]
  wire  barrier_14_io_x_paa; // @[package.scala 258:25]
  wire  barrier_14_io_x_eff; // @[package.scala 258:25]
  wire  barrier_14_io_x_c; // @[package.scala 258:25]
  wire  barrier_14_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] barrier_14_io_y_ppn; // @[package.scala 258:25]
  wire  barrier_14_io_y_u; // @[package.scala 258:25]
  wire  barrier_14_io_y_g; // @[package.scala 258:25]
  wire  barrier_14_io_y_ae; // @[package.scala 258:25]
  wire  barrier_14_io_y_sw; // @[package.scala 258:25]
  wire  barrier_14_io_y_sx; // @[package.scala 258:25]
  wire  barrier_14_io_y_sr; // @[package.scala 258:25]
  wire  barrier_14_io_y_pw; // @[package.scala 258:25]
  wire  barrier_14_io_y_px; // @[package.scala 258:25]
  wire  barrier_14_io_y_pr; // @[package.scala 258:25]
  wire  barrier_14_io_y_pal; // @[package.scala 258:25]
  wire  barrier_14_io_y_paa; // @[package.scala 258:25]
  wire  barrier_14_io_y_eff; // @[package.scala 258:25]
  wire  barrier_14_io_y_c; // @[package.scala 258:25]
  wire  barrier_14_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  barrier_15_clock; // @[package.scala 258:25]
  wire  barrier_15_reset; // @[package.scala 258:25]
  wire [19:0] barrier_15_io_x_ppn; // @[package.scala 258:25]
  wire  barrier_15_io_x_u; // @[package.scala 258:25]
  wire  barrier_15_io_x_g; // @[package.scala 258:25]
  wire  barrier_15_io_x_ae; // @[package.scala 258:25]
  wire  barrier_15_io_x_sw; // @[package.scala 258:25]
  wire  barrier_15_io_x_sx; // @[package.scala 258:25]
  wire  barrier_15_io_x_sr; // @[package.scala 258:25]
  wire  barrier_15_io_x_pw; // @[package.scala 258:25]
  wire  barrier_15_io_x_px; // @[package.scala 258:25]
  wire  barrier_15_io_x_pr; // @[package.scala 258:25]
  wire  barrier_15_io_x_pal; // @[package.scala 258:25]
  wire  barrier_15_io_x_paa; // @[package.scala 258:25]
  wire  barrier_15_io_x_eff; // @[package.scala 258:25]
  wire  barrier_15_io_x_c; // @[package.scala 258:25]
  wire  barrier_15_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] barrier_15_io_y_ppn; // @[package.scala 258:25]
  wire  barrier_15_io_y_u; // @[package.scala 258:25]
  wire  barrier_15_io_y_g; // @[package.scala 258:25]
  wire  barrier_15_io_y_ae; // @[package.scala 258:25]
  wire  barrier_15_io_y_sw; // @[package.scala 258:25]
  wire  barrier_15_io_y_sx; // @[package.scala 258:25]
  wire  barrier_15_io_y_sr; // @[package.scala 258:25]
  wire  barrier_15_io_y_pw; // @[package.scala 258:25]
  wire  barrier_15_io_y_px; // @[package.scala 258:25]
  wire  barrier_15_io_y_pr; // @[package.scala 258:25]
  wire  barrier_15_io_y_pal; // @[package.scala 258:25]
  wire  barrier_15_io_y_paa; // @[package.scala 258:25]
  wire  barrier_15_io_y_eff; // @[package.scala 258:25]
  wire  barrier_15_io_y_c; // @[package.scala 258:25]
  wire  barrier_15_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  barrier_16_clock; // @[package.scala 258:25]
  wire  barrier_16_reset; // @[package.scala 258:25]
  wire [19:0] barrier_16_io_x_ppn; // @[package.scala 258:25]
  wire  barrier_16_io_x_u; // @[package.scala 258:25]
  wire  barrier_16_io_x_g; // @[package.scala 258:25]
  wire  barrier_16_io_x_ae; // @[package.scala 258:25]
  wire  barrier_16_io_x_sw; // @[package.scala 258:25]
  wire  barrier_16_io_x_sx; // @[package.scala 258:25]
  wire  barrier_16_io_x_sr; // @[package.scala 258:25]
  wire  barrier_16_io_x_pw; // @[package.scala 258:25]
  wire  barrier_16_io_x_px; // @[package.scala 258:25]
  wire  barrier_16_io_x_pr; // @[package.scala 258:25]
  wire  barrier_16_io_x_pal; // @[package.scala 258:25]
  wire  barrier_16_io_x_paa; // @[package.scala 258:25]
  wire  barrier_16_io_x_eff; // @[package.scala 258:25]
  wire  barrier_16_io_x_c; // @[package.scala 258:25]
  wire  barrier_16_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] barrier_16_io_y_ppn; // @[package.scala 258:25]
  wire  barrier_16_io_y_u; // @[package.scala 258:25]
  wire  barrier_16_io_y_g; // @[package.scala 258:25]
  wire  barrier_16_io_y_ae; // @[package.scala 258:25]
  wire  barrier_16_io_y_sw; // @[package.scala 258:25]
  wire  barrier_16_io_y_sx; // @[package.scala 258:25]
  wire  barrier_16_io_y_sr; // @[package.scala 258:25]
  wire  barrier_16_io_y_pw; // @[package.scala 258:25]
  wire  barrier_16_io_y_px; // @[package.scala 258:25]
  wire  barrier_16_io_y_pr; // @[package.scala 258:25]
  wire  barrier_16_io_y_pal; // @[package.scala 258:25]
  wire  barrier_16_io_y_paa; // @[package.scala 258:25]
  wire  barrier_16_io_y_eff; // @[package.scala 258:25]
  wire  barrier_16_io_y_c; // @[package.scala 258:25]
  wire  barrier_16_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  barrier_17_clock; // @[package.scala 258:25]
  wire  barrier_17_reset; // @[package.scala 258:25]
  wire [19:0] barrier_17_io_x_ppn; // @[package.scala 258:25]
  wire  barrier_17_io_x_u; // @[package.scala 258:25]
  wire  barrier_17_io_x_g; // @[package.scala 258:25]
  wire  barrier_17_io_x_ae; // @[package.scala 258:25]
  wire  barrier_17_io_x_sw; // @[package.scala 258:25]
  wire  barrier_17_io_x_sx; // @[package.scala 258:25]
  wire  barrier_17_io_x_sr; // @[package.scala 258:25]
  wire  barrier_17_io_x_pw; // @[package.scala 258:25]
  wire  barrier_17_io_x_px; // @[package.scala 258:25]
  wire  barrier_17_io_x_pr; // @[package.scala 258:25]
  wire  barrier_17_io_x_pal; // @[package.scala 258:25]
  wire  barrier_17_io_x_paa; // @[package.scala 258:25]
  wire  barrier_17_io_x_eff; // @[package.scala 258:25]
  wire  barrier_17_io_x_c; // @[package.scala 258:25]
  wire  barrier_17_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] barrier_17_io_y_ppn; // @[package.scala 258:25]
  wire  barrier_17_io_y_u; // @[package.scala 258:25]
  wire  barrier_17_io_y_g; // @[package.scala 258:25]
  wire  barrier_17_io_y_ae; // @[package.scala 258:25]
  wire  barrier_17_io_y_sw; // @[package.scala 258:25]
  wire  barrier_17_io_y_sx; // @[package.scala 258:25]
  wire  barrier_17_io_y_sr; // @[package.scala 258:25]
  wire  barrier_17_io_y_pw; // @[package.scala 258:25]
  wire  barrier_17_io_y_px; // @[package.scala 258:25]
  wire  barrier_17_io_y_pr; // @[package.scala 258:25]
  wire  barrier_17_io_y_pal; // @[package.scala 258:25]
  wire  barrier_17_io_y_paa; // @[package.scala 258:25]
  wire  barrier_17_io_y_eff; // @[package.scala 258:25]
  wire  barrier_17_io_y_c; // @[package.scala 258:25]
  wire  barrier_17_io_y_fragmented_superpage; // @[package.scala 258:25]
  reg [26:0] sectored_entries_0_tag; // @[tlb.scala 122:29]
  reg [33:0] sectored_entries_0_data_0; // @[tlb.scala 122:29]
  reg [33:0] sectored_entries_0_data_1; // @[tlb.scala 122:29]
  reg [33:0] sectored_entries_0_data_2; // @[tlb.scala 122:29]
  reg [33:0] sectored_entries_0_data_3; // @[tlb.scala 122:29]
  reg  sectored_entries_0_valid_0; // @[tlb.scala 122:29]
  reg  sectored_entries_0_valid_1; // @[tlb.scala 122:29]
  reg  sectored_entries_0_valid_2; // @[tlb.scala 122:29]
  reg  sectored_entries_0_valid_3; // @[tlb.scala 122:29]
  reg [1:0] superpage_entries_0_level; // @[tlb.scala 123:30]
  reg [26:0] superpage_entries_0_tag; // @[tlb.scala 123:30]
  reg [33:0] superpage_entries_0_data_0; // @[tlb.scala 123:30]
  reg  superpage_entries_0_valid_0; // @[tlb.scala 123:30]
  reg [1:0] superpage_entries_1_level; // @[tlb.scala 123:30]
  reg [26:0] superpage_entries_1_tag; // @[tlb.scala 123:30]
  reg [33:0] superpage_entries_1_data_0; // @[tlb.scala 123:30]
  reg  superpage_entries_1_valid_0; // @[tlb.scala 123:30]
  reg [1:0] superpage_entries_2_level; // @[tlb.scala 123:30]
  reg [26:0] superpage_entries_2_tag; // @[tlb.scala 123:30]
  reg [33:0] superpage_entries_2_data_0; // @[tlb.scala 123:30]
  reg  superpage_entries_2_valid_0; // @[tlb.scala 123:30]
  reg [1:0] superpage_entries_3_level; // @[tlb.scala 123:30]
  reg [26:0] superpage_entries_3_tag; // @[tlb.scala 123:30]
  reg [33:0] superpage_entries_3_data_0; // @[tlb.scala 123:30]
  reg  superpage_entries_3_valid_0; // @[tlb.scala 123:30]
  reg [1:0] special_entry_level; // @[tlb.scala 124:56]
  reg [26:0] special_entry_tag; // @[tlb.scala 124:56]
  reg [33:0] special_entry_data_0; // @[tlb.scala 124:56]
  reg  special_entry_valid_0; // @[tlb.scala 124:56]
  reg [1:0] state; // @[tlb.scala 129:22]
  reg [26:0] r_refill_tag; // @[tlb.scala 130:25]
  reg [1:0] r_superpage_repl_addr; // @[tlb.scala 131:34]
  reg  r_sectored_hit; // @[tlb.scala 134:27]
  wire  priv_s = io_ptw_status_dprv[0]; // @[tlb.scala 137:20]
  wire  priv_uses_vm = io_ptw_status_dprv <= 2'h1; // @[tlb.scala 138:27]
  wire  vm_enabled_0 = io_ptw_ptbr_mode[3] & priv_uses_vm & ~io_req_0_bits_passthrough; // @[tlb.scala 139:109]
  wire [26:0] vpn_0 = io_req_0_bits_vaddr[38:12]; // @[tlb.scala 142:47]
  wire [19:0] refill_ppn = io_ptw_resp_bits_pte_ppn[19:0]; // @[tlb.scala 143:44]
  wire  _T_6 = state == 2'h1; // @[package.scala 15:47]
  wire [1:0] hi = barrier_io_y_ppn[19:18]; // @[tlb.scala 78:28]
  wire  _T_25 = special_entry_level < 2'h1; // @[tlb.scala 80:31]
  wire [26:0] _T_27 = _T_25 ? vpn_0 : 27'h0; // @[tlb.scala 81:30]
  wire [26:0] _GEN_222 = {{7'd0}, barrier_io_y_ppn}; // @[tlb.scala 81:49]
  wire [26:0] _T_28 = _T_27 | _GEN_222; // @[tlb.scala 81:49]
  wire [8:0] lo = _T_28[17:9]; // @[tlb.scala 81:60]
  wire  _T_29 = special_entry_level < 2'h2; // @[tlb.scala 80:31]
  wire [26:0] _T_31 = _T_29 ? vpn_0 : 27'h0; // @[tlb.scala 81:30]
  wire [26:0] _T_32 = _T_31 | _GEN_222; // @[tlb.scala 81:49]
  wire [8:0] lo_1 = _T_32[8:0]; // @[tlb.scala 81:60]
  wire [19:0] _T_33 = {hi,lo,lo_1}; // @[Cat.scala 30:58]
  wire [27:0] _T_35 = vm_enabled_0 ? {{8'd0}, _T_33} : io_req_0_bits_vaddr[39:12]; // @[tlb.scala 148:20]
  wire [27:0] mpu_ppn_0 = io_ptw_resp_valid ? {{8'd0}, refill_ppn} : _T_35; // @[tlb.scala 147:20]
  wire [11:0] lo_2 = io_req_0_bits_vaddr[11:0]; // @[tlb.scala 149:72]
  wire [39:0] mpu_physaddr_0 = {mpu_ppn_0,lo_2}; // @[Cat.scala 30:58]
  wire [39:0] _T_41 = mpu_physaddr_0 ^ 40'h3000; // @[Parameters.scala 137:31]
  wire [40:0] _T_42 = {1'b0,$signed(_T_41)}; // @[Parameters.scala 137:49]
  wire [40:0] _T_44 = $signed(_T_42) & -41'sh1000; // @[Parameters.scala 137:52]
  wire  _T_45 = $signed(_T_44) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] _T_46 = mpu_physaddr_0 ^ 40'h4000; // @[Parameters.scala 137:31]
  wire [40:0] _T_47 = {1'b0,$signed(_T_46)}; // @[Parameters.scala 137:49]
  wire [40:0] _T_49 = $signed(_T_47) & -41'sh1000; // @[Parameters.scala 137:52]
  wire  _T_50 = $signed(_T_49) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] _T_51 = mpu_physaddr_0 ^ 40'h54000000; // @[Parameters.scala 137:31]
  wire [40:0] _T_52 = {1'b0,$signed(_T_51)}; // @[Parameters.scala 137:49]
  wire [40:0] _T_54 = $signed(_T_52) & -41'sh1000; // @[Parameters.scala 137:52]
  wire  _T_55 = $signed(_T_54) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] _T_56 = mpu_physaddr_0 ^ 40'h100000; // @[Parameters.scala 137:31]
  wire [40:0] _T_57 = {1'b0,$signed(_T_56)}; // @[Parameters.scala 137:49]
  wire [40:0] _T_59 = $signed(_T_57) & -41'sh1000; // @[Parameters.scala 137:52]
  wire  _T_60 = $signed(_T_59) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] _T_61 = mpu_physaddr_0 ^ 40'hc000000; // @[Parameters.scala 137:31]
  wire [40:0] _T_62 = {1'b0,$signed(_T_61)}; // @[Parameters.scala 137:49]
  wire [40:0] _T_64 = $signed(_T_62) & -41'sh4000000; // @[Parameters.scala 137:52]
  wire  _T_65 = $signed(_T_64) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] _T_66 = mpu_physaddr_0 ^ 40'h2000000; // @[Parameters.scala 137:31]
  wire [40:0] _T_67 = {1'b0,$signed(_T_66)}; // @[Parameters.scala 137:49]
  wire [40:0] _T_69 = $signed(_T_67) & -41'sh10000; // @[Parameters.scala 137:52]
  wire  _T_70 = $signed(_T_69) == 41'sh0; // @[Parameters.scala 137:67]
  wire [40:0] _T_72 = {1'b0,$signed(mpu_physaddr_0)}; // @[Parameters.scala 137:49]
  wire [40:0] _T_74 = $signed(_T_72) & -41'sh1000; // @[Parameters.scala 137:52]
  wire  _T_75 = $signed(_T_74) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] _T_76 = mpu_physaddr_0 ^ 40'h10000; // @[Parameters.scala 137:31]
  wire [40:0] _T_77 = {1'b0,$signed(_T_76)}; // @[Parameters.scala 137:49]
  wire [40:0] _T_79 = $signed(_T_77) & -41'sh10000; // @[Parameters.scala 137:52]
  wire  _T_80 = $signed(_T_79) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] _T_81 = mpu_physaddr_0 ^ 40'h80000000; // @[Parameters.scala 137:31]
  wire [40:0] _T_82 = {1'b0,$signed(_T_81)}; // @[Parameters.scala 137:49]
  wire [40:0] _T_84 = $signed(_T_82) & -41'sh10000000; // @[Parameters.scala 137:52]
  wire  _T_85 = $signed(_T_84) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] _T_86 = mpu_physaddr_0 ^ 40'h10000000; // @[Parameters.scala 137:31]
  wire [40:0] _T_87 = {1'b0,$signed(_T_86)}; // @[Parameters.scala 137:49]
  wire [40:0] _T_89 = $signed(_T_87) & -41'sh1000; // @[Parameters.scala 137:52]
  wire  _T_90 = $signed(_T_89) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] _T_91 = mpu_physaddr_0 ^ 40'h20000; // @[Parameters.scala 137:31]
  wire [40:0] _T_92 = {1'b0,$signed(_T_91)}; // @[Parameters.scala 137:49]
  wire [40:0] _T_94 = $signed(_T_92) & -41'sh10000; // @[Parameters.scala 137:52]
  wire  _T_95 = $signed(_T_94) == 41'sh0; // @[Parameters.scala 137:67]
  wire  legal_address_0 = _T_45 | _T_50 | _T_55 | _T_60 | _T_65 | _T_70 | _T_75 | _T_80 | _T_85 | _T_90 | _T_95; // @[tlb.scala 157:84]
  wire [39:0] _T_111 = mpu_physaddr_0 ^ 40'h14000000; // @[Parameters.scala 137:31]
  wire [40:0] _T_112 = {1'b0,$signed(_T_111)}; // @[Parameters.scala 137:49]
  wire [40:0] _T_120 = $signed(_T_87) & 41'sh94000000; // @[Parameters.scala 137:52]
  wire  _T_121 = $signed(_T_120) == 41'sh0; // @[Parameters.scala 137:67]
  wire [40:0] _T_125 = $signed(_T_82) & 41'sh90000000; // @[Parameters.scala 137:52]
  wire  _T_126 = $signed(_T_125) == 41'sh0; // @[Parameters.scala 137:67]
  wire  _T_127 = _T_121 | _T_126; // @[Parameters.scala 615:89]
  wire  cacheable_0 = legal_address_0 & _T_127; // @[tlb.scala 159:22]
  wire [40:0] _T_210 = $signed(_T_72) & 41'sh86134000; // @[Parameters.scala 137:52]
  wire  _T_211 = $signed(_T_210) == 41'sh0; // @[Parameters.scala 137:67]
  wire [40:0] _T_215 = $signed(_T_77) & 41'sh96130000; // @[Parameters.scala 137:52]
  wire  _T_216 = $signed(_T_215) == 41'sh0; // @[Parameters.scala 137:67]
  wire [40:0] _T_220 = $signed(_T_92) & 41'sh96130000; // @[Parameters.scala 137:52]
  wire  _T_221 = $signed(_T_220) == 41'sh0; // @[Parameters.scala 137:67]
  wire  _T_230 = _T_211 | _T_216 | _T_221 | _T_126; // @[TLBPermissions.scala 82:66]
  wire  prot_r_0 = legal_address_0 & pmp_0_io_r; // @[tlb.scala 162:60]
  wire [40:0] _T_309 = $signed(_T_72) & 41'sh9a030000; // @[Parameters.scala 137:52]
  wire  _T_310 = $signed(_T_309) == 41'sh0; // @[Parameters.scala 137:67]
  wire [40:0] _T_314 = $signed(_T_67) & 41'sh9a130000; // @[Parameters.scala 137:52]
  wire  _T_315 = $signed(_T_314) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] _T_316 = mpu_physaddr_0 ^ 40'h8000000; // @[Parameters.scala 137:31]
  wire [40:0] _T_317 = {1'b0,$signed(_T_316)}; // @[Parameters.scala 137:49]
  wire [40:0] _T_319 = $signed(_T_317) & 41'sh98000000; // @[Parameters.scala 137:52]
  wire  _T_320 = $signed(_T_319) == 41'sh0; // @[Parameters.scala 137:67]
  wire [40:0] _T_324 = $signed(_T_87) & 41'sh9a130000; // @[Parameters.scala 137:52]
  wire  _T_325 = $signed(_T_324) == 41'sh0; // @[Parameters.scala 137:67]
  wire  _T_334 = _T_310 | _T_315 | _T_320 | _T_325 | _T_126; // @[Parameters.scala 615:89]
  wire  _T_349 = legal_address_0 & _T_334; // @[tlb.scala 159:22]
  wire  prot_w_0 = _T_349 & pmp_0_io_w; // @[tlb.scala 163:64]
  wire [40:0] _T_354 = $signed(_T_72) & 41'sh96030000; // @[Parameters.scala 137:52]
  wire  _T_355 = $signed(_T_354) == 41'sh0; // @[Parameters.scala 137:67]
  wire [40:0] _T_359 = $signed(_T_67) & 41'sh96130000; // @[Parameters.scala 137:52]
  wire  _T_360 = $signed(_T_359) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] _T_361 = mpu_physaddr_0 ^ 40'h4000000; // @[Parameters.scala 137:31]
  wire [40:0] _T_362 = {1'b0,$signed(_T_361)}; // @[Parameters.scala 137:49]
  wire [40:0] _T_364 = $signed(_T_362) & 41'sh94000000; // @[Parameters.scala 137:52]
  wire  _T_365 = $signed(_T_364) == 41'sh0; // @[Parameters.scala 137:67]
  wire [40:0] _T_369 = $signed(_T_112) & 41'sh96130000; // @[Parameters.scala 137:52]
  wire  _T_370 = $signed(_T_369) == 41'sh0; // @[Parameters.scala 137:67]
  wire  _T_373 = _T_355 | _T_360 | _T_365 | _T_370; // @[Parameters.scala 615:89]
  wire  prot_al_0 = legal_address_0 & _T_373; // @[tlb.scala 159:22]
  wire  _T_506 = legal_address_0 & _T_230; // @[tlb.scala 159:22]
  wire  prot_x_0 = _T_506 & pmp_0_io_x; // @[tlb.scala 166:59]
  wire [40:0] _T_540 = $signed(_T_72) & 41'sh96032000; // @[Parameters.scala 137:52]
  wire  _T_541 = $signed(_T_540) == 41'sh0; // @[Parameters.scala 137:67]
  wire [40:0] _T_555 = $signed(_T_112) & 41'sh96132000; // @[Parameters.scala 137:52]
  wire  _T_556 = $signed(_T_555) == 41'sh0; // @[Parameters.scala 137:67]
  wire  _T_559 = _T_541 | _T_360 | _T_365 | _T_556; // @[Parameters.scala 615:89]
  wire  prot_eff_0 = legal_address_0 & _T_559; // @[tlb.scala 159:22]
  wire  _T_566 = sectored_entries_0_valid_0 | sectored_entries_0_valid_1 | sectored_entries_0_valid_2 |
    sectored_entries_0_valid_3; // @[package.scala 72:59]
  wire [26:0] _T_567 = sectored_entries_0_tag ^ vpn_0; // @[tlb.scala 60:43]
  wire  _T_569 = _T_567[26:2] == 25'h0; // @[tlb.scala 60:73]
  wire  sector_hits_0_0 = _T_566 & _T_569; // @[tlb.scala 59:42]
  wire  _T_578 = superpage_entries_0_level < 2'h1; // @[tlb.scala 66:30]
  wire  superpage_hits_0_0 = superpage_entries_0_valid_0 & superpage_entries_0_tag[26:18] == vpn_0[26:18] & (_T_578 |
    superpage_entries_0_tag[17:9] == vpn_0[17:9]); // @[tlb.scala 67:31]
  wire  _T_599 = superpage_entries_1_level < 2'h1; // @[tlb.scala 66:30]
  wire  superpage_hits_0_1 = superpage_entries_1_valid_0 & superpage_entries_1_tag[26:18] == vpn_0[26:18] & (_T_599 |
    superpage_entries_1_tag[17:9] == vpn_0[17:9]); // @[tlb.scala 67:31]
  wire  _T_620 = superpage_entries_2_level < 2'h1; // @[tlb.scala 66:30]
  wire  superpage_hits_0_2 = superpage_entries_2_valid_0 & superpage_entries_2_tag[26:18] == vpn_0[26:18] & (_T_620 |
    superpage_entries_2_tag[17:9] == vpn_0[17:9]); // @[tlb.scala 67:31]
  wire  _T_641 = superpage_entries_3_level < 2'h1; // @[tlb.scala 66:30]
  wire  superpage_hits_0_3 = superpage_entries_3_valid_0 & superpage_entries_3_tag[26:18] == vpn_0[26:18] & (_T_641 |
    superpage_entries_3_tag[17:9] == vpn_0[17:9]); // @[tlb.scala 67:31]
  wire  _GEN_1 = 2'h1 == vpn_0[1:0] ? sectored_entries_0_valid_1 : sectored_entries_0_valid_0; // @[tlb.scala 72:20 tlb.scala 72:20]
  wire  _GEN_2 = 2'h2 == vpn_0[1:0] ? sectored_entries_0_valid_2 : _GEN_1; // @[tlb.scala 72:20 tlb.scala 72:20]
  wire  _GEN_3 = 2'h3 == vpn_0[1:0] ? sectored_entries_0_valid_3 : _GEN_2; // @[tlb.scala 72:20 tlb.scala 72:20]
  wire  _T_659 = _GEN_3 & _T_569; // @[tlb.scala 72:20]
  wire  hitsVec_0_0 = vm_enabled_0 & _T_659; // @[tlb.scala 171:69]
  wire  hitsVec_0_1 = vm_enabled_0 & superpage_hits_0_0; // @[tlb.scala 171:69]
  wire  hitsVec_0_2 = vm_enabled_0 & superpage_hits_0_1; // @[tlb.scala 171:69]
  wire  hitsVec_0_3 = vm_enabled_0 & superpage_hits_0_2; // @[tlb.scala 171:69]
  wire  hitsVec_0_4 = vm_enabled_0 & superpage_hits_0_3; // @[tlb.scala 171:69]
  wire  _T_769 = special_entry_valid_0 & special_entry_tag[26:18] == vpn_0[26:18] & (_T_25 | special_entry_tag[17:9] ==
    vpn_0[17:9]) & (_T_29 | special_entry_tag[8:0] == vpn_0[8:0]); // @[tlb.scala 67:31]
  wire  hitsVec_0_5 = vm_enabled_0 & _T_769; // @[tlb.scala 171:69]
  wire [5:0] real_hits_0 = {hitsVec_0_5,hitsVec_0_4,hitsVec_0_3,hitsVec_0_2,hitsVec_0_1,hitsVec_0_0}; // @[tlb.scala 172:44]
  wire  hi_3 = ~vm_enabled_0; // @[tlb.scala 173:32]
  wire [6:0] hits_0 = {hi_3,hitsVec_0_5,hitsVec_0_4,hitsVec_0_3,hitsVec_0_2,hitsVec_0_1,hitsVec_0_0}; // @[Cat.scala 30:58]
  wire [33:0] _GEN_5 = 2'h1 == vpn_0[1:0] ? sectored_entries_0_data_1 : sectored_entries_0_data_0; // @[]
  wire [33:0] _GEN_6 = 2'h2 == vpn_0[1:0] ? sectored_entries_0_data_2 : _GEN_5; // @[]
  wire [33:0] _GEN_7 = 2'h3 == vpn_0[1:0] ? sectored_entries_0_data_3 : _GEN_6; // @[]
  wire [1:0] hi_4 = barrier_2_io_y_ppn[19:18]; // @[tlb.scala 78:28]
  wire [26:0] _T_807 = _T_578 ? vpn_0 : 27'h0; // @[tlb.scala 81:30]
  wire [26:0] _GEN_224 = {{7'd0}, barrier_2_io_y_ppn}; // @[tlb.scala 81:49]
  wire [26:0] _T_808 = _T_807 | _GEN_224; // @[tlb.scala 81:49]
  wire [8:0] lo_4 = _T_808[17:9]; // @[tlb.scala 81:60]
  wire [26:0] _T_812 = vpn_0 | _GEN_224; // @[tlb.scala 81:49]
  wire [8:0] lo_5 = _T_812[8:0]; // @[tlb.scala 81:60]
  wire [19:0] _T_813 = {hi_4,lo_4,lo_5}; // @[Cat.scala 30:58]
  wire [1:0] hi_6 = barrier_3_io_y_ppn[19:18]; // @[tlb.scala 78:28]
  wire [26:0] _T_831 = _T_599 ? vpn_0 : 27'h0; // @[tlb.scala 81:30]
  wire [26:0] _GEN_226 = {{7'd0}, barrier_3_io_y_ppn}; // @[tlb.scala 81:49]
  wire [26:0] _T_832 = _T_831 | _GEN_226; // @[tlb.scala 81:49]
  wire [8:0] lo_6 = _T_832[17:9]; // @[tlb.scala 81:60]
  wire [26:0] _T_836 = vpn_0 | _GEN_226; // @[tlb.scala 81:49]
  wire [8:0] lo_7 = _T_836[8:0]; // @[tlb.scala 81:60]
  wire [19:0] _T_837 = {hi_6,lo_6,lo_7}; // @[Cat.scala 30:58]
  wire [1:0] hi_8 = barrier_4_io_y_ppn[19:18]; // @[tlb.scala 78:28]
  wire [26:0] _T_855 = _T_620 ? vpn_0 : 27'h0; // @[tlb.scala 81:30]
  wire [26:0] _GEN_228 = {{7'd0}, barrier_4_io_y_ppn}; // @[tlb.scala 81:49]
  wire [26:0] _T_856 = _T_855 | _GEN_228; // @[tlb.scala 81:49]
  wire [8:0] lo_8 = _T_856[17:9]; // @[tlb.scala 81:60]
  wire [26:0] _T_860 = vpn_0 | _GEN_228; // @[tlb.scala 81:49]
  wire [8:0] lo_9 = _T_860[8:0]; // @[tlb.scala 81:60]
  wire [19:0] _T_861 = {hi_8,lo_8,lo_9}; // @[Cat.scala 30:58]
  wire [1:0] hi_10 = barrier_5_io_y_ppn[19:18]; // @[tlb.scala 78:28]
  wire [26:0] _T_879 = _T_641 ? vpn_0 : 27'h0; // @[tlb.scala 81:30]
  wire [26:0] _GEN_230 = {{7'd0}, barrier_5_io_y_ppn}; // @[tlb.scala 81:49]
  wire [26:0] _T_880 = _T_879 | _GEN_230; // @[tlb.scala 81:49]
  wire [8:0] lo_10 = _T_880[17:9]; // @[tlb.scala 81:60]
  wire [26:0] _T_884 = vpn_0 | _GEN_230; // @[tlb.scala 81:49]
  wire [8:0] lo_11 = _T_884[8:0]; // @[tlb.scala 81:60]
  wire [19:0] _T_885 = {hi_10,lo_10,lo_11}; // @[Cat.scala 30:58]
  wire [1:0] hi_12 = barrier_6_io_y_ppn[19:18]; // @[tlb.scala 78:28]
  wire [26:0] _GEN_232 = {{7'd0}, barrier_6_io_y_ppn}; // @[tlb.scala 81:49]
  wire [26:0] _T_904 = _T_27 | _GEN_232; // @[tlb.scala 81:49]
  wire [8:0] lo_12 = _T_904[17:9]; // @[tlb.scala 81:60]
  wire [26:0] _T_908 = _T_31 | _GEN_232; // @[tlb.scala 81:49]
  wire [8:0] lo_13 = _T_908[8:0]; // @[tlb.scala 81:60]
  wire [19:0] _T_909 = {hi_12,lo_12,lo_13}; // @[Cat.scala 30:58]
  wire [19:0] _T_911 = hitsVec_0_0 ? barrier_1_io_y_ppn : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _T_912 = hitsVec_0_1 ? _T_813 : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _T_913 = hitsVec_0_2 ? _T_837 : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _T_914 = hitsVec_0_3 ? _T_861 : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _T_915 = hitsVec_0_4 ? _T_885 : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _T_916 = hitsVec_0_5 ? _T_909 : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _T_917 = hi_3 ? vpn_0[19:0] : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _T_918 = _T_911 | _T_912; // @[Mux.scala 27:72]
  wire [19:0] _T_919 = _T_918 | _T_913; // @[Mux.scala 27:72]
  wire [19:0] _T_920 = _T_919 | _T_914; // @[Mux.scala 27:72]
  wire [19:0] _T_921 = _T_920 | _T_915; // @[Mux.scala 27:72]
  wire [19:0] _T_922 = _T_921 | _T_916; // @[Mux.scala 27:72]
  wire [19:0] ppn_0 = _T_922 | _T_917; // @[Mux.scala 27:72]
  wire  _T_928 = io_ptw_resp_bits_pte_v & (io_ptw_resp_bits_pte_r | io_ptw_resp_bits_pte_x & ~io_ptw_resp_bits_pte_w) &
    io_ptw_resp_bits_pte_a; // @[PTW.scala 73:52]
  wire  _T_929 = _T_928 & io_ptw_resp_bits_pte_r; // @[PTW.scala 77:35]
  wire  _T_936 = _T_928 & io_ptw_resp_bits_pte_w & io_ptw_resp_bits_pte_d; // @[PTW.scala 78:40]
  wire  _T_942 = _T_928 & io_ptw_resp_bits_pte_x; // @[PTW.scala 79:35]
  wire [6:0] lo_14 = {prot_x_0,prot_r_0,prot_al_0,prot_al_0,prot_eff_0,cacheable_0,io_ptw_resp_bits_fragmented_superpage
    }; // @[tlb.scala 95:26]
  wire [33:0] _T_946 = {refill_ppn,io_ptw_resp_bits_pte_u,io_ptw_resp_bits_pte_g,io_ptw_resp_bits_ae,_T_936,_T_942,
    _T_929,prot_w_0,lo_14}; // @[tlb.scala 95:26]
  wire  _GEN_10 = r_superpage_repl_addr == 2'h0 | superpage_entries_0_valid_0; // @[tlb.scala 199:91 tlb.scala 94:18 tlb.scala 123:30]
  wire  _GEN_14 = r_superpage_repl_addr == 2'h1 | superpage_entries_1_valid_0; // @[tlb.scala 199:91 tlb.scala 94:18 tlb.scala 123:30]
  wire  _GEN_18 = r_superpage_repl_addr == 2'h2 | superpage_entries_2_valid_0; // @[tlb.scala 199:91 tlb.scala 94:18 tlb.scala 123:30]
  wire  _GEN_22 = r_superpage_repl_addr == 2'h3 | superpage_entries_3_valid_0; // @[tlb.scala 199:91 tlb.scala 94:18 tlb.scala 123:30]
  wire  _GEN_24 = ~r_sectored_hit ? 1'h0 : sectored_entries_0_valid_0; // @[tlb.scala 205:32 tlb.scala 98:40 tlb.scala 122:29]
  wire  _GEN_25 = ~r_sectored_hit ? 1'h0 : sectored_entries_0_valid_1; // @[tlb.scala 205:32 tlb.scala 98:40 tlb.scala 122:29]
  wire  _GEN_26 = ~r_sectored_hit ? 1'h0 : sectored_entries_0_valid_2; // @[tlb.scala 205:32 tlb.scala 98:40 tlb.scala 122:29]
  wire  _GEN_27 = ~r_sectored_hit ? 1'h0 : sectored_entries_0_valid_3; // @[tlb.scala 205:32 tlb.scala 98:40 tlb.scala 122:29]
  wire  _GEN_28 = 2'h0 == r_refill_tag[1:0] | _GEN_24; // @[tlb.scala 94:18 tlb.scala 94:18]
  wire  _GEN_29 = 2'h1 == r_refill_tag[1:0] | _GEN_25; // @[tlb.scala 94:18 tlb.scala 94:18]
  wire  _GEN_30 = 2'h2 == r_refill_tag[1:0] | _GEN_26; // @[tlb.scala 94:18 tlb.scala 94:18]
  wire  _GEN_31 = 2'h3 == r_refill_tag[1:0] | _GEN_27; // @[tlb.scala 94:18 tlb.scala 94:18]
  wire  _GEN_48 = io_ptw_resp_bits_level < 2'h2 ? _GEN_10 : superpage_entries_0_valid_0; // @[tlb.scala 198:58 tlb.scala 123:30]
  wire  _GEN_52 = io_ptw_resp_bits_level < 2'h2 ? _GEN_14 : superpage_entries_1_valid_0; // @[tlb.scala 198:58 tlb.scala 123:30]
  wire  _GEN_56 = io_ptw_resp_bits_level < 2'h2 ? _GEN_18 : superpage_entries_2_valid_0; // @[tlb.scala 198:58 tlb.scala 123:30]
  wire  _GEN_60 = io_ptw_resp_bits_level < 2'h2 ? _GEN_22 : superpage_entries_3_valid_0; // @[tlb.scala 198:58 tlb.scala 123:30]
  wire  _GEN_62 = io_ptw_resp_bits_level < 2'h2 ? sectored_entries_0_valid_0 : _GEN_28; // @[tlb.scala 198:58 tlb.scala 122:29]
  wire  _GEN_63 = io_ptw_resp_bits_level < 2'h2 ? sectored_entries_0_valid_1 : _GEN_29; // @[tlb.scala 198:58 tlb.scala 122:29]
  wire  _GEN_64 = io_ptw_resp_bits_level < 2'h2 ? sectored_entries_0_valid_2 : _GEN_30; // @[tlb.scala 198:58 tlb.scala 122:29]
  wire  _GEN_65 = io_ptw_resp_bits_level < 2'h2 ? sectored_entries_0_valid_3 : _GEN_31; // @[tlb.scala 198:58 tlb.scala 122:29]
  wire  _GEN_74 = ~io_ptw_resp_bits_homogeneous | special_entry_valid_0; // @[tlb.scala 196:70 tlb.scala 94:18 tlb.scala 124:56]
  wire  _GEN_78 = ~io_ptw_resp_bits_homogeneous ? superpage_entries_0_valid_0 : _GEN_48; // @[tlb.scala 196:70 tlb.scala 123:30]
  wire  _GEN_82 = ~io_ptw_resp_bits_homogeneous ? superpage_entries_1_valid_0 : _GEN_52; // @[tlb.scala 196:70 tlb.scala 123:30]
  wire  _GEN_86 = ~io_ptw_resp_bits_homogeneous ? superpage_entries_2_valid_0 : _GEN_56; // @[tlb.scala 196:70 tlb.scala 123:30]
  wire  _GEN_90 = ~io_ptw_resp_bits_homogeneous ? superpage_entries_3_valid_0 : _GEN_60; // @[tlb.scala 196:70 tlb.scala 123:30]
  wire  _GEN_92 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_valid_0 : _GEN_62; // @[tlb.scala 196:70 tlb.scala 122:29]
  wire  _GEN_93 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_valid_1 : _GEN_63; // @[tlb.scala 196:70 tlb.scala 122:29]
  wire  _GEN_94 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_valid_2 : _GEN_64; // @[tlb.scala 196:70 tlb.scala 122:29]
  wire  _GEN_95 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_valid_3 : _GEN_65; // @[tlb.scala 196:70 tlb.scala 122:29]
  wire  _GEN_104 = io_ptw_resp_valid ? _GEN_74 : special_entry_valid_0; // @[tlb.scala 177:20 tlb.scala 124:56]
  wire  _GEN_108 = io_ptw_resp_valid ? _GEN_78 : superpage_entries_0_valid_0; // @[tlb.scala 177:20 tlb.scala 123:30]
  wire  _GEN_112 = io_ptw_resp_valid ? _GEN_82 : superpage_entries_1_valid_0; // @[tlb.scala 177:20 tlb.scala 123:30]
  wire  _GEN_116 = io_ptw_resp_valid ? _GEN_86 : superpage_entries_2_valid_0; // @[tlb.scala 177:20 tlb.scala 123:30]
  wire  _GEN_120 = io_ptw_resp_valid ? _GEN_90 : superpage_entries_3_valid_0; // @[tlb.scala 177:20 tlb.scala 123:30]
  wire  _GEN_122 = io_ptw_resp_valid ? _GEN_92 : sectored_entries_0_valid_0; // @[tlb.scala 177:20 tlb.scala 122:29]
  wire  _GEN_123 = io_ptw_resp_valid ? _GEN_93 : sectored_entries_0_valid_1; // @[tlb.scala 177:20 tlb.scala 122:29]
  wire  _GEN_124 = io_ptw_resp_valid ? _GEN_94 : sectored_entries_0_valid_2; // @[tlb.scala 177:20 tlb.scala 122:29]
  wire  _GEN_125 = io_ptw_resp_valid ? _GEN_95 : sectored_entries_0_valid_3; // @[tlb.scala 177:20 tlb.scala 122:29]
  wire  entries_0_2_ae = barrier_9_io_y_ae; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_1_ae = barrier_8_io_y_ae; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_0_ae = barrier_7_io_y_ae; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_5_ae = barrier_12_io_y_ae; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_4_ae = barrier_11_io_y_ae; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_3_ae = barrier_10_io_y_ae; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire [6:0] ptw_ae_array_0 = {1'h0,entries_0_5_ae,entries_0_4_ae,entries_0_3_ae,entries_0_2_ae,entries_0_1_ae,
    entries_0_0_ae}; // @[Cat.scala 30:58]
  wire  entries_0_2_u = barrier_9_io_y_u; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_1_u = barrier_8_io_y_u; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_0_u = barrier_7_io_y_u; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_5_u = barrier_12_io_y_u; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_4_u = barrier_11_io_y_u; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_3_u = barrier_10_io_y_u; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire [5:0] _T_1135 = {entries_0_5_u,entries_0_4_u,entries_0_3_u,entries_0_2_u,entries_0_1_u,entries_0_0_u}; // @[Cat.scala 30:58]
  wire [5:0] _T_1136 = ~priv_s | io_ptw_status_sum ? _T_1135 : 6'h0; // @[tlb.scala 215:39]
  wire [5:0] _T_1138 = ~_T_1135; // @[tlb.scala 215:117]
  wire [5:0] _T_1139 = priv_s ? _T_1138 : 6'h0; // @[tlb.scala 215:108]
  wire [5:0] priv_rw_ok_0 = _T_1136 | _T_1139; // @[tlb.scala 215:103]
  wire [5:0] priv_x_ok_0 = priv_s ? _T_1138 : _T_1135; // @[tlb.scala 216:39]
  wire  entries_0_2_sr = barrier_9_io_y_sr; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_1_sr = barrier_8_io_y_sr; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_0_sr = barrier_7_io_y_sr; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_5_sr = barrier_12_io_y_sr; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_4_sr = barrier_11_io_y_sr; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_3_sr = barrier_10_io_y_sr; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire [5:0] _T_1145 = {entries_0_5_sr,entries_0_4_sr,entries_0_3_sr,entries_0_2_sr,entries_0_1_sr,entries_0_0_sr}; // @[Cat.scala 30:58]
  wire  entries_0_2_sx = barrier_9_io_y_sx; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_1_sx = barrier_8_io_y_sx; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_0_sx = barrier_7_io_y_sx; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_5_sx = barrier_12_io_y_sx; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_4_sx = barrier_11_io_y_sx; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_3_sx = barrier_10_io_y_sx; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire [5:0] _T_1146 = {entries_0_5_sx,entries_0_4_sx,entries_0_3_sx,entries_0_2_sx,entries_0_1_sx,entries_0_0_sx}; // @[Cat.scala 30:58]
  wire [5:0] _T_1147 = io_ptw_status_mxr ? _T_1146 : 6'h0; // @[tlb.scala 217:98]
  wire [5:0] _T_1148 = _T_1145 | _T_1147; // @[tlb.scala 217:93]
  wire [5:0] lo_28 = priv_rw_ok_0 & _T_1148; // @[tlb.scala 217:62]
  wire [6:0] r_array_0 = {1'h1,lo_28}; // @[Cat.scala 30:58]
  wire  entries_0_2_sw = barrier_9_io_y_sw; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_1_sw = barrier_8_io_y_sw; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_0_sw = barrier_7_io_y_sw; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_5_sw = barrier_12_io_y_sw; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_4_sw = barrier_11_io_y_sw; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire  entries_0_3_sw = barrier_10_io_y_sw; // @[tlb.scala 211:38 tlb.scala 211:38]
  wire [5:0] _T_1150 = {entries_0_5_sw,entries_0_4_sw,entries_0_3_sw,entries_0_2_sw,entries_0_1_sw,entries_0_0_sw}; // @[Cat.scala 30:58]
  wire [5:0] lo_30 = priv_rw_ok_0 & _T_1150; // @[tlb.scala 218:62]
  wire [6:0] w_array_0 = {1'h1,lo_30}; // @[Cat.scala 30:58]
  wire [5:0] lo_32 = priv_x_ok_0 & _T_1146; // @[tlb.scala 219:62]
  wire [6:0] x_array_0 = {1'h1,lo_32}; // @[Cat.scala 30:58]
  wire [1:0] hi_29 = prot_r_0 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  normal_entries_0_1_pr = barrier_14_io_y_pr; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_0_pr = barrier_13_io_y_pr; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_4_pr = barrier_17_io_y_pr; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_3_pr = barrier_16_io_y_pr; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_2_pr = barrier_15_io_y_pr; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire [6:0] _T_1155 = {hi_29,normal_entries_0_4_pr,normal_entries_0_3_pr,normal_entries_0_2_pr,normal_entries_0_1_pr,
    normal_entries_0_0_pr}; // @[Cat.scala 30:58]
  wire [6:0] _T_1156 = ~ptw_ae_array_0; // @[tlb.scala 220:116]
  wire [6:0] pr_array_0 = _T_1155 & _T_1156; // @[tlb.scala 220:114]
  wire [1:0] hi_31 = prot_w_0 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  normal_entries_0_1_pw = barrier_14_io_y_pw; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_0_pw = barrier_13_io_y_pw; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_4_pw = barrier_17_io_y_pw; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_3_pw = barrier_16_io_y_pw; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_2_pw = barrier_15_io_y_pw; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire [6:0] _T_1159 = {hi_31,normal_entries_0_4_pw,normal_entries_0_3_pw,normal_entries_0_2_pw,normal_entries_0_1_pw,
    normal_entries_0_0_pw}; // @[Cat.scala 30:58]
  wire [6:0] pw_array_0 = _T_1159 & _T_1156; // @[tlb.scala 221:114]
  wire [1:0] hi_33 = prot_x_0 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  normal_entries_0_1_px = barrier_14_io_y_px; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_0_px = barrier_13_io_y_px; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_4_px = barrier_17_io_y_px; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_3_px = barrier_16_io_y_px; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_2_px = barrier_15_io_y_px; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire [6:0] _T_1163 = {hi_33,normal_entries_0_4_px,normal_entries_0_3_px,normal_entries_0_2_px,normal_entries_0_1_px,
    normal_entries_0_0_px}; // @[Cat.scala 30:58]
  wire [6:0] px_array_0 = _T_1163 & _T_1156; // @[tlb.scala 222:114]
  wire [1:0] hi_35 = prot_eff_0 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  normal_entries_0_1_eff = barrier_14_io_y_eff; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_0_eff = barrier_13_io_y_eff; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_4_eff = barrier_17_io_y_eff; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_3_eff = barrier_16_io_y_eff; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_2_eff = barrier_15_io_y_eff; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire [6:0] eff_array_0 = {hi_35,normal_entries_0_4_eff,normal_entries_0_3_eff,normal_entries_0_2_eff,
    normal_entries_0_1_eff,normal_entries_0_0_eff}; // @[Cat.scala 30:58]
  wire [1:0] hi_37 = cacheable_0 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  normal_entries_0_1_c = barrier_14_io_y_c; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_0_c = barrier_13_io_y_c; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_4_c = barrier_17_io_y_c; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_3_c = barrier_16_io_y_c; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_2_c = barrier_15_io_y_c; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire [6:0] c_array_0 = {hi_37,normal_entries_0_4_c,normal_entries_0_3_c,normal_entries_0_2_c,normal_entries_0_1_c,
    normal_entries_0_0_c}; // @[Cat.scala 30:58]
  wire [1:0] hi_39 = prot_al_0 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire  normal_entries_0_1_paa = barrier_14_io_y_paa; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_0_paa = barrier_13_io_y_paa; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_4_paa = barrier_17_io_y_paa; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_3_paa = barrier_16_io_y_paa; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_2_paa = barrier_15_io_y_paa; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire [6:0] paa_array_0 = {hi_39,normal_entries_0_4_paa,normal_entries_0_3_paa,normal_entries_0_2_paa,
    normal_entries_0_1_paa,normal_entries_0_0_paa}; // @[Cat.scala 30:58]
  wire  normal_entries_0_1_pal = barrier_14_io_y_pal; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_0_pal = barrier_13_io_y_pal; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_4_pal = barrier_17_io_y_pal; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_3_pal = barrier_16_io_y_pal; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire  normal_entries_0_2_pal = barrier_15_io_y_pal; // @[tlb.scala 212:45 tlb.scala 212:45]
  wire [6:0] pal_array_0 = {hi_39,normal_entries_0_4_pal,normal_entries_0_3_pal,normal_entries_0_2_pal,
    normal_entries_0_1_pal,normal_entries_0_0_pal}; // @[Cat.scala 30:58]
  wire [6:0] paa_array_if_cached_0 = paa_array_0 | c_array_0; // @[tlb.scala 227:56]
  wire [6:0] pal_array_if_cached_0 = pal_array_0 | c_array_0; // @[tlb.scala 228:56]
  wire [3:0] _T_1180 = 4'h1 << io_req_0_bits_size; // @[OneHot.scala 58:35]
  wire [3:0] _T_1182 = _T_1180 - 4'h1; // @[tlb.scala 231:89]
  wire [39:0] _GEN_238 = {{36'd0}, _T_1182}; // @[tlb.scala 231:56]
  wire [39:0] _T_1183 = io_req_0_bits_vaddr & _GEN_238; // @[tlb.scala 231:56]
  wire  misaligned_0 = |_T_1183; // @[tlb.scala 231:97]
  wire [39:0] _T_1185 = io_req_0_bits_vaddr & 40'hc000000000; // @[tlb.scala 237:46]
  wire  _T_1190 = ~(_T_1185 == 40'h0 | _T_1185 == 40'hc000000000); // @[tlb.scala 238:49]
  wire  bad_va_0 = vm_enabled_0 & _T_1190; // @[tlb.scala 232:134]
  wire  _T_1193 = io_req_0_bits_cmd == 5'h6; // @[package.scala 15:47]
  wire  _T_1194 = io_req_0_bits_cmd == 5'h7; // @[package.scala 15:47]
  wire  cmd_lrsc_0 = _T_1193 | _T_1194; // @[package.scala 72:59]
  wire  _T_1197 = io_req_0_bits_cmd == 5'h4; // @[package.scala 15:47]
  wire  _T_1198 = io_req_0_bits_cmd == 5'h9; // @[package.scala 15:47]
  wire  _T_1199 = io_req_0_bits_cmd == 5'ha; // @[package.scala 15:47]
  wire  _T_1200 = io_req_0_bits_cmd == 5'hb; // @[package.scala 15:47]
  wire  cmd_amo_logical_0 = _T_1197 | _T_1198 | _T_1199 | _T_1200; // @[package.scala 72:59]
  wire  _T_1205 = io_req_0_bits_cmd == 5'h8; // @[package.scala 15:47]
  wire  _T_1206 = io_req_0_bits_cmd == 5'hc; // @[package.scala 15:47]
  wire  _T_1207 = io_req_0_bits_cmd == 5'hd; // @[package.scala 15:47]
  wire  _T_1208 = io_req_0_bits_cmd == 5'he; // @[package.scala 15:47]
  wire  _T_1209 = io_req_0_bits_cmd == 5'hf; // @[package.scala 15:47]
  wire  cmd_amo_arithmetic_0 = _T_1205 | _T_1206 | _T_1207 | _T_1208 | _T_1209; // @[package.scala 72:59]
  wire  _T_1236 = cmd_amo_logical_0 | cmd_amo_arithmetic_0; // @[Consts.scala 79:44]
  wire  cmd_read_0 = io_req_0_bits_cmd == 5'h0 | _T_1193 | _T_1194 | _T_1236; // @[Consts.scala 81:75]
  wire  cmd_write_0 = io_req_0_bits_cmd == 5'h1 | io_req_0_bits_cmd == 5'h11 | _T_1194 | _T_1236; // @[Consts.scala 82:76]
  wire [6:0] _T_1265 = misaligned_0 ? eff_array_0 : 7'h0; // @[tlb.scala 252:8]
  wire [6:0] _T_1266 = ~c_array_0; // @[tlb.scala 253:24]
  wire [6:0] _T_1267 = cmd_lrsc_0 ? _T_1266 : 7'h0; // @[tlb.scala 253:8]
  wire [6:0] ae_array_0 = _T_1265 | _T_1267; // @[tlb.scala 252:43]
  wire [6:0] _T_1269 = ~pr_array_0; // @[tlb.scala 254:66]
  wire [6:0] _T_1270 = ae_array_0 | _T_1269; // @[tlb.scala 254:64]
  wire [6:0] ae_ld_array_0 = cmd_read_0 ? _T_1270 : 7'h0; // @[tlb.scala 254:38]
  wire [6:0] _T_1272 = ~pw_array_0; // @[tlb.scala 256:46]
  wire [6:0] _T_1273 = ae_array_0 | _T_1272; // @[tlb.scala 256:44]
  wire [6:0] _T_1274 = cmd_write_0 ? _T_1273 : 7'h0; // @[tlb.scala 256:8]
  wire [6:0] _T_1275 = ~pal_array_if_cached_0; // @[tlb.scala 257:32]
  wire [6:0] _T_1276 = cmd_amo_logical_0 ? _T_1275 : 7'h0; // @[tlb.scala 257:8]
  wire [6:0] _T_1277 = _T_1274 | _T_1276; // @[tlb.scala 256:65]
  wire [6:0] _T_1278 = ~paa_array_if_cached_0; // @[tlb.scala 258:32]
  wire [6:0] _T_1279 = cmd_amo_arithmetic_0 ? _T_1278 : 7'h0; // @[tlb.scala 258:8]
  wire [6:0] ae_st_array_0 = _T_1277 | _T_1279; // @[tlb.scala 257:62]
  wire [6:0] _T_1281 = ~paa_array_0; // @[tlb.scala 260:32]
  wire [6:0] _T_1282 = cmd_amo_logical_0 ? _T_1281 : 7'h0; // @[tlb.scala 260:8]
  wire [6:0] _T_1283 = ~pal_array_0; // @[tlb.scala 261:32]
  wire [6:0] _T_1284 = cmd_amo_arithmetic_0 ? _T_1283 : 7'h0; // @[tlb.scala 261:8]
  wire [6:0] _T_1285 = _T_1282 | _T_1284; // @[tlb.scala 260:52]
  wire [6:0] _T_1287 = cmd_lrsc_0 ? 7'h7f : 7'h0; // @[tlb.scala 262:8]
  wire [6:0] must_alloc_array_0 = _T_1285 | _T_1287; // @[tlb.scala 261:52]
  wire [6:0] _T_1290 = ~eff_array_0; // @[tlb.scala 263:70]
  wire [6:0] ma_ld_array_0 = misaligned_0 & cmd_read_0 ? _T_1290 : 7'h0; // @[tlb.scala 263:38]
  wire [6:0] ma_st_array_0 = misaligned_0 & cmd_write_0 ? _T_1290 : 7'h0; // @[tlb.scala 264:38]
  wire [6:0] _T_1295 = r_array_0 | ptw_ae_array_0; // @[tlb.scala 265:72]
  wire [6:0] _T_1296 = ~_T_1295; // @[tlb.scala 265:59]
  wire [6:0] pf_ld_array_0 = cmd_read_0 ? _T_1296 : 7'h0; // @[tlb.scala 265:38]
  wire [6:0] _T_1298 = w_array_0 | ptw_ae_array_0; // @[tlb.scala 266:72]
  wire [6:0] _T_1299 = ~_T_1298; // @[tlb.scala 266:59]
  wire [6:0] pf_st_array_0 = cmd_write_0 ? _T_1299 : 7'h0; // @[tlb.scala 266:38]
  wire [6:0] _T_1301 = x_array_0 | ptw_ae_array_0; // @[tlb.scala 267:50]
  wire [6:0] pf_inst_array_0 = ~_T_1301; // @[tlb.scala 267:37]
  wire  tlb_hit_0 = |real_hits_0; // @[tlb.scala 269:44]
  wire  tlb_miss_0 = vm_enabled_0 & ~bad_va_0 & ~tlb_hit_0; // @[tlb.scala 270:60]
  reg [2:0] state_reg_1; // @[Replacement.scala 168:70]
  wire  _T_1311 = superpage_hits_0_0 | superpage_hits_0_1 | superpage_hits_0_2 | superpage_hits_0_3; // @[package.scala 72:59]
  wire [3:0] _T_1312 = {superpage_hits_0_3,superpage_hits_0_2,superpage_hits_0_1,superpage_hits_0_0}; // @[OneHot.scala 22:45]
  wire [1:0] hi_46 = _T_1312[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] lo_50 = _T_1312[1:0]; // @[OneHot.scala 31:18]
  wire  hi_47 = |hi_46; // @[OneHot.scala 32:14]
  wire [1:0] _T_1313 = hi_46 | lo_50; // @[OneHot.scala 32:28]
  wire  lo_51 = _T_1313[1]; // @[CircuitMath.scala 30:8]
  wire [1:0] state_reg_touch_way_sized = {hi_47,lo_51}; // @[Cat.scala 30:58]
  wire  state_reg_hi_hi = ~state_reg_touch_way_sized[1]; // @[Replacement.scala 196:33]
  wire  state_reg_left_subtree_state = state_reg_1[1]; // @[package.scala 154:13]
  wire  state_reg_right_subtree_state = state_reg_1[0]; // @[Replacement.scala 198:38]
  wire  _state_reg_T_2 = ~state_reg_touch_way_sized[0]; // @[Replacement.scala 218:7]
  wire  state_reg_hi_lo = state_reg_hi_hi ? state_reg_left_subtree_state : _state_reg_T_2; // @[Replacement.scala 203:16]
  wire  state_reg_lo = state_reg_hi_hi ? _state_reg_T_2 : state_reg_right_subtree_state; // @[Replacement.scala 206:16]
  wire [2:0] _state_reg_T_6 = {state_reg_hi_hi,state_reg_hi_lo,state_reg_lo}; // @[Cat.scala 30:58]
  wire  leftOne = real_hits_0[0]; // @[Misc.scala 180:37]
  wire  leftOne_1 = real_hits_0[1]; // @[Misc.scala 180:37]
  wire  rightOne = real_hits_0[2]; // @[Misc.scala 181:39]
  wire  rightOne_1 = leftOne_1 | rightOne; // @[Misc.scala 182:16]
  wire  rightTwo = leftOne_1 & rightOne; // @[Misc.scala 182:61]
  wire  leftOne_2 = leftOne | rightOne_1; // @[Misc.scala 182:16]
  wire  leftTwo = rightTwo | leftOne & rightOne_1; // @[Misc.scala 182:49]
  wire  leftOne_3 = real_hits_0[3]; // @[Misc.scala 180:37]
  wire  leftOne_4 = real_hits_0[4]; // @[Misc.scala 180:37]
  wire  rightOne_2 = real_hits_0[5]; // @[Misc.scala 181:39]
  wire  rightOne_3 = leftOne_4 | rightOne_2; // @[Misc.scala 182:16]
  wire  rightTwo_1 = leftOne_4 & rightOne_2; // @[Misc.scala 182:61]
  wire  rightOne_4 = leftOne_3 | rightOne_3; // @[Misc.scala 182:16]
  wire  rightTwo_2 = rightTwo_1 | leftOne_3 & rightOne_3; // @[Misc.scala 182:49]
  wire  multipleHits_0 = leftTwo | rightTwo_2 | leftOne_2 & rightOne_4; // @[Misc.scala 182:49]
  wire  _T_1337 = state == 2'h0; // @[tlb.scala 288:24]
  wire [6:0] _T_1339 = pf_ld_array_0 & hits_0; // @[tlb.scala 291:73]
  wire [6:0] _T_1343 = pf_st_array_0 & hits_0; // @[tlb.scala 292:80]
  wire [6:0] _T_1346 = pf_inst_array_0 & hits_0; // @[tlb.scala 293:58]
  wire [6:0] _T_1349 = ae_ld_array_0 & hits_0; // @[tlb.scala 294:43]
  wire [6:0] _T_1351 = ae_st_array_0 & hits_0; // @[tlb.scala 295:43]
  wire [6:0] _T_1353 = ~px_array_0; // @[tlb.scala 296:28]
  wire [6:0] _T_1354 = _T_1353 & hits_0; // @[tlb.scala 296:43]
  wire [6:0] _T_1356 = ma_ld_array_0 & hits_0; // @[tlb.scala 297:43]
  wire [6:0] _T_1358 = ma_st_array_0 & hits_0; // @[tlb.scala 298:43]
  wire [6:0] _T_1360 = c_array_0 & hits_0; // @[tlb.scala 300:44]
  wire [6:0] _T_1362 = must_alloc_array_0 & hits_0; // @[tlb.scala 301:53]
  wire  _T_1372 = io_req_0_ready & io_req_0_valid; // @[Decoupled.scala 40:37]
  wire  hi_48 = state_reg_1[2]; // @[Replacement.scala 243:38]
  wire  lo_53 = hi_48 ? state_reg_left_subtree_state : state_reg_right_subtree_state; // @[Replacement.scala 250:16]
  wire [1:0] _T_1378 = {hi_48,lo_53}; // @[Cat.scala 30:58]
  wire [3:0] _T_1379 = {superpage_entries_3_valid_0,superpage_entries_2_valid_0,superpage_entries_1_valid_0,
    superpage_entries_0_valid_0}; // @[Cat.scala 30:58]
  wire [3:0] _T_1381 = ~_T_1379; // @[tlb.scala 353:43]
  wire [1:0] _T_1386 = _T_1381[2] ? 2'h2 : 2'h3; // @[Mux.scala 47:69]
  wire [1:0] _GEN_144 = _T_1372 & tlb_miss_0 & _T_1337 ? 2'h1 : state; // @[tlb.scala 314:67 tlb.scala 315:15 tlb.scala 129:22]
  wire [1:0] _GEN_150 = io_sfence_valid ? 2'h0 : _GEN_144; // @[tlb.scala 325:21 tlb.scala 325:29]
  wire [1:0] _T_1398 = io_sfence_valid ? 2'h3 : 2'h2; // @[tlb.scala 326:45]
  wire [1:0] _GEN_151 = io_ptw_req_ready ? _T_1398 : _GEN_150; // @[tlb.scala 326:31 tlb.scala 326:39]
  wire [1:0] _GEN_152 = io_kill ? 2'h0 : _GEN_151; // @[tlb.scala 327:22 tlb.scala 327:30]
  wire  _GEN_156 = 2'h0 == vpn_0[1:0] ? 1'h0 : _GEN_122; // @[tlb.scala 103:60 tlb.scala 103:60]
  wire  _GEN_157 = 2'h1 == vpn_0[1:0] ? 1'h0 : _GEN_123; // @[tlb.scala 103:60 tlb.scala 103:60]
  wire  _GEN_158 = 2'h2 == vpn_0[1:0] ? 1'h0 : _GEN_124; // @[tlb.scala 103:60 tlb.scala 103:60]
  wire  _GEN_159 = 2'h3 == vpn_0[1:0] ? 1'h0 : _GEN_125; // @[tlb.scala 103:60 tlb.scala 103:60]
  wire  _GEN_160 = _T_569 ? _GEN_156 : _GEN_122; // @[tlb.scala 103:36]
  wire  _GEN_161 = _T_569 ? _GEN_157 : _GEN_123; // @[tlb.scala 103:36]
  wire  _GEN_162 = _T_569 ? _GEN_158 : _GEN_124; // @[tlb.scala 103:36]
  wire  _GEN_163 = _T_569 ? _GEN_159 : _GEN_125; // @[tlb.scala 103:36]
  wire  _GEN_164 = sectored_entries_0_data_0[0] ? 1'h0 : _GEN_160; // @[tlb.scala 109:44 tlb.scala 109:48]
  wire  _GEN_165 = sectored_entries_0_data_1[0] ? 1'h0 : _GEN_161; // @[tlb.scala 109:44 tlb.scala 109:48]
  wire  _GEN_166 = sectored_entries_0_data_2[0] ? 1'h0 : _GEN_162; // @[tlb.scala 109:44 tlb.scala 109:48]
  wire  _GEN_167 = sectored_entries_0_data_3[0] ? 1'h0 : _GEN_163; // @[tlb.scala 109:44 tlb.scala 109:48]
  wire  _GEN_172 = ~sectored_entries_0_data_0[12] ? 1'h0 : _GEN_122; // @[tlb.scala 115:22 tlb.scala 115:26]
  wire  _GEN_173 = ~sectored_entries_0_data_1[12] ? 1'h0 : _GEN_123; // @[tlb.scala 115:22 tlb.scala 115:26]
  wire  _GEN_174 = ~sectored_entries_0_data_2[12] ? 1'h0 : _GEN_124; // @[tlb.scala 115:22 tlb.scala 115:26]
  wire  _GEN_175 = ~sectored_entries_0_data_3[12] ? 1'h0 : _GEN_125; // @[tlb.scala 115:22 tlb.scala 115:26]
  wire  _GEN_176 = io_sfence_bits_rs2 & _GEN_172; // @[tlb.scala 341:42 tlb.scala 98:40]
  wire  _GEN_177 = io_sfence_bits_rs2 & _GEN_173; // @[tlb.scala 341:42 tlb.scala 98:40]
  wire  _GEN_178 = io_sfence_bits_rs2 & _GEN_174; // @[tlb.scala 341:42 tlb.scala 98:40]
  wire  _GEN_179 = io_sfence_bits_rs2 & _GEN_175; // @[tlb.scala 341:42 tlb.scala 98:40]
  wire  _GEN_185 = ~superpage_entries_0_data_0[12] ? 1'h0 : _GEN_108; // @[tlb.scala 115:22 tlb.scala 115:26]
  wire  _GEN_186 = io_sfence_bits_rs2 & _GEN_185; // @[tlb.scala 341:42 tlb.scala 98:40]
  wire  _GEN_189 = ~superpage_entries_1_data_0[12] ? 1'h0 : _GEN_112; // @[tlb.scala 115:22 tlb.scala 115:26]
  wire  _GEN_190 = io_sfence_bits_rs2 & _GEN_189; // @[tlb.scala 341:42 tlb.scala 98:40]
  wire  _GEN_193 = ~superpage_entries_2_data_0[12] ? 1'h0 : _GEN_116; // @[tlb.scala 115:22 tlb.scala 115:26]
  wire  _GEN_194 = io_sfence_bits_rs2 & _GEN_193; // @[tlb.scala 341:42 tlb.scala 98:40]
  wire  _GEN_197 = ~superpage_entries_3_data_0[12] ? 1'h0 : _GEN_120; // @[tlb.scala 115:22 tlb.scala 115:26]
  wire  _GEN_198 = io_sfence_bits_rs2 & _GEN_197; // @[tlb.scala 341:42 tlb.scala 98:40]
  wire  _GEN_201 = ~special_entry_data_0[12] ? 1'h0 : _GEN_104; // @[tlb.scala 115:22 tlb.scala 115:26]
  wire  _GEN_202 = io_sfence_bits_rs2 & _GEN_201; // @[tlb.scala 341:42 tlb.scala 98:40]
  OptimizationBarrier_18 barrier ( // @[package.scala 258:25]
    .clock(barrier_clock),
    .reset(barrier_reset),
    .io_x_ppn(barrier_io_x_ppn),
    .io_x_u(barrier_io_x_u),
    .io_x_g(barrier_io_x_g),
    .io_x_ae(barrier_io_x_ae),
    .io_x_sw(barrier_io_x_sw),
    .io_x_sx(barrier_io_x_sx),
    .io_x_sr(barrier_io_x_sr),
    .io_x_pw(barrier_io_x_pw),
    .io_x_px(barrier_io_x_px),
    .io_x_pr(barrier_io_x_pr),
    .io_x_pal(barrier_io_x_pal),
    .io_x_paa(barrier_io_x_paa),
    .io_x_eff(barrier_io_x_eff),
    .io_x_c(barrier_io_x_c),
    .io_x_fragmented_superpage(barrier_io_x_fragmented_superpage),
    .io_y_ppn(barrier_io_y_ppn),
    .io_y_u(barrier_io_y_u),
    .io_y_g(barrier_io_y_g),
    .io_y_ae(barrier_io_y_ae),
    .io_y_sw(barrier_io_y_sw),
    .io_y_sx(barrier_io_y_sx),
    .io_y_sr(barrier_io_y_sr),
    .io_y_pw(barrier_io_y_pw),
    .io_y_px(barrier_io_y_px),
    .io_y_pr(barrier_io_y_pr),
    .io_y_pal(barrier_io_y_pal),
    .io_y_paa(barrier_io_y_paa),
    .io_y_eff(barrier_io_y_eff),
    .io_y_c(barrier_io_y_c),
    .io_y_fragmented_superpage(barrier_io_y_fragmented_superpage)
  );
  PMPChecker_1 pmp_0 ( // @[tlb.scala 150:40]
    .clock(pmp_0_clock),
    .reset(pmp_0_reset),
    .io_prv(pmp_0_io_prv),
    .io_pmp_0_cfg_l(pmp_0_io_pmp_0_cfg_l),
    .io_pmp_0_cfg_res(pmp_0_io_pmp_0_cfg_res),
    .io_pmp_0_cfg_a(pmp_0_io_pmp_0_cfg_a),
    .io_pmp_0_cfg_x(pmp_0_io_pmp_0_cfg_x),
    .io_pmp_0_cfg_w(pmp_0_io_pmp_0_cfg_w),
    .io_pmp_0_cfg_r(pmp_0_io_pmp_0_cfg_r),
    .io_pmp_0_addr(pmp_0_io_pmp_0_addr),
    .io_pmp_0_mask(pmp_0_io_pmp_0_mask),
    .io_pmp_1_cfg_l(pmp_0_io_pmp_1_cfg_l),
    .io_pmp_1_cfg_res(pmp_0_io_pmp_1_cfg_res),
    .io_pmp_1_cfg_a(pmp_0_io_pmp_1_cfg_a),
    .io_pmp_1_cfg_x(pmp_0_io_pmp_1_cfg_x),
    .io_pmp_1_cfg_w(pmp_0_io_pmp_1_cfg_w),
    .io_pmp_1_cfg_r(pmp_0_io_pmp_1_cfg_r),
    .io_pmp_1_addr(pmp_0_io_pmp_1_addr),
    .io_pmp_1_mask(pmp_0_io_pmp_1_mask),
    .io_pmp_2_cfg_l(pmp_0_io_pmp_2_cfg_l),
    .io_pmp_2_cfg_res(pmp_0_io_pmp_2_cfg_res),
    .io_pmp_2_cfg_a(pmp_0_io_pmp_2_cfg_a),
    .io_pmp_2_cfg_x(pmp_0_io_pmp_2_cfg_x),
    .io_pmp_2_cfg_w(pmp_0_io_pmp_2_cfg_w),
    .io_pmp_2_cfg_r(pmp_0_io_pmp_2_cfg_r),
    .io_pmp_2_addr(pmp_0_io_pmp_2_addr),
    .io_pmp_2_mask(pmp_0_io_pmp_2_mask),
    .io_pmp_3_cfg_l(pmp_0_io_pmp_3_cfg_l),
    .io_pmp_3_cfg_res(pmp_0_io_pmp_3_cfg_res),
    .io_pmp_3_cfg_a(pmp_0_io_pmp_3_cfg_a),
    .io_pmp_3_cfg_x(pmp_0_io_pmp_3_cfg_x),
    .io_pmp_3_cfg_w(pmp_0_io_pmp_3_cfg_w),
    .io_pmp_3_cfg_r(pmp_0_io_pmp_3_cfg_r),
    .io_pmp_3_addr(pmp_0_io_pmp_3_addr),
    .io_pmp_3_mask(pmp_0_io_pmp_3_mask),
    .io_pmp_4_cfg_l(pmp_0_io_pmp_4_cfg_l),
    .io_pmp_4_cfg_res(pmp_0_io_pmp_4_cfg_res),
    .io_pmp_4_cfg_a(pmp_0_io_pmp_4_cfg_a),
    .io_pmp_4_cfg_x(pmp_0_io_pmp_4_cfg_x),
    .io_pmp_4_cfg_w(pmp_0_io_pmp_4_cfg_w),
    .io_pmp_4_cfg_r(pmp_0_io_pmp_4_cfg_r),
    .io_pmp_4_addr(pmp_0_io_pmp_4_addr),
    .io_pmp_4_mask(pmp_0_io_pmp_4_mask),
    .io_pmp_5_cfg_l(pmp_0_io_pmp_5_cfg_l),
    .io_pmp_5_cfg_res(pmp_0_io_pmp_5_cfg_res),
    .io_pmp_5_cfg_a(pmp_0_io_pmp_5_cfg_a),
    .io_pmp_5_cfg_x(pmp_0_io_pmp_5_cfg_x),
    .io_pmp_5_cfg_w(pmp_0_io_pmp_5_cfg_w),
    .io_pmp_5_cfg_r(pmp_0_io_pmp_5_cfg_r),
    .io_pmp_5_addr(pmp_0_io_pmp_5_addr),
    .io_pmp_5_mask(pmp_0_io_pmp_5_mask),
    .io_pmp_6_cfg_l(pmp_0_io_pmp_6_cfg_l),
    .io_pmp_6_cfg_res(pmp_0_io_pmp_6_cfg_res),
    .io_pmp_6_cfg_a(pmp_0_io_pmp_6_cfg_a),
    .io_pmp_6_cfg_x(pmp_0_io_pmp_6_cfg_x),
    .io_pmp_6_cfg_w(pmp_0_io_pmp_6_cfg_w),
    .io_pmp_6_cfg_r(pmp_0_io_pmp_6_cfg_r),
    .io_pmp_6_addr(pmp_0_io_pmp_6_addr),
    .io_pmp_6_mask(pmp_0_io_pmp_6_mask),
    .io_pmp_7_cfg_l(pmp_0_io_pmp_7_cfg_l),
    .io_pmp_7_cfg_res(pmp_0_io_pmp_7_cfg_res),
    .io_pmp_7_cfg_a(pmp_0_io_pmp_7_cfg_a),
    .io_pmp_7_cfg_x(pmp_0_io_pmp_7_cfg_x),
    .io_pmp_7_cfg_w(pmp_0_io_pmp_7_cfg_w),
    .io_pmp_7_cfg_r(pmp_0_io_pmp_7_cfg_r),
    .io_pmp_7_addr(pmp_0_io_pmp_7_addr),
    .io_pmp_7_mask(pmp_0_io_pmp_7_mask),
    .io_addr(pmp_0_io_addr),
    .io_size(pmp_0_io_size),
    .io_r(pmp_0_io_r),
    .io_w(pmp_0_io_w),
    .io_x(pmp_0_io_x)
  );
  OptimizationBarrier_18 barrier_1 ( // @[package.scala 258:25]
    .clock(barrier_1_clock),
    .reset(barrier_1_reset),
    .io_x_ppn(barrier_1_io_x_ppn),
    .io_x_u(barrier_1_io_x_u),
    .io_x_g(barrier_1_io_x_g),
    .io_x_ae(barrier_1_io_x_ae),
    .io_x_sw(barrier_1_io_x_sw),
    .io_x_sx(barrier_1_io_x_sx),
    .io_x_sr(barrier_1_io_x_sr),
    .io_x_pw(barrier_1_io_x_pw),
    .io_x_px(barrier_1_io_x_px),
    .io_x_pr(barrier_1_io_x_pr),
    .io_x_pal(barrier_1_io_x_pal),
    .io_x_paa(barrier_1_io_x_paa),
    .io_x_eff(barrier_1_io_x_eff),
    .io_x_c(barrier_1_io_x_c),
    .io_x_fragmented_superpage(barrier_1_io_x_fragmented_superpage),
    .io_y_ppn(barrier_1_io_y_ppn),
    .io_y_u(barrier_1_io_y_u),
    .io_y_g(barrier_1_io_y_g),
    .io_y_ae(barrier_1_io_y_ae),
    .io_y_sw(barrier_1_io_y_sw),
    .io_y_sx(barrier_1_io_y_sx),
    .io_y_sr(barrier_1_io_y_sr),
    .io_y_pw(barrier_1_io_y_pw),
    .io_y_px(barrier_1_io_y_px),
    .io_y_pr(barrier_1_io_y_pr),
    .io_y_pal(barrier_1_io_y_pal),
    .io_y_paa(barrier_1_io_y_paa),
    .io_y_eff(barrier_1_io_y_eff),
    .io_y_c(barrier_1_io_y_c),
    .io_y_fragmented_superpage(barrier_1_io_y_fragmented_superpage)
  );
  OptimizationBarrier_18 barrier_2 ( // @[package.scala 258:25]
    .clock(barrier_2_clock),
    .reset(barrier_2_reset),
    .io_x_ppn(barrier_2_io_x_ppn),
    .io_x_u(barrier_2_io_x_u),
    .io_x_g(barrier_2_io_x_g),
    .io_x_ae(barrier_2_io_x_ae),
    .io_x_sw(barrier_2_io_x_sw),
    .io_x_sx(barrier_2_io_x_sx),
    .io_x_sr(barrier_2_io_x_sr),
    .io_x_pw(barrier_2_io_x_pw),
    .io_x_px(barrier_2_io_x_px),
    .io_x_pr(barrier_2_io_x_pr),
    .io_x_pal(barrier_2_io_x_pal),
    .io_x_paa(barrier_2_io_x_paa),
    .io_x_eff(barrier_2_io_x_eff),
    .io_x_c(barrier_2_io_x_c),
    .io_x_fragmented_superpage(barrier_2_io_x_fragmented_superpage),
    .io_y_ppn(barrier_2_io_y_ppn),
    .io_y_u(barrier_2_io_y_u),
    .io_y_g(barrier_2_io_y_g),
    .io_y_ae(barrier_2_io_y_ae),
    .io_y_sw(barrier_2_io_y_sw),
    .io_y_sx(barrier_2_io_y_sx),
    .io_y_sr(barrier_2_io_y_sr),
    .io_y_pw(barrier_2_io_y_pw),
    .io_y_px(barrier_2_io_y_px),
    .io_y_pr(barrier_2_io_y_pr),
    .io_y_pal(barrier_2_io_y_pal),
    .io_y_paa(barrier_2_io_y_paa),
    .io_y_eff(barrier_2_io_y_eff),
    .io_y_c(barrier_2_io_y_c),
    .io_y_fragmented_superpage(barrier_2_io_y_fragmented_superpage)
  );
  OptimizationBarrier_18 barrier_3 ( // @[package.scala 258:25]
    .clock(barrier_3_clock),
    .reset(barrier_3_reset),
    .io_x_ppn(barrier_3_io_x_ppn),
    .io_x_u(barrier_3_io_x_u),
    .io_x_g(barrier_3_io_x_g),
    .io_x_ae(barrier_3_io_x_ae),
    .io_x_sw(barrier_3_io_x_sw),
    .io_x_sx(barrier_3_io_x_sx),
    .io_x_sr(barrier_3_io_x_sr),
    .io_x_pw(barrier_3_io_x_pw),
    .io_x_px(barrier_3_io_x_px),
    .io_x_pr(barrier_3_io_x_pr),
    .io_x_pal(barrier_3_io_x_pal),
    .io_x_paa(barrier_3_io_x_paa),
    .io_x_eff(barrier_3_io_x_eff),
    .io_x_c(barrier_3_io_x_c),
    .io_x_fragmented_superpage(barrier_3_io_x_fragmented_superpage),
    .io_y_ppn(barrier_3_io_y_ppn),
    .io_y_u(barrier_3_io_y_u),
    .io_y_g(barrier_3_io_y_g),
    .io_y_ae(barrier_3_io_y_ae),
    .io_y_sw(barrier_3_io_y_sw),
    .io_y_sx(barrier_3_io_y_sx),
    .io_y_sr(barrier_3_io_y_sr),
    .io_y_pw(barrier_3_io_y_pw),
    .io_y_px(barrier_3_io_y_px),
    .io_y_pr(barrier_3_io_y_pr),
    .io_y_pal(barrier_3_io_y_pal),
    .io_y_paa(barrier_3_io_y_paa),
    .io_y_eff(barrier_3_io_y_eff),
    .io_y_c(barrier_3_io_y_c),
    .io_y_fragmented_superpage(barrier_3_io_y_fragmented_superpage)
  );
  OptimizationBarrier_18 barrier_4 ( // @[package.scala 258:25]
    .clock(barrier_4_clock),
    .reset(barrier_4_reset),
    .io_x_ppn(barrier_4_io_x_ppn),
    .io_x_u(barrier_4_io_x_u),
    .io_x_g(barrier_4_io_x_g),
    .io_x_ae(barrier_4_io_x_ae),
    .io_x_sw(barrier_4_io_x_sw),
    .io_x_sx(barrier_4_io_x_sx),
    .io_x_sr(barrier_4_io_x_sr),
    .io_x_pw(barrier_4_io_x_pw),
    .io_x_px(barrier_4_io_x_px),
    .io_x_pr(barrier_4_io_x_pr),
    .io_x_pal(barrier_4_io_x_pal),
    .io_x_paa(barrier_4_io_x_paa),
    .io_x_eff(barrier_4_io_x_eff),
    .io_x_c(barrier_4_io_x_c),
    .io_x_fragmented_superpage(barrier_4_io_x_fragmented_superpage),
    .io_y_ppn(barrier_4_io_y_ppn),
    .io_y_u(barrier_4_io_y_u),
    .io_y_g(barrier_4_io_y_g),
    .io_y_ae(barrier_4_io_y_ae),
    .io_y_sw(barrier_4_io_y_sw),
    .io_y_sx(barrier_4_io_y_sx),
    .io_y_sr(barrier_4_io_y_sr),
    .io_y_pw(barrier_4_io_y_pw),
    .io_y_px(barrier_4_io_y_px),
    .io_y_pr(barrier_4_io_y_pr),
    .io_y_pal(barrier_4_io_y_pal),
    .io_y_paa(barrier_4_io_y_paa),
    .io_y_eff(barrier_4_io_y_eff),
    .io_y_c(barrier_4_io_y_c),
    .io_y_fragmented_superpage(barrier_4_io_y_fragmented_superpage)
  );
  OptimizationBarrier_18 barrier_5 ( // @[package.scala 258:25]
    .clock(barrier_5_clock),
    .reset(barrier_5_reset),
    .io_x_ppn(barrier_5_io_x_ppn),
    .io_x_u(barrier_5_io_x_u),
    .io_x_g(barrier_5_io_x_g),
    .io_x_ae(barrier_5_io_x_ae),
    .io_x_sw(barrier_5_io_x_sw),
    .io_x_sx(barrier_5_io_x_sx),
    .io_x_sr(barrier_5_io_x_sr),
    .io_x_pw(barrier_5_io_x_pw),
    .io_x_px(barrier_5_io_x_px),
    .io_x_pr(barrier_5_io_x_pr),
    .io_x_pal(barrier_5_io_x_pal),
    .io_x_paa(barrier_5_io_x_paa),
    .io_x_eff(barrier_5_io_x_eff),
    .io_x_c(barrier_5_io_x_c),
    .io_x_fragmented_superpage(barrier_5_io_x_fragmented_superpage),
    .io_y_ppn(barrier_5_io_y_ppn),
    .io_y_u(barrier_5_io_y_u),
    .io_y_g(barrier_5_io_y_g),
    .io_y_ae(barrier_5_io_y_ae),
    .io_y_sw(barrier_5_io_y_sw),
    .io_y_sx(barrier_5_io_y_sx),
    .io_y_sr(barrier_5_io_y_sr),
    .io_y_pw(barrier_5_io_y_pw),
    .io_y_px(barrier_5_io_y_px),
    .io_y_pr(barrier_5_io_y_pr),
    .io_y_pal(barrier_5_io_y_pal),
    .io_y_paa(barrier_5_io_y_paa),
    .io_y_eff(barrier_5_io_y_eff),
    .io_y_c(barrier_5_io_y_c),
    .io_y_fragmented_superpage(barrier_5_io_y_fragmented_superpage)
  );
  OptimizationBarrier_18 barrier_6 ( // @[package.scala 258:25]
    .clock(barrier_6_clock),
    .reset(barrier_6_reset),
    .io_x_ppn(barrier_6_io_x_ppn),
    .io_x_u(barrier_6_io_x_u),
    .io_x_g(barrier_6_io_x_g),
    .io_x_ae(barrier_6_io_x_ae),
    .io_x_sw(barrier_6_io_x_sw),
    .io_x_sx(barrier_6_io_x_sx),
    .io_x_sr(barrier_6_io_x_sr),
    .io_x_pw(barrier_6_io_x_pw),
    .io_x_px(barrier_6_io_x_px),
    .io_x_pr(barrier_6_io_x_pr),
    .io_x_pal(barrier_6_io_x_pal),
    .io_x_paa(barrier_6_io_x_paa),
    .io_x_eff(barrier_6_io_x_eff),
    .io_x_c(barrier_6_io_x_c),
    .io_x_fragmented_superpage(barrier_6_io_x_fragmented_superpage),
    .io_y_ppn(barrier_6_io_y_ppn),
    .io_y_u(barrier_6_io_y_u),
    .io_y_g(barrier_6_io_y_g),
    .io_y_ae(barrier_6_io_y_ae),
    .io_y_sw(barrier_6_io_y_sw),
    .io_y_sx(barrier_6_io_y_sx),
    .io_y_sr(barrier_6_io_y_sr),
    .io_y_pw(barrier_6_io_y_pw),
    .io_y_px(barrier_6_io_y_px),
    .io_y_pr(barrier_6_io_y_pr),
    .io_y_pal(barrier_6_io_y_pal),
    .io_y_paa(barrier_6_io_y_paa),
    .io_y_eff(barrier_6_io_y_eff),
    .io_y_c(barrier_6_io_y_c),
    .io_y_fragmented_superpage(barrier_6_io_y_fragmented_superpage)
  );
  OptimizationBarrier_18 barrier_7 ( // @[package.scala 258:25]
    .clock(barrier_7_clock),
    .reset(barrier_7_reset),
    .io_x_ppn(barrier_7_io_x_ppn),
    .io_x_u(barrier_7_io_x_u),
    .io_x_g(barrier_7_io_x_g),
    .io_x_ae(barrier_7_io_x_ae),
    .io_x_sw(barrier_7_io_x_sw),
    .io_x_sx(barrier_7_io_x_sx),
    .io_x_sr(barrier_7_io_x_sr),
    .io_x_pw(barrier_7_io_x_pw),
    .io_x_px(barrier_7_io_x_px),
    .io_x_pr(barrier_7_io_x_pr),
    .io_x_pal(barrier_7_io_x_pal),
    .io_x_paa(barrier_7_io_x_paa),
    .io_x_eff(barrier_7_io_x_eff),
    .io_x_c(barrier_7_io_x_c),
    .io_x_fragmented_superpage(barrier_7_io_x_fragmented_superpage),
    .io_y_ppn(barrier_7_io_y_ppn),
    .io_y_u(barrier_7_io_y_u),
    .io_y_g(barrier_7_io_y_g),
    .io_y_ae(barrier_7_io_y_ae),
    .io_y_sw(barrier_7_io_y_sw),
    .io_y_sx(barrier_7_io_y_sx),
    .io_y_sr(barrier_7_io_y_sr),
    .io_y_pw(barrier_7_io_y_pw),
    .io_y_px(barrier_7_io_y_px),
    .io_y_pr(barrier_7_io_y_pr),
    .io_y_pal(barrier_7_io_y_pal),
    .io_y_paa(barrier_7_io_y_paa),
    .io_y_eff(barrier_7_io_y_eff),
    .io_y_c(barrier_7_io_y_c),
    .io_y_fragmented_superpage(barrier_7_io_y_fragmented_superpage)
  );
  OptimizationBarrier_18 barrier_8 ( // @[package.scala 258:25]
    .clock(barrier_8_clock),
    .reset(barrier_8_reset),
    .io_x_ppn(barrier_8_io_x_ppn),
    .io_x_u(barrier_8_io_x_u),
    .io_x_g(barrier_8_io_x_g),
    .io_x_ae(barrier_8_io_x_ae),
    .io_x_sw(barrier_8_io_x_sw),
    .io_x_sx(barrier_8_io_x_sx),
    .io_x_sr(barrier_8_io_x_sr),
    .io_x_pw(barrier_8_io_x_pw),
    .io_x_px(barrier_8_io_x_px),
    .io_x_pr(barrier_8_io_x_pr),
    .io_x_pal(barrier_8_io_x_pal),
    .io_x_paa(barrier_8_io_x_paa),
    .io_x_eff(barrier_8_io_x_eff),
    .io_x_c(barrier_8_io_x_c),
    .io_x_fragmented_superpage(barrier_8_io_x_fragmented_superpage),
    .io_y_ppn(barrier_8_io_y_ppn),
    .io_y_u(barrier_8_io_y_u),
    .io_y_g(barrier_8_io_y_g),
    .io_y_ae(barrier_8_io_y_ae),
    .io_y_sw(barrier_8_io_y_sw),
    .io_y_sx(barrier_8_io_y_sx),
    .io_y_sr(barrier_8_io_y_sr),
    .io_y_pw(barrier_8_io_y_pw),
    .io_y_px(barrier_8_io_y_px),
    .io_y_pr(barrier_8_io_y_pr),
    .io_y_pal(barrier_8_io_y_pal),
    .io_y_paa(barrier_8_io_y_paa),
    .io_y_eff(barrier_8_io_y_eff),
    .io_y_c(barrier_8_io_y_c),
    .io_y_fragmented_superpage(barrier_8_io_y_fragmented_superpage)
  );
  OptimizationBarrier_18 barrier_9 ( // @[package.scala 258:25]
    .clock(barrier_9_clock),
    .reset(barrier_9_reset),
    .io_x_ppn(barrier_9_io_x_ppn),
    .io_x_u(barrier_9_io_x_u),
    .io_x_g(barrier_9_io_x_g),
    .io_x_ae(barrier_9_io_x_ae),
    .io_x_sw(barrier_9_io_x_sw),
    .io_x_sx(barrier_9_io_x_sx),
    .io_x_sr(barrier_9_io_x_sr),
    .io_x_pw(barrier_9_io_x_pw),
    .io_x_px(barrier_9_io_x_px),
    .io_x_pr(barrier_9_io_x_pr),
    .io_x_pal(barrier_9_io_x_pal),
    .io_x_paa(barrier_9_io_x_paa),
    .io_x_eff(barrier_9_io_x_eff),
    .io_x_c(barrier_9_io_x_c),
    .io_x_fragmented_superpage(barrier_9_io_x_fragmented_superpage),
    .io_y_ppn(barrier_9_io_y_ppn),
    .io_y_u(barrier_9_io_y_u),
    .io_y_g(barrier_9_io_y_g),
    .io_y_ae(barrier_9_io_y_ae),
    .io_y_sw(barrier_9_io_y_sw),
    .io_y_sx(barrier_9_io_y_sx),
    .io_y_sr(barrier_9_io_y_sr),
    .io_y_pw(barrier_9_io_y_pw),
    .io_y_px(barrier_9_io_y_px),
    .io_y_pr(barrier_9_io_y_pr),
    .io_y_pal(barrier_9_io_y_pal),
    .io_y_paa(barrier_9_io_y_paa),
    .io_y_eff(barrier_9_io_y_eff),
    .io_y_c(barrier_9_io_y_c),
    .io_y_fragmented_superpage(barrier_9_io_y_fragmented_superpage)
  );
  OptimizationBarrier_18 barrier_10 ( // @[package.scala 258:25]
    .clock(barrier_10_clock),
    .reset(barrier_10_reset),
    .io_x_ppn(barrier_10_io_x_ppn),
    .io_x_u(barrier_10_io_x_u),
    .io_x_g(barrier_10_io_x_g),
    .io_x_ae(barrier_10_io_x_ae),
    .io_x_sw(barrier_10_io_x_sw),
    .io_x_sx(barrier_10_io_x_sx),
    .io_x_sr(barrier_10_io_x_sr),
    .io_x_pw(barrier_10_io_x_pw),
    .io_x_px(barrier_10_io_x_px),
    .io_x_pr(barrier_10_io_x_pr),
    .io_x_pal(barrier_10_io_x_pal),
    .io_x_paa(barrier_10_io_x_paa),
    .io_x_eff(barrier_10_io_x_eff),
    .io_x_c(barrier_10_io_x_c),
    .io_x_fragmented_superpage(barrier_10_io_x_fragmented_superpage),
    .io_y_ppn(barrier_10_io_y_ppn),
    .io_y_u(barrier_10_io_y_u),
    .io_y_g(barrier_10_io_y_g),
    .io_y_ae(barrier_10_io_y_ae),
    .io_y_sw(barrier_10_io_y_sw),
    .io_y_sx(barrier_10_io_y_sx),
    .io_y_sr(barrier_10_io_y_sr),
    .io_y_pw(barrier_10_io_y_pw),
    .io_y_px(barrier_10_io_y_px),
    .io_y_pr(barrier_10_io_y_pr),
    .io_y_pal(barrier_10_io_y_pal),
    .io_y_paa(barrier_10_io_y_paa),
    .io_y_eff(barrier_10_io_y_eff),
    .io_y_c(barrier_10_io_y_c),
    .io_y_fragmented_superpage(barrier_10_io_y_fragmented_superpage)
  );
  OptimizationBarrier_18 barrier_11 ( // @[package.scala 258:25]
    .clock(barrier_11_clock),
    .reset(barrier_11_reset),
    .io_x_ppn(barrier_11_io_x_ppn),
    .io_x_u(barrier_11_io_x_u),
    .io_x_g(barrier_11_io_x_g),
    .io_x_ae(barrier_11_io_x_ae),
    .io_x_sw(barrier_11_io_x_sw),
    .io_x_sx(barrier_11_io_x_sx),
    .io_x_sr(barrier_11_io_x_sr),
    .io_x_pw(barrier_11_io_x_pw),
    .io_x_px(barrier_11_io_x_px),
    .io_x_pr(barrier_11_io_x_pr),
    .io_x_pal(barrier_11_io_x_pal),
    .io_x_paa(barrier_11_io_x_paa),
    .io_x_eff(barrier_11_io_x_eff),
    .io_x_c(barrier_11_io_x_c),
    .io_x_fragmented_superpage(barrier_11_io_x_fragmented_superpage),
    .io_y_ppn(barrier_11_io_y_ppn),
    .io_y_u(barrier_11_io_y_u),
    .io_y_g(barrier_11_io_y_g),
    .io_y_ae(barrier_11_io_y_ae),
    .io_y_sw(barrier_11_io_y_sw),
    .io_y_sx(barrier_11_io_y_sx),
    .io_y_sr(barrier_11_io_y_sr),
    .io_y_pw(barrier_11_io_y_pw),
    .io_y_px(barrier_11_io_y_px),
    .io_y_pr(barrier_11_io_y_pr),
    .io_y_pal(barrier_11_io_y_pal),
    .io_y_paa(barrier_11_io_y_paa),
    .io_y_eff(barrier_11_io_y_eff),
    .io_y_c(barrier_11_io_y_c),
    .io_y_fragmented_superpage(barrier_11_io_y_fragmented_superpage)
  );
  OptimizationBarrier_18 barrier_12 ( // @[package.scala 258:25]
    .clock(barrier_12_clock),
    .reset(barrier_12_reset),
    .io_x_ppn(barrier_12_io_x_ppn),
    .io_x_u(barrier_12_io_x_u),
    .io_x_g(barrier_12_io_x_g),
    .io_x_ae(barrier_12_io_x_ae),
    .io_x_sw(barrier_12_io_x_sw),
    .io_x_sx(barrier_12_io_x_sx),
    .io_x_sr(barrier_12_io_x_sr),
    .io_x_pw(barrier_12_io_x_pw),
    .io_x_px(barrier_12_io_x_px),
    .io_x_pr(barrier_12_io_x_pr),
    .io_x_pal(barrier_12_io_x_pal),
    .io_x_paa(barrier_12_io_x_paa),
    .io_x_eff(barrier_12_io_x_eff),
    .io_x_c(barrier_12_io_x_c),
    .io_x_fragmented_superpage(barrier_12_io_x_fragmented_superpage),
    .io_y_ppn(barrier_12_io_y_ppn),
    .io_y_u(barrier_12_io_y_u),
    .io_y_g(barrier_12_io_y_g),
    .io_y_ae(barrier_12_io_y_ae),
    .io_y_sw(barrier_12_io_y_sw),
    .io_y_sx(barrier_12_io_y_sx),
    .io_y_sr(barrier_12_io_y_sr),
    .io_y_pw(barrier_12_io_y_pw),
    .io_y_px(barrier_12_io_y_px),
    .io_y_pr(barrier_12_io_y_pr),
    .io_y_pal(barrier_12_io_y_pal),
    .io_y_paa(barrier_12_io_y_paa),
    .io_y_eff(barrier_12_io_y_eff),
    .io_y_c(barrier_12_io_y_c),
    .io_y_fragmented_superpage(barrier_12_io_y_fragmented_superpage)
  );
  OptimizationBarrier_18 barrier_13 ( // @[package.scala 258:25]
    .clock(barrier_13_clock),
    .reset(barrier_13_reset),
    .io_x_ppn(barrier_13_io_x_ppn),
    .io_x_u(barrier_13_io_x_u),
    .io_x_g(barrier_13_io_x_g),
    .io_x_ae(barrier_13_io_x_ae),
    .io_x_sw(barrier_13_io_x_sw),
    .io_x_sx(barrier_13_io_x_sx),
    .io_x_sr(barrier_13_io_x_sr),
    .io_x_pw(barrier_13_io_x_pw),
    .io_x_px(barrier_13_io_x_px),
    .io_x_pr(barrier_13_io_x_pr),
    .io_x_pal(barrier_13_io_x_pal),
    .io_x_paa(barrier_13_io_x_paa),
    .io_x_eff(barrier_13_io_x_eff),
    .io_x_c(barrier_13_io_x_c),
    .io_x_fragmented_superpage(barrier_13_io_x_fragmented_superpage),
    .io_y_ppn(barrier_13_io_y_ppn),
    .io_y_u(barrier_13_io_y_u),
    .io_y_g(barrier_13_io_y_g),
    .io_y_ae(barrier_13_io_y_ae),
    .io_y_sw(barrier_13_io_y_sw),
    .io_y_sx(barrier_13_io_y_sx),
    .io_y_sr(barrier_13_io_y_sr),
    .io_y_pw(barrier_13_io_y_pw),
    .io_y_px(barrier_13_io_y_px),
    .io_y_pr(barrier_13_io_y_pr),
    .io_y_pal(barrier_13_io_y_pal),
    .io_y_paa(barrier_13_io_y_paa),
    .io_y_eff(barrier_13_io_y_eff),
    .io_y_c(barrier_13_io_y_c),
    .io_y_fragmented_superpage(barrier_13_io_y_fragmented_superpage)
  );
  OptimizationBarrier_18 barrier_14 ( // @[package.scala 258:25]
    .clock(barrier_14_clock),
    .reset(barrier_14_reset),
    .io_x_ppn(barrier_14_io_x_ppn),
    .io_x_u(barrier_14_io_x_u),
    .io_x_g(barrier_14_io_x_g),
    .io_x_ae(barrier_14_io_x_ae),
    .io_x_sw(barrier_14_io_x_sw),
    .io_x_sx(barrier_14_io_x_sx),
    .io_x_sr(barrier_14_io_x_sr),
    .io_x_pw(barrier_14_io_x_pw),
    .io_x_px(barrier_14_io_x_px),
    .io_x_pr(barrier_14_io_x_pr),
    .io_x_pal(barrier_14_io_x_pal),
    .io_x_paa(barrier_14_io_x_paa),
    .io_x_eff(barrier_14_io_x_eff),
    .io_x_c(barrier_14_io_x_c),
    .io_x_fragmented_superpage(barrier_14_io_x_fragmented_superpage),
    .io_y_ppn(barrier_14_io_y_ppn),
    .io_y_u(barrier_14_io_y_u),
    .io_y_g(barrier_14_io_y_g),
    .io_y_ae(barrier_14_io_y_ae),
    .io_y_sw(barrier_14_io_y_sw),
    .io_y_sx(barrier_14_io_y_sx),
    .io_y_sr(barrier_14_io_y_sr),
    .io_y_pw(barrier_14_io_y_pw),
    .io_y_px(barrier_14_io_y_px),
    .io_y_pr(barrier_14_io_y_pr),
    .io_y_pal(barrier_14_io_y_pal),
    .io_y_paa(barrier_14_io_y_paa),
    .io_y_eff(barrier_14_io_y_eff),
    .io_y_c(barrier_14_io_y_c),
    .io_y_fragmented_superpage(barrier_14_io_y_fragmented_superpage)
  );
  OptimizationBarrier_18 barrier_15 ( // @[package.scala 258:25]
    .clock(barrier_15_clock),
    .reset(barrier_15_reset),
    .io_x_ppn(barrier_15_io_x_ppn),
    .io_x_u(barrier_15_io_x_u),
    .io_x_g(barrier_15_io_x_g),
    .io_x_ae(barrier_15_io_x_ae),
    .io_x_sw(barrier_15_io_x_sw),
    .io_x_sx(barrier_15_io_x_sx),
    .io_x_sr(barrier_15_io_x_sr),
    .io_x_pw(barrier_15_io_x_pw),
    .io_x_px(barrier_15_io_x_px),
    .io_x_pr(barrier_15_io_x_pr),
    .io_x_pal(barrier_15_io_x_pal),
    .io_x_paa(barrier_15_io_x_paa),
    .io_x_eff(barrier_15_io_x_eff),
    .io_x_c(barrier_15_io_x_c),
    .io_x_fragmented_superpage(barrier_15_io_x_fragmented_superpage),
    .io_y_ppn(barrier_15_io_y_ppn),
    .io_y_u(barrier_15_io_y_u),
    .io_y_g(barrier_15_io_y_g),
    .io_y_ae(barrier_15_io_y_ae),
    .io_y_sw(barrier_15_io_y_sw),
    .io_y_sx(barrier_15_io_y_sx),
    .io_y_sr(barrier_15_io_y_sr),
    .io_y_pw(barrier_15_io_y_pw),
    .io_y_px(barrier_15_io_y_px),
    .io_y_pr(barrier_15_io_y_pr),
    .io_y_pal(barrier_15_io_y_pal),
    .io_y_paa(barrier_15_io_y_paa),
    .io_y_eff(barrier_15_io_y_eff),
    .io_y_c(barrier_15_io_y_c),
    .io_y_fragmented_superpage(barrier_15_io_y_fragmented_superpage)
  );
  OptimizationBarrier_18 barrier_16 ( // @[package.scala 258:25]
    .clock(barrier_16_clock),
    .reset(barrier_16_reset),
    .io_x_ppn(barrier_16_io_x_ppn),
    .io_x_u(barrier_16_io_x_u),
    .io_x_g(barrier_16_io_x_g),
    .io_x_ae(barrier_16_io_x_ae),
    .io_x_sw(barrier_16_io_x_sw),
    .io_x_sx(barrier_16_io_x_sx),
    .io_x_sr(barrier_16_io_x_sr),
    .io_x_pw(barrier_16_io_x_pw),
    .io_x_px(barrier_16_io_x_px),
    .io_x_pr(barrier_16_io_x_pr),
    .io_x_pal(barrier_16_io_x_pal),
    .io_x_paa(barrier_16_io_x_paa),
    .io_x_eff(barrier_16_io_x_eff),
    .io_x_c(barrier_16_io_x_c),
    .io_x_fragmented_superpage(barrier_16_io_x_fragmented_superpage),
    .io_y_ppn(barrier_16_io_y_ppn),
    .io_y_u(barrier_16_io_y_u),
    .io_y_g(barrier_16_io_y_g),
    .io_y_ae(barrier_16_io_y_ae),
    .io_y_sw(barrier_16_io_y_sw),
    .io_y_sx(barrier_16_io_y_sx),
    .io_y_sr(barrier_16_io_y_sr),
    .io_y_pw(barrier_16_io_y_pw),
    .io_y_px(barrier_16_io_y_px),
    .io_y_pr(barrier_16_io_y_pr),
    .io_y_pal(barrier_16_io_y_pal),
    .io_y_paa(barrier_16_io_y_paa),
    .io_y_eff(barrier_16_io_y_eff),
    .io_y_c(barrier_16_io_y_c),
    .io_y_fragmented_superpage(barrier_16_io_y_fragmented_superpage)
  );
  OptimizationBarrier_18 barrier_17 ( // @[package.scala 258:25]
    .clock(barrier_17_clock),
    .reset(barrier_17_reset),
    .io_x_ppn(barrier_17_io_x_ppn),
    .io_x_u(barrier_17_io_x_u),
    .io_x_g(barrier_17_io_x_g),
    .io_x_ae(barrier_17_io_x_ae),
    .io_x_sw(barrier_17_io_x_sw),
    .io_x_sx(barrier_17_io_x_sx),
    .io_x_sr(barrier_17_io_x_sr),
    .io_x_pw(barrier_17_io_x_pw),
    .io_x_px(barrier_17_io_x_px),
    .io_x_pr(barrier_17_io_x_pr),
    .io_x_pal(barrier_17_io_x_pal),
    .io_x_paa(barrier_17_io_x_paa),
    .io_x_eff(barrier_17_io_x_eff),
    .io_x_c(barrier_17_io_x_c),
    .io_x_fragmented_superpage(barrier_17_io_x_fragmented_superpage),
    .io_y_ppn(barrier_17_io_y_ppn),
    .io_y_u(barrier_17_io_y_u),
    .io_y_g(barrier_17_io_y_g),
    .io_y_ae(barrier_17_io_y_ae),
    .io_y_sw(barrier_17_io_y_sw),
    .io_y_sx(barrier_17_io_y_sx),
    .io_y_sr(barrier_17_io_y_sr),
    .io_y_pw(barrier_17_io_y_pw),
    .io_y_px(barrier_17_io_y_px),
    .io_y_pr(barrier_17_io_y_pr),
    .io_y_pal(barrier_17_io_y_pal),
    .io_y_paa(barrier_17_io_y_paa),
    .io_y_eff(barrier_17_io_y_eff),
    .io_y_c(barrier_17_io_y_c),
    .io_y_fragmented_superpage(barrier_17_io_y_fragmented_superpage)
  );
  assign io_req_0_ready = 1'h1; // @[tlb.scala 290:24]
  assign io_miss_rdy = state == 2'h0; // @[tlb.scala 288:24]
  assign io_resp_0_miss = io_ptw_resp_valid | tlb_miss_0 | multipleHits_0; // @[tlb.scala 303:50]
  assign io_resp_0_paddr = {ppn_0,lo_2}; // @[Cat.scala 30:58]
  assign io_resp_0_pf_ld = bad_va_0 & cmd_read_0 | |_T_1339; // @[tlb.scala 291:54]
  assign io_resp_0_pf_st = bad_va_0 & cmd_write_0 | |_T_1343; // @[tlb.scala 292:61]
  assign io_resp_0_pf_inst = bad_va_0 | |_T_1346; // @[tlb.scala 293:37]
  assign io_resp_0_ae_ld = |_T_1349; // @[tlb.scala 294:54]
  assign io_resp_0_ae_st = |_T_1351; // @[tlb.scala 295:54]
  assign io_resp_0_ae_inst = |_T_1354; // @[tlb.scala 296:54]
  assign io_resp_0_ma_ld = |_T_1356; // @[tlb.scala 297:54]
  assign io_resp_0_ma_st = |_T_1358; // @[tlb.scala 298:54]
  assign io_resp_0_ma_inst = 1'h0; // @[tlb.scala 299:24]
  assign io_resp_0_cacheable = |_T_1360; // @[tlb.scala 300:55]
  assign io_resp_0_must_alloc = |_T_1362; // @[tlb.scala 301:64]
  assign io_resp_0_prefetchable = 1'h0; // @[tlb.scala 302:70]
  assign io_ptw_req_valid = state == 2'h1; // @[tlb.scala 307:29]
  assign io_ptw_req_bits_valid = ~io_kill; // @[tlb.scala 308:28]
  assign io_ptw_req_bits_bits_addr = r_refill_tag; // @[tlb.scala 309:29]
  assign barrier_clock = clock;
  assign barrier_reset = reset;
  assign barrier_io_x_ppn = special_entry_data_0[33:14]; // @[tlb.scala 58:79]
  assign barrier_io_x_u = special_entry_data_0[13]; // @[tlb.scala 58:79]
  assign barrier_io_x_g = special_entry_data_0[12]; // @[tlb.scala 58:79]
  assign barrier_io_x_ae = special_entry_data_0[11]; // @[tlb.scala 58:79]
  assign barrier_io_x_sw = special_entry_data_0[10]; // @[tlb.scala 58:79]
  assign barrier_io_x_sx = special_entry_data_0[9]; // @[tlb.scala 58:79]
  assign barrier_io_x_sr = special_entry_data_0[8]; // @[tlb.scala 58:79]
  assign barrier_io_x_pw = special_entry_data_0[7]; // @[tlb.scala 58:79]
  assign barrier_io_x_px = special_entry_data_0[6]; // @[tlb.scala 58:79]
  assign barrier_io_x_pr = special_entry_data_0[5]; // @[tlb.scala 58:79]
  assign barrier_io_x_pal = special_entry_data_0[4]; // @[tlb.scala 58:79]
  assign barrier_io_x_paa = special_entry_data_0[3]; // @[tlb.scala 58:79]
  assign barrier_io_x_eff = special_entry_data_0[2]; // @[tlb.scala 58:79]
  assign barrier_io_x_c = special_entry_data_0[1]; // @[tlb.scala 58:79]
  assign barrier_io_x_fragmented_superpage = special_entry_data_0[0]; // @[tlb.scala 58:79]
  assign pmp_0_clock = clock;
  assign pmp_0_reset = reset;
  assign pmp_0_io_prv = io_ptw_resp_valid | io_req_0_bits_passthrough ? 2'h1 : io_ptw_status_dprv; // @[tlb.scala 155:25]
  assign pmp_0_io_pmp_0_cfg_l = io_ptw_pmp_0_cfg_l; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_0_cfg_res = io_ptw_pmp_0_cfg_res; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_0_cfg_a = io_ptw_pmp_0_cfg_a; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_0_cfg_x = io_ptw_pmp_0_cfg_x; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_0_cfg_w = io_ptw_pmp_0_cfg_w; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_0_cfg_r = io_ptw_pmp_0_cfg_r; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_0_addr = io_ptw_pmp_0_addr; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_0_mask = io_ptw_pmp_0_mask; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_1_cfg_l = io_ptw_pmp_1_cfg_l; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_1_cfg_res = io_ptw_pmp_1_cfg_res; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_1_cfg_a = io_ptw_pmp_1_cfg_a; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_1_cfg_x = io_ptw_pmp_1_cfg_x; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_1_cfg_w = io_ptw_pmp_1_cfg_w; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_1_cfg_r = io_ptw_pmp_1_cfg_r; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_1_addr = io_ptw_pmp_1_addr; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_1_mask = io_ptw_pmp_1_mask; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_2_cfg_l = io_ptw_pmp_2_cfg_l; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_2_cfg_res = io_ptw_pmp_2_cfg_res; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_2_cfg_a = io_ptw_pmp_2_cfg_a; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_2_cfg_x = io_ptw_pmp_2_cfg_x; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_2_cfg_w = io_ptw_pmp_2_cfg_w; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_2_cfg_r = io_ptw_pmp_2_cfg_r; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_2_addr = io_ptw_pmp_2_addr; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_2_mask = io_ptw_pmp_2_mask; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_3_cfg_l = io_ptw_pmp_3_cfg_l; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_3_cfg_res = io_ptw_pmp_3_cfg_res; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_3_cfg_a = io_ptw_pmp_3_cfg_a; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_3_cfg_x = io_ptw_pmp_3_cfg_x; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_3_cfg_w = io_ptw_pmp_3_cfg_w; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_3_cfg_r = io_ptw_pmp_3_cfg_r; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_3_addr = io_ptw_pmp_3_addr; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_3_mask = io_ptw_pmp_3_mask; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_4_cfg_l = io_ptw_pmp_4_cfg_l; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_4_cfg_res = io_ptw_pmp_4_cfg_res; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_4_cfg_a = io_ptw_pmp_4_cfg_a; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_4_cfg_x = io_ptw_pmp_4_cfg_x; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_4_cfg_w = io_ptw_pmp_4_cfg_w; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_4_cfg_r = io_ptw_pmp_4_cfg_r; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_4_addr = io_ptw_pmp_4_addr; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_4_mask = io_ptw_pmp_4_mask; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_5_cfg_l = io_ptw_pmp_5_cfg_l; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_5_cfg_res = io_ptw_pmp_5_cfg_res; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_5_cfg_a = io_ptw_pmp_5_cfg_a; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_5_cfg_x = io_ptw_pmp_5_cfg_x; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_5_cfg_w = io_ptw_pmp_5_cfg_w; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_5_cfg_r = io_ptw_pmp_5_cfg_r; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_5_addr = io_ptw_pmp_5_addr; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_5_mask = io_ptw_pmp_5_mask; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_6_cfg_l = io_ptw_pmp_6_cfg_l; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_6_cfg_res = io_ptw_pmp_6_cfg_res; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_6_cfg_a = io_ptw_pmp_6_cfg_a; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_6_cfg_x = io_ptw_pmp_6_cfg_x; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_6_cfg_w = io_ptw_pmp_6_cfg_w; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_6_cfg_r = io_ptw_pmp_6_cfg_r; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_6_addr = io_ptw_pmp_6_addr; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_6_mask = io_ptw_pmp_6_mask; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_7_cfg_l = io_ptw_pmp_7_cfg_l; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_7_cfg_res = io_ptw_pmp_7_cfg_res; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_7_cfg_a = io_ptw_pmp_7_cfg_a; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_7_cfg_x = io_ptw_pmp_7_cfg_x; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_7_cfg_w = io_ptw_pmp_7_cfg_w; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_7_cfg_r = io_ptw_pmp_7_cfg_r; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_7_addr = io_ptw_pmp_7_addr; // @[tlb.scala 154:19]
  assign pmp_0_io_pmp_7_mask = io_ptw_pmp_7_mask; // @[tlb.scala 154:19]
  assign pmp_0_io_addr = mpu_physaddr_0[31:0]; // @[tlb.scala 152:20]
  assign pmp_0_io_size = io_req_0_bits_size; // @[tlb.scala 153:20]
  assign barrier_1_clock = clock;
  assign barrier_1_reset = reset;
  assign barrier_1_io_x_ppn = _GEN_7[33:14]; // @[tlb.scala 58:79]
  assign barrier_1_io_x_u = _GEN_7[13]; // @[tlb.scala 58:79]
  assign barrier_1_io_x_g = _GEN_7[12]; // @[tlb.scala 58:79]
  assign barrier_1_io_x_ae = _GEN_7[11]; // @[tlb.scala 58:79]
  assign barrier_1_io_x_sw = _GEN_7[10]; // @[tlb.scala 58:79]
  assign barrier_1_io_x_sx = _GEN_7[9]; // @[tlb.scala 58:79]
  assign barrier_1_io_x_sr = _GEN_7[8]; // @[tlb.scala 58:79]
  assign barrier_1_io_x_pw = _GEN_7[7]; // @[tlb.scala 58:79]
  assign barrier_1_io_x_px = _GEN_7[6]; // @[tlb.scala 58:79]
  assign barrier_1_io_x_pr = _GEN_7[5]; // @[tlb.scala 58:79]
  assign barrier_1_io_x_pal = _GEN_7[4]; // @[tlb.scala 58:79]
  assign barrier_1_io_x_paa = _GEN_7[3]; // @[tlb.scala 58:79]
  assign barrier_1_io_x_eff = _GEN_7[2]; // @[tlb.scala 58:79]
  assign barrier_1_io_x_c = _GEN_7[1]; // @[tlb.scala 58:79]
  assign barrier_1_io_x_fragmented_superpage = _GEN_7[0]; // @[tlb.scala 58:79]
  assign barrier_2_clock = clock;
  assign barrier_2_reset = reset;
  assign barrier_2_io_x_ppn = superpage_entries_0_data_0[33:14]; // @[tlb.scala 58:79]
  assign barrier_2_io_x_u = superpage_entries_0_data_0[13]; // @[tlb.scala 58:79]
  assign barrier_2_io_x_g = superpage_entries_0_data_0[12]; // @[tlb.scala 58:79]
  assign barrier_2_io_x_ae = superpage_entries_0_data_0[11]; // @[tlb.scala 58:79]
  assign barrier_2_io_x_sw = superpage_entries_0_data_0[10]; // @[tlb.scala 58:79]
  assign barrier_2_io_x_sx = superpage_entries_0_data_0[9]; // @[tlb.scala 58:79]
  assign barrier_2_io_x_sr = superpage_entries_0_data_0[8]; // @[tlb.scala 58:79]
  assign barrier_2_io_x_pw = superpage_entries_0_data_0[7]; // @[tlb.scala 58:79]
  assign barrier_2_io_x_px = superpage_entries_0_data_0[6]; // @[tlb.scala 58:79]
  assign barrier_2_io_x_pr = superpage_entries_0_data_0[5]; // @[tlb.scala 58:79]
  assign barrier_2_io_x_pal = superpage_entries_0_data_0[4]; // @[tlb.scala 58:79]
  assign barrier_2_io_x_paa = superpage_entries_0_data_0[3]; // @[tlb.scala 58:79]
  assign barrier_2_io_x_eff = superpage_entries_0_data_0[2]; // @[tlb.scala 58:79]
  assign barrier_2_io_x_c = superpage_entries_0_data_0[1]; // @[tlb.scala 58:79]
  assign barrier_2_io_x_fragmented_superpage = superpage_entries_0_data_0[0]; // @[tlb.scala 58:79]
  assign barrier_3_clock = clock;
  assign barrier_3_reset = reset;
  assign barrier_3_io_x_ppn = superpage_entries_1_data_0[33:14]; // @[tlb.scala 58:79]
  assign barrier_3_io_x_u = superpage_entries_1_data_0[13]; // @[tlb.scala 58:79]
  assign barrier_3_io_x_g = superpage_entries_1_data_0[12]; // @[tlb.scala 58:79]
  assign barrier_3_io_x_ae = superpage_entries_1_data_0[11]; // @[tlb.scala 58:79]
  assign barrier_3_io_x_sw = superpage_entries_1_data_0[10]; // @[tlb.scala 58:79]
  assign barrier_3_io_x_sx = superpage_entries_1_data_0[9]; // @[tlb.scala 58:79]
  assign barrier_3_io_x_sr = superpage_entries_1_data_0[8]; // @[tlb.scala 58:79]
  assign barrier_3_io_x_pw = superpage_entries_1_data_0[7]; // @[tlb.scala 58:79]
  assign barrier_3_io_x_px = superpage_entries_1_data_0[6]; // @[tlb.scala 58:79]
  assign barrier_3_io_x_pr = superpage_entries_1_data_0[5]; // @[tlb.scala 58:79]
  assign barrier_3_io_x_pal = superpage_entries_1_data_0[4]; // @[tlb.scala 58:79]
  assign barrier_3_io_x_paa = superpage_entries_1_data_0[3]; // @[tlb.scala 58:79]
  assign barrier_3_io_x_eff = superpage_entries_1_data_0[2]; // @[tlb.scala 58:79]
  assign barrier_3_io_x_c = superpage_entries_1_data_0[1]; // @[tlb.scala 58:79]
  assign barrier_3_io_x_fragmented_superpage = superpage_entries_1_data_0[0]; // @[tlb.scala 58:79]
  assign barrier_4_clock = clock;
  assign barrier_4_reset = reset;
  assign barrier_4_io_x_ppn = superpage_entries_2_data_0[33:14]; // @[tlb.scala 58:79]
  assign barrier_4_io_x_u = superpage_entries_2_data_0[13]; // @[tlb.scala 58:79]
  assign barrier_4_io_x_g = superpage_entries_2_data_0[12]; // @[tlb.scala 58:79]
  assign barrier_4_io_x_ae = superpage_entries_2_data_0[11]; // @[tlb.scala 58:79]
  assign barrier_4_io_x_sw = superpage_entries_2_data_0[10]; // @[tlb.scala 58:79]
  assign barrier_4_io_x_sx = superpage_entries_2_data_0[9]; // @[tlb.scala 58:79]
  assign barrier_4_io_x_sr = superpage_entries_2_data_0[8]; // @[tlb.scala 58:79]
  assign barrier_4_io_x_pw = superpage_entries_2_data_0[7]; // @[tlb.scala 58:79]
  assign barrier_4_io_x_px = superpage_entries_2_data_0[6]; // @[tlb.scala 58:79]
  assign barrier_4_io_x_pr = superpage_entries_2_data_0[5]; // @[tlb.scala 58:79]
  assign barrier_4_io_x_pal = superpage_entries_2_data_0[4]; // @[tlb.scala 58:79]
  assign barrier_4_io_x_paa = superpage_entries_2_data_0[3]; // @[tlb.scala 58:79]
  assign barrier_4_io_x_eff = superpage_entries_2_data_0[2]; // @[tlb.scala 58:79]
  assign barrier_4_io_x_c = superpage_entries_2_data_0[1]; // @[tlb.scala 58:79]
  assign barrier_4_io_x_fragmented_superpage = superpage_entries_2_data_0[0]; // @[tlb.scala 58:79]
  assign barrier_5_clock = clock;
  assign barrier_5_reset = reset;
  assign barrier_5_io_x_ppn = superpage_entries_3_data_0[33:14]; // @[tlb.scala 58:79]
  assign barrier_5_io_x_u = superpage_entries_3_data_0[13]; // @[tlb.scala 58:79]
  assign barrier_5_io_x_g = superpage_entries_3_data_0[12]; // @[tlb.scala 58:79]
  assign barrier_5_io_x_ae = superpage_entries_3_data_0[11]; // @[tlb.scala 58:79]
  assign barrier_5_io_x_sw = superpage_entries_3_data_0[10]; // @[tlb.scala 58:79]
  assign barrier_5_io_x_sx = superpage_entries_3_data_0[9]; // @[tlb.scala 58:79]
  assign barrier_5_io_x_sr = superpage_entries_3_data_0[8]; // @[tlb.scala 58:79]
  assign barrier_5_io_x_pw = superpage_entries_3_data_0[7]; // @[tlb.scala 58:79]
  assign barrier_5_io_x_px = superpage_entries_3_data_0[6]; // @[tlb.scala 58:79]
  assign barrier_5_io_x_pr = superpage_entries_3_data_0[5]; // @[tlb.scala 58:79]
  assign barrier_5_io_x_pal = superpage_entries_3_data_0[4]; // @[tlb.scala 58:79]
  assign barrier_5_io_x_paa = superpage_entries_3_data_0[3]; // @[tlb.scala 58:79]
  assign barrier_5_io_x_eff = superpage_entries_3_data_0[2]; // @[tlb.scala 58:79]
  assign barrier_5_io_x_c = superpage_entries_3_data_0[1]; // @[tlb.scala 58:79]
  assign barrier_5_io_x_fragmented_superpage = superpage_entries_3_data_0[0]; // @[tlb.scala 58:79]
  assign barrier_6_clock = clock;
  assign barrier_6_reset = reset;
  assign barrier_6_io_x_ppn = special_entry_data_0[33:14]; // @[tlb.scala 58:79]
  assign barrier_6_io_x_u = special_entry_data_0[13]; // @[tlb.scala 58:79]
  assign barrier_6_io_x_g = special_entry_data_0[12]; // @[tlb.scala 58:79]
  assign barrier_6_io_x_ae = special_entry_data_0[11]; // @[tlb.scala 58:79]
  assign barrier_6_io_x_sw = special_entry_data_0[10]; // @[tlb.scala 58:79]
  assign barrier_6_io_x_sx = special_entry_data_0[9]; // @[tlb.scala 58:79]
  assign barrier_6_io_x_sr = special_entry_data_0[8]; // @[tlb.scala 58:79]
  assign barrier_6_io_x_pw = special_entry_data_0[7]; // @[tlb.scala 58:79]
  assign barrier_6_io_x_px = special_entry_data_0[6]; // @[tlb.scala 58:79]
  assign barrier_6_io_x_pr = special_entry_data_0[5]; // @[tlb.scala 58:79]
  assign barrier_6_io_x_pal = special_entry_data_0[4]; // @[tlb.scala 58:79]
  assign barrier_6_io_x_paa = special_entry_data_0[3]; // @[tlb.scala 58:79]
  assign barrier_6_io_x_eff = special_entry_data_0[2]; // @[tlb.scala 58:79]
  assign barrier_6_io_x_c = special_entry_data_0[1]; // @[tlb.scala 58:79]
  assign barrier_6_io_x_fragmented_superpage = special_entry_data_0[0]; // @[tlb.scala 58:79]
  assign barrier_7_clock = clock;
  assign barrier_7_reset = reset;
  assign barrier_7_io_x_ppn = _GEN_7[33:14]; // @[tlb.scala 58:79]
  assign barrier_7_io_x_u = _GEN_7[13]; // @[tlb.scala 58:79]
  assign barrier_7_io_x_g = _GEN_7[12]; // @[tlb.scala 58:79]
  assign barrier_7_io_x_ae = _GEN_7[11]; // @[tlb.scala 58:79]
  assign barrier_7_io_x_sw = _GEN_7[10]; // @[tlb.scala 58:79]
  assign barrier_7_io_x_sx = _GEN_7[9]; // @[tlb.scala 58:79]
  assign barrier_7_io_x_sr = _GEN_7[8]; // @[tlb.scala 58:79]
  assign barrier_7_io_x_pw = _GEN_7[7]; // @[tlb.scala 58:79]
  assign barrier_7_io_x_px = _GEN_7[6]; // @[tlb.scala 58:79]
  assign barrier_7_io_x_pr = _GEN_7[5]; // @[tlb.scala 58:79]
  assign barrier_7_io_x_pal = _GEN_7[4]; // @[tlb.scala 58:79]
  assign barrier_7_io_x_paa = _GEN_7[3]; // @[tlb.scala 58:79]
  assign barrier_7_io_x_eff = _GEN_7[2]; // @[tlb.scala 58:79]
  assign barrier_7_io_x_c = _GEN_7[1]; // @[tlb.scala 58:79]
  assign barrier_7_io_x_fragmented_superpage = _GEN_7[0]; // @[tlb.scala 58:79]
  assign barrier_8_clock = clock;
  assign barrier_8_reset = reset;
  assign barrier_8_io_x_ppn = superpage_entries_0_data_0[33:14]; // @[tlb.scala 58:79]
  assign barrier_8_io_x_u = superpage_entries_0_data_0[13]; // @[tlb.scala 58:79]
  assign barrier_8_io_x_g = superpage_entries_0_data_0[12]; // @[tlb.scala 58:79]
  assign barrier_8_io_x_ae = superpage_entries_0_data_0[11]; // @[tlb.scala 58:79]
  assign barrier_8_io_x_sw = superpage_entries_0_data_0[10]; // @[tlb.scala 58:79]
  assign barrier_8_io_x_sx = superpage_entries_0_data_0[9]; // @[tlb.scala 58:79]
  assign barrier_8_io_x_sr = superpage_entries_0_data_0[8]; // @[tlb.scala 58:79]
  assign barrier_8_io_x_pw = superpage_entries_0_data_0[7]; // @[tlb.scala 58:79]
  assign barrier_8_io_x_px = superpage_entries_0_data_0[6]; // @[tlb.scala 58:79]
  assign barrier_8_io_x_pr = superpage_entries_0_data_0[5]; // @[tlb.scala 58:79]
  assign barrier_8_io_x_pal = superpage_entries_0_data_0[4]; // @[tlb.scala 58:79]
  assign barrier_8_io_x_paa = superpage_entries_0_data_0[3]; // @[tlb.scala 58:79]
  assign barrier_8_io_x_eff = superpage_entries_0_data_0[2]; // @[tlb.scala 58:79]
  assign barrier_8_io_x_c = superpage_entries_0_data_0[1]; // @[tlb.scala 58:79]
  assign barrier_8_io_x_fragmented_superpage = superpage_entries_0_data_0[0]; // @[tlb.scala 58:79]
  assign barrier_9_clock = clock;
  assign barrier_9_reset = reset;
  assign barrier_9_io_x_ppn = superpage_entries_1_data_0[33:14]; // @[tlb.scala 58:79]
  assign barrier_9_io_x_u = superpage_entries_1_data_0[13]; // @[tlb.scala 58:79]
  assign barrier_9_io_x_g = superpage_entries_1_data_0[12]; // @[tlb.scala 58:79]
  assign barrier_9_io_x_ae = superpage_entries_1_data_0[11]; // @[tlb.scala 58:79]
  assign barrier_9_io_x_sw = superpage_entries_1_data_0[10]; // @[tlb.scala 58:79]
  assign barrier_9_io_x_sx = superpage_entries_1_data_0[9]; // @[tlb.scala 58:79]
  assign barrier_9_io_x_sr = superpage_entries_1_data_0[8]; // @[tlb.scala 58:79]
  assign barrier_9_io_x_pw = superpage_entries_1_data_0[7]; // @[tlb.scala 58:79]
  assign barrier_9_io_x_px = superpage_entries_1_data_0[6]; // @[tlb.scala 58:79]
  assign barrier_9_io_x_pr = superpage_entries_1_data_0[5]; // @[tlb.scala 58:79]
  assign barrier_9_io_x_pal = superpage_entries_1_data_0[4]; // @[tlb.scala 58:79]
  assign barrier_9_io_x_paa = superpage_entries_1_data_0[3]; // @[tlb.scala 58:79]
  assign barrier_9_io_x_eff = superpage_entries_1_data_0[2]; // @[tlb.scala 58:79]
  assign barrier_9_io_x_c = superpage_entries_1_data_0[1]; // @[tlb.scala 58:79]
  assign barrier_9_io_x_fragmented_superpage = superpage_entries_1_data_0[0]; // @[tlb.scala 58:79]
  assign barrier_10_clock = clock;
  assign barrier_10_reset = reset;
  assign barrier_10_io_x_ppn = superpage_entries_2_data_0[33:14]; // @[tlb.scala 58:79]
  assign barrier_10_io_x_u = superpage_entries_2_data_0[13]; // @[tlb.scala 58:79]
  assign barrier_10_io_x_g = superpage_entries_2_data_0[12]; // @[tlb.scala 58:79]
  assign barrier_10_io_x_ae = superpage_entries_2_data_0[11]; // @[tlb.scala 58:79]
  assign barrier_10_io_x_sw = superpage_entries_2_data_0[10]; // @[tlb.scala 58:79]
  assign barrier_10_io_x_sx = superpage_entries_2_data_0[9]; // @[tlb.scala 58:79]
  assign barrier_10_io_x_sr = superpage_entries_2_data_0[8]; // @[tlb.scala 58:79]
  assign barrier_10_io_x_pw = superpage_entries_2_data_0[7]; // @[tlb.scala 58:79]
  assign barrier_10_io_x_px = superpage_entries_2_data_0[6]; // @[tlb.scala 58:79]
  assign barrier_10_io_x_pr = superpage_entries_2_data_0[5]; // @[tlb.scala 58:79]
  assign barrier_10_io_x_pal = superpage_entries_2_data_0[4]; // @[tlb.scala 58:79]
  assign barrier_10_io_x_paa = superpage_entries_2_data_0[3]; // @[tlb.scala 58:79]
  assign barrier_10_io_x_eff = superpage_entries_2_data_0[2]; // @[tlb.scala 58:79]
  assign barrier_10_io_x_c = superpage_entries_2_data_0[1]; // @[tlb.scala 58:79]
  assign barrier_10_io_x_fragmented_superpage = superpage_entries_2_data_0[0]; // @[tlb.scala 58:79]
  assign barrier_11_clock = clock;
  assign barrier_11_reset = reset;
  assign barrier_11_io_x_ppn = superpage_entries_3_data_0[33:14]; // @[tlb.scala 58:79]
  assign barrier_11_io_x_u = superpage_entries_3_data_0[13]; // @[tlb.scala 58:79]
  assign barrier_11_io_x_g = superpage_entries_3_data_0[12]; // @[tlb.scala 58:79]
  assign barrier_11_io_x_ae = superpage_entries_3_data_0[11]; // @[tlb.scala 58:79]
  assign barrier_11_io_x_sw = superpage_entries_3_data_0[10]; // @[tlb.scala 58:79]
  assign barrier_11_io_x_sx = superpage_entries_3_data_0[9]; // @[tlb.scala 58:79]
  assign barrier_11_io_x_sr = superpage_entries_3_data_0[8]; // @[tlb.scala 58:79]
  assign barrier_11_io_x_pw = superpage_entries_3_data_0[7]; // @[tlb.scala 58:79]
  assign barrier_11_io_x_px = superpage_entries_3_data_0[6]; // @[tlb.scala 58:79]
  assign barrier_11_io_x_pr = superpage_entries_3_data_0[5]; // @[tlb.scala 58:79]
  assign barrier_11_io_x_pal = superpage_entries_3_data_0[4]; // @[tlb.scala 58:79]
  assign barrier_11_io_x_paa = superpage_entries_3_data_0[3]; // @[tlb.scala 58:79]
  assign barrier_11_io_x_eff = superpage_entries_3_data_0[2]; // @[tlb.scala 58:79]
  assign barrier_11_io_x_c = superpage_entries_3_data_0[1]; // @[tlb.scala 58:79]
  assign barrier_11_io_x_fragmented_superpage = superpage_entries_3_data_0[0]; // @[tlb.scala 58:79]
  assign barrier_12_clock = clock;
  assign barrier_12_reset = reset;
  assign barrier_12_io_x_ppn = special_entry_data_0[33:14]; // @[tlb.scala 58:79]
  assign barrier_12_io_x_u = special_entry_data_0[13]; // @[tlb.scala 58:79]
  assign barrier_12_io_x_g = special_entry_data_0[12]; // @[tlb.scala 58:79]
  assign barrier_12_io_x_ae = special_entry_data_0[11]; // @[tlb.scala 58:79]
  assign barrier_12_io_x_sw = special_entry_data_0[10]; // @[tlb.scala 58:79]
  assign barrier_12_io_x_sx = special_entry_data_0[9]; // @[tlb.scala 58:79]
  assign barrier_12_io_x_sr = special_entry_data_0[8]; // @[tlb.scala 58:79]
  assign barrier_12_io_x_pw = special_entry_data_0[7]; // @[tlb.scala 58:79]
  assign barrier_12_io_x_px = special_entry_data_0[6]; // @[tlb.scala 58:79]
  assign barrier_12_io_x_pr = special_entry_data_0[5]; // @[tlb.scala 58:79]
  assign barrier_12_io_x_pal = special_entry_data_0[4]; // @[tlb.scala 58:79]
  assign barrier_12_io_x_paa = special_entry_data_0[3]; // @[tlb.scala 58:79]
  assign barrier_12_io_x_eff = special_entry_data_0[2]; // @[tlb.scala 58:79]
  assign barrier_12_io_x_c = special_entry_data_0[1]; // @[tlb.scala 58:79]
  assign barrier_12_io_x_fragmented_superpage = special_entry_data_0[0]; // @[tlb.scala 58:79]
  assign barrier_13_clock = clock;
  assign barrier_13_reset = reset;
  assign barrier_13_io_x_ppn = _GEN_7[33:14]; // @[tlb.scala 58:79]
  assign barrier_13_io_x_u = _GEN_7[13]; // @[tlb.scala 58:79]
  assign barrier_13_io_x_g = _GEN_7[12]; // @[tlb.scala 58:79]
  assign barrier_13_io_x_ae = _GEN_7[11]; // @[tlb.scala 58:79]
  assign barrier_13_io_x_sw = _GEN_7[10]; // @[tlb.scala 58:79]
  assign barrier_13_io_x_sx = _GEN_7[9]; // @[tlb.scala 58:79]
  assign barrier_13_io_x_sr = _GEN_7[8]; // @[tlb.scala 58:79]
  assign barrier_13_io_x_pw = _GEN_7[7]; // @[tlb.scala 58:79]
  assign barrier_13_io_x_px = _GEN_7[6]; // @[tlb.scala 58:79]
  assign barrier_13_io_x_pr = _GEN_7[5]; // @[tlb.scala 58:79]
  assign barrier_13_io_x_pal = _GEN_7[4]; // @[tlb.scala 58:79]
  assign barrier_13_io_x_paa = _GEN_7[3]; // @[tlb.scala 58:79]
  assign barrier_13_io_x_eff = _GEN_7[2]; // @[tlb.scala 58:79]
  assign barrier_13_io_x_c = _GEN_7[1]; // @[tlb.scala 58:79]
  assign barrier_13_io_x_fragmented_superpage = _GEN_7[0]; // @[tlb.scala 58:79]
  assign barrier_14_clock = clock;
  assign barrier_14_reset = reset;
  assign barrier_14_io_x_ppn = superpage_entries_0_data_0[33:14]; // @[tlb.scala 58:79]
  assign barrier_14_io_x_u = superpage_entries_0_data_0[13]; // @[tlb.scala 58:79]
  assign barrier_14_io_x_g = superpage_entries_0_data_0[12]; // @[tlb.scala 58:79]
  assign barrier_14_io_x_ae = superpage_entries_0_data_0[11]; // @[tlb.scala 58:79]
  assign barrier_14_io_x_sw = superpage_entries_0_data_0[10]; // @[tlb.scala 58:79]
  assign barrier_14_io_x_sx = superpage_entries_0_data_0[9]; // @[tlb.scala 58:79]
  assign barrier_14_io_x_sr = superpage_entries_0_data_0[8]; // @[tlb.scala 58:79]
  assign barrier_14_io_x_pw = superpage_entries_0_data_0[7]; // @[tlb.scala 58:79]
  assign barrier_14_io_x_px = superpage_entries_0_data_0[6]; // @[tlb.scala 58:79]
  assign barrier_14_io_x_pr = superpage_entries_0_data_0[5]; // @[tlb.scala 58:79]
  assign barrier_14_io_x_pal = superpage_entries_0_data_0[4]; // @[tlb.scala 58:79]
  assign barrier_14_io_x_paa = superpage_entries_0_data_0[3]; // @[tlb.scala 58:79]
  assign barrier_14_io_x_eff = superpage_entries_0_data_0[2]; // @[tlb.scala 58:79]
  assign barrier_14_io_x_c = superpage_entries_0_data_0[1]; // @[tlb.scala 58:79]
  assign barrier_14_io_x_fragmented_superpage = superpage_entries_0_data_0[0]; // @[tlb.scala 58:79]
  assign barrier_15_clock = clock;
  assign barrier_15_reset = reset;
  assign barrier_15_io_x_ppn = superpage_entries_1_data_0[33:14]; // @[tlb.scala 58:79]
  assign barrier_15_io_x_u = superpage_entries_1_data_0[13]; // @[tlb.scala 58:79]
  assign barrier_15_io_x_g = superpage_entries_1_data_0[12]; // @[tlb.scala 58:79]
  assign barrier_15_io_x_ae = superpage_entries_1_data_0[11]; // @[tlb.scala 58:79]
  assign barrier_15_io_x_sw = superpage_entries_1_data_0[10]; // @[tlb.scala 58:79]
  assign barrier_15_io_x_sx = superpage_entries_1_data_0[9]; // @[tlb.scala 58:79]
  assign barrier_15_io_x_sr = superpage_entries_1_data_0[8]; // @[tlb.scala 58:79]
  assign barrier_15_io_x_pw = superpage_entries_1_data_0[7]; // @[tlb.scala 58:79]
  assign barrier_15_io_x_px = superpage_entries_1_data_0[6]; // @[tlb.scala 58:79]
  assign barrier_15_io_x_pr = superpage_entries_1_data_0[5]; // @[tlb.scala 58:79]
  assign barrier_15_io_x_pal = superpage_entries_1_data_0[4]; // @[tlb.scala 58:79]
  assign barrier_15_io_x_paa = superpage_entries_1_data_0[3]; // @[tlb.scala 58:79]
  assign barrier_15_io_x_eff = superpage_entries_1_data_0[2]; // @[tlb.scala 58:79]
  assign barrier_15_io_x_c = superpage_entries_1_data_0[1]; // @[tlb.scala 58:79]
  assign barrier_15_io_x_fragmented_superpage = superpage_entries_1_data_0[0]; // @[tlb.scala 58:79]
  assign barrier_16_clock = clock;
  assign barrier_16_reset = reset;
  assign barrier_16_io_x_ppn = superpage_entries_2_data_0[33:14]; // @[tlb.scala 58:79]
  assign barrier_16_io_x_u = superpage_entries_2_data_0[13]; // @[tlb.scala 58:79]
  assign barrier_16_io_x_g = superpage_entries_2_data_0[12]; // @[tlb.scala 58:79]
  assign barrier_16_io_x_ae = superpage_entries_2_data_0[11]; // @[tlb.scala 58:79]
  assign barrier_16_io_x_sw = superpage_entries_2_data_0[10]; // @[tlb.scala 58:79]
  assign barrier_16_io_x_sx = superpage_entries_2_data_0[9]; // @[tlb.scala 58:79]
  assign barrier_16_io_x_sr = superpage_entries_2_data_0[8]; // @[tlb.scala 58:79]
  assign barrier_16_io_x_pw = superpage_entries_2_data_0[7]; // @[tlb.scala 58:79]
  assign barrier_16_io_x_px = superpage_entries_2_data_0[6]; // @[tlb.scala 58:79]
  assign barrier_16_io_x_pr = superpage_entries_2_data_0[5]; // @[tlb.scala 58:79]
  assign barrier_16_io_x_pal = superpage_entries_2_data_0[4]; // @[tlb.scala 58:79]
  assign barrier_16_io_x_paa = superpage_entries_2_data_0[3]; // @[tlb.scala 58:79]
  assign barrier_16_io_x_eff = superpage_entries_2_data_0[2]; // @[tlb.scala 58:79]
  assign barrier_16_io_x_c = superpage_entries_2_data_0[1]; // @[tlb.scala 58:79]
  assign barrier_16_io_x_fragmented_superpage = superpage_entries_2_data_0[0]; // @[tlb.scala 58:79]
  assign barrier_17_clock = clock;
  assign barrier_17_reset = reset;
  assign barrier_17_io_x_ppn = superpage_entries_3_data_0[33:14]; // @[tlb.scala 58:79]
  assign barrier_17_io_x_u = superpage_entries_3_data_0[13]; // @[tlb.scala 58:79]
  assign barrier_17_io_x_g = superpage_entries_3_data_0[12]; // @[tlb.scala 58:79]
  assign barrier_17_io_x_ae = superpage_entries_3_data_0[11]; // @[tlb.scala 58:79]
  assign barrier_17_io_x_sw = superpage_entries_3_data_0[10]; // @[tlb.scala 58:79]
  assign barrier_17_io_x_sx = superpage_entries_3_data_0[9]; // @[tlb.scala 58:79]
  assign barrier_17_io_x_sr = superpage_entries_3_data_0[8]; // @[tlb.scala 58:79]
  assign barrier_17_io_x_pw = superpage_entries_3_data_0[7]; // @[tlb.scala 58:79]
  assign barrier_17_io_x_px = superpage_entries_3_data_0[6]; // @[tlb.scala 58:79]
  assign barrier_17_io_x_pr = superpage_entries_3_data_0[5]; // @[tlb.scala 58:79]
  assign barrier_17_io_x_pal = superpage_entries_3_data_0[4]; // @[tlb.scala 58:79]
  assign barrier_17_io_x_paa = superpage_entries_3_data_0[3]; // @[tlb.scala 58:79]
  assign barrier_17_io_x_eff = superpage_entries_3_data_0[2]; // @[tlb.scala 58:79]
  assign barrier_17_io_x_c = superpage_entries_3_data_0[1]; // @[tlb.scala 58:79]
  assign barrier_17_io_x_fragmented_superpage = superpage_entries_3_data_0[0]; // @[tlb.scala 58:79]
  always @(posedge clock) begin
    if (io_ptw_resp_valid) begin // @[tlb.scala 177:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[tlb.scala 196:70]
        if (!(io_ptw_resp_bits_level < 2'h2)) begin // @[tlb.scala 198:58]
          sectored_entries_0_tag <= r_refill_tag;
        end
      end
    end
    if (io_ptw_resp_valid) begin // @[tlb.scala 177:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[tlb.scala 196:70]
        if (!(io_ptw_resp_bits_level < 2'h2)) begin // @[tlb.scala 198:58]
          if (2'h0 == r_refill_tag[1:0]) begin // @[tlb.scala 95:17]
            sectored_entries_0_data_0 <= _T_946; // @[tlb.scala 95:17]
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin // @[tlb.scala 177:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[tlb.scala 196:70]
        if (!(io_ptw_resp_bits_level < 2'h2)) begin // @[tlb.scala 198:58]
          if (2'h1 == r_refill_tag[1:0]) begin // @[tlb.scala 95:17]
            sectored_entries_0_data_1 <= _T_946; // @[tlb.scala 95:17]
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin // @[tlb.scala 177:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[tlb.scala 196:70]
        if (!(io_ptw_resp_bits_level < 2'h2)) begin // @[tlb.scala 198:58]
          if (2'h2 == r_refill_tag[1:0]) begin // @[tlb.scala 95:17]
            sectored_entries_0_data_2 <= _T_946; // @[tlb.scala 95:17]
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin // @[tlb.scala 177:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[tlb.scala 196:70]
        if (!(io_ptw_resp_bits_level < 2'h2)) begin // @[tlb.scala 198:58]
          if (2'h3 == r_refill_tag[1:0]) begin // @[tlb.scala 95:17]
            sectored_entries_0_data_3 <= _T_946; // @[tlb.scala 95:17]
          end
        end
      end
    end
    if (multipleHits_0 | reset) begin // @[tlb.scala 346:45]
      sectored_entries_0_valid_0 <= 1'h0; // @[tlb.scala 98:40]
    end else if (io_sfence_valid) begin // @[tlb.scala 336:19]
      if (io_sfence_bits_rs1) begin // @[tlb.scala 340:37]
        if (_T_567[26:18] == 9'h0) begin // @[tlb.scala 107:73]
          sectored_entries_0_valid_0 <= _GEN_164;
        end else begin
          sectored_entries_0_valid_0 <= _GEN_160;
        end
      end else begin
        sectored_entries_0_valid_0 <= _GEN_176;
      end
    end else if (io_ptw_resp_valid) begin // @[tlb.scala 177:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[tlb.scala 196:70]
        sectored_entries_0_valid_0 <= _GEN_62;
      end
    end
    if (multipleHits_0 | reset) begin // @[tlb.scala 346:45]
      sectored_entries_0_valid_1 <= 1'h0; // @[tlb.scala 98:40]
    end else if (io_sfence_valid) begin // @[tlb.scala 336:19]
      if (io_sfence_bits_rs1) begin // @[tlb.scala 340:37]
        if (_T_567[26:18] == 9'h0) begin // @[tlb.scala 107:73]
          sectored_entries_0_valid_1 <= _GEN_165;
        end else begin
          sectored_entries_0_valid_1 <= _GEN_161;
        end
      end else begin
        sectored_entries_0_valid_1 <= _GEN_177;
      end
    end else if (io_ptw_resp_valid) begin // @[tlb.scala 177:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[tlb.scala 196:70]
        sectored_entries_0_valid_1 <= _GEN_63;
      end
    end
    if (multipleHits_0 | reset) begin // @[tlb.scala 346:45]
      sectored_entries_0_valid_2 <= 1'h0; // @[tlb.scala 98:40]
    end else if (io_sfence_valid) begin // @[tlb.scala 336:19]
      if (io_sfence_bits_rs1) begin // @[tlb.scala 340:37]
        if (_T_567[26:18] == 9'h0) begin // @[tlb.scala 107:73]
          sectored_entries_0_valid_2 <= _GEN_166;
        end else begin
          sectored_entries_0_valid_2 <= _GEN_162;
        end
      end else begin
        sectored_entries_0_valid_2 <= _GEN_178;
      end
    end else if (io_ptw_resp_valid) begin // @[tlb.scala 177:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[tlb.scala 196:70]
        sectored_entries_0_valid_2 <= _GEN_64;
      end
    end
    if (multipleHits_0 | reset) begin // @[tlb.scala 346:45]
      sectored_entries_0_valid_3 <= 1'h0; // @[tlb.scala 98:40]
    end else if (io_sfence_valid) begin // @[tlb.scala 336:19]
      if (io_sfence_bits_rs1) begin // @[tlb.scala 340:37]
        if (_T_567[26:18] == 9'h0) begin // @[tlb.scala 107:73]
          sectored_entries_0_valid_3 <= _GEN_167;
        end else begin
          sectored_entries_0_valid_3 <= _GEN_163;
        end
      end else begin
        sectored_entries_0_valid_3 <= _GEN_179;
      end
    end else if (io_ptw_resp_valid) begin // @[tlb.scala 177:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[tlb.scala 196:70]
        sectored_entries_0_valid_3 <= _GEN_65;
      end
    end
    if (io_ptw_resp_valid) begin // @[tlb.scala 177:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[tlb.scala 196:70]
        if (io_ptw_resp_bits_level < 2'h2) begin // @[tlb.scala 198:58]
          if (r_superpage_repl_addr == 2'h0) begin // @[tlb.scala 199:91]
            superpage_entries_0_level <= {{1'd0}, io_ptw_resp_bits_level[0]}; // @[tlb.scala 91:18]
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin // @[tlb.scala 177:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[tlb.scala 196:70]
        if (io_ptw_resp_bits_level < 2'h2) begin // @[tlb.scala 198:58]
          if (r_superpage_repl_addr == 2'h0) begin // @[tlb.scala 199:91]
            superpage_entries_0_tag <= r_refill_tag; // @[tlb.scala 90:16]
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin // @[tlb.scala 177:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[tlb.scala 196:70]
        if (io_ptw_resp_bits_level < 2'h2) begin // @[tlb.scala 198:58]
          if (r_superpage_repl_addr == 2'h0) begin // @[tlb.scala 199:91]
            superpage_entries_0_data_0 <= _T_946; // @[tlb.scala 95:17]
          end
        end
      end
    end
    if (multipleHits_0 | reset) begin // @[tlb.scala 346:45]
      superpage_entries_0_valid_0 <= 1'h0; // @[tlb.scala 98:40]
    end else if (io_sfence_valid) begin // @[tlb.scala 336:19]
      if (io_sfence_bits_rs1) begin // @[tlb.scala 340:37]
        if (superpage_hits_0_0) begin // @[tlb.scala 101:26]
          superpage_entries_0_valid_0 <= 1'h0; // @[tlb.scala 98:40]
        end else begin
          superpage_entries_0_valid_0 <= _GEN_108;
        end
      end else begin
        superpage_entries_0_valid_0 <= _GEN_186;
      end
    end else begin
      superpage_entries_0_valid_0 <= _GEN_108;
    end
    if (io_ptw_resp_valid) begin // @[tlb.scala 177:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[tlb.scala 196:70]
        if (io_ptw_resp_bits_level < 2'h2) begin // @[tlb.scala 198:58]
          if (r_superpage_repl_addr == 2'h1) begin // @[tlb.scala 199:91]
            superpage_entries_1_level <= {{1'd0}, io_ptw_resp_bits_level[0]}; // @[tlb.scala 91:18]
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin // @[tlb.scala 177:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[tlb.scala 196:70]
        if (io_ptw_resp_bits_level < 2'h2) begin // @[tlb.scala 198:58]
          if (r_superpage_repl_addr == 2'h1) begin // @[tlb.scala 199:91]
            superpage_entries_1_tag <= r_refill_tag; // @[tlb.scala 90:16]
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin // @[tlb.scala 177:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[tlb.scala 196:70]
        if (io_ptw_resp_bits_level < 2'h2) begin // @[tlb.scala 198:58]
          if (r_superpage_repl_addr == 2'h1) begin // @[tlb.scala 199:91]
            superpage_entries_1_data_0 <= _T_946; // @[tlb.scala 95:17]
          end
        end
      end
    end
    if (multipleHits_0 | reset) begin // @[tlb.scala 346:45]
      superpage_entries_1_valid_0 <= 1'h0; // @[tlb.scala 98:40]
    end else if (io_sfence_valid) begin // @[tlb.scala 336:19]
      if (io_sfence_bits_rs1) begin // @[tlb.scala 340:37]
        if (superpage_hits_0_1) begin // @[tlb.scala 101:26]
          superpage_entries_1_valid_0 <= 1'h0; // @[tlb.scala 98:40]
        end else begin
          superpage_entries_1_valid_0 <= _GEN_112;
        end
      end else begin
        superpage_entries_1_valid_0 <= _GEN_190;
      end
    end else begin
      superpage_entries_1_valid_0 <= _GEN_112;
    end
    if (io_ptw_resp_valid) begin // @[tlb.scala 177:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[tlb.scala 196:70]
        if (io_ptw_resp_bits_level < 2'h2) begin // @[tlb.scala 198:58]
          if (r_superpage_repl_addr == 2'h2) begin // @[tlb.scala 199:91]
            superpage_entries_2_level <= {{1'd0}, io_ptw_resp_bits_level[0]}; // @[tlb.scala 91:18]
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin // @[tlb.scala 177:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[tlb.scala 196:70]
        if (io_ptw_resp_bits_level < 2'h2) begin // @[tlb.scala 198:58]
          if (r_superpage_repl_addr == 2'h2) begin // @[tlb.scala 199:91]
            superpage_entries_2_tag <= r_refill_tag; // @[tlb.scala 90:16]
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin // @[tlb.scala 177:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[tlb.scala 196:70]
        if (io_ptw_resp_bits_level < 2'h2) begin // @[tlb.scala 198:58]
          if (r_superpage_repl_addr == 2'h2) begin // @[tlb.scala 199:91]
            superpage_entries_2_data_0 <= _T_946; // @[tlb.scala 95:17]
          end
        end
      end
    end
    if (multipleHits_0 | reset) begin // @[tlb.scala 346:45]
      superpage_entries_2_valid_0 <= 1'h0; // @[tlb.scala 98:40]
    end else if (io_sfence_valid) begin // @[tlb.scala 336:19]
      if (io_sfence_bits_rs1) begin // @[tlb.scala 340:37]
        if (superpage_hits_0_2) begin // @[tlb.scala 101:26]
          superpage_entries_2_valid_0 <= 1'h0; // @[tlb.scala 98:40]
        end else begin
          superpage_entries_2_valid_0 <= _GEN_116;
        end
      end else begin
        superpage_entries_2_valid_0 <= _GEN_194;
      end
    end else begin
      superpage_entries_2_valid_0 <= _GEN_116;
    end
    if (io_ptw_resp_valid) begin // @[tlb.scala 177:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[tlb.scala 196:70]
        if (io_ptw_resp_bits_level < 2'h2) begin // @[tlb.scala 198:58]
          if (r_superpage_repl_addr == 2'h3) begin // @[tlb.scala 199:91]
            superpage_entries_3_level <= {{1'd0}, io_ptw_resp_bits_level[0]}; // @[tlb.scala 91:18]
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin // @[tlb.scala 177:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[tlb.scala 196:70]
        if (io_ptw_resp_bits_level < 2'h2) begin // @[tlb.scala 198:58]
          if (r_superpage_repl_addr == 2'h3) begin // @[tlb.scala 199:91]
            superpage_entries_3_tag <= r_refill_tag; // @[tlb.scala 90:16]
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin // @[tlb.scala 177:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[tlb.scala 196:70]
        if (io_ptw_resp_bits_level < 2'h2) begin // @[tlb.scala 198:58]
          if (r_superpage_repl_addr == 2'h3) begin // @[tlb.scala 199:91]
            superpage_entries_3_data_0 <= _T_946; // @[tlb.scala 95:17]
          end
        end
      end
    end
    if (multipleHits_0 | reset) begin // @[tlb.scala 346:45]
      superpage_entries_3_valid_0 <= 1'h0; // @[tlb.scala 98:40]
    end else if (io_sfence_valid) begin // @[tlb.scala 336:19]
      if (io_sfence_bits_rs1) begin // @[tlb.scala 340:37]
        if (superpage_hits_0_3) begin // @[tlb.scala 101:26]
          superpage_entries_3_valid_0 <= 1'h0; // @[tlb.scala 98:40]
        end else begin
          superpage_entries_3_valid_0 <= _GEN_120;
        end
      end else begin
        superpage_entries_3_valid_0 <= _GEN_198;
      end
    end else begin
      superpage_entries_3_valid_0 <= _GEN_120;
    end
    if (io_ptw_resp_valid) begin // @[tlb.scala 177:20]
      if (~io_ptw_resp_bits_homogeneous) begin // @[tlb.scala 196:70]
        special_entry_level <= io_ptw_resp_bits_level; // @[tlb.scala 91:18]
      end
    end
    if (io_ptw_resp_valid) begin // @[tlb.scala 177:20]
      if (~io_ptw_resp_bits_homogeneous) begin // @[tlb.scala 196:70]
        special_entry_tag <= r_refill_tag; // @[tlb.scala 90:16]
      end
    end
    if (io_ptw_resp_valid) begin // @[tlb.scala 177:20]
      if (~io_ptw_resp_bits_homogeneous) begin // @[tlb.scala 196:70]
        special_entry_data_0 <= _T_946; // @[tlb.scala 95:17]
      end
    end
    if (multipleHits_0 | reset) begin // @[tlb.scala 346:45]
      special_entry_valid_0 <= 1'h0; // @[tlb.scala 98:40]
    end else if (io_sfence_valid) begin // @[tlb.scala 336:19]
      if (io_sfence_bits_rs1) begin // @[tlb.scala 340:37]
        if (_T_769) begin // @[tlb.scala 101:26]
          special_entry_valid_0 <= 1'h0; // @[tlb.scala 98:40]
        end else begin
          special_entry_valid_0 <= _GEN_104;
        end
      end else begin
        special_entry_valid_0 <= _GEN_202;
      end
    end else begin
      special_entry_valid_0 <= _GEN_104;
    end
    if (reset) begin // @[tlb.scala 129:22]
      state <= 2'h0; // @[tlb.scala 129:22]
    end else if (io_ptw_resp_valid) begin // @[tlb.scala 332:30]
      state <= 2'h0; // @[tlb.scala 333:13]
    end else if (state == 2'h2 & io_sfence_valid) begin // @[tlb.scala 329:39]
      state <= 2'h3; // @[tlb.scala 330:13]
    end else if (_T_6) begin // @[tlb.scala 324:32]
      state <= _GEN_152;
    end else begin
      state <= _GEN_144;
    end
    if (_T_1372 & tlb_miss_0 & _T_1337) begin // @[tlb.scala 314:67]
      r_refill_tag <= vpn_0; // @[tlb.scala 316:22]
    end
    if (_T_1372 & tlb_miss_0 & _T_1337) begin // @[tlb.scala 314:67]
      if (&_T_1379) begin // @[tlb.scala 353:8]
        r_superpage_repl_addr <= _T_1378;
      end else if (_T_1381[0]) begin // @[Mux.scala 47:69]
        r_superpage_repl_addr <= 2'h0;
      end else if (_T_1381[1]) begin // @[Mux.scala 47:69]
        r_superpage_repl_addr <= 2'h1;
      end else begin
        r_superpage_repl_addr <= _T_1386;
      end
    end
    if (_T_1372 & tlb_miss_0 & _T_1337) begin // @[tlb.scala 314:67]
      r_sectored_hit <= sector_hits_0_0; // @[tlb.scala 321:31]
    end
    if (reset) begin // @[Replacement.scala 168:70]
      state_reg_1 <= 3'h0; // @[Replacement.scala 168:70]
    end else if (io_req_0_valid & vm_enabled_0) begin // @[tlb.scala 275:45]
      if (_T_1311) begin // @[tlb.scala 277:36]
        state_reg_1 <= _state_reg_T_6; // @[Replacement.scala 172:15]
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_sfence_valid & ~(~io_sfence_bits_rs1 | io_sfence_bits_addr[38:12] == vpn_0 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at tlb.scala:338 assert(!io.sfence.bits.rs1 || (io.sfence.bits.addr >> pgIdxBits) === vpn(w))\n"
            ); // @[tlb.scala 338:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_sfence_valid & ~(~io_sfence_bits_rs1 | io_sfence_bits_addr[38:12] == vpn_0 | reset)) begin
          $fatal; // @[tlb.scala 338:15]
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
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  sectored_entries_0_tag = _RAND_0[26:0];
  _RAND_1 = {2{`RANDOM}};
  sectored_entries_0_data_0 = _RAND_1[33:0];
  _RAND_2 = {2{`RANDOM}};
  sectored_entries_0_data_1 = _RAND_2[33:0];
  _RAND_3 = {2{`RANDOM}};
  sectored_entries_0_data_2 = _RAND_3[33:0];
  _RAND_4 = {2{`RANDOM}};
  sectored_entries_0_data_3 = _RAND_4[33:0];
  _RAND_5 = {1{`RANDOM}};
  sectored_entries_0_valid_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  sectored_entries_0_valid_1 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  sectored_entries_0_valid_2 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  sectored_entries_0_valid_3 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  superpage_entries_0_level = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  superpage_entries_0_tag = _RAND_10[26:0];
  _RAND_11 = {2{`RANDOM}};
  superpage_entries_0_data_0 = _RAND_11[33:0];
  _RAND_12 = {1{`RANDOM}};
  superpage_entries_0_valid_0 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  superpage_entries_1_level = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  superpage_entries_1_tag = _RAND_14[26:0];
  _RAND_15 = {2{`RANDOM}};
  superpage_entries_1_data_0 = _RAND_15[33:0];
  _RAND_16 = {1{`RANDOM}};
  superpage_entries_1_valid_0 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  superpage_entries_2_level = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  superpage_entries_2_tag = _RAND_18[26:0];
  _RAND_19 = {2{`RANDOM}};
  superpage_entries_2_data_0 = _RAND_19[33:0];
  _RAND_20 = {1{`RANDOM}};
  superpage_entries_2_valid_0 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  superpage_entries_3_level = _RAND_21[1:0];
  _RAND_22 = {1{`RANDOM}};
  superpage_entries_3_tag = _RAND_22[26:0];
  _RAND_23 = {2{`RANDOM}};
  superpage_entries_3_data_0 = _RAND_23[33:0];
  _RAND_24 = {1{`RANDOM}};
  superpage_entries_3_valid_0 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  special_entry_level = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  special_entry_tag = _RAND_26[26:0];
  _RAND_27 = {2{`RANDOM}};
  special_entry_data_0 = _RAND_27[33:0];
  _RAND_28 = {1{`RANDOM}};
  special_entry_valid_0 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  state = _RAND_29[1:0];
  _RAND_30 = {1{`RANDOM}};
  r_refill_tag = _RAND_30[26:0];
  _RAND_31 = {1{`RANDOM}};
  r_superpage_repl_addr = _RAND_31[1:0];
  _RAND_32 = {1{`RANDOM}};
  r_sectored_hit = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  state_reg_1 = _RAND_33[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
