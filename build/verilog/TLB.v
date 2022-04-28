module TLB(
  input         clock,
  input         reset,
  output        io_req_ready,
  input         io_req_valid,
  input  [39:0] io_req_bits_vaddr,
  input         io_req_bits_passthrough,
  input  [1:0]  io_req_bits_size,
  input  [4:0]  io_req_bits_cmd,
  output        io_resp_miss,
  output [31:0] io_resp_paddr,
  output        io_resp_pf_ld,
  output        io_resp_pf_st,
  output        io_resp_pf_inst,
  output        io_resp_ae_ld,
  output        io_resp_ae_st,
  output        io_resp_ae_inst,
  output        io_resp_ma_ld,
  output        io_resp_ma_st,
  output        io_resp_ma_inst,
  output        io_resp_cacheable,
  output        io_resp_must_alloc,
  output        io_resp_prefetchable,
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
  wire  mpu_ppn_data_barrier_clock; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_reset; // @[package.scala 258:25]
  wire [19:0] mpu_ppn_data_barrier_io_x_ppn; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_x_u; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_x_g; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_x_ae; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_x_sw; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_x_sx; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_x_sr; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_x_pw; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_x_px; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_x_pr; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_x_ppp; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_x_pal; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_x_paa; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_x_eff; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_x_c; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] mpu_ppn_data_barrier_io_y_ppn; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_y_u; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_y_g; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_y_ae; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_y_sw; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_y_sx; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_y_sr; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_y_pw; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_y_px; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_y_pr; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_y_ppp; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_y_pal; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_y_paa; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_y_eff; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_y_c; // @[package.scala 258:25]
  wire  mpu_ppn_data_barrier_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  pmp_clock; // @[TLB.scala 193:19]
  wire  pmp_reset; // @[TLB.scala 193:19]
  wire [1:0] pmp_io_prv; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_0_cfg_l; // @[TLB.scala 193:19]
  wire [1:0] pmp_io_pmp_0_cfg_res; // @[TLB.scala 193:19]
  wire [1:0] pmp_io_pmp_0_cfg_a; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_0_cfg_x; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_0_cfg_w; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_0_cfg_r; // @[TLB.scala 193:19]
  wire [29:0] pmp_io_pmp_0_addr; // @[TLB.scala 193:19]
  wire [31:0] pmp_io_pmp_0_mask; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_1_cfg_l; // @[TLB.scala 193:19]
  wire [1:0] pmp_io_pmp_1_cfg_res; // @[TLB.scala 193:19]
  wire [1:0] pmp_io_pmp_1_cfg_a; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_1_cfg_x; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_1_cfg_w; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_1_cfg_r; // @[TLB.scala 193:19]
  wire [29:0] pmp_io_pmp_1_addr; // @[TLB.scala 193:19]
  wire [31:0] pmp_io_pmp_1_mask; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_2_cfg_l; // @[TLB.scala 193:19]
  wire [1:0] pmp_io_pmp_2_cfg_res; // @[TLB.scala 193:19]
  wire [1:0] pmp_io_pmp_2_cfg_a; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_2_cfg_x; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_2_cfg_w; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_2_cfg_r; // @[TLB.scala 193:19]
  wire [29:0] pmp_io_pmp_2_addr; // @[TLB.scala 193:19]
  wire [31:0] pmp_io_pmp_2_mask; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_3_cfg_l; // @[TLB.scala 193:19]
  wire [1:0] pmp_io_pmp_3_cfg_res; // @[TLB.scala 193:19]
  wire [1:0] pmp_io_pmp_3_cfg_a; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_3_cfg_x; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_3_cfg_w; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_3_cfg_r; // @[TLB.scala 193:19]
  wire [29:0] pmp_io_pmp_3_addr; // @[TLB.scala 193:19]
  wire [31:0] pmp_io_pmp_3_mask; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_4_cfg_l; // @[TLB.scala 193:19]
  wire [1:0] pmp_io_pmp_4_cfg_res; // @[TLB.scala 193:19]
  wire [1:0] pmp_io_pmp_4_cfg_a; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_4_cfg_x; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_4_cfg_w; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_4_cfg_r; // @[TLB.scala 193:19]
  wire [29:0] pmp_io_pmp_4_addr; // @[TLB.scala 193:19]
  wire [31:0] pmp_io_pmp_4_mask; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_5_cfg_l; // @[TLB.scala 193:19]
  wire [1:0] pmp_io_pmp_5_cfg_res; // @[TLB.scala 193:19]
  wire [1:0] pmp_io_pmp_5_cfg_a; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_5_cfg_x; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_5_cfg_w; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_5_cfg_r; // @[TLB.scala 193:19]
  wire [29:0] pmp_io_pmp_5_addr; // @[TLB.scala 193:19]
  wire [31:0] pmp_io_pmp_5_mask; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_6_cfg_l; // @[TLB.scala 193:19]
  wire [1:0] pmp_io_pmp_6_cfg_res; // @[TLB.scala 193:19]
  wire [1:0] pmp_io_pmp_6_cfg_a; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_6_cfg_x; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_6_cfg_w; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_6_cfg_r; // @[TLB.scala 193:19]
  wire [29:0] pmp_io_pmp_6_addr; // @[TLB.scala 193:19]
  wire [31:0] pmp_io_pmp_6_mask; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_7_cfg_l; // @[TLB.scala 193:19]
  wire [1:0] pmp_io_pmp_7_cfg_res; // @[TLB.scala 193:19]
  wire [1:0] pmp_io_pmp_7_cfg_a; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_7_cfg_x; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_7_cfg_w; // @[TLB.scala 193:19]
  wire  pmp_io_pmp_7_cfg_r; // @[TLB.scala 193:19]
  wire [29:0] pmp_io_pmp_7_addr; // @[TLB.scala 193:19]
  wire [31:0] pmp_io_pmp_7_mask; // @[TLB.scala 193:19]
  wire [31:0] pmp_io_addr; // @[TLB.scala 193:19]
  wire [1:0] pmp_io_size; // @[TLB.scala 193:19]
  wire  pmp_io_r; // @[TLB.scala 193:19]
  wire  pmp_io_w; // @[TLB.scala 193:19]
  wire  pmp_io_x; // @[TLB.scala 193:19]
  wire  ppn_data_barrier_clock; // @[package.scala 258:25]
  wire  ppn_data_barrier_reset; // @[package.scala 258:25]
  wire [19:0] ppn_data_barrier_io_x_ppn; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_x_u; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_x_g; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_x_ae; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_x_sw; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_x_sx; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_x_sr; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_x_pw; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_x_px; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_x_pr; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_x_ppp; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_x_pal; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_x_paa; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_x_eff; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_x_c; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] ppn_data_barrier_io_y_ppn; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_y_u; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_y_g; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_y_ae; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_y_sw; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_y_sx; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_y_sr; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_y_pw; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_y_px; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_y_pr; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_y_ppp; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_y_pal; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_y_paa; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_y_eff; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_y_c; // @[package.scala 258:25]
  wire  ppn_data_barrier_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_clock; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_reset; // @[package.scala 258:25]
  wire [19:0] ppn_data_barrier_1_io_x_ppn; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_x_u; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_x_g; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_x_ae; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_x_sw; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_x_sx; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_x_sr; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_x_pw; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_x_px; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_x_pr; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_x_ppp; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_x_pal; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_x_paa; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_x_eff; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_x_c; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] ppn_data_barrier_1_io_y_ppn; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_y_u; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_y_g; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_y_ae; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_y_sw; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_y_sx; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_y_sr; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_y_pw; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_y_px; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_y_pr; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_y_ppp; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_y_pal; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_y_paa; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_y_eff; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_y_c; // @[package.scala 258:25]
  wire  ppn_data_barrier_1_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_clock; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_reset; // @[package.scala 258:25]
  wire [19:0] ppn_data_barrier_2_io_x_ppn; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_x_u; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_x_g; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_x_ae; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_x_sw; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_x_sx; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_x_sr; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_x_pw; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_x_px; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_x_pr; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_x_ppp; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_x_pal; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_x_paa; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_x_eff; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_x_c; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] ppn_data_barrier_2_io_y_ppn; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_y_u; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_y_g; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_y_ae; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_y_sw; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_y_sx; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_y_sr; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_y_pw; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_y_px; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_y_pr; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_y_ppp; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_y_pal; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_y_paa; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_y_eff; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_y_c; // @[package.scala 258:25]
  wire  ppn_data_barrier_2_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_clock; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_reset; // @[package.scala 258:25]
  wire [19:0] ppn_data_barrier_3_io_x_ppn; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_x_u; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_x_g; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_x_ae; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_x_sw; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_x_sx; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_x_sr; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_x_pw; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_x_px; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_x_pr; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_x_ppp; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_x_pal; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_x_paa; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_x_eff; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_x_c; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] ppn_data_barrier_3_io_y_ppn; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_y_u; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_y_g; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_y_ae; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_y_sw; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_y_sx; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_y_sr; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_y_pw; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_y_px; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_y_pr; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_y_ppp; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_y_pal; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_y_paa; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_y_eff; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_y_c; // @[package.scala 258:25]
  wire  ppn_data_barrier_3_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_clock; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_reset; // @[package.scala 258:25]
  wire [19:0] ppn_data_barrier_4_io_x_ppn; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_x_u; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_x_g; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_x_ae; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_x_sw; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_x_sx; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_x_sr; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_x_pw; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_x_px; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_x_pr; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_x_ppp; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_x_pal; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_x_paa; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_x_eff; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_x_c; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] ppn_data_barrier_4_io_y_ppn; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_y_u; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_y_g; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_y_ae; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_y_sw; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_y_sx; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_y_sr; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_y_pw; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_y_px; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_y_pr; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_y_ppp; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_y_pal; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_y_paa; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_y_eff; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_y_c; // @[package.scala 258:25]
  wire  ppn_data_barrier_4_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_clock; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_reset; // @[package.scala 258:25]
  wire [19:0] ppn_data_barrier_5_io_x_ppn; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_x_u; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_x_g; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_x_ae; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_x_sw; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_x_sx; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_x_sr; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_x_pw; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_x_px; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_x_pr; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_x_ppp; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_x_pal; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_x_paa; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_x_eff; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_x_c; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] ppn_data_barrier_5_io_y_ppn; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_y_u; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_y_g; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_y_ae; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_y_sw; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_y_sx; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_y_sr; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_y_pw; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_y_px; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_y_pr; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_y_ppp; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_y_pal; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_y_paa; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_y_eff; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_y_c; // @[package.scala 258:25]
  wire  ppn_data_barrier_5_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  entries_barrier_clock; // @[package.scala 258:25]
  wire  entries_barrier_reset; // @[package.scala 258:25]
  wire [19:0] entries_barrier_io_x_ppn; // @[package.scala 258:25]
  wire  entries_barrier_io_x_u; // @[package.scala 258:25]
  wire  entries_barrier_io_x_g; // @[package.scala 258:25]
  wire  entries_barrier_io_x_ae; // @[package.scala 258:25]
  wire  entries_barrier_io_x_sw; // @[package.scala 258:25]
  wire  entries_barrier_io_x_sx; // @[package.scala 258:25]
  wire  entries_barrier_io_x_sr; // @[package.scala 258:25]
  wire  entries_barrier_io_x_pw; // @[package.scala 258:25]
  wire  entries_barrier_io_x_px; // @[package.scala 258:25]
  wire  entries_barrier_io_x_pr; // @[package.scala 258:25]
  wire  entries_barrier_io_x_ppp; // @[package.scala 258:25]
  wire  entries_barrier_io_x_pal; // @[package.scala 258:25]
  wire  entries_barrier_io_x_paa; // @[package.scala 258:25]
  wire  entries_barrier_io_x_eff; // @[package.scala 258:25]
  wire  entries_barrier_io_x_c; // @[package.scala 258:25]
  wire  entries_barrier_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] entries_barrier_io_y_ppn; // @[package.scala 258:25]
  wire  entries_barrier_io_y_u; // @[package.scala 258:25]
  wire  entries_barrier_io_y_g; // @[package.scala 258:25]
  wire  entries_barrier_io_y_ae; // @[package.scala 258:25]
  wire  entries_barrier_io_y_sw; // @[package.scala 258:25]
  wire  entries_barrier_io_y_sx; // @[package.scala 258:25]
  wire  entries_barrier_io_y_sr; // @[package.scala 258:25]
  wire  entries_barrier_io_y_pw; // @[package.scala 258:25]
  wire  entries_barrier_io_y_px; // @[package.scala 258:25]
  wire  entries_barrier_io_y_pr; // @[package.scala 258:25]
  wire  entries_barrier_io_y_ppp; // @[package.scala 258:25]
  wire  entries_barrier_io_y_pal; // @[package.scala 258:25]
  wire  entries_barrier_io_y_paa; // @[package.scala 258:25]
  wire  entries_barrier_io_y_eff; // @[package.scala 258:25]
  wire  entries_barrier_io_y_c; // @[package.scala 258:25]
  wire  entries_barrier_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  entries_barrier_1_clock; // @[package.scala 258:25]
  wire  entries_barrier_1_reset; // @[package.scala 258:25]
  wire [19:0] entries_barrier_1_io_x_ppn; // @[package.scala 258:25]
  wire  entries_barrier_1_io_x_u; // @[package.scala 258:25]
  wire  entries_barrier_1_io_x_g; // @[package.scala 258:25]
  wire  entries_barrier_1_io_x_ae; // @[package.scala 258:25]
  wire  entries_barrier_1_io_x_sw; // @[package.scala 258:25]
  wire  entries_barrier_1_io_x_sx; // @[package.scala 258:25]
  wire  entries_barrier_1_io_x_sr; // @[package.scala 258:25]
  wire  entries_barrier_1_io_x_pw; // @[package.scala 258:25]
  wire  entries_barrier_1_io_x_px; // @[package.scala 258:25]
  wire  entries_barrier_1_io_x_pr; // @[package.scala 258:25]
  wire  entries_barrier_1_io_x_ppp; // @[package.scala 258:25]
  wire  entries_barrier_1_io_x_pal; // @[package.scala 258:25]
  wire  entries_barrier_1_io_x_paa; // @[package.scala 258:25]
  wire  entries_barrier_1_io_x_eff; // @[package.scala 258:25]
  wire  entries_barrier_1_io_x_c; // @[package.scala 258:25]
  wire  entries_barrier_1_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] entries_barrier_1_io_y_ppn; // @[package.scala 258:25]
  wire  entries_barrier_1_io_y_u; // @[package.scala 258:25]
  wire  entries_barrier_1_io_y_g; // @[package.scala 258:25]
  wire  entries_barrier_1_io_y_ae; // @[package.scala 258:25]
  wire  entries_barrier_1_io_y_sw; // @[package.scala 258:25]
  wire  entries_barrier_1_io_y_sx; // @[package.scala 258:25]
  wire  entries_barrier_1_io_y_sr; // @[package.scala 258:25]
  wire  entries_barrier_1_io_y_pw; // @[package.scala 258:25]
  wire  entries_barrier_1_io_y_px; // @[package.scala 258:25]
  wire  entries_barrier_1_io_y_pr; // @[package.scala 258:25]
  wire  entries_barrier_1_io_y_ppp; // @[package.scala 258:25]
  wire  entries_barrier_1_io_y_pal; // @[package.scala 258:25]
  wire  entries_barrier_1_io_y_paa; // @[package.scala 258:25]
  wire  entries_barrier_1_io_y_eff; // @[package.scala 258:25]
  wire  entries_barrier_1_io_y_c; // @[package.scala 258:25]
  wire  entries_barrier_1_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  entries_barrier_2_clock; // @[package.scala 258:25]
  wire  entries_barrier_2_reset; // @[package.scala 258:25]
  wire [19:0] entries_barrier_2_io_x_ppn; // @[package.scala 258:25]
  wire  entries_barrier_2_io_x_u; // @[package.scala 258:25]
  wire  entries_barrier_2_io_x_g; // @[package.scala 258:25]
  wire  entries_barrier_2_io_x_ae; // @[package.scala 258:25]
  wire  entries_barrier_2_io_x_sw; // @[package.scala 258:25]
  wire  entries_barrier_2_io_x_sx; // @[package.scala 258:25]
  wire  entries_barrier_2_io_x_sr; // @[package.scala 258:25]
  wire  entries_barrier_2_io_x_pw; // @[package.scala 258:25]
  wire  entries_barrier_2_io_x_px; // @[package.scala 258:25]
  wire  entries_barrier_2_io_x_pr; // @[package.scala 258:25]
  wire  entries_barrier_2_io_x_ppp; // @[package.scala 258:25]
  wire  entries_barrier_2_io_x_pal; // @[package.scala 258:25]
  wire  entries_barrier_2_io_x_paa; // @[package.scala 258:25]
  wire  entries_barrier_2_io_x_eff; // @[package.scala 258:25]
  wire  entries_barrier_2_io_x_c; // @[package.scala 258:25]
  wire  entries_barrier_2_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] entries_barrier_2_io_y_ppn; // @[package.scala 258:25]
  wire  entries_barrier_2_io_y_u; // @[package.scala 258:25]
  wire  entries_barrier_2_io_y_g; // @[package.scala 258:25]
  wire  entries_barrier_2_io_y_ae; // @[package.scala 258:25]
  wire  entries_barrier_2_io_y_sw; // @[package.scala 258:25]
  wire  entries_barrier_2_io_y_sx; // @[package.scala 258:25]
  wire  entries_barrier_2_io_y_sr; // @[package.scala 258:25]
  wire  entries_barrier_2_io_y_pw; // @[package.scala 258:25]
  wire  entries_barrier_2_io_y_px; // @[package.scala 258:25]
  wire  entries_barrier_2_io_y_pr; // @[package.scala 258:25]
  wire  entries_barrier_2_io_y_ppp; // @[package.scala 258:25]
  wire  entries_barrier_2_io_y_pal; // @[package.scala 258:25]
  wire  entries_barrier_2_io_y_paa; // @[package.scala 258:25]
  wire  entries_barrier_2_io_y_eff; // @[package.scala 258:25]
  wire  entries_barrier_2_io_y_c; // @[package.scala 258:25]
  wire  entries_barrier_2_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  entries_barrier_3_clock; // @[package.scala 258:25]
  wire  entries_barrier_3_reset; // @[package.scala 258:25]
  wire [19:0] entries_barrier_3_io_x_ppn; // @[package.scala 258:25]
  wire  entries_barrier_3_io_x_u; // @[package.scala 258:25]
  wire  entries_barrier_3_io_x_g; // @[package.scala 258:25]
  wire  entries_barrier_3_io_x_ae; // @[package.scala 258:25]
  wire  entries_barrier_3_io_x_sw; // @[package.scala 258:25]
  wire  entries_barrier_3_io_x_sx; // @[package.scala 258:25]
  wire  entries_barrier_3_io_x_sr; // @[package.scala 258:25]
  wire  entries_barrier_3_io_x_pw; // @[package.scala 258:25]
  wire  entries_barrier_3_io_x_px; // @[package.scala 258:25]
  wire  entries_barrier_3_io_x_pr; // @[package.scala 258:25]
  wire  entries_barrier_3_io_x_ppp; // @[package.scala 258:25]
  wire  entries_barrier_3_io_x_pal; // @[package.scala 258:25]
  wire  entries_barrier_3_io_x_paa; // @[package.scala 258:25]
  wire  entries_barrier_3_io_x_eff; // @[package.scala 258:25]
  wire  entries_barrier_3_io_x_c; // @[package.scala 258:25]
  wire  entries_barrier_3_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] entries_barrier_3_io_y_ppn; // @[package.scala 258:25]
  wire  entries_barrier_3_io_y_u; // @[package.scala 258:25]
  wire  entries_barrier_3_io_y_g; // @[package.scala 258:25]
  wire  entries_barrier_3_io_y_ae; // @[package.scala 258:25]
  wire  entries_barrier_3_io_y_sw; // @[package.scala 258:25]
  wire  entries_barrier_3_io_y_sx; // @[package.scala 258:25]
  wire  entries_barrier_3_io_y_sr; // @[package.scala 258:25]
  wire  entries_barrier_3_io_y_pw; // @[package.scala 258:25]
  wire  entries_barrier_3_io_y_px; // @[package.scala 258:25]
  wire  entries_barrier_3_io_y_pr; // @[package.scala 258:25]
  wire  entries_barrier_3_io_y_ppp; // @[package.scala 258:25]
  wire  entries_barrier_3_io_y_pal; // @[package.scala 258:25]
  wire  entries_barrier_3_io_y_paa; // @[package.scala 258:25]
  wire  entries_barrier_3_io_y_eff; // @[package.scala 258:25]
  wire  entries_barrier_3_io_y_c; // @[package.scala 258:25]
  wire  entries_barrier_3_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  entries_barrier_4_clock; // @[package.scala 258:25]
  wire  entries_barrier_4_reset; // @[package.scala 258:25]
  wire [19:0] entries_barrier_4_io_x_ppn; // @[package.scala 258:25]
  wire  entries_barrier_4_io_x_u; // @[package.scala 258:25]
  wire  entries_barrier_4_io_x_g; // @[package.scala 258:25]
  wire  entries_barrier_4_io_x_ae; // @[package.scala 258:25]
  wire  entries_barrier_4_io_x_sw; // @[package.scala 258:25]
  wire  entries_barrier_4_io_x_sx; // @[package.scala 258:25]
  wire  entries_barrier_4_io_x_sr; // @[package.scala 258:25]
  wire  entries_barrier_4_io_x_pw; // @[package.scala 258:25]
  wire  entries_barrier_4_io_x_px; // @[package.scala 258:25]
  wire  entries_barrier_4_io_x_pr; // @[package.scala 258:25]
  wire  entries_barrier_4_io_x_ppp; // @[package.scala 258:25]
  wire  entries_barrier_4_io_x_pal; // @[package.scala 258:25]
  wire  entries_barrier_4_io_x_paa; // @[package.scala 258:25]
  wire  entries_barrier_4_io_x_eff; // @[package.scala 258:25]
  wire  entries_barrier_4_io_x_c; // @[package.scala 258:25]
  wire  entries_barrier_4_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] entries_barrier_4_io_y_ppn; // @[package.scala 258:25]
  wire  entries_barrier_4_io_y_u; // @[package.scala 258:25]
  wire  entries_barrier_4_io_y_g; // @[package.scala 258:25]
  wire  entries_barrier_4_io_y_ae; // @[package.scala 258:25]
  wire  entries_barrier_4_io_y_sw; // @[package.scala 258:25]
  wire  entries_barrier_4_io_y_sx; // @[package.scala 258:25]
  wire  entries_barrier_4_io_y_sr; // @[package.scala 258:25]
  wire  entries_barrier_4_io_y_pw; // @[package.scala 258:25]
  wire  entries_barrier_4_io_y_px; // @[package.scala 258:25]
  wire  entries_barrier_4_io_y_pr; // @[package.scala 258:25]
  wire  entries_barrier_4_io_y_ppp; // @[package.scala 258:25]
  wire  entries_barrier_4_io_y_pal; // @[package.scala 258:25]
  wire  entries_barrier_4_io_y_paa; // @[package.scala 258:25]
  wire  entries_barrier_4_io_y_eff; // @[package.scala 258:25]
  wire  entries_barrier_4_io_y_c; // @[package.scala 258:25]
  wire  entries_barrier_4_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  entries_barrier_5_clock; // @[package.scala 258:25]
  wire  entries_barrier_5_reset; // @[package.scala 258:25]
  wire [19:0] entries_barrier_5_io_x_ppn; // @[package.scala 258:25]
  wire  entries_barrier_5_io_x_u; // @[package.scala 258:25]
  wire  entries_barrier_5_io_x_g; // @[package.scala 258:25]
  wire  entries_barrier_5_io_x_ae; // @[package.scala 258:25]
  wire  entries_barrier_5_io_x_sw; // @[package.scala 258:25]
  wire  entries_barrier_5_io_x_sx; // @[package.scala 258:25]
  wire  entries_barrier_5_io_x_sr; // @[package.scala 258:25]
  wire  entries_barrier_5_io_x_pw; // @[package.scala 258:25]
  wire  entries_barrier_5_io_x_px; // @[package.scala 258:25]
  wire  entries_barrier_5_io_x_pr; // @[package.scala 258:25]
  wire  entries_barrier_5_io_x_ppp; // @[package.scala 258:25]
  wire  entries_barrier_5_io_x_pal; // @[package.scala 258:25]
  wire  entries_barrier_5_io_x_paa; // @[package.scala 258:25]
  wire  entries_barrier_5_io_x_eff; // @[package.scala 258:25]
  wire  entries_barrier_5_io_x_c; // @[package.scala 258:25]
  wire  entries_barrier_5_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] entries_barrier_5_io_y_ppn; // @[package.scala 258:25]
  wire  entries_barrier_5_io_y_u; // @[package.scala 258:25]
  wire  entries_barrier_5_io_y_g; // @[package.scala 258:25]
  wire  entries_barrier_5_io_y_ae; // @[package.scala 258:25]
  wire  entries_barrier_5_io_y_sw; // @[package.scala 258:25]
  wire  entries_barrier_5_io_y_sx; // @[package.scala 258:25]
  wire  entries_barrier_5_io_y_sr; // @[package.scala 258:25]
  wire  entries_barrier_5_io_y_pw; // @[package.scala 258:25]
  wire  entries_barrier_5_io_y_px; // @[package.scala 258:25]
  wire  entries_barrier_5_io_y_pr; // @[package.scala 258:25]
  wire  entries_barrier_5_io_y_ppp; // @[package.scala 258:25]
  wire  entries_barrier_5_io_y_pal; // @[package.scala 258:25]
  wire  entries_barrier_5_io_y_paa; // @[package.scala 258:25]
  wire  entries_barrier_5_io_y_eff; // @[package.scala 258:25]
  wire  entries_barrier_5_io_y_c; // @[package.scala 258:25]
  wire  entries_barrier_5_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  normal_entries_barrier_clock; // @[package.scala 258:25]
  wire  normal_entries_barrier_reset; // @[package.scala 258:25]
  wire [19:0] normal_entries_barrier_io_x_ppn; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_x_u; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_x_g; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_x_ae; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_x_sw; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_x_sx; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_x_sr; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_x_pw; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_x_px; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_x_pr; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_x_ppp; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_x_pal; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_x_paa; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_x_eff; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_x_c; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] normal_entries_barrier_io_y_ppn; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_y_u; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_y_g; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_y_ae; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_y_sw; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_y_sx; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_y_sr; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_y_pw; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_y_px; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_y_pr; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_y_ppp; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_y_pal; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_y_paa; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_y_eff; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_y_c; // @[package.scala 258:25]
  wire  normal_entries_barrier_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_clock; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_reset; // @[package.scala 258:25]
  wire [19:0] normal_entries_barrier_1_io_x_ppn; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_x_u; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_x_g; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_x_ae; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_x_sw; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_x_sx; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_x_sr; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_x_pw; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_x_px; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_x_pr; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_x_ppp; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_x_pal; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_x_paa; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_x_eff; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_x_c; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] normal_entries_barrier_1_io_y_ppn; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_y_u; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_y_g; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_y_ae; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_y_sw; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_y_sx; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_y_sr; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_y_pw; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_y_px; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_y_pr; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_y_ppp; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_y_pal; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_y_paa; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_y_eff; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_y_c; // @[package.scala 258:25]
  wire  normal_entries_barrier_1_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_clock; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_reset; // @[package.scala 258:25]
  wire [19:0] normal_entries_barrier_2_io_x_ppn; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_x_u; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_x_g; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_x_ae; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_x_sw; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_x_sx; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_x_sr; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_x_pw; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_x_px; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_x_pr; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_x_ppp; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_x_pal; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_x_paa; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_x_eff; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_x_c; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] normal_entries_barrier_2_io_y_ppn; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_y_u; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_y_g; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_y_ae; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_y_sw; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_y_sx; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_y_sr; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_y_pw; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_y_px; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_y_pr; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_y_ppp; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_y_pal; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_y_paa; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_y_eff; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_y_c; // @[package.scala 258:25]
  wire  normal_entries_barrier_2_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_clock; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_reset; // @[package.scala 258:25]
  wire [19:0] normal_entries_barrier_3_io_x_ppn; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_x_u; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_x_g; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_x_ae; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_x_sw; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_x_sx; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_x_sr; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_x_pw; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_x_px; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_x_pr; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_x_ppp; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_x_pal; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_x_paa; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_x_eff; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_x_c; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] normal_entries_barrier_3_io_y_ppn; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_y_u; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_y_g; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_y_ae; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_y_sw; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_y_sx; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_y_sr; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_y_pw; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_y_px; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_y_pr; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_y_ppp; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_y_pal; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_y_paa; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_y_eff; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_y_c; // @[package.scala 258:25]
  wire  normal_entries_barrier_3_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_clock; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_reset; // @[package.scala 258:25]
  wire [19:0] normal_entries_barrier_4_io_x_ppn; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_x_u; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_x_g; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_x_ae; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_x_sw; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_x_sx; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_x_sr; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_x_pw; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_x_px; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_x_pr; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_x_ppp; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_x_pal; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_x_paa; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_x_eff; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_x_c; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_x_fragmented_superpage; // @[package.scala 258:25]
  wire [19:0] normal_entries_barrier_4_io_y_ppn; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_y_u; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_y_g; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_y_ae; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_y_sw; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_y_sx; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_y_sr; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_y_pw; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_y_px; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_y_pr; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_y_ppp; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_y_pal; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_y_paa; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_y_eff; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_y_c; // @[package.scala 258:25]
  wire  normal_entries_barrier_4_io_y_fragmented_superpage; // @[package.scala 258:25]
  wire [26:0] vpn = io_req_bits_vaddr[38:12]; // @[TLB.scala 163:30]
  reg [26:0] sectored_entries_0_0_tag; // @[TLB.scala 165:29]
  reg [34:0] sectored_entries_0_0_data_0; // @[TLB.scala 165:29]
  reg [34:0] sectored_entries_0_0_data_1; // @[TLB.scala 165:29]
  reg [34:0] sectored_entries_0_0_data_2; // @[TLB.scala 165:29]
  reg [34:0] sectored_entries_0_0_data_3; // @[TLB.scala 165:29]
  reg  sectored_entries_0_0_valid_0; // @[TLB.scala 165:29]
  reg  sectored_entries_0_0_valid_1; // @[TLB.scala 165:29]
  reg  sectored_entries_0_0_valid_2; // @[TLB.scala 165:29]
  reg  sectored_entries_0_0_valid_3; // @[TLB.scala 165:29]
  reg [1:0] superpage_entries_0_level; // @[TLB.scala 166:30]
  reg [26:0] superpage_entries_0_tag; // @[TLB.scala 166:30]
  reg [34:0] superpage_entries_0_data_0; // @[TLB.scala 166:30]
  reg  superpage_entries_0_valid_0; // @[TLB.scala 166:30]
  reg [1:0] superpage_entries_1_level; // @[TLB.scala 166:30]
  reg [26:0] superpage_entries_1_tag; // @[TLB.scala 166:30]
  reg [34:0] superpage_entries_1_data_0; // @[TLB.scala 166:30]
  reg  superpage_entries_1_valid_0; // @[TLB.scala 166:30]
  reg [1:0] superpage_entries_2_level; // @[TLB.scala 166:30]
  reg [26:0] superpage_entries_2_tag; // @[TLB.scala 166:30]
  reg [34:0] superpage_entries_2_data_0; // @[TLB.scala 166:30]
  reg  superpage_entries_2_valid_0; // @[TLB.scala 166:30]
  reg [1:0] superpage_entries_3_level; // @[TLB.scala 166:30]
  reg [26:0] superpage_entries_3_tag; // @[TLB.scala 166:30]
  reg [34:0] superpage_entries_3_data_0; // @[TLB.scala 166:30]
  reg  superpage_entries_3_valid_0; // @[TLB.scala 166:30]
  reg [1:0] special_entry_level; // @[TLB.scala 167:56]
  reg [26:0] special_entry_tag; // @[TLB.scala 167:56]
  reg [34:0] special_entry_data_0; // @[TLB.scala 167:56]
  reg  special_entry_valid_0; // @[TLB.scala 167:56]
  reg [1:0] state; // @[TLB.scala 173:18]
  reg [26:0] r_refill_tag; // @[TLB.scala 174:25]
  reg [1:0] r_superpage_repl_addr; // @[TLB.scala 175:34]
  reg  r_sectored_hit; // @[TLB.scala 178:27]
  wire  priv_s = io_ptw_status_prv[0]; // @[TLB.scala 181:20]
  wire  priv_uses_vm = io_ptw_status_prv <= 2'h1; // @[TLB.scala 182:27]
  wire  vm_enabled = io_ptw_ptbr_mode[3] & priv_uses_vm & ~io_req_bits_passthrough; // @[TLB.scala 183:99]
  wire [19:0] refill_ppn = io_ptw_resp_bits_pte_ppn[19:0]; // @[TLB.scala 186:44]
  wire  _invalidate_refill_T = state == 2'h1; // @[package.scala 15:47]
  wire  _invalidate_refill_T_1 = state == 2'h3; // @[package.scala 15:47]
  wire  _invalidate_refill_T_2 = _invalidate_refill_T | _invalidate_refill_T_1; // @[package.scala 72:59]
  wire  invalidate_refill = _invalidate_refill_T_2 | io_sfence_valid; // @[TLB.scala 188:88]
  wire [1:0] mpu_ppn_hi = mpu_ppn_data_barrier_io_y_ppn[19:18]; // @[TLB.scala 106:26]
  wire  mpu_ppn_ignore = special_entry_level < 2'h1; // @[TLB.scala 108:28]
  wire [26:0] _mpu_ppn_T_1 = mpu_ppn_ignore ? vpn : 27'h0; // @[TLB.scala 109:28]
  wire [26:0] _GEN_227 = {{7'd0}, mpu_ppn_data_barrier_io_y_ppn}; // @[TLB.scala 109:47]
  wire [26:0] _mpu_ppn_T_2 = _mpu_ppn_T_1 | _GEN_227; // @[TLB.scala 109:47]
  wire [8:0] mpu_ppn_lo = _mpu_ppn_T_2[17:9]; // @[TLB.scala 109:58]
  wire  mpu_ppn_ignore_1 = special_entry_level < 2'h2; // @[TLB.scala 108:28]
  wire [26:0] _mpu_ppn_T_3 = mpu_ppn_ignore_1 ? vpn : 27'h0; // @[TLB.scala 109:28]
  wire [26:0] _mpu_ppn_T_4 = _mpu_ppn_T_3 | _GEN_227; // @[TLB.scala 109:47]
  wire [8:0] mpu_ppn_lo_1 = _mpu_ppn_T_4[8:0]; // @[TLB.scala 109:58]
  wire [19:0] _mpu_ppn_T_5 = {mpu_ppn_hi,mpu_ppn_lo,mpu_ppn_lo_1}; // @[Cat.scala 30:58]
  wire [27:0] _mpu_ppn_T_7 = vm_enabled ? {{8'd0}, _mpu_ppn_T_5} : io_req_bits_vaddr[39:12]; // @[TLB.scala 190:20]
  wire [27:0] mpu_ppn = io_ptw_resp_valid ? {{8'd0}, refill_ppn} : _mpu_ppn_T_7; // @[TLB.scala 189:20]
  wire [11:0] mpu_physaddr_lo = io_req_bits_vaddr[11:0]; // @[TLB.scala 191:52]
  wire [39:0] mpu_physaddr = {mpu_ppn,mpu_physaddr_lo}; // @[Cat.scala 30:58]
  wire [2:0] _mpu_priv_T_2 = {io_ptw_status_debug,io_ptw_status_prv}; // @[Cat.scala 30:58]
  wire [2:0] mpu_priv = io_ptw_resp_valid | io_req_bits_passthrough ? 3'h1 : _mpu_priv_T_2; // @[TLB.scala 192:27]
  wire [39:0] _legal_address_T = mpu_physaddr ^ 40'h3000; // @[Parameters.scala 137:31]
  wire [40:0] _legal_address_T_1 = {1'b0,$signed(_legal_address_T)}; // @[Parameters.scala 137:49]
  wire [40:0] _legal_address_T_3 = $signed(_legal_address_T_1) & -41'sh1000; // @[Parameters.scala 137:52]
  wire  _legal_address_T_4 = $signed(_legal_address_T_3) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] _legal_address_T_5 = mpu_physaddr ^ 40'h4000; // @[Parameters.scala 137:31]
  wire [40:0] _legal_address_T_6 = {1'b0,$signed(_legal_address_T_5)}; // @[Parameters.scala 137:49]
  wire [40:0] _legal_address_T_8 = $signed(_legal_address_T_6) & -41'sh1000; // @[Parameters.scala 137:52]
  wire  _legal_address_T_9 = $signed(_legal_address_T_8) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] _legal_address_T_10 = mpu_physaddr ^ 40'h54000000; // @[Parameters.scala 137:31]
  wire [40:0] _legal_address_T_11 = {1'b0,$signed(_legal_address_T_10)}; // @[Parameters.scala 137:49]
  wire [40:0] _legal_address_T_13 = $signed(_legal_address_T_11) & -41'sh1000; // @[Parameters.scala 137:52]
  wire  _legal_address_T_14 = $signed(_legal_address_T_13) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] _legal_address_T_15 = mpu_physaddr ^ 40'h100000; // @[Parameters.scala 137:31]
  wire [40:0] _legal_address_T_16 = {1'b0,$signed(_legal_address_T_15)}; // @[Parameters.scala 137:49]
  wire [40:0] _legal_address_T_18 = $signed(_legal_address_T_16) & -41'sh1000; // @[Parameters.scala 137:52]
  wire  _legal_address_T_19 = $signed(_legal_address_T_18) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] _legal_address_T_20 = mpu_physaddr ^ 40'hc000000; // @[Parameters.scala 137:31]
  wire [40:0] _legal_address_T_21 = {1'b0,$signed(_legal_address_T_20)}; // @[Parameters.scala 137:49]
  wire [40:0] _legal_address_T_23 = $signed(_legal_address_T_21) & -41'sh4000000; // @[Parameters.scala 137:52]
  wire  _legal_address_T_24 = $signed(_legal_address_T_23) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] _legal_address_T_25 = mpu_physaddr ^ 40'h2000000; // @[Parameters.scala 137:31]
  wire [40:0] _legal_address_T_26 = {1'b0,$signed(_legal_address_T_25)}; // @[Parameters.scala 137:49]
  wire [40:0] _legal_address_T_28 = $signed(_legal_address_T_26) & -41'sh10000; // @[Parameters.scala 137:52]
  wire  _legal_address_T_29 = $signed(_legal_address_T_28) == 41'sh0; // @[Parameters.scala 137:67]
  wire [40:0] _legal_address_T_31 = {1'b0,$signed(mpu_physaddr)}; // @[Parameters.scala 137:49]
  wire [40:0] _legal_address_T_33 = $signed(_legal_address_T_31) & -41'sh1000; // @[Parameters.scala 137:52]
  wire  _legal_address_T_34 = $signed(_legal_address_T_33) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] _legal_address_T_35 = mpu_physaddr ^ 40'h10000; // @[Parameters.scala 137:31]
  wire [40:0] _legal_address_T_36 = {1'b0,$signed(_legal_address_T_35)}; // @[Parameters.scala 137:49]
  wire [40:0] _legal_address_T_38 = $signed(_legal_address_T_36) & -41'sh10000; // @[Parameters.scala 137:52]
  wire  _legal_address_T_39 = $signed(_legal_address_T_38) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] _legal_address_T_40 = mpu_physaddr ^ 40'h80000000; // @[Parameters.scala 137:31]
  wire [40:0] _legal_address_T_41 = {1'b0,$signed(_legal_address_T_40)}; // @[Parameters.scala 137:49]
  wire [40:0] _legal_address_T_43 = $signed(_legal_address_T_41) & -41'sh10000000; // @[Parameters.scala 137:52]
  wire  _legal_address_T_44 = $signed(_legal_address_T_43) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] _legal_address_T_45 = mpu_physaddr ^ 40'h10000000; // @[Parameters.scala 137:31]
  wire [40:0] _legal_address_T_46 = {1'b0,$signed(_legal_address_T_45)}; // @[Parameters.scala 137:49]
  wire [40:0] _legal_address_T_48 = $signed(_legal_address_T_46) & -41'sh1000; // @[Parameters.scala 137:52]
  wire  _legal_address_T_49 = $signed(_legal_address_T_48) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] _legal_address_T_50 = mpu_physaddr ^ 40'h20000; // @[Parameters.scala 137:31]
  wire [40:0] _legal_address_T_51 = {1'b0,$signed(_legal_address_T_50)}; // @[Parameters.scala 137:49]
  wire [40:0] _legal_address_T_53 = $signed(_legal_address_T_51) & -41'sh10000; // @[Parameters.scala 137:52]
  wire  _legal_address_T_54 = $signed(_legal_address_T_53) == 41'sh0; // @[Parameters.scala 137:67]
  wire  legal_address = _legal_address_T_4 | _legal_address_T_9 | _legal_address_T_14 | _legal_address_T_19 |
    _legal_address_T_24 | _legal_address_T_29 | _legal_address_T_34 | _legal_address_T_39 | _legal_address_T_44 |
    _legal_address_T_49 | _legal_address_T_54; // @[TLB.scala 198:67]
  wire [39:0] _cacheable_T_5 = mpu_physaddr ^ 40'h14000000; // @[Parameters.scala 137:31]
  wire [40:0] _cacheable_T_6 = {1'b0,$signed(_cacheable_T_5)}; // @[Parameters.scala 137:49]
  wire [40:0] _cacheable_T_14 = $signed(_legal_address_T_46) & 41'sh94000000; // @[Parameters.scala 137:52]
  wire  _cacheable_T_15 = $signed(_cacheable_T_14) == 41'sh0; // @[Parameters.scala 137:67]
  wire [40:0] _cacheable_T_19 = $signed(_legal_address_T_41) & 41'sh90000000; // @[Parameters.scala 137:52]
  wire  _cacheable_T_20 = $signed(_cacheable_T_19) == 41'sh0; // @[Parameters.scala 137:67]
  wire  _cacheable_T_21 = _cacheable_T_15 | _cacheable_T_20; // @[Parameters.scala 615:89]
  wire  cacheable = legal_address & _cacheable_T_21; // @[TLB.scala 200:19]
  wire [40:0] _homogeneous_T_76 = $signed(_legal_address_T_31) & 41'sh86134000; // @[Parameters.scala 137:52]
  wire  _homogeneous_T_77 = $signed(_homogeneous_T_76) == 41'sh0; // @[Parameters.scala 137:67]
  wire [40:0] _homogeneous_T_81 = $signed(_legal_address_T_36) & 41'sh96130000; // @[Parameters.scala 137:52]
  wire  _homogeneous_T_82 = $signed(_homogeneous_T_81) == 41'sh0; // @[Parameters.scala 137:67]
  wire [40:0] _homogeneous_T_86 = $signed(_legal_address_T_51) & 41'sh96130000; // @[Parameters.scala 137:52]
  wire  _homogeneous_T_87 = $signed(_homogeneous_T_86) == 41'sh0; // @[Parameters.scala 137:67]
  wire  _homogeneous_T_96 = _homogeneous_T_77 | _homogeneous_T_82 | _homogeneous_T_87 | _cacheable_T_20; // @[TLBPermissions.scala 82:66]
  wire  deny_access_to_debug = mpu_priv <= 3'h3 & _legal_address_T_34; // @[TLB.scala 203:48]
  wire  _prot_r_T_6 = ~deny_access_to_debug; // @[TLB.scala 204:44]
  wire  prot_r = legal_address & ~deny_access_to_debug & pmp_io_r; // @[TLB.scala 204:66]
  wire [40:0] _prot_w_T_3 = $signed(_legal_address_T_31) & 41'sh9a030000; // @[Parameters.scala 137:52]
  wire  _prot_w_T_4 = $signed(_prot_w_T_3) == 41'sh0; // @[Parameters.scala 137:67]
  wire [40:0] _prot_w_T_8 = $signed(_legal_address_T_26) & 41'sh9a130000; // @[Parameters.scala 137:52]
  wire  _prot_w_T_9 = $signed(_prot_w_T_8) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] _prot_w_T_10 = mpu_physaddr ^ 40'h8000000; // @[Parameters.scala 137:31]
  wire [40:0] _prot_w_T_11 = {1'b0,$signed(_prot_w_T_10)}; // @[Parameters.scala 137:49]
  wire [40:0] _prot_w_T_13 = $signed(_prot_w_T_11) & 41'sh98000000; // @[Parameters.scala 137:52]
  wire  _prot_w_T_14 = $signed(_prot_w_T_13) == 41'sh0; // @[Parameters.scala 137:67]
  wire [40:0] _prot_w_T_18 = $signed(_legal_address_T_46) & 41'sh9a130000; // @[Parameters.scala 137:52]
  wire  _prot_w_T_19 = $signed(_prot_w_T_18) == 41'sh0; // @[Parameters.scala 137:67]
  wire  _prot_w_T_28 = _prot_w_T_4 | _prot_w_T_9 | _prot_w_T_14 | _prot_w_T_19 | _cacheable_T_20; // @[Parameters.scala 615:89]
  wire  _prot_w_T_43 = legal_address & _prot_w_T_28; // @[TLB.scala 200:19]
  wire  prot_w = _prot_w_T_43 & _prot_r_T_6 & pmp_io_w; // @[TLB.scala 205:70]
  wire [40:0] _prot_al_T_3 = $signed(_legal_address_T_31) & 41'sh96030000; // @[Parameters.scala 137:52]
  wire  _prot_al_T_4 = $signed(_prot_al_T_3) == 41'sh0; // @[Parameters.scala 137:67]
  wire [40:0] _prot_al_T_8 = $signed(_legal_address_T_26) & 41'sh96130000; // @[Parameters.scala 137:52]
  wire  _prot_al_T_9 = $signed(_prot_al_T_8) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] _prot_al_T_10 = mpu_physaddr ^ 40'h4000000; // @[Parameters.scala 137:31]
  wire [40:0] _prot_al_T_11 = {1'b0,$signed(_prot_al_T_10)}; // @[Parameters.scala 137:49]
  wire [40:0] _prot_al_T_13 = $signed(_prot_al_T_11) & 41'sh94000000; // @[Parameters.scala 137:52]
  wire  _prot_al_T_14 = $signed(_prot_al_T_13) == 41'sh0; // @[Parameters.scala 137:67]
  wire [40:0] _prot_al_T_18 = $signed(_cacheable_T_6) & 41'sh96130000; // @[Parameters.scala 137:52]
  wire  _prot_al_T_19 = $signed(_prot_al_T_18) == 41'sh0; // @[Parameters.scala 137:67]
  wire  _prot_al_T_22 = _prot_al_T_4 | _prot_al_T_9 | _prot_al_T_14 | _prot_al_T_19; // @[Parameters.scala 615:89]
  wire  prot_al = legal_address & _prot_al_T_22; // @[TLB.scala 200:19]
  wire  _prot_x_T_55 = legal_address & _homogeneous_T_96; // @[TLB.scala 200:19]
  wire  prot_x = _prot_x_T_55 & _prot_r_T_6 & pmp_io_x; // @[TLB.scala 209:65]
  wire [40:0] _prot_eff_T_32 = $signed(_legal_address_T_31) & 41'sh96032000; // @[Parameters.scala 137:52]
  wire  _prot_eff_T_33 = $signed(_prot_eff_T_32) == 41'sh0; // @[Parameters.scala 137:67]
  wire [40:0] _prot_eff_T_47 = $signed(_cacheable_T_6) & 41'sh96132000; // @[Parameters.scala 137:52]
  wire  _prot_eff_T_48 = $signed(_prot_eff_T_47) == 41'sh0; // @[Parameters.scala 137:67]
  wire  _prot_eff_T_51 = _prot_eff_T_33 | _prot_al_T_9 | _prot_al_T_14 | _prot_eff_T_48; // @[Parameters.scala 615:89]
  wire  prot_eff = legal_address & _prot_eff_T_51; // @[TLB.scala 200:19]
  wire  _sector_hits_T_2 = sectored_entries_0_0_valid_0 | sectored_entries_0_0_valid_1 | sectored_entries_0_0_valid_2 |
    sectored_entries_0_0_valid_3; // @[package.scala 72:59]
  wire [26:0] _sector_hits_T_3 = sectored_entries_0_0_tag ^ vpn; // @[TLB.scala 88:41]
  wire  _sector_hits_T_5 = _sector_hits_T_3[26:2] == 25'h0; // @[TLB.scala 88:66]
  wire  sector_hits_0 = _sector_hits_T_2 & _sector_hits_T_5; // @[TLB.scala 87:40]
  wire  superpage_hits_ignore_1 = superpage_entries_0_level < 2'h1; // @[TLB.scala 94:28]
  wire  superpage_hits_0 = superpage_entries_0_valid_0 & superpage_entries_0_tag[26:18] == vpn[26:18] & (
    superpage_hits_ignore_1 | superpage_entries_0_tag[17:9] == vpn[17:9]); // @[TLB.scala 95:29]
  wire  superpage_hits_ignore_4 = superpage_entries_1_level < 2'h1; // @[TLB.scala 94:28]
  wire  superpage_hits_1 = superpage_entries_1_valid_0 & superpage_entries_1_tag[26:18] == vpn[26:18] & (
    superpage_hits_ignore_4 | superpage_entries_1_tag[17:9] == vpn[17:9]); // @[TLB.scala 95:29]
  wire  superpage_hits_ignore_7 = superpage_entries_2_level < 2'h1; // @[TLB.scala 94:28]
  wire  superpage_hits_2 = superpage_entries_2_valid_0 & superpage_entries_2_tag[26:18] == vpn[26:18] & (
    superpage_hits_ignore_7 | superpage_entries_2_tag[17:9] == vpn[17:9]); // @[TLB.scala 95:29]
  wire  superpage_hits_ignore_10 = superpage_entries_3_level < 2'h1; // @[TLB.scala 94:28]
  wire  superpage_hits_3 = superpage_entries_3_valid_0 & superpage_entries_3_tag[26:18] == vpn[26:18] & (
    superpage_hits_ignore_10 | superpage_entries_3_tag[17:9] == vpn[17:9]); // @[TLB.scala 95:29]
  wire [1:0] hitsVec_idx = vpn[1:0]; // @[package.scala 154:13]
  wire  _GEN_1 = 2'h1 == hitsVec_idx ? sectored_entries_0_0_valid_1 : sectored_entries_0_0_valid_0; // @[TLB.scala 100:18 TLB.scala 100:18]
  wire  _GEN_2 = 2'h2 == hitsVec_idx ? sectored_entries_0_0_valid_2 : _GEN_1; // @[TLB.scala 100:18 TLB.scala 100:18]
  wire  _GEN_3 = 2'h3 == hitsVec_idx ? sectored_entries_0_0_valid_3 : _GEN_2; // @[TLB.scala 100:18 TLB.scala 100:18]
  wire  _hitsVec_T_3 = _GEN_3 & _sector_hits_T_5; // @[TLB.scala 100:18]
  wire  hitsVec_0 = vm_enabled & _hitsVec_T_3; // @[TLB.scala 214:44]
  wire  hitsVec_1 = vm_enabled & superpage_hits_0; // @[TLB.scala 214:44]
  wire  hitsVec_2 = vm_enabled & superpage_hits_1; // @[TLB.scala 214:44]
  wire  hitsVec_3 = vm_enabled & superpage_hits_2; // @[TLB.scala 214:44]
  wire  hitsVec_4 = vm_enabled & superpage_hits_3; // @[TLB.scala 214:44]
  wire  _hitsVec_T_78 = special_entry_valid_0 & special_entry_tag[26:18] == vpn[26:18] & (mpu_ppn_ignore |
    special_entry_tag[17:9] == vpn[17:9]) & (mpu_ppn_ignore_1 | special_entry_tag[8:0] == vpn[8:0]); // @[TLB.scala 95:29]
  wire  hitsVec_5 = vm_enabled & _hitsVec_T_78; // @[TLB.scala 214:44]
  wire [5:0] real_hits = {hitsVec_5,hitsVec_4,hitsVec_3,hitsVec_2,hitsVec_1,hitsVec_0}; // @[Cat.scala 30:58]
  wire  hits_hi = ~vm_enabled; // @[TLB.scala 216:18]
  wire [6:0] hits = {hits_hi,hitsVec_5,hitsVec_4,hitsVec_3,hitsVec_2,hitsVec_1,hitsVec_0}; // @[Cat.scala 30:58]
  wire [34:0] _GEN_5 = 2'h1 == hitsVec_idx ? sectored_entries_0_0_data_1 : sectored_entries_0_0_data_0; // @[]
  wire [34:0] _GEN_6 = 2'h2 == hitsVec_idx ? sectored_entries_0_0_data_2 : _GEN_5; // @[]
  wire [34:0] _GEN_7 = 2'h3 == hitsVec_idx ? sectored_entries_0_0_data_3 : _GEN_6; // @[]
  wire [1:0] ppn_hi = ppn_data_barrier_1_io_y_ppn[19:18]; // @[TLB.scala 106:26]
  wire [26:0] _ppn_T_1 = superpage_hits_ignore_1 ? vpn : 27'h0; // @[TLB.scala 109:28]
  wire [26:0] _GEN_229 = {{7'd0}, ppn_data_barrier_1_io_y_ppn}; // @[TLB.scala 109:47]
  wire [26:0] _ppn_T_2 = _ppn_T_1 | _GEN_229; // @[TLB.scala 109:47]
  wire [8:0] ppn_lo = _ppn_T_2[17:9]; // @[TLB.scala 109:58]
  wire [26:0] _ppn_T_4 = vpn | _GEN_229; // @[TLB.scala 109:47]
  wire [8:0] ppn_lo_1 = _ppn_T_4[8:0]; // @[TLB.scala 109:58]
  wire [19:0] _ppn_T_5 = {ppn_hi,ppn_lo,ppn_lo_1}; // @[Cat.scala 30:58]
  wire [1:0] ppn_hi_2 = ppn_data_barrier_2_io_y_ppn[19:18]; // @[TLB.scala 106:26]
  wire [26:0] _ppn_T_6 = superpage_hits_ignore_4 ? vpn : 27'h0; // @[TLB.scala 109:28]
  wire [26:0] _GEN_231 = {{7'd0}, ppn_data_barrier_2_io_y_ppn}; // @[TLB.scala 109:47]
  wire [26:0] _ppn_T_7 = _ppn_T_6 | _GEN_231; // @[TLB.scala 109:47]
  wire [8:0] ppn_lo_2 = _ppn_T_7[17:9]; // @[TLB.scala 109:58]
  wire [26:0] _ppn_T_9 = vpn | _GEN_231; // @[TLB.scala 109:47]
  wire [8:0] ppn_lo_3 = _ppn_T_9[8:0]; // @[TLB.scala 109:58]
  wire [19:0] _ppn_T_10 = {ppn_hi_2,ppn_lo_2,ppn_lo_3}; // @[Cat.scala 30:58]
  wire [1:0] ppn_hi_4 = ppn_data_barrier_3_io_y_ppn[19:18]; // @[TLB.scala 106:26]
  wire [26:0] _ppn_T_11 = superpage_hits_ignore_7 ? vpn : 27'h0; // @[TLB.scala 109:28]
  wire [26:0] _GEN_233 = {{7'd0}, ppn_data_barrier_3_io_y_ppn}; // @[TLB.scala 109:47]
  wire [26:0] _ppn_T_12 = _ppn_T_11 | _GEN_233; // @[TLB.scala 109:47]
  wire [8:0] ppn_lo_4 = _ppn_T_12[17:9]; // @[TLB.scala 109:58]
  wire [26:0] _ppn_T_14 = vpn | _GEN_233; // @[TLB.scala 109:47]
  wire [8:0] ppn_lo_5 = _ppn_T_14[8:0]; // @[TLB.scala 109:58]
  wire [19:0] _ppn_T_15 = {ppn_hi_4,ppn_lo_4,ppn_lo_5}; // @[Cat.scala 30:58]
  wire [1:0] ppn_hi_6 = ppn_data_barrier_4_io_y_ppn[19:18]; // @[TLB.scala 106:26]
  wire [26:0] _ppn_T_16 = superpage_hits_ignore_10 ? vpn : 27'h0; // @[TLB.scala 109:28]
  wire [26:0] _GEN_235 = {{7'd0}, ppn_data_barrier_4_io_y_ppn}; // @[TLB.scala 109:47]
  wire [26:0] _ppn_T_17 = _ppn_T_16 | _GEN_235; // @[TLB.scala 109:47]
  wire [8:0] ppn_lo_6 = _ppn_T_17[17:9]; // @[TLB.scala 109:58]
  wire [26:0] _ppn_T_19 = vpn | _GEN_235; // @[TLB.scala 109:47]
  wire [8:0] ppn_lo_7 = _ppn_T_19[8:0]; // @[TLB.scala 109:58]
  wire [19:0] _ppn_T_20 = {ppn_hi_6,ppn_lo_6,ppn_lo_7}; // @[Cat.scala 30:58]
  wire [1:0] ppn_hi_8 = ppn_data_barrier_5_io_y_ppn[19:18]; // @[TLB.scala 106:26]
  wire [26:0] _GEN_237 = {{7'd0}, ppn_data_barrier_5_io_y_ppn}; // @[TLB.scala 109:47]
  wire [26:0] _ppn_T_22 = _mpu_ppn_T_1 | _GEN_237; // @[TLB.scala 109:47]
  wire [8:0] ppn_lo_8 = _ppn_T_22[17:9]; // @[TLB.scala 109:58]
  wire [26:0] _ppn_T_24 = _mpu_ppn_T_3 | _GEN_237; // @[TLB.scala 109:47]
  wire [8:0] ppn_lo_9 = _ppn_T_24[8:0]; // @[TLB.scala 109:58]
  wire [19:0] _ppn_T_25 = {ppn_hi_8,ppn_lo_8,ppn_lo_9}; // @[Cat.scala 30:58]
  wire [19:0] _ppn_T_27 = hitsVec_0 ? ppn_data_barrier_io_y_ppn : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _ppn_T_28 = hitsVec_1 ? _ppn_T_5 : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _ppn_T_29 = hitsVec_2 ? _ppn_T_10 : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _ppn_T_30 = hitsVec_3 ? _ppn_T_15 : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _ppn_T_31 = hitsVec_4 ? _ppn_T_20 : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _ppn_T_32 = hitsVec_5 ? _ppn_T_25 : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _ppn_T_33 = hits_hi ? vpn[19:0] : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _ppn_T_34 = _ppn_T_27 | _ppn_T_28; // @[Mux.scala 27:72]
  wire [19:0] _ppn_T_35 = _ppn_T_34 | _ppn_T_29; // @[Mux.scala 27:72]
  wire [19:0] _ppn_T_36 = _ppn_T_35 | _ppn_T_30; // @[Mux.scala 27:72]
  wire [19:0] _ppn_T_37 = _ppn_T_36 | _ppn_T_31; // @[Mux.scala 27:72]
  wire [19:0] _ppn_T_38 = _ppn_T_37 | _ppn_T_32; // @[Mux.scala 27:72]
  wire [19:0] ppn = _ppn_T_38 | _ppn_T_33; // @[Mux.scala 27:72]
  wire  newEntry_g = io_ptw_resp_bits_pte_g & io_ptw_resp_bits_pte_v; // @[TLB.scala 226:25]
  wire  _newEntry_sr_T_4 = io_ptw_resp_bits_pte_v & (io_ptw_resp_bits_pte_r | io_ptw_resp_bits_pte_x & ~
    io_ptw_resp_bits_pte_w) & io_ptw_resp_bits_pte_a; // @[PTW.scala 73:52]
  wire  newEntry_sr = _newEntry_sr_T_4 & io_ptw_resp_bits_pte_r; // @[PTW.scala 77:35]
  wire  newEntry_sw = _newEntry_sr_T_4 & io_ptw_resp_bits_pte_w & io_ptw_resp_bits_pte_d; // @[PTW.scala 78:40]
  wire  newEntry_sx = _newEntry_sr_T_4 & io_ptw_resp_bits_pte_x; // @[PTW.scala 79:35]
  wire [7:0] special_entry_data_0_lo = {prot_x,prot_r,_prot_w_T_43,prot_al,prot_al,prot_eff,cacheable,
    io_ptw_resp_bits_fragmented_superpage}; // @[TLB.scala 123:24]
  wire [34:0] _special_entry_data_0_T = {refill_ppn,io_ptw_resp_bits_pte_u,newEntry_g,io_ptw_resp_bits_ae,newEntry_sw,
    newEntry_sx,newEntry_sr,prot_w,special_entry_data_0_lo}; // @[TLB.scala 123:24]
  wire  _GEN_8 = invalidate_refill ? 1'h0 : 1'h1; // @[TLB.scala 243:34 TLB.scala 126:46 TLB.scala 122:16]
  wire  _GEN_11 = r_superpage_repl_addr == 2'h0 ? _GEN_8 : superpage_entries_0_valid_0; // @[TLB.scala 246:89 TLB.scala 166:30]
  wire  _GEN_15 = r_superpage_repl_addr == 2'h1 ? _GEN_8 : superpage_entries_1_valid_0; // @[TLB.scala 246:89 TLB.scala 166:30]
  wire  _GEN_19 = r_superpage_repl_addr == 2'h2 ? _GEN_8 : superpage_entries_2_valid_0; // @[TLB.scala 246:89 TLB.scala 166:30]
  wire  _GEN_23 = r_superpage_repl_addr == 2'h3 ? _GEN_8 : superpage_entries_3_valid_0; // @[TLB.scala 246:89 TLB.scala 166:30]
  wire  _GEN_25 = ~r_sectored_hit ? 1'h0 : sectored_entries_0_0_valid_0; // @[TLB.scala 254:32 TLB.scala 126:46 TLB.scala 165:29]
  wire  _GEN_26 = ~r_sectored_hit ? 1'h0 : sectored_entries_0_0_valid_1; // @[TLB.scala 254:32 TLB.scala 126:46 TLB.scala 165:29]
  wire  _GEN_27 = ~r_sectored_hit ? 1'h0 : sectored_entries_0_0_valid_2; // @[TLB.scala 254:32 TLB.scala 126:46 TLB.scala 165:29]
  wire  _GEN_28 = ~r_sectored_hit ? 1'h0 : sectored_entries_0_0_valid_3; // @[TLB.scala 254:32 TLB.scala 126:46 TLB.scala 165:29]
  wire [1:0] idx = r_refill_tag[1:0]; // @[package.scala 154:13]
  wire  _GEN_29 = 2'h0 == idx | _GEN_25; // @[TLB.scala 122:16 TLB.scala 122:16]
  wire  _GEN_30 = 2'h1 == idx | _GEN_26; // @[TLB.scala 122:16 TLB.scala 122:16]
  wire  _GEN_31 = 2'h2 == idx | _GEN_27; // @[TLB.scala 122:16 TLB.scala 122:16]
  wire  _GEN_32 = 2'h3 == idx | _GEN_28; // @[TLB.scala 122:16 TLB.scala 122:16]
  wire  _GEN_37 = invalidate_refill ? 1'h0 : _GEN_29; // @[TLB.scala 256:34 TLB.scala 126:46]
  wire  _GEN_38 = invalidate_refill ? 1'h0 : _GEN_30; // @[TLB.scala 256:34 TLB.scala 126:46]
  wire  _GEN_39 = invalidate_refill ? 1'h0 : _GEN_31; // @[TLB.scala 256:34 TLB.scala 126:46]
  wire  _GEN_40 = invalidate_refill ? 1'h0 : _GEN_32; // @[TLB.scala 256:34 TLB.scala 126:46]
  wire  _GEN_53 = io_ptw_resp_bits_level < 2'h2 ? _GEN_11 : superpage_entries_0_valid_0; // @[TLB.scala 245:54 TLB.scala 166:30]
  wire  _GEN_57 = io_ptw_resp_bits_level < 2'h2 ? _GEN_15 : superpage_entries_1_valid_0; // @[TLB.scala 245:54 TLB.scala 166:30]
  wire  _GEN_61 = io_ptw_resp_bits_level < 2'h2 ? _GEN_19 : superpage_entries_2_valid_0; // @[TLB.scala 245:54 TLB.scala 166:30]
  wire  _GEN_65 = io_ptw_resp_bits_level < 2'h2 ? _GEN_23 : superpage_entries_3_valid_0; // @[TLB.scala 245:54 TLB.scala 166:30]
  wire  _GEN_67 = io_ptw_resp_bits_level < 2'h2 ? sectored_entries_0_0_valid_0 : _GEN_37; // @[TLB.scala 245:54 TLB.scala 165:29]
  wire  _GEN_68 = io_ptw_resp_bits_level < 2'h2 ? sectored_entries_0_0_valid_1 : _GEN_38; // @[TLB.scala 245:54 TLB.scala 165:29]
  wire  _GEN_69 = io_ptw_resp_bits_level < 2'h2 ? sectored_entries_0_0_valid_2 : _GEN_39; // @[TLB.scala 245:54 TLB.scala 165:29]
  wire  _GEN_70 = io_ptw_resp_bits_level < 2'h2 ? sectored_entries_0_0_valid_3 : _GEN_40; // @[TLB.scala 245:54 TLB.scala 165:29]
  wire  _GEN_79 = ~io_ptw_resp_bits_homogeneous ? _GEN_8 : special_entry_valid_0; // @[TLB.scala 240:68 TLB.scala 167:56]
  wire  _GEN_83 = ~io_ptw_resp_bits_homogeneous ? superpage_entries_0_valid_0 : _GEN_53; // @[TLB.scala 240:68 TLB.scala 166:30]
  wire  _GEN_87 = ~io_ptw_resp_bits_homogeneous ? superpage_entries_1_valid_0 : _GEN_57; // @[TLB.scala 240:68 TLB.scala 166:30]
  wire  _GEN_91 = ~io_ptw_resp_bits_homogeneous ? superpage_entries_2_valid_0 : _GEN_61; // @[TLB.scala 240:68 TLB.scala 166:30]
  wire  _GEN_95 = ~io_ptw_resp_bits_homogeneous ? superpage_entries_3_valid_0 : _GEN_65; // @[TLB.scala 240:68 TLB.scala 166:30]
  wire  _GEN_97 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_0_valid_0 : _GEN_67; // @[TLB.scala 240:68 TLB.scala 165:29]
  wire  _GEN_98 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_0_valid_1 : _GEN_68; // @[TLB.scala 240:68 TLB.scala 165:29]
  wire  _GEN_99 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_0_valid_2 : _GEN_69; // @[TLB.scala 240:68 TLB.scala 165:29]
  wire  _GEN_100 = ~io_ptw_resp_bits_homogeneous ? sectored_entries_0_0_valid_3 : _GEN_70; // @[TLB.scala 240:68 TLB.scala 165:29]
  wire  _GEN_109 = io_ptw_resp_valid ? _GEN_79 : special_entry_valid_0; // @[TLB.scala 220:20 TLB.scala 167:56]
  wire  _GEN_113 = io_ptw_resp_valid ? _GEN_83 : superpage_entries_0_valid_0; // @[TLB.scala 220:20 TLB.scala 166:30]
  wire  _GEN_117 = io_ptw_resp_valid ? _GEN_87 : superpage_entries_1_valid_0; // @[TLB.scala 220:20 TLB.scala 166:30]
  wire  _GEN_121 = io_ptw_resp_valid ? _GEN_91 : superpage_entries_2_valid_0; // @[TLB.scala 220:20 TLB.scala 166:30]
  wire  _GEN_125 = io_ptw_resp_valid ? _GEN_95 : superpage_entries_3_valid_0; // @[TLB.scala 220:20 TLB.scala 166:30]
  wire  _GEN_127 = io_ptw_resp_valid ? _GEN_97 : sectored_entries_0_0_valid_0; // @[TLB.scala 220:20 TLB.scala 165:29]
  wire  _GEN_128 = io_ptw_resp_valid ? _GEN_98 : sectored_entries_0_0_valid_1; // @[TLB.scala 220:20 TLB.scala 165:29]
  wire  _GEN_129 = io_ptw_resp_valid ? _GEN_99 : sectored_entries_0_0_valid_2; // @[TLB.scala 220:20 TLB.scala 165:29]
  wire  _GEN_130 = io_ptw_resp_valid ? _GEN_100 : sectored_entries_0_0_valid_3; // @[TLB.scala 220:20 TLB.scala 165:29]
  wire [6:0] ptw_ae_array = {1'h0,entries_barrier_5_io_y_ae,entries_barrier_4_io_y_ae,entries_barrier_3_io_y_ae,
    entries_barrier_2_io_y_ae,entries_barrier_1_io_y_ae,entries_barrier_io_y_ae}; // @[Cat.scala 30:58]
  wire [5:0] _priv_rw_ok_T_2 = {entries_barrier_5_io_y_u,entries_barrier_4_io_y_u,entries_barrier_3_io_y_u,
    entries_barrier_2_io_y_u,entries_barrier_1_io_y_u,entries_barrier_io_y_u}; // @[Cat.scala 30:58]
  wire [5:0] _priv_rw_ok_T_3 = ~priv_s | io_ptw_status_sum ? _priv_rw_ok_T_2 : 6'h0; // @[TLB.scala 265:23]
  wire [5:0] _priv_rw_ok_T_5 = ~_priv_rw_ok_T_2; // @[TLB.scala 265:98]
  wire [5:0] _priv_rw_ok_T_6 = priv_s ? _priv_rw_ok_T_5 : 6'h0; // @[TLB.scala 265:89]
  wire [5:0] priv_rw_ok = _priv_rw_ok_T_3 | _priv_rw_ok_T_6; // @[TLB.scala 265:84]
  wire [5:0] priv_x_ok = priv_s ? _priv_rw_ok_T_5 : _priv_rw_ok_T_2; // @[TLB.scala 266:22]
  wire [5:0] _r_array_T = {entries_barrier_5_io_y_sr,entries_barrier_4_io_y_sr,entries_barrier_3_io_y_sr,
    entries_barrier_2_io_y_sr,entries_barrier_1_io_y_sr,entries_barrier_io_y_sr}; // @[Cat.scala 30:58]
  wire [5:0] _r_array_T_1 = {entries_barrier_5_io_y_sx,entries_barrier_4_io_y_sx,entries_barrier_3_io_y_sx,
    entries_barrier_2_io_y_sx,entries_barrier_1_io_y_sx,entries_barrier_io_y_sx}; // @[Cat.scala 30:58]
  wire [5:0] _r_array_T_2 = io_ptw_status_mxr ? _r_array_T_1 : 6'h0; // @[TLB.scala 267:73]
  wire [5:0] _r_array_T_3 = _r_array_T | _r_array_T_2; // @[TLB.scala 267:68]
  wire [5:0] r_array_lo_2 = priv_rw_ok & _r_array_T_3; // @[TLB.scala 267:40]
  wire [6:0] r_array = {1'h1,r_array_lo_2}; // @[Cat.scala 30:58]
  wire [5:0] _w_array_T = {entries_barrier_5_io_y_sw,entries_barrier_4_io_y_sw,entries_barrier_3_io_y_sw,
    entries_barrier_2_io_y_sw,entries_barrier_1_io_y_sw,entries_barrier_io_y_sw}; // @[Cat.scala 30:58]
  wire [5:0] w_array_lo_1 = priv_rw_ok & _w_array_T; // @[TLB.scala 268:40]
  wire [6:0] w_array = {1'h1,w_array_lo_1}; // @[Cat.scala 30:58]
  wire [5:0] x_array_lo_1 = priv_x_ok & _r_array_T_1; // @[TLB.scala 269:39]
  wire [6:0] x_array = {1'h1,x_array_lo_1}; // @[Cat.scala 30:58]
  wire [1:0] pr_array_hi = prot_r ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [6:0] _pr_array_T_1 = {pr_array_hi,normal_entries_barrier_4_io_y_pr,normal_entries_barrier_3_io_y_pr,
    normal_entries_barrier_2_io_y_pr,normal_entries_barrier_1_io_y_pr,normal_entries_barrier_io_y_pr}; // @[Cat.scala 30:58]
  wire [6:0] _pr_array_T_2 = ~ptw_ae_array; // @[TLB.scala 270:89]
  wire [6:0] pr_array = _pr_array_T_1 & _pr_array_T_2; // @[TLB.scala 270:87]
  wire [1:0] pw_array_hi = prot_w ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [6:0] _pw_array_T_1 = {pw_array_hi,normal_entries_barrier_4_io_y_pw,normal_entries_barrier_3_io_y_pw,
    normal_entries_barrier_2_io_y_pw,normal_entries_barrier_1_io_y_pw,normal_entries_barrier_io_y_pw}; // @[Cat.scala 30:58]
  wire [6:0] pw_array = _pw_array_T_1 & _pr_array_T_2; // @[TLB.scala 271:87]
  wire [1:0] px_array_hi = prot_x ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [6:0] _px_array_T_1 = {px_array_hi,normal_entries_barrier_4_io_y_px,normal_entries_barrier_3_io_y_px,
    normal_entries_barrier_2_io_y_px,normal_entries_barrier_1_io_y_px,normal_entries_barrier_io_y_px}; // @[Cat.scala 30:58]
  wire [6:0] px_array = _px_array_T_1 & _pr_array_T_2; // @[TLB.scala 272:87]
  wire [1:0] eff_array_hi = prot_eff ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [6:0] eff_array = {eff_array_hi,normal_entries_barrier_4_io_y_eff,normal_entries_barrier_3_io_y_eff,
    normal_entries_barrier_2_io_y_eff,normal_entries_barrier_1_io_y_eff,normal_entries_barrier_io_y_eff}; // @[Cat.scala 30:58]
  wire [1:0] c_array_hi = cacheable ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [6:0] c_array = {c_array_hi,normal_entries_barrier_4_io_y_c,normal_entries_barrier_3_io_y_c,
    normal_entries_barrier_2_io_y_c,normal_entries_barrier_1_io_y_c,normal_entries_barrier_io_y_c}; // @[Cat.scala 30:58]
  wire [1:0] ppp_array_hi = _prot_w_T_43 ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [6:0] ppp_array = {ppp_array_hi,normal_entries_barrier_4_io_y_ppp,normal_entries_barrier_3_io_y_ppp,
    normal_entries_barrier_2_io_y_ppp,normal_entries_barrier_1_io_y_ppp,normal_entries_barrier_io_y_ppp}; // @[Cat.scala 30:58]
  wire [1:0] paa_array_hi = prot_al ? 2'h3 : 2'h0; // @[Bitwise.scala 72:12]
  wire [6:0] paa_array = {paa_array_hi,normal_entries_barrier_4_io_y_paa,normal_entries_barrier_3_io_y_paa,
    normal_entries_barrier_2_io_y_paa,normal_entries_barrier_1_io_y_paa,normal_entries_barrier_io_y_paa}; // @[Cat.scala 30:58]
  wire [6:0] pal_array = {paa_array_hi,normal_entries_barrier_4_io_y_pal,normal_entries_barrier_3_io_y_pal,
    normal_entries_barrier_2_io_y_pal,normal_entries_barrier_1_io_y_pal,normal_entries_barrier_io_y_pal}; // @[Cat.scala 30:58]
  wire [6:0] ppp_array_if_cached = ppp_array | c_array; // @[TLB.scala 278:39]
  wire [6:0] paa_array_if_cached = paa_array | c_array; // @[TLB.scala 279:39]
  wire [6:0] pal_array_if_cached = pal_array | c_array; // @[TLB.scala 280:39]
  wire [3:0] _misaligned_T = 4'h1 << io_req_bits_size; // @[OneHot.scala 58:35]
  wire [3:0] _misaligned_T_2 = _misaligned_T - 4'h1; // @[TLB.scala 283:69]
  wire [39:0] _GEN_243 = {{36'd0}, _misaligned_T_2}; // @[TLB.scala 283:39]
  wire [39:0] _misaligned_T_3 = io_req_bits_vaddr & _GEN_243; // @[TLB.scala 283:39]
  wire  misaligned = |_misaligned_T_3; // @[TLB.scala 283:75]
  wire [39:0] bad_va_maskedVAddr = io_req_bits_vaddr & 40'hc000000000; // @[TLB.scala 289:43]
  wire  _bad_va_T_4 = ~(bad_va_maskedVAddr == 40'h0 | bad_va_maskedVAddr == 40'hc000000000); // @[TLB.scala 290:47]
  wire  bad_va = vm_enabled & _bad_va_T_4; // @[TLB.scala 284:117]
  wire  _cmd_lrsc_T = io_req_bits_cmd == 5'h6; // @[package.scala 15:47]
  wire  _cmd_lrsc_T_1 = io_req_bits_cmd == 5'h7; // @[package.scala 15:47]
  wire  cmd_lrsc = _cmd_lrsc_T | _cmd_lrsc_T_1; // @[package.scala 72:59]
  wire  _cmd_amo_logical_T = io_req_bits_cmd == 5'h4; // @[package.scala 15:47]
  wire  _cmd_amo_logical_T_1 = io_req_bits_cmd == 5'h9; // @[package.scala 15:47]
  wire  _cmd_amo_logical_T_2 = io_req_bits_cmd == 5'ha; // @[package.scala 15:47]
  wire  _cmd_amo_logical_T_3 = io_req_bits_cmd == 5'hb; // @[package.scala 15:47]
  wire  cmd_amo_logical = _cmd_amo_logical_T | _cmd_amo_logical_T_1 | _cmd_amo_logical_T_2 | _cmd_amo_logical_T_3; // @[package.scala 72:59]
  wire  _cmd_amo_arithmetic_T = io_req_bits_cmd == 5'h8; // @[package.scala 15:47]
  wire  _cmd_amo_arithmetic_T_1 = io_req_bits_cmd == 5'hc; // @[package.scala 15:47]
  wire  _cmd_amo_arithmetic_T_2 = io_req_bits_cmd == 5'hd; // @[package.scala 15:47]
  wire  _cmd_amo_arithmetic_T_3 = io_req_bits_cmd == 5'he; // @[package.scala 15:47]
  wire  _cmd_amo_arithmetic_T_4 = io_req_bits_cmd == 5'hf; // @[package.scala 15:47]
  wire  cmd_amo_arithmetic = _cmd_amo_arithmetic_T | _cmd_amo_arithmetic_T_1 | _cmd_amo_arithmetic_T_2 |
    _cmd_amo_arithmetic_T_3 | _cmd_amo_arithmetic_T_4; // @[package.scala 72:59]
  wire  cmd_put_partial = io_req_bits_cmd == 5'h11; // @[TLB.scala 297:41]
  wire  _cmd_read_T_21 = cmd_amo_logical | cmd_amo_arithmetic; // @[Consts.scala 79:44]
  wire  cmd_read = io_req_bits_cmd == 5'h0 | _cmd_lrsc_T | _cmd_lrsc_T_1 | _cmd_read_T_21; // @[Consts.scala 81:75]
  wire  cmd_write = io_req_bits_cmd == 5'h1 | cmd_put_partial | _cmd_lrsc_T_1 | _cmd_read_T_21; // @[Consts.scala 82:76]
  wire  _cmd_write_perms_T = io_req_bits_cmd == 5'h5; // @[package.scala 15:47]
  wire  _cmd_write_perms_T_1 = io_req_bits_cmd == 5'h17; // @[package.scala 15:47]
  wire  _cmd_write_perms_T_2 = _cmd_write_perms_T | _cmd_write_perms_T_1; // @[package.scala 72:59]
  wire  cmd_write_perms = cmd_write | _cmd_write_perms_T_2; // @[TLB.scala 300:35]
  wire [6:0] _ae_array_T = misaligned ? eff_array : 7'h0; // @[TLB.scala 305:8]
  wire [6:0] _ae_array_T_1 = ~c_array; // @[TLB.scala 306:19]
  wire [6:0] _ae_array_T_2 = cmd_lrsc ? _ae_array_T_1 : 7'h0; // @[TLB.scala 306:8]
  wire [6:0] ae_array = _ae_array_T | _ae_array_T_2; // @[TLB.scala 305:37]
  wire [6:0] _ae_ld_array_T = ~pr_array; // @[TLB.scala 307:46]
  wire [6:0] _ae_ld_array_T_1 = ae_array | _ae_ld_array_T; // @[TLB.scala 307:44]
  wire [6:0] ae_ld_array = cmd_read ? _ae_ld_array_T_1 : 7'h0; // @[TLB.scala 307:24]
  wire [6:0] _ae_st_array_T = ~pw_array; // @[TLB.scala 309:37]
  wire [6:0] _ae_st_array_T_1 = ae_array | _ae_st_array_T; // @[TLB.scala 309:35]
  wire [6:0] _ae_st_array_T_2 = cmd_write_perms ? _ae_st_array_T_1 : 7'h0; // @[TLB.scala 309:8]
  wire [6:0] _ae_st_array_T_3 = ~ppp_array_if_cached; // @[TLB.scala 310:26]
  wire [6:0] _ae_st_array_T_4 = cmd_put_partial ? _ae_st_array_T_3 : 7'h0; // @[TLB.scala 310:8]
  wire [6:0] _ae_st_array_T_5 = _ae_st_array_T_2 | _ae_st_array_T_4; // @[TLB.scala 309:53]
  wire [6:0] _ae_st_array_T_6 = ~pal_array_if_cached; // @[TLB.scala 311:26]
  wire [6:0] _ae_st_array_T_7 = cmd_amo_logical ? _ae_st_array_T_6 : 7'h0; // @[TLB.scala 311:8]
  wire [6:0] _ae_st_array_T_8 = _ae_st_array_T_5 | _ae_st_array_T_7; // @[TLB.scala 310:53]
  wire [6:0] _ae_st_array_T_9 = ~paa_array_if_cached; // @[TLB.scala 312:29]
  wire [6:0] _ae_st_array_T_10 = cmd_amo_arithmetic ? _ae_st_array_T_9 : 7'h0; // @[TLB.scala 312:8]
  wire [6:0] ae_st_array = _ae_st_array_T_8 | _ae_st_array_T_10; // @[TLB.scala 311:53]
  wire [6:0] _must_alloc_array_T = ~ppp_array; // @[TLB.scala 314:26]
  wire [6:0] _must_alloc_array_T_1 = cmd_put_partial ? _must_alloc_array_T : 7'h0; // @[TLB.scala 314:8]
  wire [6:0] _must_alloc_array_T_2 = ~paa_array; // @[TLB.scala 315:26]
  wire [6:0] _must_alloc_array_T_3 = cmd_amo_logical ? _must_alloc_array_T_2 : 7'h0; // @[TLB.scala 315:8]
  wire [6:0] _must_alloc_array_T_4 = _must_alloc_array_T_1 | _must_alloc_array_T_3; // @[TLB.scala 314:43]
  wire [6:0] _must_alloc_array_T_5 = ~pal_array; // @[TLB.scala 316:29]
  wire [6:0] _must_alloc_array_T_6 = cmd_amo_arithmetic ? _must_alloc_array_T_5 : 7'h0; // @[TLB.scala 316:8]
  wire [6:0] _must_alloc_array_T_7 = _must_alloc_array_T_4 | _must_alloc_array_T_6; // @[TLB.scala 315:43]
  wire [6:0] _must_alloc_array_T_9 = cmd_lrsc ? 7'h7f : 7'h0; // @[TLB.scala 317:8]
  wire [6:0] must_alloc_array = _must_alloc_array_T_7 | _must_alloc_array_T_9; // @[TLB.scala 316:46]
  wire [6:0] _ma_ld_array_T_1 = ~eff_array; // @[TLB.scala 318:49]
  wire [6:0] ma_ld_array = misaligned & cmd_read ? _ma_ld_array_T_1 : 7'h0; // @[TLB.scala 318:24]
  wire [6:0] ma_st_array = misaligned & cmd_write ? _ma_ld_array_T_1 : 7'h0; // @[TLB.scala 319:24]
  wire [6:0] _pf_ld_array_T = r_array | ptw_ae_array; // @[TLB.scala 320:45]
  wire [6:0] _pf_ld_array_T_1 = ~_pf_ld_array_T; // @[TLB.scala 320:35]
  wire [6:0] pf_ld_array = cmd_read ? _pf_ld_array_T_1 : 7'h0; // @[TLB.scala 320:24]
  wire [6:0] _pf_st_array_T = w_array | ptw_ae_array; // @[TLB.scala 321:52]
  wire [6:0] _pf_st_array_T_1 = ~_pf_st_array_T; // @[TLB.scala 321:42]
  wire [6:0] pf_st_array = cmd_write_perms ? _pf_st_array_T_1 : 7'h0; // @[TLB.scala 321:24]
  wire [6:0] _pf_inst_array_T = x_array | ptw_ae_array; // @[TLB.scala 322:33]
  wire [6:0] pf_inst_array = ~_pf_inst_array_T; // @[TLB.scala 322:23]
  wire  tlb_hit = |real_hits; // @[TLB.scala 324:27]
  wire  tlb_miss = vm_enabled & ~bad_va & ~tlb_hit; // @[TLB.scala 325:40]
  reg [2:0] state_reg_1; // @[Replacement.scala 168:70]
  wire  _T_12 = superpage_hits_0 | superpage_hits_1 | superpage_hits_2 | superpage_hits_3; // @[package.scala 72:59]
  wire [3:0] _T_13 = {superpage_hits_3,superpage_hits_2,superpage_hits_1,superpage_hits_0}; // @[Cat.scala 30:58]
  wire [1:0] hi_1 = _T_13[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] lo_1 = _T_13[1:0]; // @[OneHot.scala 31:18]
  wire  hi_2 = |hi_1; // @[OneHot.scala 32:14]
  wire [1:0] _T_14 = hi_1 | lo_1; // @[OneHot.scala 32:28]
  wire  lo_2 = _T_14[1]; // @[CircuitMath.scala 30:8]
  wire [1:0] state_reg_touch_way_sized = {hi_2,lo_2}; // @[Cat.scala 30:58]
  wire  state_reg_hi_hi = ~state_reg_touch_way_sized[1]; // @[Replacement.scala 196:33]
  wire  state_reg_left_subtree_state = state_reg_1[1]; // @[package.scala 154:13]
  wire  state_reg_right_subtree_state = state_reg_1[0]; // @[Replacement.scala 198:38]
  wire  _state_reg_T_2 = ~state_reg_touch_way_sized[0]; // @[Replacement.scala 218:7]
  wire  state_reg_hi_lo = state_reg_hi_hi ? state_reg_left_subtree_state : _state_reg_T_2; // @[Replacement.scala 203:16]
  wire  state_reg_lo = state_reg_hi_hi ? _state_reg_T_2 : state_reg_right_subtree_state; // @[Replacement.scala 206:16]
  wire [2:0] _state_reg_T_6 = {state_reg_hi_hi,state_reg_hi_lo,state_reg_lo}; // @[Cat.scala 30:58]
  wire  multipleHits_leftOne = real_hits[0]; // @[Misc.scala 180:37]
  wire  multipleHits_leftOne_1 = real_hits[1]; // @[Misc.scala 180:37]
  wire  multipleHits_rightOne = real_hits[2]; // @[Misc.scala 181:39]
  wire  multipleHits_rightOne_1 = multipleHits_leftOne_1 | multipleHits_rightOne; // @[Misc.scala 182:16]
  wire  multipleHits_rightTwo = multipleHits_leftOne_1 & multipleHits_rightOne; // @[Misc.scala 182:61]
  wire  multipleHits_leftOne_2 = multipleHits_leftOne | multipleHits_rightOne_1; // @[Misc.scala 182:16]
  wire  multipleHits_leftTwo = multipleHits_rightTwo | multipleHits_leftOne & multipleHits_rightOne_1; // @[Misc.scala 182:49]
  wire  multipleHits_leftOne_3 = real_hits[3]; // @[Misc.scala 180:37]
  wire  multipleHits_leftOne_4 = real_hits[4]; // @[Misc.scala 180:37]
  wire  multipleHits_rightOne_2 = real_hits[5]; // @[Misc.scala 181:39]
  wire  multipleHits_rightOne_3 = multipleHits_leftOne_4 | multipleHits_rightOne_2; // @[Misc.scala 182:16]
  wire  multipleHits_rightTwo_1 = multipleHits_leftOne_4 & multipleHits_rightOne_2; // @[Misc.scala 182:61]
  wire  multipleHits_rightOne_4 = multipleHits_leftOne_3 | multipleHits_rightOne_3; // @[Misc.scala 182:16]
  wire  multipleHits_rightTwo_2 = multipleHits_rightTwo_1 | multipleHits_leftOne_3 & multipleHits_rightOne_3; // @[Misc.scala 182:49]
  wire  multipleHits = multipleHits_leftTwo | multipleHits_rightTwo_2 | multipleHits_leftOne_2 & multipleHits_rightOne_4
    ; // @[Misc.scala 182:49]
  wire [6:0] _io_resp_pf_ld_T_1 = pf_ld_array & hits; // @[TLB.scala 342:57]
  wire [6:0] _io_resp_pf_st_T_1 = pf_st_array & hits; // @[TLB.scala 343:64]
  wire [6:0] _io_resp_pf_inst_T = pf_inst_array & hits; // @[TLB.scala 344:47]
  wire [6:0] _io_resp_ae_ld_T = ae_ld_array & hits; // @[TLB.scala 345:33]
  wire [6:0] _io_resp_ae_st_T = ae_st_array & hits; // @[TLB.scala 346:33]
  wire [6:0] _io_resp_ae_inst_T = ~px_array; // @[TLB.scala 347:23]
  wire [6:0] _io_resp_ae_inst_T_1 = _io_resp_ae_inst_T & hits; // @[TLB.scala 347:33]
  wire [6:0] _io_resp_ma_ld_T = ma_ld_array & hits; // @[TLB.scala 348:33]
  wire [6:0] _io_resp_ma_st_T = ma_st_array & hits; // @[TLB.scala 349:33]
  wire [6:0] _io_resp_cacheable_T = c_array & hits; // @[TLB.scala 351:33]
  wire [6:0] _io_resp_must_alloc_T = must_alloc_array & hits; // @[TLB.scala 352:43]
  wire  _T_16 = io_req_ready & io_req_valid; // @[Decoupled.scala 40:37]
  wire  r_superpage_repl_addr_hi = state_reg_1[2]; // @[Replacement.scala 243:38]
  wire  r_superpage_repl_addr_lo = r_superpage_repl_addr_hi ? state_reg_left_subtree_state :
    state_reg_right_subtree_state; // @[Replacement.scala 250:16]
  wire [1:0] _r_superpage_repl_addr_T_2 = {r_superpage_repl_addr_hi,r_superpage_repl_addr_lo}; // @[Cat.scala 30:58]
  wire [3:0] r_superpage_repl_addr_valids = {superpage_entries_3_valid_0,superpage_entries_2_valid_0,
    superpage_entries_1_valid_0,superpage_entries_0_valid_0}; // @[Cat.scala 30:58]
  wire [3:0] _r_superpage_repl_addr_T_4 = ~r_superpage_repl_addr_valids; // @[TLB.scala 411:43]
  wire [1:0] _r_superpage_repl_addr_T_9 = _r_superpage_repl_addr_T_4[2] ? 2'h2 : 2'h3; // @[Mux.scala 47:69]
  wire [1:0] _GEN_149 = _T_16 & tlb_miss ? 2'h1 : state; // @[TLB.scala 363:38 TLB.scala 364:13 TLB.scala 173:18]
  wire [1:0] _GEN_155 = io_sfence_valid ? 2'h0 : _GEN_149; // @[TLB.scala 373:21 TLB.scala 373:29]
  wire [1:0] _state_T = io_sfence_valid ? 2'h3 : 2'h2; // @[TLB.scala 374:45]
  wire [1:0] _GEN_156 = io_ptw_req_ready ? _state_T : _GEN_155; // @[TLB.scala 374:31 TLB.scala 374:39]
  wire [1:0] _GEN_157 = io_kill ? 2'h0 : _GEN_156; // @[TLB.scala 375:22 TLB.scala 375:30]
  wire  _GEN_161 = 2'h0 == hitsVec_idx ? 1'h0 : _GEN_127; // @[TLB.scala 131:58 TLB.scala 131:58]
  wire  _GEN_162 = 2'h1 == hitsVec_idx ? 1'h0 : _GEN_128; // @[TLB.scala 131:58 TLB.scala 131:58]
  wire  _GEN_163 = 2'h2 == hitsVec_idx ? 1'h0 : _GEN_129; // @[TLB.scala 131:58 TLB.scala 131:58]
  wire  _GEN_164 = 2'h3 == hitsVec_idx ? 1'h0 : _GEN_130; // @[TLB.scala 131:58 TLB.scala 131:58]
  wire  _GEN_165 = _sector_hits_T_5 ? _GEN_161 : _GEN_127; // @[TLB.scala 131:34]
  wire  _GEN_166 = _sector_hits_T_5 ? _GEN_162 : _GEN_128; // @[TLB.scala 131:34]
  wire  _GEN_167 = _sector_hits_T_5 ? _GEN_163 : _GEN_129; // @[TLB.scala 131:34]
  wire  _GEN_168 = _sector_hits_T_5 ? _GEN_164 : _GEN_130; // @[TLB.scala 131:34]
  wire  _GEN_169 = sectored_entries_0_0_data_0[0] ? 1'h0 : _GEN_165; // @[TLB.scala 137:41 TLB.scala 137:45]
  wire  _GEN_170 = sectored_entries_0_0_data_1[0] ? 1'h0 : _GEN_166; // @[TLB.scala 137:41 TLB.scala 137:45]
  wire  _GEN_171 = sectored_entries_0_0_data_2[0] ? 1'h0 : _GEN_167; // @[TLB.scala 137:41 TLB.scala 137:45]
  wire  _GEN_172 = sectored_entries_0_0_data_3[0] ? 1'h0 : _GEN_168; // @[TLB.scala 137:41 TLB.scala 137:45]
  wire  _GEN_177 = ~sectored_entries_0_0_data_0[13] ? 1'h0 : _GEN_127; // @[TLB.scala 143:19 TLB.scala 143:23]
  wire  _GEN_178 = ~sectored_entries_0_0_data_1[13] ? 1'h0 : _GEN_128; // @[TLB.scala 143:19 TLB.scala 143:23]
  wire  _GEN_179 = ~sectored_entries_0_0_data_2[13] ? 1'h0 : _GEN_129; // @[TLB.scala 143:19 TLB.scala 143:23]
  wire  _GEN_180 = ~sectored_entries_0_0_data_3[13] ? 1'h0 : _GEN_130; // @[TLB.scala 143:19 TLB.scala 143:23]
  wire  _GEN_181 = io_sfence_bits_rs2 & _GEN_177; // @[TLB.scala 388:40 TLB.scala 126:46]
  wire  _GEN_182 = io_sfence_bits_rs2 & _GEN_178; // @[TLB.scala 388:40 TLB.scala 126:46]
  wire  _GEN_183 = io_sfence_bits_rs2 & _GEN_179; // @[TLB.scala 388:40 TLB.scala 126:46]
  wire  _GEN_184 = io_sfence_bits_rs2 & _GEN_180; // @[TLB.scala 388:40 TLB.scala 126:46]
  wire  _GEN_190 = ~superpage_entries_0_data_0[13] ? 1'h0 : _GEN_113; // @[TLB.scala 143:19 TLB.scala 143:23]
  wire  _GEN_191 = io_sfence_bits_rs2 & _GEN_190; // @[TLB.scala 388:40 TLB.scala 126:46]
  wire  _GEN_194 = ~superpage_entries_1_data_0[13] ? 1'h0 : _GEN_117; // @[TLB.scala 143:19 TLB.scala 143:23]
  wire  _GEN_195 = io_sfence_bits_rs2 & _GEN_194; // @[TLB.scala 388:40 TLB.scala 126:46]
  wire  _GEN_198 = ~superpage_entries_2_data_0[13] ? 1'h0 : _GEN_121; // @[TLB.scala 143:19 TLB.scala 143:23]
  wire  _GEN_199 = io_sfence_bits_rs2 & _GEN_198; // @[TLB.scala 388:40 TLB.scala 126:46]
  wire  _GEN_202 = ~superpage_entries_3_data_0[13] ? 1'h0 : _GEN_125; // @[TLB.scala 143:19 TLB.scala 143:23]
  wire  _GEN_203 = io_sfence_bits_rs2 & _GEN_202; // @[TLB.scala 388:40 TLB.scala 126:46]
  wire  _GEN_206 = ~special_entry_data_0[13] ? 1'h0 : _GEN_109; // @[TLB.scala 143:19 TLB.scala 143:23]
  wire  _GEN_207 = io_sfence_bits_rs2 & _GEN_206; // @[TLB.scala 388:40 TLB.scala 126:46]
  OptimizationBarrier mpu_ppn_data_barrier ( // @[package.scala 258:25]
    .clock(mpu_ppn_data_barrier_clock),
    .reset(mpu_ppn_data_barrier_reset),
    .io_x_ppn(mpu_ppn_data_barrier_io_x_ppn),
    .io_x_u(mpu_ppn_data_barrier_io_x_u),
    .io_x_g(mpu_ppn_data_barrier_io_x_g),
    .io_x_ae(mpu_ppn_data_barrier_io_x_ae),
    .io_x_sw(mpu_ppn_data_barrier_io_x_sw),
    .io_x_sx(mpu_ppn_data_barrier_io_x_sx),
    .io_x_sr(mpu_ppn_data_barrier_io_x_sr),
    .io_x_pw(mpu_ppn_data_barrier_io_x_pw),
    .io_x_px(mpu_ppn_data_barrier_io_x_px),
    .io_x_pr(mpu_ppn_data_barrier_io_x_pr),
    .io_x_ppp(mpu_ppn_data_barrier_io_x_ppp),
    .io_x_pal(mpu_ppn_data_barrier_io_x_pal),
    .io_x_paa(mpu_ppn_data_barrier_io_x_paa),
    .io_x_eff(mpu_ppn_data_barrier_io_x_eff),
    .io_x_c(mpu_ppn_data_barrier_io_x_c),
    .io_x_fragmented_superpage(mpu_ppn_data_barrier_io_x_fragmented_superpage),
    .io_y_ppn(mpu_ppn_data_barrier_io_y_ppn),
    .io_y_u(mpu_ppn_data_barrier_io_y_u),
    .io_y_g(mpu_ppn_data_barrier_io_y_g),
    .io_y_ae(mpu_ppn_data_barrier_io_y_ae),
    .io_y_sw(mpu_ppn_data_barrier_io_y_sw),
    .io_y_sx(mpu_ppn_data_barrier_io_y_sx),
    .io_y_sr(mpu_ppn_data_barrier_io_y_sr),
    .io_y_pw(mpu_ppn_data_barrier_io_y_pw),
    .io_y_px(mpu_ppn_data_barrier_io_y_px),
    .io_y_pr(mpu_ppn_data_barrier_io_y_pr),
    .io_y_ppp(mpu_ppn_data_barrier_io_y_ppp),
    .io_y_pal(mpu_ppn_data_barrier_io_y_pal),
    .io_y_paa(mpu_ppn_data_barrier_io_y_paa),
    .io_y_eff(mpu_ppn_data_barrier_io_y_eff),
    .io_y_c(mpu_ppn_data_barrier_io_y_c),
    .io_y_fragmented_superpage(mpu_ppn_data_barrier_io_y_fragmented_superpage)
  );
  PMPChecker pmp ( // @[TLB.scala 193:19]
    .clock(pmp_clock),
    .reset(pmp_reset),
    .io_prv(pmp_io_prv),
    .io_pmp_0_cfg_l(pmp_io_pmp_0_cfg_l),
    .io_pmp_0_cfg_res(pmp_io_pmp_0_cfg_res),
    .io_pmp_0_cfg_a(pmp_io_pmp_0_cfg_a),
    .io_pmp_0_cfg_x(pmp_io_pmp_0_cfg_x),
    .io_pmp_0_cfg_w(pmp_io_pmp_0_cfg_w),
    .io_pmp_0_cfg_r(pmp_io_pmp_0_cfg_r),
    .io_pmp_0_addr(pmp_io_pmp_0_addr),
    .io_pmp_0_mask(pmp_io_pmp_0_mask),
    .io_pmp_1_cfg_l(pmp_io_pmp_1_cfg_l),
    .io_pmp_1_cfg_res(pmp_io_pmp_1_cfg_res),
    .io_pmp_1_cfg_a(pmp_io_pmp_1_cfg_a),
    .io_pmp_1_cfg_x(pmp_io_pmp_1_cfg_x),
    .io_pmp_1_cfg_w(pmp_io_pmp_1_cfg_w),
    .io_pmp_1_cfg_r(pmp_io_pmp_1_cfg_r),
    .io_pmp_1_addr(pmp_io_pmp_1_addr),
    .io_pmp_1_mask(pmp_io_pmp_1_mask),
    .io_pmp_2_cfg_l(pmp_io_pmp_2_cfg_l),
    .io_pmp_2_cfg_res(pmp_io_pmp_2_cfg_res),
    .io_pmp_2_cfg_a(pmp_io_pmp_2_cfg_a),
    .io_pmp_2_cfg_x(pmp_io_pmp_2_cfg_x),
    .io_pmp_2_cfg_w(pmp_io_pmp_2_cfg_w),
    .io_pmp_2_cfg_r(pmp_io_pmp_2_cfg_r),
    .io_pmp_2_addr(pmp_io_pmp_2_addr),
    .io_pmp_2_mask(pmp_io_pmp_2_mask),
    .io_pmp_3_cfg_l(pmp_io_pmp_3_cfg_l),
    .io_pmp_3_cfg_res(pmp_io_pmp_3_cfg_res),
    .io_pmp_3_cfg_a(pmp_io_pmp_3_cfg_a),
    .io_pmp_3_cfg_x(pmp_io_pmp_3_cfg_x),
    .io_pmp_3_cfg_w(pmp_io_pmp_3_cfg_w),
    .io_pmp_3_cfg_r(pmp_io_pmp_3_cfg_r),
    .io_pmp_3_addr(pmp_io_pmp_3_addr),
    .io_pmp_3_mask(pmp_io_pmp_3_mask),
    .io_pmp_4_cfg_l(pmp_io_pmp_4_cfg_l),
    .io_pmp_4_cfg_res(pmp_io_pmp_4_cfg_res),
    .io_pmp_4_cfg_a(pmp_io_pmp_4_cfg_a),
    .io_pmp_4_cfg_x(pmp_io_pmp_4_cfg_x),
    .io_pmp_4_cfg_w(pmp_io_pmp_4_cfg_w),
    .io_pmp_4_cfg_r(pmp_io_pmp_4_cfg_r),
    .io_pmp_4_addr(pmp_io_pmp_4_addr),
    .io_pmp_4_mask(pmp_io_pmp_4_mask),
    .io_pmp_5_cfg_l(pmp_io_pmp_5_cfg_l),
    .io_pmp_5_cfg_res(pmp_io_pmp_5_cfg_res),
    .io_pmp_5_cfg_a(pmp_io_pmp_5_cfg_a),
    .io_pmp_5_cfg_x(pmp_io_pmp_5_cfg_x),
    .io_pmp_5_cfg_w(pmp_io_pmp_5_cfg_w),
    .io_pmp_5_cfg_r(pmp_io_pmp_5_cfg_r),
    .io_pmp_5_addr(pmp_io_pmp_5_addr),
    .io_pmp_5_mask(pmp_io_pmp_5_mask),
    .io_pmp_6_cfg_l(pmp_io_pmp_6_cfg_l),
    .io_pmp_6_cfg_res(pmp_io_pmp_6_cfg_res),
    .io_pmp_6_cfg_a(pmp_io_pmp_6_cfg_a),
    .io_pmp_6_cfg_x(pmp_io_pmp_6_cfg_x),
    .io_pmp_6_cfg_w(pmp_io_pmp_6_cfg_w),
    .io_pmp_6_cfg_r(pmp_io_pmp_6_cfg_r),
    .io_pmp_6_addr(pmp_io_pmp_6_addr),
    .io_pmp_6_mask(pmp_io_pmp_6_mask),
    .io_pmp_7_cfg_l(pmp_io_pmp_7_cfg_l),
    .io_pmp_7_cfg_res(pmp_io_pmp_7_cfg_res),
    .io_pmp_7_cfg_a(pmp_io_pmp_7_cfg_a),
    .io_pmp_7_cfg_x(pmp_io_pmp_7_cfg_x),
    .io_pmp_7_cfg_w(pmp_io_pmp_7_cfg_w),
    .io_pmp_7_cfg_r(pmp_io_pmp_7_cfg_r),
    .io_pmp_7_addr(pmp_io_pmp_7_addr),
    .io_pmp_7_mask(pmp_io_pmp_7_mask),
    .io_addr(pmp_io_addr),
    .io_size(pmp_io_size),
    .io_r(pmp_io_r),
    .io_w(pmp_io_w),
    .io_x(pmp_io_x)
  );
  OptimizationBarrier ppn_data_barrier ( // @[package.scala 258:25]
    .clock(ppn_data_barrier_clock),
    .reset(ppn_data_barrier_reset),
    .io_x_ppn(ppn_data_barrier_io_x_ppn),
    .io_x_u(ppn_data_barrier_io_x_u),
    .io_x_g(ppn_data_barrier_io_x_g),
    .io_x_ae(ppn_data_barrier_io_x_ae),
    .io_x_sw(ppn_data_barrier_io_x_sw),
    .io_x_sx(ppn_data_barrier_io_x_sx),
    .io_x_sr(ppn_data_barrier_io_x_sr),
    .io_x_pw(ppn_data_barrier_io_x_pw),
    .io_x_px(ppn_data_barrier_io_x_px),
    .io_x_pr(ppn_data_barrier_io_x_pr),
    .io_x_ppp(ppn_data_barrier_io_x_ppp),
    .io_x_pal(ppn_data_barrier_io_x_pal),
    .io_x_paa(ppn_data_barrier_io_x_paa),
    .io_x_eff(ppn_data_barrier_io_x_eff),
    .io_x_c(ppn_data_barrier_io_x_c),
    .io_x_fragmented_superpage(ppn_data_barrier_io_x_fragmented_superpage),
    .io_y_ppn(ppn_data_barrier_io_y_ppn),
    .io_y_u(ppn_data_barrier_io_y_u),
    .io_y_g(ppn_data_barrier_io_y_g),
    .io_y_ae(ppn_data_barrier_io_y_ae),
    .io_y_sw(ppn_data_barrier_io_y_sw),
    .io_y_sx(ppn_data_barrier_io_y_sx),
    .io_y_sr(ppn_data_barrier_io_y_sr),
    .io_y_pw(ppn_data_barrier_io_y_pw),
    .io_y_px(ppn_data_barrier_io_y_px),
    .io_y_pr(ppn_data_barrier_io_y_pr),
    .io_y_ppp(ppn_data_barrier_io_y_ppp),
    .io_y_pal(ppn_data_barrier_io_y_pal),
    .io_y_paa(ppn_data_barrier_io_y_paa),
    .io_y_eff(ppn_data_barrier_io_y_eff),
    .io_y_c(ppn_data_barrier_io_y_c),
    .io_y_fragmented_superpage(ppn_data_barrier_io_y_fragmented_superpage)
  );
  OptimizationBarrier ppn_data_barrier_1 ( // @[package.scala 258:25]
    .clock(ppn_data_barrier_1_clock),
    .reset(ppn_data_barrier_1_reset),
    .io_x_ppn(ppn_data_barrier_1_io_x_ppn),
    .io_x_u(ppn_data_barrier_1_io_x_u),
    .io_x_g(ppn_data_barrier_1_io_x_g),
    .io_x_ae(ppn_data_barrier_1_io_x_ae),
    .io_x_sw(ppn_data_barrier_1_io_x_sw),
    .io_x_sx(ppn_data_barrier_1_io_x_sx),
    .io_x_sr(ppn_data_barrier_1_io_x_sr),
    .io_x_pw(ppn_data_barrier_1_io_x_pw),
    .io_x_px(ppn_data_barrier_1_io_x_px),
    .io_x_pr(ppn_data_barrier_1_io_x_pr),
    .io_x_ppp(ppn_data_barrier_1_io_x_ppp),
    .io_x_pal(ppn_data_barrier_1_io_x_pal),
    .io_x_paa(ppn_data_barrier_1_io_x_paa),
    .io_x_eff(ppn_data_barrier_1_io_x_eff),
    .io_x_c(ppn_data_barrier_1_io_x_c),
    .io_x_fragmented_superpage(ppn_data_barrier_1_io_x_fragmented_superpage),
    .io_y_ppn(ppn_data_barrier_1_io_y_ppn),
    .io_y_u(ppn_data_barrier_1_io_y_u),
    .io_y_g(ppn_data_barrier_1_io_y_g),
    .io_y_ae(ppn_data_barrier_1_io_y_ae),
    .io_y_sw(ppn_data_barrier_1_io_y_sw),
    .io_y_sx(ppn_data_barrier_1_io_y_sx),
    .io_y_sr(ppn_data_barrier_1_io_y_sr),
    .io_y_pw(ppn_data_barrier_1_io_y_pw),
    .io_y_px(ppn_data_barrier_1_io_y_px),
    .io_y_pr(ppn_data_barrier_1_io_y_pr),
    .io_y_ppp(ppn_data_barrier_1_io_y_ppp),
    .io_y_pal(ppn_data_barrier_1_io_y_pal),
    .io_y_paa(ppn_data_barrier_1_io_y_paa),
    .io_y_eff(ppn_data_barrier_1_io_y_eff),
    .io_y_c(ppn_data_barrier_1_io_y_c),
    .io_y_fragmented_superpage(ppn_data_barrier_1_io_y_fragmented_superpage)
  );
  OptimizationBarrier ppn_data_barrier_2 ( // @[package.scala 258:25]
    .clock(ppn_data_barrier_2_clock),
    .reset(ppn_data_barrier_2_reset),
    .io_x_ppn(ppn_data_barrier_2_io_x_ppn),
    .io_x_u(ppn_data_barrier_2_io_x_u),
    .io_x_g(ppn_data_barrier_2_io_x_g),
    .io_x_ae(ppn_data_barrier_2_io_x_ae),
    .io_x_sw(ppn_data_barrier_2_io_x_sw),
    .io_x_sx(ppn_data_barrier_2_io_x_sx),
    .io_x_sr(ppn_data_barrier_2_io_x_sr),
    .io_x_pw(ppn_data_barrier_2_io_x_pw),
    .io_x_px(ppn_data_barrier_2_io_x_px),
    .io_x_pr(ppn_data_barrier_2_io_x_pr),
    .io_x_ppp(ppn_data_barrier_2_io_x_ppp),
    .io_x_pal(ppn_data_barrier_2_io_x_pal),
    .io_x_paa(ppn_data_barrier_2_io_x_paa),
    .io_x_eff(ppn_data_barrier_2_io_x_eff),
    .io_x_c(ppn_data_barrier_2_io_x_c),
    .io_x_fragmented_superpage(ppn_data_barrier_2_io_x_fragmented_superpage),
    .io_y_ppn(ppn_data_barrier_2_io_y_ppn),
    .io_y_u(ppn_data_barrier_2_io_y_u),
    .io_y_g(ppn_data_barrier_2_io_y_g),
    .io_y_ae(ppn_data_barrier_2_io_y_ae),
    .io_y_sw(ppn_data_barrier_2_io_y_sw),
    .io_y_sx(ppn_data_barrier_2_io_y_sx),
    .io_y_sr(ppn_data_barrier_2_io_y_sr),
    .io_y_pw(ppn_data_barrier_2_io_y_pw),
    .io_y_px(ppn_data_barrier_2_io_y_px),
    .io_y_pr(ppn_data_barrier_2_io_y_pr),
    .io_y_ppp(ppn_data_barrier_2_io_y_ppp),
    .io_y_pal(ppn_data_barrier_2_io_y_pal),
    .io_y_paa(ppn_data_barrier_2_io_y_paa),
    .io_y_eff(ppn_data_barrier_2_io_y_eff),
    .io_y_c(ppn_data_barrier_2_io_y_c),
    .io_y_fragmented_superpage(ppn_data_barrier_2_io_y_fragmented_superpage)
  );
  OptimizationBarrier ppn_data_barrier_3 ( // @[package.scala 258:25]
    .clock(ppn_data_barrier_3_clock),
    .reset(ppn_data_barrier_3_reset),
    .io_x_ppn(ppn_data_barrier_3_io_x_ppn),
    .io_x_u(ppn_data_barrier_3_io_x_u),
    .io_x_g(ppn_data_barrier_3_io_x_g),
    .io_x_ae(ppn_data_barrier_3_io_x_ae),
    .io_x_sw(ppn_data_barrier_3_io_x_sw),
    .io_x_sx(ppn_data_barrier_3_io_x_sx),
    .io_x_sr(ppn_data_barrier_3_io_x_sr),
    .io_x_pw(ppn_data_barrier_3_io_x_pw),
    .io_x_px(ppn_data_barrier_3_io_x_px),
    .io_x_pr(ppn_data_barrier_3_io_x_pr),
    .io_x_ppp(ppn_data_barrier_3_io_x_ppp),
    .io_x_pal(ppn_data_barrier_3_io_x_pal),
    .io_x_paa(ppn_data_barrier_3_io_x_paa),
    .io_x_eff(ppn_data_barrier_3_io_x_eff),
    .io_x_c(ppn_data_barrier_3_io_x_c),
    .io_x_fragmented_superpage(ppn_data_barrier_3_io_x_fragmented_superpage),
    .io_y_ppn(ppn_data_barrier_3_io_y_ppn),
    .io_y_u(ppn_data_barrier_3_io_y_u),
    .io_y_g(ppn_data_barrier_3_io_y_g),
    .io_y_ae(ppn_data_barrier_3_io_y_ae),
    .io_y_sw(ppn_data_barrier_3_io_y_sw),
    .io_y_sx(ppn_data_barrier_3_io_y_sx),
    .io_y_sr(ppn_data_barrier_3_io_y_sr),
    .io_y_pw(ppn_data_barrier_3_io_y_pw),
    .io_y_px(ppn_data_barrier_3_io_y_px),
    .io_y_pr(ppn_data_barrier_3_io_y_pr),
    .io_y_ppp(ppn_data_barrier_3_io_y_ppp),
    .io_y_pal(ppn_data_barrier_3_io_y_pal),
    .io_y_paa(ppn_data_barrier_3_io_y_paa),
    .io_y_eff(ppn_data_barrier_3_io_y_eff),
    .io_y_c(ppn_data_barrier_3_io_y_c),
    .io_y_fragmented_superpage(ppn_data_barrier_3_io_y_fragmented_superpage)
  );
  OptimizationBarrier ppn_data_barrier_4 ( // @[package.scala 258:25]
    .clock(ppn_data_barrier_4_clock),
    .reset(ppn_data_barrier_4_reset),
    .io_x_ppn(ppn_data_barrier_4_io_x_ppn),
    .io_x_u(ppn_data_barrier_4_io_x_u),
    .io_x_g(ppn_data_barrier_4_io_x_g),
    .io_x_ae(ppn_data_barrier_4_io_x_ae),
    .io_x_sw(ppn_data_barrier_4_io_x_sw),
    .io_x_sx(ppn_data_barrier_4_io_x_sx),
    .io_x_sr(ppn_data_barrier_4_io_x_sr),
    .io_x_pw(ppn_data_barrier_4_io_x_pw),
    .io_x_px(ppn_data_barrier_4_io_x_px),
    .io_x_pr(ppn_data_barrier_4_io_x_pr),
    .io_x_ppp(ppn_data_barrier_4_io_x_ppp),
    .io_x_pal(ppn_data_barrier_4_io_x_pal),
    .io_x_paa(ppn_data_barrier_4_io_x_paa),
    .io_x_eff(ppn_data_barrier_4_io_x_eff),
    .io_x_c(ppn_data_barrier_4_io_x_c),
    .io_x_fragmented_superpage(ppn_data_barrier_4_io_x_fragmented_superpage),
    .io_y_ppn(ppn_data_barrier_4_io_y_ppn),
    .io_y_u(ppn_data_barrier_4_io_y_u),
    .io_y_g(ppn_data_barrier_4_io_y_g),
    .io_y_ae(ppn_data_barrier_4_io_y_ae),
    .io_y_sw(ppn_data_barrier_4_io_y_sw),
    .io_y_sx(ppn_data_barrier_4_io_y_sx),
    .io_y_sr(ppn_data_barrier_4_io_y_sr),
    .io_y_pw(ppn_data_barrier_4_io_y_pw),
    .io_y_px(ppn_data_barrier_4_io_y_px),
    .io_y_pr(ppn_data_barrier_4_io_y_pr),
    .io_y_ppp(ppn_data_barrier_4_io_y_ppp),
    .io_y_pal(ppn_data_barrier_4_io_y_pal),
    .io_y_paa(ppn_data_barrier_4_io_y_paa),
    .io_y_eff(ppn_data_barrier_4_io_y_eff),
    .io_y_c(ppn_data_barrier_4_io_y_c),
    .io_y_fragmented_superpage(ppn_data_barrier_4_io_y_fragmented_superpage)
  );
  OptimizationBarrier ppn_data_barrier_5 ( // @[package.scala 258:25]
    .clock(ppn_data_barrier_5_clock),
    .reset(ppn_data_barrier_5_reset),
    .io_x_ppn(ppn_data_barrier_5_io_x_ppn),
    .io_x_u(ppn_data_barrier_5_io_x_u),
    .io_x_g(ppn_data_barrier_5_io_x_g),
    .io_x_ae(ppn_data_barrier_5_io_x_ae),
    .io_x_sw(ppn_data_barrier_5_io_x_sw),
    .io_x_sx(ppn_data_barrier_5_io_x_sx),
    .io_x_sr(ppn_data_barrier_5_io_x_sr),
    .io_x_pw(ppn_data_barrier_5_io_x_pw),
    .io_x_px(ppn_data_barrier_5_io_x_px),
    .io_x_pr(ppn_data_barrier_5_io_x_pr),
    .io_x_ppp(ppn_data_barrier_5_io_x_ppp),
    .io_x_pal(ppn_data_barrier_5_io_x_pal),
    .io_x_paa(ppn_data_barrier_5_io_x_paa),
    .io_x_eff(ppn_data_barrier_5_io_x_eff),
    .io_x_c(ppn_data_barrier_5_io_x_c),
    .io_x_fragmented_superpage(ppn_data_barrier_5_io_x_fragmented_superpage),
    .io_y_ppn(ppn_data_barrier_5_io_y_ppn),
    .io_y_u(ppn_data_barrier_5_io_y_u),
    .io_y_g(ppn_data_barrier_5_io_y_g),
    .io_y_ae(ppn_data_barrier_5_io_y_ae),
    .io_y_sw(ppn_data_barrier_5_io_y_sw),
    .io_y_sx(ppn_data_barrier_5_io_y_sx),
    .io_y_sr(ppn_data_barrier_5_io_y_sr),
    .io_y_pw(ppn_data_barrier_5_io_y_pw),
    .io_y_px(ppn_data_barrier_5_io_y_px),
    .io_y_pr(ppn_data_barrier_5_io_y_pr),
    .io_y_ppp(ppn_data_barrier_5_io_y_ppp),
    .io_y_pal(ppn_data_barrier_5_io_y_pal),
    .io_y_paa(ppn_data_barrier_5_io_y_paa),
    .io_y_eff(ppn_data_barrier_5_io_y_eff),
    .io_y_c(ppn_data_barrier_5_io_y_c),
    .io_y_fragmented_superpage(ppn_data_barrier_5_io_y_fragmented_superpage)
  );
  OptimizationBarrier entries_barrier ( // @[package.scala 258:25]
    .clock(entries_barrier_clock),
    .reset(entries_barrier_reset),
    .io_x_ppn(entries_barrier_io_x_ppn),
    .io_x_u(entries_barrier_io_x_u),
    .io_x_g(entries_barrier_io_x_g),
    .io_x_ae(entries_barrier_io_x_ae),
    .io_x_sw(entries_barrier_io_x_sw),
    .io_x_sx(entries_barrier_io_x_sx),
    .io_x_sr(entries_barrier_io_x_sr),
    .io_x_pw(entries_barrier_io_x_pw),
    .io_x_px(entries_barrier_io_x_px),
    .io_x_pr(entries_barrier_io_x_pr),
    .io_x_ppp(entries_barrier_io_x_ppp),
    .io_x_pal(entries_barrier_io_x_pal),
    .io_x_paa(entries_barrier_io_x_paa),
    .io_x_eff(entries_barrier_io_x_eff),
    .io_x_c(entries_barrier_io_x_c),
    .io_x_fragmented_superpage(entries_barrier_io_x_fragmented_superpage),
    .io_y_ppn(entries_barrier_io_y_ppn),
    .io_y_u(entries_barrier_io_y_u),
    .io_y_g(entries_barrier_io_y_g),
    .io_y_ae(entries_barrier_io_y_ae),
    .io_y_sw(entries_barrier_io_y_sw),
    .io_y_sx(entries_barrier_io_y_sx),
    .io_y_sr(entries_barrier_io_y_sr),
    .io_y_pw(entries_barrier_io_y_pw),
    .io_y_px(entries_barrier_io_y_px),
    .io_y_pr(entries_barrier_io_y_pr),
    .io_y_ppp(entries_barrier_io_y_ppp),
    .io_y_pal(entries_barrier_io_y_pal),
    .io_y_paa(entries_barrier_io_y_paa),
    .io_y_eff(entries_barrier_io_y_eff),
    .io_y_c(entries_barrier_io_y_c),
    .io_y_fragmented_superpage(entries_barrier_io_y_fragmented_superpage)
  );
  OptimizationBarrier entries_barrier_1 ( // @[package.scala 258:25]
    .clock(entries_barrier_1_clock),
    .reset(entries_barrier_1_reset),
    .io_x_ppn(entries_barrier_1_io_x_ppn),
    .io_x_u(entries_barrier_1_io_x_u),
    .io_x_g(entries_barrier_1_io_x_g),
    .io_x_ae(entries_barrier_1_io_x_ae),
    .io_x_sw(entries_barrier_1_io_x_sw),
    .io_x_sx(entries_barrier_1_io_x_sx),
    .io_x_sr(entries_barrier_1_io_x_sr),
    .io_x_pw(entries_barrier_1_io_x_pw),
    .io_x_px(entries_barrier_1_io_x_px),
    .io_x_pr(entries_barrier_1_io_x_pr),
    .io_x_ppp(entries_barrier_1_io_x_ppp),
    .io_x_pal(entries_barrier_1_io_x_pal),
    .io_x_paa(entries_barrier_1_io_x_paa),
    .io_x_eff(entries_barrier_1_io_x_eff),
    .io_x_c(entries_barrier_1_io_x_c),
    .io_x_fragmented_superpage(entries_barrier_1_io_x_fragmented_superpage),
    .io_y_ppn(entries_barrier_1_io_y_ppn),
    .io_y_u(entries_barrier_1_io_y_u),
    .io_y_g(entries_barrier_1_io_y_g),
    .io_y_ae(entries_barrier_1_io_y_ae),
    .io_y_sw(entries_barrier_1_io_y_sw),
    .io_y_sx(entries_barrier_1_io_y_sx),
    .io_y_sr(entries_barrier_1_io_y_sr),
    .io_y_pw(entries_barrier_1_io_y_pw),
    .io_y_px(entries_barrier_1_io_y_px),
    .io_y_pr(entries_barrier_1_io_y_pr),
    .io_y_ppp(entries_barrier_1_io_y_ppp),
    .io_y_pal(entries_barrier_1_io_y_pal),
    .io_y_paa(entries_barrier_1_io_y_paa),
    .io_y_eff(entries_barrier_1_io_y_eff),
    .io_y_c(entries_barrier_1_io_y_c),
    .io_y_fragmented_superpage(entries_barrier_1_io_y_fragmented_superpage)
  );
  OptimizationBarrier entries_barrier_2 ( // @[package.scala 258:25]
    .clock(entries_barrier_2_clock),
    .reset(entries_barrier_2_reset),
    .io_x_ppn(entries_barrier_2_io_x_ppn),
    .io_x_u(entries_barrier_2_io_x_u),
    .io_x_g(entries_barrier_2_io_x_g),
    .io_x_ae(entries_barrier_2_io_x_ae),
    .io_x_sw(entries_barrier_2_io_x_sw),
    .io_x_sx(entries_barrier_2_io_x_sx),
    .io_x_sr(entries_barrier_2_io_x_sr),
    .io_x_pw(entries_barrier_2_io_x_pw),
    .io_x_px(entries_barrier_2_io_x_px),
    .io_x_pr(entries_barrier_2_io_x_pr),
    .io_x_ppp(entries_barrier_2_io_x_ppp),
    .io_x_pal(entries_barrier_2_io_x_pal),
    .io_x_paa(entries_barrier_2_io_x_paa),
    .io_x_eff(entries_barrier_2_io_x_eff),
    .io_x_c(entries_barrier_2_io_x_c),
    .io_x_fragmented_superpage(entries_barrier_2_io_x_fragmented_superpage),
    .io_y_ppn(entries_barrier_2_io_y_ppn),
    .io_y_u(entries_barrier_2_io_y_u),
    .io_y_g(entries_barrier_2_io_y_g),
    .io_y_ae(entries_barrier_2_io_y_ae),
    .io_y_sw(entries_barrier_2_io_y_sw),
    .io_y_sx(entries_barrier_2_io_y_sx),
    .io_y_sr(entries_barrier_2_io_y_sr),
    .io_y_pw(entries_barrier_2_io_y_pw),
    .io_y_px(entries_barrier_2_io_y_px),
    .io_y_pr(entries_barrier_2_io_y_pr),
    .io_y_ppp(entries_barrier_2_io_y_ppp),
    .io_y_pal(entries_barrier_2_io_y_pal),
    .io_y_paa(entries_barrier_2_io_y_paa),
    .io_y_eff(entries_barrier_2_io_y_eff),
    .io_y_c(entries_barrier_2_io_y_c),
    .io_y_fragmented_superpage(entries_barrier_2_io_y_fragmented_superpage)
  );
  OptimizationBarrier entries_barrier_3 ( // @[package.scala 258:25]
    .clock(entries_barrier_3_clock),
    .reset(entries_barrier_3_reset),
    .io_x_ppn(entries_barrier_3_io_x_ppn),
    .io_x_u(entries_barrier_3_io_x_u),
    .io_x_g(entries_barrier_3_io_x_g),
    .io_x_ae(entries_barrier_3_io_x_ae),
    .io_x_sw(entries_barrier_3_io_x_sw),
    .io_x_sx(entries_barrier_3_io_x_sx),
    .io_x_sr(entries_barrier_3_io_x_sr),
    .io_x_pw(entries_barrier_3_io_x_pw),
    .io_x_px(entries_barrier_3_io_x_px),
    .io_x_pr(entries_barrier_3_io_x_pr),
    .io_x_ppp(entries_barrier_3_io_x_ppp),
    .io_x_pal(entries_barrier_3_io_x_pal),
    .io_x_paa(entries_barrier_3_io_x_paa),
    .io_x_eff(entries_barrier_3_io_x_eff),
    .io_x_c(entries_barrier_3_io_x_c),
    .io_x_fragmented_superpage(entries_barrier_3_io_x_fragmented_superpage),
    .io_y_ppn(entries_barrier_3_io_y_ppn),
    .io_y_u(entries_barrier_3_io_y_u),
    .io_y_g(entries_barrier_3_io_y_g),
    .io_y_ae(entries_barrier_3_io_y_ae),
    .io_y_sw(entries_barrier_3_io_y_sw),
    .io_y_sx(entries_barrier_3_io_y_sx),
    .io_y_sr(entries_barrier_3_io_y_sr),
    .io_y_pw(entries_barrier_3_io_y_pw),
    .io_y_px(entries_barrier_3_io_y_px),
    .io_y_pr(entries_barrier_3_io_y_pr),
    .io_y_ppp(entries_barrier_3_io_y_ppp),
    .io_y_pal(entries_barrier_3_io_y_pal),
    .io_y_paa(entries_barrier_3_io_y_paa),
    .io_y_eff(entries_barrier_3_io_y_eff),
    .io_y_c(entries_barrier_3_io_y_c),
    .io_y_fragmented_superpage(entries_barrier_3_io_y_fragmented_superpage)
  );
  OptimizationBarrier entries_barrier_4 ( // @[package.scala 258:25]
    .clock(entries_barrier_4_clock),
    .reset(entries_barrier_4_reset),
    .io_x_ppn(entries_barrier_4_io_x_ppn),
    .io_x_u(entries_barrier_4_io_x_u),
    .io_x_g(entries_barrier_4_io_x_g),
    .io_x_ae(entries_barrier_4_io_x_ae),
    .io_x_sw(entries_barrier_4_io_x_sw),
    .io_x_sx(entries_barrier_4_io_x_sx),
    .io_x_sr(entries_barrier_4_io_x_sr),
    .io_x_pw(entries_barrier_4_io_x_pw),
    .io_x_px(entries_barrier_4_io_x_px),
    .io_x_pr(entries_barrier_4_io_x_pr),
    .io_x_ppp(entries_barrier_4_io_x_ppp),
    .io_x_pal(entries_barrier_4_io_x_pal),
    .io_x_paa(entries_barrier_4_io_x_paa),
    .io_x_eff(entries_barrier_4_io_x_eff),
    .io_x_c(entries_barrier_4_io_x_c),
    .io_x_fragmented_superpage(entries_barrier_4_io_x_fragmented_superpage),
    .io_y_ppn(entries_barrier_4_io_y_ppn),
    .io_y_u(entries_barrier_4_io_y_u),
    .io_y_g(entries_barrier_4_io_y_g),
    .io_y_ae(entries_barrier_4_io_y_ae),
    .io_y_sw(entries_barrier_4_io_y_sw),
    .io_y_sx(entries_barrier_4_io_y_sx),
    .io_y_sr(entries_barrier_4_io_y_sr),
    .io_y_pw(entries_barrier_4_io_y_pw),
    .io_y_px(entries_barrier_4_io_y_px),
    .io_y_pr(entries_barrier_4_io_y_pr),
    .io_y_ppp(entries_barrier_4_io_y_ppp),
    .io_y_pal(entries_barrier_4_io_y_pal),
    .io_y_paa(entries_barrier_4_io_y_paa),
    .io_y_eff(entries_barrier_4_io_y_eff),
    .io_y_c(entries_barrier_4_io_y_c),
    .io_y_fragmented_superpage(entries_barrier_4_io_y_fragmented_superpage)
  );
  OptimizationBarrier entries_barrier_5 ( // @[package.scala 258:25]
    .clock(entries_barrier_5_clock),
    .reset(entries_barrier_5_reset),
    .io_x_ppn(entries_barrier_5_io_x_ppn),
    .io_x_u(entries_barrier_5_io_x_u),
    .io_x_g(entries_barrier_5_io_x_g),
    .io_x_ae(entries_barrier_5_io_x_ae),
    .io_x_sw(entries_barrier_5_io_x_sw),
    .io_x_sx(entries_barrier_5_io_x_sx),
    .io_x_sr(entries_barrier_5_io_x_sr),
    .io_x_pw(entries_barrier_5_io_x_pw),
    .io_x_px(entries_barrier_5_io_x_px),
    .io_x_pr(entries_barrier_5_io_x_pr),
    .io_x_ppp(entries_barrier_5_io_x_ppp),
    .io_x_pal(entries_barrier_5_io_x_pal),
    .io_x_paa(entries_barrier_5_io_x_paa),
    .io_x_eff(entries_barrier_5_io_x_eff),
    .io_x_c(entries_barrier_5_io_x_c),
    .io_x_fragmented_superpage(entries_barrier_5_io_x_fragmented_superpage),
    .io_y_ppn(entries_barrier_5_io_y_ppn),
    .io_y_u(entries_barrier_5_io_y_u),
    .io_y_g(entries_barrier_5_io_y_g),
    .io_y_ae(entries_barrier_5_io_y_ae),
    .io_y_sw(entries_barrier_5_io_y_sw),
    .io_y_sx(entries_barrier_5_io_y_sx),
    .io_y_sr(entries_barrier_5_io_y_sr),
    .io_y_pw(entries_barrier_5_io_y_pw),
    .io_y_px(entries_barrier_5_io_y_px),
    .io_y_pr(entries_barrier_5_io_y_pr),
    .io_y_ppp(entries_barrier_5_io_y_ppp),
    .io_y_pal(entries_barrier_5_io_y_pal),
    .io_y_paa(entries_barrier_5_io_y_paa),
    .io_y_eff(entries_barrier_5_io_y_eff),
    .io_y_c(entries_barrier_5_io_y_c),
    .io_y_fragmented_superpage(entries_barrier_5_io_y_fragmented_superpage)
  );
  OptimizationBarrier normal_entries_barrier ( // @[package.scala 258:25]
    .clock(normal_entries_barrier_clock),
    .reset(normal_entries_barrier_reset),
    .io_x_ppn(normal_entries_barrier_io_x_ppn),
    .io_x_u(normal_entries_barrier_io_x_u),
    .io_x_g(normal_entries_barrier_io_x_g),
    .io_x_ae(normal_entries_barrier_io_x_ae),
    .io_x_sw(normal_entries_barrier_io_x_sw),
    .io_x_sx(normal_entries_barrier_io_x_sx),
    .io_x_sr(normal_entries_barrier_io_x_sr),
    .io_x_pw(normal_entries_barrier_io_x_pw),
    .io_x_px(normal_entries_barrier_io_x_px),
    .io_x_pr(normal_entries_barrier_io_x_pr),
    .io_x_ppp(normal_entries_barrier_io_x_ppp),
    .io_x_pal(normal_entries_barrier_io_x_pal),
    .io_x_paa(normal_entries_barrier_io_x_paa),
    .io_x_eff(normal_entries_barrier_io_x_eff),
    .io_x_c(normal_entries_barrier_io_x_c),
    .io_x_fragmented_superpage(normal_entries_barrier_io_x_fragmented_superpage),
    .io_y_ppn(normal_entries_barrier_io_y_ppn),
    .io_y_u(normal_entries_barrier_io_y_u),
    .io_y_g(normal_entries_barrier_io_y_g),
    .io_y_ae(normal_entries_barrier_io_y_ae),
    .io_y_sw(normal_entries_barrier_io_y_sw),
    .io_y_sx(normal_entries_barrier_io_y_sx),
    .io_y_sr(normal_entries_barrier_io_y_sr),
    .io_y_pw(normal_entries_barrier_io_y_pw),
    .io_y_px(normal_entries_barrier_io_y_px),
    .io_y_pr(normal_entries_barrier_io_y_pr),
    .io_y_ppp(normal_entries_barrier_io_y_ppp),
    .io_y_pal(normal_entries_barrier_io_y_pal),
    .io_y_paa(normal_entries_barrier_io_y_paa),
    .io_y_eff(normal_entries_barrier_io_y_eff),
    .io_y_c(normal_entries_barrier_io_y_c),
    .io_y_fragmented_superpage(normal_entries_barrier_io_y_fragmented_superpage)
  );
  OptimizationBarrier normal_entries_barrier_1 ( // @[package.scala 258:25]
    .clock(normal_entries_barrier_1_clock),
    .reset(normal_entries_barrier_1_reset),
    .io_x_ppn(normal_entries_barrier_1_io_x_ppn),
    .io_x_u(normal_entries_barrier_1_io_x_u),
    .io_x_g(normal_entries_barrier_1_io_x_g),
    .io_x_ae(normal_entries_barrier_1_io_x_ae),
    .io_x_sw(normal_entries_barrier_1_io_x_sw),
    .io_x_sx(normal_entries_barrier_1_io_x_sx),
    .io_x_sr(normal_entries_barrier_1_io_x_sr),
    .io_x_pw(normal_entries_barrier_1_io_x_pw),
    .io_x_px(normal_entries_barrier_1_io_x_px),
    .io_x_pr(normal_entries_barrier_1_io_x_pr),
    .io_x_ppp(normal_entries_barrier_1_io_x_ppp),
    .io_x_pal(normal_entries_barrier_1_io_x_pal),
    .io_x_paa(normal_entries_barrier_1_io_x_paa),
    .io_x_eff(normal_entries_barrier_1_io_x_eff),
    .io_x_c(normal_entries_barrier_1_io_x_c),
    .io_x_fragmented_superpage(normal_entries_barrier_1_io_x_fragmented_superpage),
    .io_y_ppn(normal_entries_barrier_1_io_y_ppn),
    .io_y_u(normal_entries_barrier_1_io_y_u),
    .io_y_g(normal_entries_barrier_1_io_y_g),
    .io_y_ae(normal_entries_barrier_1_io_y_ae),
    .io_y_sw(normal_entries_barrier_1_io_y_sw),
    .io_y_sx(normal_entries_barrier_1_io_y_sx),
    .io_y_sr(normal_entries_barrier_1_io_y_sr),
    .io_y_pw(normal_entries_barrier_1_io_y_pw),
    .io_y_px(normal_entries_barrier_1_io_y_px),
    .io_y_pr(normal_entries_barrier_1_io_y_pr),
    .io_y_ppp(normal_entries_barrier_1_io_y_ppp),
    .io_y_pal(normal_entries_barrier_1_io_y_pal),
    .io_y_paa(normal_entries_barrier_1_io_y_paa),
    .io_y_eff(normal_entries_barrier_1_io_y_eff),
    .io_y_c(normal_entries_barrier_1_io_y_c),
    .io_y_fragmented_superpage(normal_entries_barrier_1_io_y_fragmented_superpage)
  );
  OptimizationBarrier normal_entries_barrier_2 ( // @[package.scala 258:25]
    .clock(normal_entries_barrier_2_clock),
    .reset(normal_entries_barrier_2_reset),
    .io_x_ppn(normal_entries_barrier_2_io_x_ppn),
    .io_x_u(normal_entries_barrier_2_io_x_u),
    .io_x_g(normal_entries_barrier_2_io_x_g),
    .io_x_ae(normal_entries_barrier_2_io_x_ae),
    .io_x_sw(normal_entries_barrier_2_io_x_sw),
    .io_x_sx(normal_entries_barrier_2_io_x_sx),
    .io_x_sr(normal_entries_barrier_2_io_x_sr),
    .io_x_pw(normal_entries_barrier_2_io_x_pw),
    .io_x_px(normal_entries_barrier_2_io_x_px),
    .io_x_pr(normal_entries_barrier_2_io_x_pr),
    .io_x_ppp(normal_entries_barrier_2_io_x_ppp),
    .io_x_pal(normal_entries_barrier_2_io_x_pal),
    .io_x_paa(normal_entries_barrier_2_io_x_paa),
    .io_x_eff(normal_entries_barrier_2_io_x_eff),
    .io_x_c(normal_entries_barrier_2_io_x_c),
    .io_x_fragmented_superpage(normal_entries_barrier_2_io_x_fragmented_superpage),
    .io_y_ppn(normal_entries_barrier_2_io_y_ppn),
    .io_y_u(normal_entries_barrier_2_io_y_u),
    .io_y_g(normal_entries_barrier_2_io_y_g),
    .io_y_ae(normal_entries_barrier_2_io_y_ae),
    .io_y_sw(normal_entries_barrier_2_io_y_sw),
    .io_y_sx(normal_entries_barrier_2_io_y_sx),
    .io_y_sr(normal_entries_barrier_2_io_y_sr),
    .io_y_pw(normal_entries_barrier_2_io_y_pw),
    .io_y_px(normal_entries_barrier_2_io_y_px),
    .io_y_pr(normal_entries_barrier_2_io_y_pr),
    .io_y_ppp(normal_entries_barrier_2_io_y_ppp),
    .io_y_pal(normal_entries_barrier_2_io_y_pal),
    .io_y_paa(normal_entries_barrier_2_io_y_paa),
    .io_y_eff(normal_entries_barrier_2_io_y_eff),
    .io_y_c(normal_entries_barrier_2_io_y_c),
    .io_y_fragmented_superpage(normal_entries_barrier_2_io_y_fragmented_superpage)
  );
  OptimizationBarrier normal_entries_barrier_3 ( // @[package.scala 258:25]
    .clock(normal_entries_barrier_3_clock),
    .reset(normal_entries_barrier_3_reset),
    .io_x_ppn(normal_entries_barrier_3_io_x_ppn),
    .io_x_u(normal_entries_barrier_3_io_x_u),
    .io_x_g(normal_entries_barrier_3_io_x_g),
    .io_x_ae(normal_entries_barrier_3_io_x_ae),
    .io_x_sw(normal_entries_barrier_3_io_x_sw),
    .io_x_sx(normal_entries_barrier_3_io_x_sx),
    .io_x_sr(normal_entries_barrier_3_io_x_sr),
    .io_x_pw(normal_entries_barrier_3_io_x_pw),
    .io_x_px(normal_entries_barrier_3_io_x_px),
    .io_x_pr(normal_entries_barrier_3_io_x_pr),
    .io_x_ppp(normal_entries_barrier_3_io_x_ppp),
    .io_x_pal(normal_entries_barrier_3_io_x_pal),
    .io_x_paa(normal_entries_barrier_3_io_x_paa),
    .io_x_eff(normal_entries_barrier_3_io_x_eff),
    .io_x_c(normal_entries_barrier_3_io_x_c),
    .io_x_fragmented_superpage(normal_entries_barrier_3_io_x_fragmented_superpage),
    .io_y_ppn(normal_entries_barrier_3_io_y_ppn),
    .io_y_u(normal_entries_barrier_3_io_y_u),
    .io_y_g(normal_entries_barrier_3_io_y_g),
    .io_y_ae(normal_entries_barrier_3_io_y_ae),
    .io_y_sw(normal_entries_barrier_3_io_y_sw),
    .io_y_sx(normal_entries_barrier_3_io_y_sx),
    .io_y_sr(normal_entries_barrier_3_io_y_sr),
    .io_y_pw(normal_entries_barrier_3_io_y_pw),
    .io_y_px(normal_entries_barrier_3_io_y_px),
    .io_y_pr(normal_entries_barrier_3_io_y_pr),
    .io_y_ppp(normal_entries_barrier_3_io_y_ppp),
    .io_y_pal(normal_entries_barrier_3_io_y_pal),
    .io_y_paa(normal_entries_barrier_3_io_y_paa),
    .io_y_eff(normal_entries_barrier_3_io_y_eff),
    .io_y_c(normal_entries_barrier_3_io_y_c),
    .io_y_fragmented_superpage(normal_entries_barrier_3_io_y_fragmented_superpage)
  );
  OptimizationBarrier normal_entries_barrier_4 ( // @[package.scala 258:25]
    .clock(normal_entries_barrier_4_clock),
    .reset(normal_entries_barrier_4_reset),
    .io_x_ppn(normal_entries_barrier_4_io_x_ppn),
    .io_x_u(normal_entries_barrier_4_io_x_u),
    .io_x_g(normal_entries_barrier_4_io_x_g),
    .io_x_ae(normal_entries_barrier_4_io_x_ae),
    .io_x_sw(normal_entries_barrier_4_io_x_sw),
    .io_x_sx(normal_entries_barrier_4_io_x_sx),
    .io_x_sr(normal_entries_barrier_4_io_x_sr),
    .io_x_pw(normal_entries_barrier_4_io_x_pw),
    .io_x_px(normal_entries_barrier_4_io_x_px),
    .io_x_pr(normal_entries_barrier_4_io_x_pr),
    .io_x_ppp(normal_entries_barrier_4_io_x_ppp),
    .io_x_pal(normal_entries_barrier_4_io_x_pal),
    .io_x_paa(normal_entries_barrier_4_io_x_paa),
    .io_x_eff(normal_entries_barrier_4_io_x_eff),
    .io_x_c(normal_entries_barrier_4_io_x_c),
    .io_x_fragmented_superpage(normal_entries_barrier_4_io_x_fragmented_superpage),
    .io_y_ppn(normal_entries_barrier_4_io_y_ppn),
    .io_y_u(normal_entries_barrier_4_io_y_u),
    .io_y_g(normal_entries_barrier_4_io_y_g),
    .io_y_ae(normal_entries_barrier_4_io_y_ae),
    .io_y_sw(normal_entries_barrier_4_io_y_sw),
    .io_y_sx(normal_entries_barrier_4_io_y_sx),
    .io_y_sr(normal_entries_barrier_4_io_y_sr),
    .io_y_pw(normal_entries_barrier_4_io_y_pw),
    .io_y_px(normal_entries_barrier_4_io_y_px),
    .io_y_pr(normal_entries_barrier_4_io_y_pr),
    .io_y_ppp(normal_entries_barrier_4_io_y_ppp),
    .io_y_pal(normal_entries_barrier_4_io_y_pal),
    .io_y_paa(normal_entries_barrier_4_io_y_paa),
    .io_y_eff(normal_entries_barrier_4_io_y_eff),
    .io_y_c(normal_entries_barrier_4_io_y_c),
    .io_y_fragmented_superpage(normal_entries_barrier_4_io_y_fragmented_superpage)
  );
  assign io_req_ready = state == 2'h0; // @[TLB.scala 341:25]
  assign io_resp_miss = io_ptw_resp_valid | tlb_miss | multipleHits; // @[TLB.scala 354:41]
  assign io_resp_paddr = {ppn,mpu_physaddr_lo}; // @[Cat.scala 30:58]
  assign io_resp_pf_ld = bad_va & cmd_read | |_io_resp_pf_ld_T_1; // @[TLB.scala 342:41]
  assign io_resp_pf_st = bad_va & cmd_write_perms | |_io_resp_pf_st_T_1; // @[TLB.scala 343:48]
  assign io_resp_pf_inst = bad_va | |_io_resp_pf_inst_T; // @[TLB.scala 344:29]
  assign io_resp_ae_ld = |_io_resp_ae_ld_T; // @[TLB.scala 345:41]
  assign io_resp_ae_st = |_io_resp_ae_st_T; // @[TLB.scala 346:41]
  assign io_resp_ae_inst = |_io_resp_ae_inst_T_1; // @[TLB.scala 347:41]
  assign io_resp_ma_ld = |_io_resp_ma_ld_T; // @[TLB.scala 348:41]
  assign io_resp_ma_st = |_io_resp_ma_st_T; // @[TLB.scala 349:41]
  assign io_resp_ma_inst = 1'h0; // @[TLB.scala 350:19]
  assign io_resp_cacheable = |_io_resp_cacheable_T; // @[TLB.scala 351:41]
  assign io_resp_must_alloc = |_io_resp_must_alloc_T; // @[TLB.scala 352:51]
  assign io_resp_prefetchable = 1'h0; // @[TLB.scala 353:59]
  assign io_ptw_req_valid = state == 2'h1; // @[TLB.scala 357:29]
  assign io_ptw_req_bits_valid = ~io_kill; // @[TLB.scala 358:28]
  assign io_ptw_req_bits_bits_addr = r_refill_tag; // @[TLB.scala 359:29]
  assign mpu_ppn_data_barrier_clock = clock;
  assign mpu_ppn_data_barrier_reset = reset;
  assign mpu_ppn_data_barrier_io_x_ppn = special_entry_data_0[34:15]; // @[TLB.scala 86:77]
  assign mpu_ppn_data_barrier_io_x_u = special_entry_data_0[14]; // @[TLB.scala 86:77]
  assign mpu_ppn_data_barrier_io_x_g = special_entry_data_0[13]; // @[TLB.scala 86:77]
  assign mpu_ppn_data_barrier_io_x_ae = special_entry_data_0[12]; // @[TLB.scala 86:77]
  assign mpu_ppn_data_barrier_io_x_sw = special_entry_data_0[11]; // @[TLB.scala 86:77]
  assign mpu_ppn_data_barrier_io_x_sx = special_entry_data_0[10]; // @[TLB.scala 86:77]
  assign mpu_ppn_data_barrier_io_x_sr = special_entry_data_0[9]; // @[TLB.scala 86:77]
  assign mpu_ppn_data_barrier_io_x_pw = special_entry_data_0[8]; // @[TLB.scala 86:77]
  assign mpu_ppn_data_barrier_io_x_px = special_entry_data_0[7]; // @[TLB.scala 86:77]
  assign mpu_ppn_data_barrier_io_x_pr = special_entry_data_0[6]; // @[TLB.scala 86:77]
  assign mpu_ppn_data_barrier_io_x_ppp = special_entry_data_0[5]; // @[TLB.scala 86:77]
  assign mpu_ppn_data_barrier_io_x_pal = special_entry_data_0[4]; // @[TLB.scala 86:77]
  assign mpu_ppn_data_barrier_io_x_paa = special_entry_data_0[3]; // @[TLB.scala 86:77]
  assign mpu_ppn_data_barrier_io_x_eff = special_entry_data_0[2]; // @[TLB.scala 86:77]
  assign mpu_ppn_data_barrier_io_x_c = special_entry_data_0[1]; // @[TLB.scala 86:77]
  assign mpu_ppn_data_barrier_io_x_fragmented_superpage = special_entry_data_0[0]; // @[TLB.scala 86:77]
  assign pmp_clock = clock;
  assign pmp_reset = reset;
  assign pmp_io_prv = mpu_priv[1:0]; // @[TLB.scala 197:14]
  assign pmp_io_pmp_0_cfg_l = io_ptw_pmp_0_cfg_l; // @[TLB.scala 196:14]
  assign pmp_io_pmp_0_cfg_res = io_ptw_pmp_0_cfg_res; // @[TLB.scala 196:14]
  assign pmp_io_pmp_0_cfg_a = io_ptw_pmp_0_cfg_a; // @[TLB.scala 196:14]
  assign pmp_io_pmp_0_cfg_x = io_ptw_pmp_0_cfg_x; // @[TLB.scala 196:14]
  assign pmp_io_pmp_0_cfg_w = io_ptw_pmp_0_cfg_w; // @[TLB.scala 196:14]
  assign pmp_io_pmp_0_cfg_r = io_ptw_pmp_0_cfg_r; // @[TLB.scala 196:14]
  assign pmp_io_pmp_0_addr = io_ptw_pmp_0_addr; // @[TLB.scala 196:14]
  assign pmp_io_pmp_0_mask = io_ptw_pmp_0_mask; // @[TLB.scala 196:14]
  assign pmp_io_pmp_1_cfg_l = io_ptw_pmp_1_cfg_l; // @[TLB.scala 196:14]
  assign pmp_io_pmp_1_cfg_res = io_ptw_pmp_1_cfg_res; // @[TLB.scala 196:14]
  assign pmp_io_pmp_1_cfg_a = io_ptw_pmp_1_cfg_a; // @[TLB.scala 196:14]
  assign pmp_io_pmp_1_cfg_x = io_ptw_pmp_1_cfg_x; // @[TLB.scala 196:14]
  assign pmp_io_pmp_1_cfg_w = io_ptw_pmp_1_cfg_w; // @[TLB.scala 196:14]
  assign pmp_io_pmp_1_cfg_r = io_ptw_pmp_1_cfg_r; // @[TLB.scala 196:14]
  assign pmp_io_pmp_1_addr = io_ptw_pmp_1_addr; // @[TLB.scala 196:14]
  assign pmp_io_pmp_1_mask = io_ptw_pmp_1_mask; // @[TLB.scala 196:14]
  assign pmp_io_pmp_2_cfg_l = io_ptw_pmp_2_cfg_l; // @[TLB.scala 196:14]
  assign pmp_io_pmp_2_cfg_res = io_ptw_pmp_2_cfg_res; // @[TLB.scala 196:14]
  assign pmp_io_pmp_2_cfg_a = io_ptw_pmp_2_cfg_a; // @[TLB.scala 196:14]
  assign pmp_io_pmp_2_cfg_x = io_ptw_pmp_2_cfg_x; // @[TLB.scala 196:14]
  assign pmp_io_pmp_2_cfg_w = io_ptw_pmp_2_cfg_w; // @[TLB.scala 196:14]
  assign pmp_io_pmp_2_cfg_r = io_ptw_pmp_2_cfg_r; // @[TLB.scala 196:14]
  assign pmp_io_pmp_2_addr = io_ptw_pmp_2_addr; // @[TLB.scala 196:14]
  assign pmp_io_pmp_2_mask = io_ptw_pmp_2_mask; // @[TLB.scala 196:14]
  assign pmp_io_pmp_3_cfg_l = io_ptw_pmp_3_cfg_l; // @[TLB.scala 196:14]
  assign pmp_io_pmp_3_cfg_res = io_ptw_pmp_3_cfg_res; // @[TLB.scala 196:14]
  assign pmp_io_pmp_3_cfg_a = io_ptw_pmp_3_cfg_a; // @[TLB.scala 196:14]
  assign pmp_io_pmp_3_cfg_x = io_ptw_pmp_3_cfg_x; // @[TLB.scala 196:14]
  assign pmp_io_pmp_3_cfg_w = io_ptw_pmp_3_cfg_w; // @[TLB.scala 196:14]
  assign pmp_io_pmp_3_cfg_r = io_ptw_pmp_3_cfg_r; // @[TLB.scala 196:14]
  assign pmp_io_pmp_3_addr = io_ptw_pmp_3_addr; // @[TLB.scala 196:14]
  assign pmp_io_pmp_3_mask = io_ptw_pmp_3_mask; // @[TLB.scala 196:14]
  assign pmp_io_pmp_4_cfg_l = io_ptw_pmp_4_cfg_l; // @[TLB.scala 196:14]
  assign pmp_io_pmp_4_cfg_res = io_ptw_pmp_4_cfg_res; // @[TLB.scala 196:14]
  assign pmp_io_pmp_4_cfg_a = io_ptw_pmp_4_cfg_a; // @[TLB.scala 196:14]
  assign pmp_io_pmp_4_cfg_x = io_ptw_pmp_4_cfg_x; // @[TLB.scala 196:14]
  assign pmp_io_pmp_4_cfg_w = io_ptw_pmp_4_cfg_w; // @[TLB.scala 196:14]
  assign pmp_io_pmp_4_cfg_r = io_ptw_pmp_4_cfg_r; // @[TLB.scala 196:14]
  assign pmp_io_pmp_4_addr = io_ptw_pmp_4_addr; // @[TLB.scala 196:14]
  assign pmp_io_pmp_4_mask = io_ptw_pmp_4_mask; // @[TLB.scala 196:14]
  assign pmp_io_pmp_5_cfg_l = io_ptw_pmp_5_cfg_l; // @[TLB.scala 196:14]
  assign pmp_io_pmp_5_cfg_res = io_ptw_pmp_5_cfg_res; // @[TLB.scala 196:14]
  assign pmp_io_pmp_5_cfg_a = io_ptw_pmp_5_cfg_a; // @[TLB.scala 196:14]
  assign pmp_io_pmp_5_cfg_x = io_ptw_pmp_5_cfg_x; // @[TLB.scala 196:14]
  assign pmp_io_pmp_5_cfg_w = io_ptw_pmp_5_cfg_w; // @[TLB.scala 196:14]
  assign pmp_io_pmp_5_cfg_r = io_ptw_pmp_5_cfg_r; // @[TLB.scala 196:14]
  assign pmp_io_pmp_5_addr = io_ptw_pmp_5_addr; // @[TLB.scala 196:14]
  assign pmp_io_pmp_5_mask = io_ptw_pmp_5_mask; // @[TLB.scala 196:14]
  assign pmp_io_pmp_6_cfg_l = io_ptw_pmp_6_cfg_l; // @[TLB.scala 196:14]
  assign pmp_io_pmp_6_cfg_res = io_ptw_pmp_6_cfg_res; // @[TLB.scala 196:14]
  assign pmp_io_pmp_6_cfg_a = io_ptw_pmp_6_cfg_a; // @[TLB.scala 196:14]
  assign pmp_io_pmp_6_cfg_x = io_ptw_pmp_6_cfg_x; // @[TLB.scala 196:14]
  assign pmp_io_pmp_6_cfg_w = io_ptw_pmp_6_cfg_w; // @[TLB.scala 196:14]
  assign pmp_io_pmp_6_cfg_r = io_ptw_pmp_6_cfg_r; // @[TLB.scala 196:14]
  assign pmp_io_pmp_6_addr = io_ptw_pmp_6_addr; // @[TLB.scala 196:14]
  assign pmp_io_pmp_6_mask = io_ptw_pmp_6_mask; // @[TLB.scala 196:14]
  assign pmp_io_pmp_7_cfg_l = io_ptw_pmp_7_cfg_l; // @[TLB.scala 196:14]
  assign pmp_io_pmp_7_cfg_res = io_ptw_pmp_7_cfg_res; // @[TLB.scala 196:14]
  assign pmp_io_pmp_7_cfg_a = io_ptw_pmp_7_cfg_a; // @[TLB.scala 196:14]
  assign pmp_io_pmp_7_cfg_x = io_ptw_pmp_7_cfg_x; // @[TLB.scala 196:14]
  assign pmp_io_pmp_7_cfg_w = io_ptw_pmp_7_cfg_w; // @[TLB.scala 196:14]
  assign pmp_io_pmp_7_cfg_r = io_ptw_pmp_7_cfg_r; // @[TLB.scala 196:14]
  assign pmp_io_pmp_7_addr = io_ptw_pmp_7_addr; // @[TLB.scala 196:14]
  assign pmp_io_pmp_7_mask = io_ptw_pmp_7_mask; // @[TLB.scala 196:14]
  assign pmp_io_addr = mpu_physaddr[31:0]; // @[TLB.scala 194:15]
  assign pmp_io_size = io_req_bits_size; // @[TLB.scala 195:15]
  assign ppn_data_barrier_clock = clock;
  assign ppn_data_barrier_reset = reset;
  assign ppn_data_barrier_io_x_ppn = _GEN_7[34:15]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_io_x_u = _GEN_7[14]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_io_x_g = _GEN_7[13]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_io_x_ae = _GEN_7[12]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_io_x_sw = _GEN_7[11]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_io_x_sx = _GEN_7[10]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_io_x_sr = _GEN_7[9]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_io_x_pw = _GEN_7[8]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_io_x_px = _GEN_7[7]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_io_x_pr = _GEN_7[6]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_io_x_ppp = _GEN_7[5]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_io_x_pal = _GEN_7[4]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_io_x_paa = _GEN_7[3]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_io_x_eff = _GEN_7[2]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_io_x_c = _GEN_7[1]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_io_x_fragmented_superpage = _GEN_7[0]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_1_clock = clock;
  assign ppn_data_barrier_1_reset = reset;
  assign ppn_data_barrier_1_io_x_ppn = superpage_entries_0_data_0[34:15]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_1_io_x_u = superpage_entries_0_data_0[14]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_1_io_x_g = superpage_entries_0_data_0[13]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_1_io_x_ae = superpage_entries_0_data_0[12]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_1_io_x_sw = superpage_entries_0_data_0[11]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_1_io_x_sx = superpage_entries_0_data_0[10]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_1_io_x_sr = superpage_entries_0_data_0[9]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_1_io_x_pw = superpage_entries_0_data_0[8]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_1_io_x_px = superpage_entries_0_data_0[7]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_1_io_x_pr = superpage_entries_0_data_0[6]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_1_io_x_ppp = superpage_entries_0_data_0[5]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_1_io_x_pal = superpage_entries_0_data_0[4]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_1_io_x_paa = superpage_entries_0_data_0[3]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_1_io_x_eff = superpage_entries_0_data_0[2]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_1_io_x_c = superpage_entries_0_data_0[1]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_1_io_x_fragmented_superpage = superpage_entries_0_data_0[0]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_2_clock = clock;
  assign ppn_data_barrier_2_reset = reset;
  assign ppn_data_barrier_2_io_x_ppn = superpage_entries_1_data_0[34:15]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_2_io_x_u = superpage_entries_1_data_0[14]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_2_io_x_g = superpage_entries_1_data_0[13]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_2_io_x_ae = superpage_entries_1_data_0[12]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_2_io_x_sw = superpage_entries_1_data_0[11]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_2_io_x_sx = superpage_entries_1_data_0[10]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_2_io_x_sr = superpage_entries_1_data_0[9]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_2_io_x_pw = superpage_entries_1_data_0[8]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_2_io_x_px = superpage_entries_1_data_0[7]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_2_io_x_pr = superpage_entries_1_data_0[6]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_2_io_x_ppp = superpage_entries_1_data_0[5]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_2_io_x_pal = superpage_entries_1_data_0[4]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_2_io_x_paa = superpage_entries_1_data_0[3]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_2_io_x_eff = superpage_entries_1_data_0[2]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_2_io_x_c = superpage_entries_1_data_0[1]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_2_io_x_fragmented_superpage = superpage_entries_1_data_0[0]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_3_clock = clock;
  assign ppn_data_barrier_3_reset = reset;
  assign ppn_data_barrier_3_io_x_ppn = superpage_entries_2_data_0[34:15]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_3_io_x_u = superpage_entries_2_data_0[14]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_3_io_x_g = superpage_entries_2_data_0[13]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_3_io_x_ae = superpage_entries_2_data_0[12]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_3_io_x_sw = superpage_entries_2_data_0[11]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_3_io_x_sx = superpage_entries_2_data_0[10]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_3_io_x_sr = superpage_entries_2_data_0[9]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_3_io_x_pw = superpage_entries_2_data_0[8]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_3_io_x_px = superpage_entries_2_data_0[7]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_3_io_x_pr = superpage_entries_2_data_0[6]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_3_io_x_ppp = superpage_entries_2_data_0[5]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_3_io_x_pal = superpage_entries_2_data_0[4]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_3_io_x_paa = superpage_entries_2_data_0[3]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_3_io_x_eff = superpage_entries_2_data_0[2]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_3_io_x_c = superpage_entries_2_data_0[1]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_3_io_x_fragmented_superpage = superpage_entries_2_data_0[0]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_4_clock = clock;
  assign ppn_data_barrier_4_reset = reset;
  assign ppn_data_barrier_4_io_x_ppn = superpage_entries_3_data_0[34:15]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_4_io_x_u = superpage_entries_3_data_0[14]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_4_io_x_g = superpage_entries_3_data_0[13]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_4_io_x_ae = superpage_entries_3_data_0[12]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_4_io_x_sw = superpage_entries_3_data_0[11]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_4_io_x_sx = superpage_entries_3_data_0[10]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_4_io_x_sr = superpage_entries_3_data_0[9]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_4_io_x_pw = superpage_entries_3_data_0[8]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_4_io_x_px = superpage_entries_3_data_0[7]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_4_io_x_pr = superpage_entries_3_data_0[6]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_4_io_x_ppp = superpage_entries_3_data_0[5]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_4_io_x_pal = superpage_entries_3_data_0[4]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_4_io_x_paa = superpage_entries_3_data_0[3]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_4_io_x_eff = superpage_entries_3_data_0[2]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_4_io_x_c = superpage_entries_3_data_0[1]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_4_io_x_fragmented_superpage = superpage_entries_3_data_0[0]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_5_clock = clock;
  assign ppn_data_barrier_5_reset = reset;
  assign ppn_data_barrier_5_io_x_ppn = special_entry_data_0[34:15]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_5_io_x_u = special_entry_data_0[14]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_5_io_x_g = special_entry_data_0[13]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_5_io_x_ae = special_entry_data_0[12]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_5_io_x_sw = special_entry_data_0[11]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_5_io_x_sx = special_entry_data_0[10]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_5_io_x_sr = special_entry_data_0[9]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_5_io_x_pw = special_entry_data_0[8]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_5_io_x_px = special_entry_data_0[7]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_5_io_x_pr = special_entry_data_0[6]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_5_io_x_ppp = special_entry_data_0[5]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_5_io_x_pal = special_entry_data_0[4]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_5_io_x_paa = special_entry_data_0[3]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_5_io_x_eff = special_entry_data_0[2]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_5_io_x_c = special_entry_data_0[1]; // @[TLB.scala 86:77]
  assign ppn_data_barrier_5_io_x_fragmented_superpage = special_entry_data_0[0]; // @[TLB.scala 86:77]
  assign entries_barrier_clock = clock;
  assign entries_barrier_reset = reset;
  assign entries_barrier_io_x_ppn = _GEN_7[34:15]; // @[TLB.scala 86:77]
  assign entries_barrier_io_x_u = _GEN_7[14]; // @[TLB.scala 86:77]
  assign entries_barrier_io_x_g = _GEN_7[13]; // @[TLB.scala 86:77]
  assign entries_barrier_io_x_ae = _GEN_7[12]; // @[TLB.scala 86:77]
  assign entries_barrier_io_x_sw = _GEN_7[11]; // @[TLB.scala 86:77]
  assign entries_barrier_io_x_sx = _GEN_7[10]; // @[TLB.scala 86:77]
  assign entries_barrier_io_x_sr = _GEN_7[9]; // @[TLB.scala 86:77]
  assign entries_barrier_io_x_pw = _GEN_7[8]; // @[TLB.scala 86:77]
  assign entries_barrier_io_x_px = _GEN_7[7]; // @[TLB.scala 86:77]
  assign entries_barrier_io_x_pr = _GEN_7[6]; // @[TLB.scala 86:77]
  assign entries_barrier_io_x_ppp = _GEN_7[5]; // @[TLB.scala 86:77]
  assign entries_barrier_io_x_pal = _GEN_7[4]; // @[TLB.scala 86:77]
  assign entries_barrier_io_x_paa = _GEN_7[3]; // @[TLB.scala 86:77]
  assign entries_barrier_io_x_eff = _GEN_7[2]; // @[TLB.scala 86:77]
  assign entries_barrier_io_x_c = _GEN_7[1]; // @[TLB.scala 86:77]
  assign entries_barrier_io_x_fragmented_superpage = _GEN_7[0]; // @[TLB.scala 86:77]
  assign entries_barrier_1_clock = clock;
  assign entries_barrier_1_reset = reset;
  assign entries_barrier_1_io_x_ppn = superpage_entries_0_data_0[34:15]; // @[TLB.scala 86:77]
  assign entries_barrier_1_io_x_u = superpage_entries_0_data_0[14]; // @[TLB.scala 86:77]
  assign entries_barrier_1_io_x_g = superpage_entries_0_data_0[13]; // @[TLB.scala 86:77]
  assign entries_barrier_1_io_x_ae = superpage_entries_0_data_0[12]; // @[TLB.scala 86:77]
  assign entries_barrier_1_io_x_sw = superpage_entries_0_data_0[11]; // @[TLB.scala 86:77]
  assign entries_barrier_1_io_x_sx = superpage_entries_0_data_0[10]; // @[TLB.scala 86:77]
  assign entries_barrier_1_io_x_sr = superpage_entries_0_data_0[9]; // @[TLB.scala 86:77]
  assign entries_barrier_1_io_x_pw = superpage_entries_0_data_0[8]; // @[TLB.scala 86:77]
  assign entries_barrier_1_io_x_px = superpage_entries_0_data_0[7]; // @[TLB.scala 86:77]
  assign entries_barrier_1_io_x_pr = superpage_entries_0_data_0[6]; // @[TLB.scala 86:77]
  assign entries_barrier_1_io_x_ppp = superpage_entries_0_data_0[5]; // @[TLB.scala 86:77]
  assign entries_barrier_1_io_x_pal = superpage_entries_0_data_0[4]; // @[TLB.scala 86:77]
  assign entries_barrier_1_io_x_paa = superpage_entries_0_data_0[3]; // @[TLB.scala 86:77]
  assign entries_barrier_1_io_x_eff = superpage_entries_0_data_0[2]; // @[TLB.scala 86:77]
  assign entries_barrier_1_io_x_c = superpage_entries_0_data_0[1]; // @[TLB.scala 86:77]
  assign entries_barrier_1_io_x_fragmented_superpage = superpage_entries_0_data_0[0]; // @[TLB.scala 86:77]
  assign entries_barrier_2_clock = clock;
  assign entries_barrier_2_reset = reset;
  assign entries_barrier_2_io_x_ppn = superpage_entries_1_data_0[34:15]; // @[TLB.scala 86:77]
  assign entries_barrier_2_io_x_u = superpage_entries_1_data_0[14]; // @[TLB.scala 86:77]
  assign entries_barrier_2_io_x_g = superpage_entries_1_data_0[13]; // @[TLB.scala 86:77]
  assign entries_barrier_2_io_x_ae = superpage_entries_1_data_0[12]; // @[TLB.scala 86:77]
  assign entries_barrier_2_io_x_sw = superpage_entries_1_data_0[11]; // @[TLB.scala 86:77]
  assign entries_barrier_2_io_x_sx = superpage_entries_1_data_0[10]; // @[TLB.scala 86:77]
  assign entries_barrier_2_io_x_sr = superpage_entries_1_data_0[9]; // @[TLB.scala 86:77]
  assign entries_barrier_2_io_x_pw = superpage_entries_1_data_0[8]; // @[TLB.scala 86:77]
  assign entries_barrier_2_io_x_px = superpage_entries_1_data_0[7]; // @[TLB.scala 86:77]
  assign entries_barrier_2_io_x_pr = superpage_entries_1_data_0[6]; // @[TLB.scala 86:77]
  assign entries_barrier_2_io_x_ppp = superpage_entries_1_data_0[5]; // @[TLB.scala 86:77]
  assign entries_barrier_2_io_x_pal = superpage_entries_1_data_0[4]; // @[TLB.scala 86:77]
  assign entries_barrier_2_io_x_paa = superpage_entries_1_data_0[3]; // @[TLB.scala 86:77]
  assign entries_barrier_2_io_x_eff = superpage_entries_1_data_0[2]; // @[TLB.scala 86:77]
  assign entries_barrier_2_io_x_c = superpage_entries_1_data_0[1]; // @[TLB.scala 86:77]
  assign entries_barrier_2_io_x_fragmented_superpage = superpage_entries_1_data_0[0]; // @[TLB.scala 86:77]
  assign entries_barrier_3_clock = clock;
  assign entries_barrier_3_reset = reset;
  assign entries_barrier_3_io_x_ppn = superpage_entries_2_data_0[34:15]; // @[TLB.scala 86:77]
  assign entries_barrier_3_io_x_u = superpage_entries_2_data_0[14]; // @[TLB.scala 86:77]
  assign entries_barrier_3_io_x_g = superpage_entries_2_data_0[13]; // @[TLB.scala 86:77]
  assign entries_barrier_3_io_x_ae = superpage_entries_2_data_0[12]; // @[TLB.scala 86:77]
  assign entries_barrier_3_io_x_sw = superpage_entries_2_data_0[11]; // @[TLB.scala 86:77]
  assign entries_barrier_3_io_x_sx = superpage_entries_2_data_0[10]; // @[TLB.scala 86:77]
  assign entries_barrier_3_io_x_sr = superpage_entries_2_data_0[9]; // @[TLB.scala 86:77]
  assign entries_barrier_3_io_x_pw = superpage_entries_2_data_0[8]; // @[TLB.scala 86:77]
  assign entries_barrier_3_io_x_px = superpage_entries_2_data_0[7]; // @[TLB.scala 86:77]
  assign entries_barrier_3_io_x_pr = superpage_entries_2_data_0[6]; // @[TLB.scala 86:77]
  assign entries_barrier_3_io_x_ppp = superpage_entries_2_data_0[5]; // @[TLB.scala 86:77]
  assign entries_barrier_3_io_x_pal = superpage_entries_2_data_0[4]; // @[TLB.scala 86:77]
  assign entries_barrier_3_io_x_paa = superpage_entries_2_data_0[3]; // @[TLB.scala 86:77]
  assign entries_barrier_3_io_x_eff = superpage_entries_2_data_0[2]; // @[TLB.scala 86:77]
  assign entries_barrier_3_io_x_c = superpage_entries_2_data_0[1]; // @[TLB.scala 86:77]
  assign entries_barrier_3_io_x_fragmented_superpage = superpage_entries_2_data_0[0]; // @[TLB.scala 86:77]
  assign entries_barrier_4_clock = clock;
  assign entries_barrier_4_reset = reset;
  assign entries_barrier_4_io_x_ppn = superpage_entries_3_data_0[34:15]; // @[TLB.scala 86:77]
  assign entries_barrier_4_io_x_u = superpage_entries_3_data_0[14]; // @[TLB.scala 86:77]
  assign entries_barrier_4_io_x_g = superpage_entries_3_data_0[13]; // @[TLB.scala 86:77]
  assign entries_barrier_4_io_x_ae = superpage_entries_3_data_0[12]; // @[TLB.scala 86:77]
  assign entries_barrier_4_io_x_sw = superpage_entries_3_data_0[11]; // @[TLB.scala 86:77]
  assign entries_barrier_4_io_x_sx = superpage_entries_3_data_0[10]; // @[TLB.scala 86:77]
  assign entries_barrier_4_io_x_sr = superpage_entries_3_data_0[9]; // @[TLB.scala 86:77]
  assign entries_barrier_4_io_x_pw = superpage_entries_3_data_0[8]; // @[TLB.scala 86:77]
  assign entries_barrier_4_io_x_px = superpage_entries_3_data_0[7]; // @[TLB.scala 86:77]
  assign entries_barrier_4_io_x_pr = superpage_entries_3_data_0[6]; // @[TLB.scala 86:77]
  assign entries_barrier_4_io_x_ppp = superpage_entries_3_data_0[5]; // @[TLB.scala 86:77]
  assign entries_barrier_4_io_x_pal = superpage_entries_3_data_0[4]; // @[TLB.scala 86:77]
  assign entries_barrier_4_io_x_paa = superpage_entries_3_data_0[3]; // @[TLB.scala 86:77]
  assign entries_barrier_4_io_x_eff = superpage_entries_3_data_0[2]; // @[TLB.scala 86:77]
  assign entries_barrier_4_io_x_c = superpage_entries_3_data_0[1]; // @[TLB.scala 86:77]
  assign entries_barrier_4_io_x_fragmented_superpage = superpage_entries_3_data_0[0]; // @[TLB.scala 86:77]
  assign entries_barrier_5_clock = clock;
  assign entries_barrier_5_reset = reset;
  assign entries_barrier_5_io_x_ppn = special_entry_data_0[34:15]; // @[TLB.scala 86:77]
  assign entries_barrier_5_io_x_u = special_entry_data_0[14]; // @[TLB.scala 86:77]
  assign entries_barrier_5_io_x_g = special_entry_data_0[13]; // @[TLB.scala 86:77]
  assign entries_barrier_5_io_x_ae = special_entry_data_0[12]; // @[TLB.scala 86:77]
  assign entries_barrier_5_io_x_sw = special_entry_data_0[11]; // @[TLB.scala 86:77]
  assign entries_barrier_5_io_x_sx = special_entry_data_0[10]; // @[TLB.scala 86:77]
  assign entries_barrier_5_io_x_sr = special_entry_data_0[9]; // @[TLB.scala 86:77]
  assign entries_barrier_5_io_x_pw = special_entry_data_0[8]; // @[TLB.scala 86:77]
  assign entries_barrier_5_io_x_px = special_entry_data_0[7]; // @[TLB.scala 86:77]
  assign entries_barrier_5_io_x_pr = special_entry_data_0[6]; // @[TLB.scala 86:77]
  assign entries_barrier_5_io_x_ppp = special_entry_data_0[5]; // @[TLB.scala 86:77]
  assign entries_barrier_5_io_x_pal = special_entry_data_0[4]; // @[TLB.scala 86:77]
  assign entries_barrier_5_io_x_paa = special_entry_data_0[3]; // @[TLB.scala 86:77]
  assign entries_barrier_5_io_x_eff = special_entry_data_0[2]; // @[TLB.scala 86:77]
  assign entries_barrier_5_io_x_c = special_entry_data_0[1]; // @[TLB.scala 86:77]
  assign entries_barrier_5_io_x_fragmented_superpage = special_entry_data_0[0]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_clock = clock;
  assign normal_entries_barrier_reset = reset;
  assign normal_entries_barrier_io_x_ppn = _GEN_7[34:15]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_io_x_u = _GEN_7[14]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_io_x_g = _GEN_7[13]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_io_x_ae = _GEN_7[12]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_io_x_sw = _GEN_7[11]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_io_x_sx = _GEN_7[10]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_io_x_sr = _GEN_7[9]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_io_x_pw = _GEN_7[8]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_io_x_px = _GEN_7[7]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_io_x_pr = _GEN_7[6]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_io_x_ppp = _GEN_7[5]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_io_x_pal = _GEN_7[4]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_io_x_paa = _GEN_7[3]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_io_x_eff = _GEN_7[2]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_io_x_c = _GEN_7[1]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_io_x_fragmented_superpage = _GEN_7[0]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_1_clock = clock;
  assign normal_entries_barrier_1_reset = reset;
  assign normal_entries_barrier_1_io_x_ppn = superpage_entries_0_data_0[34:15]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_1_io_x_u = superpage_entries_0_data_0[14]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_1_io_x_g = superpage_entries_0_data_0[13]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_1_io_x_ae = superpage_entries_0_data_0[12]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_1_io_x_sw = superpage_entries_0_data_0[11]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_1_io_x_sx = superpage_entries_0_data_0[10]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_1_io_x_sr = superpage_entries_0_data_0[9]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_1_io_x_pw = superpage_entries_0_data_0[8]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_1_io_x_px = superpage_entries_0_data_0[7]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_1_io_x_pr = superpage_entries_0_data_0[6]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_1_io_x_ppp = superpage_entries_0_data_0[5]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_1_io_x_pal = superpage_entries_0_data_0[4]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_1_io_x_paa = superpage_entries_0_data_0[3]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_1_io_x_eff = superpage_entries_0_data_0[2]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_1_io_x_c = superpage_entries_0_data_0[1]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_1_io_x_fragmented_superpage = superpage_entries_0_data_0[0]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_2_clock = clock;
  assign normal_entries_barrier_2_reset = reset;
  assign normal_entries_barrier_2_io_x_ppn = superpage_entries_1_data_0[34:15]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_2_io_x_u = superpage_entries_1_data_0[14]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_2_io_x_g = superpage_entries_1_data_0[13]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_2_io_x_ae = superpage_entries_1_data_0[12]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_2_io_x_sw = superpage_entries_1_data_0[11]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_2_io_x_sx = superpage_entries_1_data_0[10]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_2_io_x_sr = superpage_entries_1_data_0[9]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_2_io_x_pw = superpage_entries_1_data_0[8]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_2_io_x_px = superpage_entries_1_data_0[7]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_2_io_x_pr = superpage_entries_1_data_0[6]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_2_io_x_ppp = superpage_entries_1_data_0[5]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_2_io_x_pal = superpage_entries_1_data_0[4]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_2_io_x_paa = superpage_entries_1_data_0[3]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_2_io_x_eff = superpage_entries_1_data_0[2]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_2_io_x_c = superpage_entries_1_data_0[1]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_2_io_x_fragmented_superpage = superpage_entries_1_data_0[0]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_3_clock = clock;
  assign normal_entries_barrier_3_reset = reset;
  assign normal_entries_barrier_3_io_x_ppn = superpage_entries_2_data_0[34:15]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_3_io_x_u = superpage_entries_2_data_0[14]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_3_io_x_g = superpage_entries_2_data_0[13]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_3_io_x_ae = superpage_entries_2_data_0[12]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_3_io_x_sw = superpage_entries_2_data_0[11]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_3_io_x_sx = superpage_entries_2_data_0[10]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_3_io_x_sr = superpage_entries_2_data_0[9]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_3_io_x_pw = superpage_entries_2_data_0[8]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_3_io_x_px = superpage_entries_2_data_0[7]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_3_io_x_pr = superpage_entries_2_data_0[6]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_3_io_x_ppp = superpage_entries_2_data_0[5]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_3_io_x_pal = superpage_entries_2_data_0[4]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_3_io_x_paa = superpage_entries_2_data_0[3]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_3_io_x_eff = superpage_entries_2_data_0[2]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_3_io_x_c = superpage_entries_2_data_0[1]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_3_io_x_fragmented_superpage = superpage_entries_2_data_0[0]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_4_clock = clock;
  assign normal_entries_barrier_4_reset = reset;
  assign normal_entries_barrier_4_io_x_ppn = superpage_entries_3_data_0[34:15]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_4_io_x_u = superpage_entries_3_data_0[14]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_4_io_x_g = superpage_entries_3_data_0[13]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_4_io_x_ae = superpage_entries_3_data_0[12]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_4_io_x_sw = superpage_entries_3_data_0[11]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_4_io_x_sx = superpage_entries_3_data_0[10]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_4_io_x_sr = superpage_entries_3_data_0[9]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_4_io_x_pw = superpage_entries_3_data_0[8]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_4_io_x_px = superpage_entries_3_data_0[7]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_4_io_x_pr = superpage_entries_3_data_0[6]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_4_io_x_ppp = superpage_entries_3_data_0[5]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_4_io_x_pal = superpage_entries_3_data_0[4]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_4_io_x_paa = superpage_entries_3_data_0[3]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_4_io_x_eff = superpage_entries_3_data_0[2]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_4_io_x_c = superpage_entries_3_data_0[1]; // @[TLB.scala 86:77]
  assign normal_entries_barrier_4_io_x_fragmented_superpage = superpage_entries_3_data_0[0]; // @[TLB.scala 86:77]
  always @(posedge clock) begin
    if (io_ptw_resp_valid) begin // @[TLB.scala 220:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[TLB.scala 240:68]
        if (!(io_ptw_resp_bits_level < 2'h2)) begin // @[TLB.scala 245:54]
          sectored_entries_0_0_tag <= r_refill_tag;
        end
      end
    end
    if (io_ptw_resp_valid) begin // @[TLB.scala 220:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[TLB.scala 240:68]
        if (!(io_ptw_resp_bits_level < 2'h2)) begin // @[TLB.scala 245:54]
          if (2'h0 == idx) begin // @[TLB.scala 123:15]
            sectored_entries_0_0_data_0 <= _special_entry_data_0_T; // @[TLB.scala 123:15]
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin // @[TLB.scala 220:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[TLB.scala 240:68]
        if (!(io_ptw_resp_bits_level < 2'h2)) begin // @[TLB.scala 245:54]
          if (2'h1 == idx) begin // @[TLB.scala 123:15]
            sectored_entries_0_0_data_1 <= _special_entry_data_0_T; // @[TLB.scala 123:15]
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin // @[TLB.scala 220:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[TLB.scala 240:68]
        if (!(io_ptw_resp_bits_level < 2'h2)) begin // @[TLB.scala 245:54]
          if (2'h2 == idx) begin // @[TLB.scala 123:15]
            sectored_entries_0_0_data_2 <= _special_entry_data_0_T; // @[TLB.scala 123:15]
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin // @[TLB.scala 220:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[TLB.scala 240:68]
        if (!(io_ptw_resp_bits_level < 2'h2)) begin // @[TLB.scala 245:54]
          if (2'h3 == idx) begin // @[TLB.scala 123:15]
            sectored_entries_0_0_data_3 <= _special_entry_data_0_T; // @[TLB.scala 123:15]
          end
        end
      end
    end
    if (multipleHits | reset) begin // @[TLB.scala 392:34]
      sectored_entries_0_0_valid_0 <= 1'h0; // @[TLB.scala 126:46]
    end else if (io_sfence_valid) begin // @[TLB.scala 384:19]
      if (io_sfence_bits_rs1) begin // @[TLB.scala 387:35]
        if (_sector_hits_T_3[26:18] == 9'h0) begin // @[TLB.scala 135:68]
          sectored_entries_0_0_valid_0 <= _GEN_169;
        end else begin
          sectored_entries_0_0_valid_0 <= _GEN_165;
        end
      end else begin
        sectored_entries_0_0_valid_0 <= _GEN_181;
      end
    end else if (io_ptw_resp_valid) begin // @[TLB.scala 220:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[TLB.scala 240:68]
        sectored_entries_0_0_valid_0 <= _GEN_67;
      end
    end
    if (multipleHits | reset) begin // @[TLB.scala 392:34]
      sectored_entries_0_0_valid_1 <= 1'h0; // @[TLB.scala 126:46]
    end else if (io_sfence_valid) begin // @[TLB.scala 384:19]
      if (io_sfence_bits_rs1) begin // @[TLB.scala 387:35]
        if (_sector_hits_T_3[26:18] == 9'h0) begin // @[TLB.scala 135:68]
          sectored_entries_0_0_valid_1 <= _GEN_170;
        end else begin
          sectored_entries_0_0_valid_1 <= _GEN_166;
        end
      end else begin
        sectored_entries_0_0_valid_1 <= _GEN_182;
      end
    end else if (io_ptw_resp_valid) begin // @[TLB.scala 220:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[TLB.scala 240:68]
        sectored_entries_0_0_valid_1 <= _GEN_68;
      end
    end
    if (multipleHits | reset) begin // @[TLB.scala 392:34]
      sectored_entries_0_0_valid_2 <= 1'h0; // @[TLB.scala 126:46]
    end else if (io_sfence_valid) begin // @[TLB.scala 384:19]
      if (io_sfence_bits_rs1) begin // @[TLB.scala 387:35]
        if (_sector_hits_T_3[26:18] == 9'h0) begin // @[TLB.scala 135:68]
          sectored_entries_0_0_valid_2 <= _GEN_171;
        end else begin
          sectored_entries_0_0_valid_2 <= _GEN_167;
        end
      end else begin
        sectored_entries_0_0_valid_2 <= _GEN_183;
      end
    end else if (io_ptw_resp_valid) begin // @[TLB.scala 220:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[TLB.scala 240:68]
        sectored_entries_0_0_valid_2 <= _GEN_69;
      end
    end
    if (multipleHits | reset) begin // @[TLB.scala 392:34]
      sectored_entries_0_0_valid_3 <= 1'h0; // @[TLB.scala 126:46]
    end else if (io_sfence_valid) begin // @[TLB.scala 384:19]
      if (io_sfence_bits_rs1) begin // @[TLB.scala 387:35]
        if (_sector_hits_T_3[26:18] == 9'h0) begin // @[TLB.scala 135:68]
          sectored_entries_0_0_valid_3 <= _GEN_172;
        end else begin
          sectored_entries_0_0_valid_3 <= _GEN_168;
        end
      end else begin
        sectored_entries_0_0_valid_3 <= _GEN_184;
      end
    end else if (io_ptw_resp_valid) begin // @[TLB.scala 220:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[TLB.scala 240:68]
        sectored_entries_0_0_valid_3 <= _GEN_70;
      end
    end
    if (io_ptw_resp_valid) begin // @[TLB.scala 220:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[TLB.scala 240:68]
        if (io_ptw_resp_bits_level < 2'h2) begin // @[TLB.scala 245:54]
          if (r_superpage_repl_addr == 2'h0) begin // @[TLB.scala 246:89]
            superpage_entries_0_level <= {{1'd0}, io_ptw_resp_bits_level[0]}; // @[TLB.scala 119:16]
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin // @[TLB.scala 220:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[TLB.scala 240:68]
        if (io_ptw_resp_bits_level < 2'h2) begin // @[TLB.scala 245:54]
          if (r_superpage_repl_addr == 2'h0) begin // @[TLB.scala 246:89]
            superpage_entries_0_tag <= r_refill_tag; // @[TLB.scala 118:14]
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin // @[TLB.scala 220:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[TLB.scala 240:68]
        if (io_ptw_resp_bits_level < 2'h2) begin // @[TLB.scala 245:54]
          if (r_superpage_repl_addr == 2'h0) begin // @[TLB.scala 246:89]
            superpage_entries_0_data_0 <= _special_entry_data_0_T; // @[TLB.scala 123:15]
          end
        end
      end
    end
    if (multipleHits | reset) begin // @[TLB.scala 392:34]
      superpage_entries_0_valid_0 <= 1'h0; // @[TLB.scala 126:46]
    end else if (io_sfence_valid) begin // @[TLB.scala 384:19]
      if (io_sfence_bits_rs1) begin // @[TLB.scala 387:35]
        if (superpage_hits_0) begin // @[TLB.scala 129:23]
          superpage_entries_0_valid_0 <= 1'h0; // @[TLB.scala 126:46]
        end else begin
          superpage_entries_0_valid_0 <= _GEN_113;
        end
      end else begin
        superpage_entries_0_valid_0 <= _GEN_191;
      end
    end else begin
      superpage_entries_0_valid_0 <= _GEN_113;
    end
    if (io_ptw_resp_valid) begin // @[TLB.scala 220:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[TLB.scala 240:68]
        if (io_ptw_resp_bits_level < 2'h2) begin // @[TLB.scala 245:54]
          if (r_superpage_repl_addr == 2'h1) begin // @[TLB.scala 246:89]
            superpage_entries_1_level <= {{1'd0}, io_ptw_resp_bits_level[0]}; // @[TLB.scala 119:16]
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin // @[TLB.scala 220:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[TLB.scala 240:68]
        if (io_ptw_resp_bits_level < 2'h2) begin // @[TLB.scala 245:54]
          if (r_superpage_repl_addr == 2'h1) begin // @[TLB.scala 246:89]
            superpage_entries_1_tag <= r_refill_tag; // @[TLB.scala 118:14]
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin // @[TLB.scala 220:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[TLB.scala 240:68]
        if (io_ptw_resp_bits_level < 2'h2) begin // @[TLB.scala 245:54]
          if (r_superpage_repl_addr == 2'h1) begin // @[TLB.scala 246:89]
            superpage_entries_1_data_0 <= _special_entry_data_0_T; // @[TLB.scala 123:15]
          end
        end
      end
    end
    if (multipleHits | reset) begin // @[TLB.scala 392:34]
      superpage_entries_1_valid_0 <= 1'h0; // @[TLB.scala 126:46]
    end else if (io_sfence_valid) begin // @[TLB.scala 384:19]
      if (io_sfence_bits_rs1) begin // @[TLB.scala 387:35]
        if (superpage_hits_1) begin // @[TLB.scala 129:23]
          superpage_entries_1_valid_0 <= 1'h0; // @[TLB.scala 126:46]
        end else begin
          superpage_entries_1_valid_0 <= _GEN_117;
        end
      end else begin
        superpage_entries_1_valid_0 <= _GEN_195;
      end
    end else begin
      superpage_entries_1_valid_0 <= _GEN_117;
    end
    if (io_ptw_resp_valid) begin // @[TLB.scala 220:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[TLB.scala 240:68]
        if (io_ptw_resp_bits_level < 2'h2) begin // @[TLB.scala 245:54]
          if (r_superpage_repl_addr == 2'h2) begin // @[TLB.scala 246:89]
            superpage_entries_2_level <= {{1'd0}, io_ptw_resp_bits_level[0]}; // @[TLB.scala 119:16]
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin // @[TLB.scala 220:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[TLB.scala 240:68]
        if (io_ptw_resp_bits_level < 2'h2) begin // @[TLB.scala 245:54]
          if (r_superpage_repl_addr == 2'h2) begin // @[TLB.scala 246:89]
            superpage_entries_2_tag <= r_refill_tag; // @[TLB.scala 118:14]
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin // @[TLB.scala 220:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[TLB.scala 240:68]
        if (io_ptw_resp_bits_level < 2'h2) begin // @[TLB.scala 245:54]
          if (r_superpage_repl_addr == 2'h2) begin // @[TLB.scala 246:89]
            superpage_entries_2_data_0 <= _special_entry_data_0_T; // @[TLB.scala 123:15]
          end
        end
      end
    end
    if (multipleHits | reset) begin // @[TLB.scala 392:34]
      superpage_entries_2_valid_0 <= 1'h0; // @[TLB.scala 126:46]
    end else if (io_sfence_valid) begin // @[TLB.scala 384:19]
      if (io_sfence_bits_rs1) begin // @[TLB.scala 387:35]
        if (superpage_hits_2) begin // @[TLB.scala 129:23]
          superpage_entries_2_valid_0 <= 1'h0; // @[TLB.scala 126:46]
        end else begin
          superpage_entries_2_valid_0 <= _GEN_121;
        end
      end else begin
        superpage_entries_2_valid_0 <= _GEN_199;
      end
    end else begin
      superpage_entries_2_valid_0 <= _GEN_121;
    end
    if (io_ptw_resp_valid) begin // @[TLB.scala 220:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[TLB.scala 240:68]
        if (io_ptw_resp_bits_level < 2'h2) begin // @[TLB.scala 245:54]
          if (r_superpage_repl_addr == 2'h3) begin // @[TLB.scala 246:89]
            superpage_entries_3_level <= {{1'd0}, io_ptw_resp_bits_level[0]}; // @[TLB.scala 119:16]
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin // @[TLB.scala 220:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[TLB.scala 240:68]
        if (io_ptw_resp_bits_level < 2'h2) begin // @[TLB.scala 245:54]
          if (r_superpage_repl_addr == 2'h3) begin // @[TLB.scala 246:89]
            superpage_entries_3_tag <= r_refill_tag; // @[TLB.scala 118:14]
          end
        end
      end
    end
    if (io_ptw_resp_valid) begin // @[TLB.scala 220:20]
      if (!(~io_ptw_resp_bits_homogeneous)) begin // @[TLB.scala 240:68]
        if (io_ptw_resp_bits_level < 2'h2) begin // @[TLB.scala 245:54]
          if (r_superpage_repl_addr == 2'h3) begin // @[TLB.scala 246:89]
            superpage_entries_3_data_0 <= _special_entry_data_0_T; // @[TLB.scala 123:15]
          end
        end
      end
    end
    if (multipleHits | reset) begin // @[TLB.scala 392:34]
      superpage_entries_3_valid_0 <= 1'h0; // @[TLB.scala 126:46]
    end else if (io_sfence_valid) begin // @[TLB.scala 384:19]
      if (io_sfence_bits_rs1) begin // @[TLB.scala 387:35]
        if (superpage_hits_3) begin // @[TLB.scala 129:23]
          superpage_entries_3_valid_0 <= 1'h0; // @[TLB.scala 126:46]
        end else begin
          superpage_entries_3_valid_0 <= _GEN_125;
        end
      end else begin
        superpage_entries_3_valid_0 <= _GEN_203;
      end
    end else begin
      superpage_entries_3_valid_0 <= _GEN_125;
    end
    if (io_ptw_resp_valid) begin // @[TLB.scala 220:20]
      if (~io_ptw_resp_bits_homogeneous) begin // @[TLB.scala 240:68]
        special_entry_level <= io_ptw_resp_bits_level; // @[TLB.scala 119:16]
      end
    end
    if (io_ptw_resp_valid) begin // @[TLB.scala 220:20]
      if (~io_ptw_resp_bits_homogeneous) begin // @[TLB.scala 240:68]
        special_entry_tag <= r_refill_tag; // @[TLB.scala 118:14]
      end
    end
    if (io_ptw_resp_valid) begin // @[TLB.scala 220:20]
      if (~io_ptw_resp_bits_homogeneous) begin // @[TLB.scala 240:68]
        special_entry_data_0 <= _special_entry_data_0_T; // @[TLB.scala 123:15]
      end
    end
    if (multipleHits | reset) begin // @[TLB.scala 392:34]
      special_entry_valid_0 <= 1'h0; // @[TLB.scala 126:46]
    end else if (io_sfence_valid) begin // @[TLB.scala 384:19]
      if (io_sfence_bits_rs1) begin // @[TLB.scala 387:35]
        if (_hitsVec_T_78) begin // @[TLB.scala 129:23]
          special_entry_valid_0 <= 1'h0; // @[TLB.scala 126:46]
        end else begin
          special_entry_valid_0 <= _GEN_109;
        end
      end else begin
        special_entry_valid_0 <= _GEN_207;
      end
    end else begin
      special_entry_valid_0 <= _GEN_109;
    end
    if (reset) begin // @[TLB.scala 173:18]
      state <= 2'h0; // @[TLB.scala 173:18]
    end else if (io_ptw_resp_valid) begin // @[TLB.scala 380:30]
      state <= 2'h0; // @[TLB.scala 381:13]
    end else if (state == 2'h2 & io_sfence_valid) begin // @[TLB.scala 377:39]
      state <= 2'h3; // @[TLB.scala 378:13]
    end else if (_invalidate_refill_T) begin // @[TLB.scala 372:32]
      state <= _GEN_157;
    end else begin
      state <= _GEN_149;
    end
    if (_T_16 & tlb_miss) begin // @[TLB.scala 363:38]
      r_refill_tag <= vpn; // @[TLB.scala 365:20]
    end
    if (_T_16 & tlb_miss) begin // @[TLB.scala 363:38]
      if (&r_superpage_repl_addr_valids) begin // @[TLB.scala 411:8]
        r_superpage_repl_addr <= _r_superpage_repl_addr_T_2;
      end else if (_r_superpage_repl_addr_T_4[0]) begin // @[Mux.scala 47:69]
        r_superpage_repl_addr <= 2'h0;
      end else if (_r_superpage_repl_addr_T_4[1]) begin // @[Mux.scala 47:69]
        r_superpage_repl_addr <= 2'h1;
      end else begin
        r_superpage_repl_addr <= _r_superpage_repl_addr_T_9;
      end
    end
    if (_T_16 & tlb_miss) begin // @[TLB.scala 363:38]
      r_sectored_hit <= sector_hits_0; // @[TLB.scala 370:22]
    end
    if (reset) begin // @[Replacement.scala 168:70]
      state_reg_1 <= 3'h0; // @[Replacement.scala 168:70]
    end else if (io_req_valid & vm_enabled) begin // @[TLB.scala 329:37]
      if (_T_12) begin // @[TLB.scala 331:31]
        state_reg_1 <= _state_reg_T_6; // @[Replacement.scala 172:15]
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_sfence_valid & ~(~io_sfence_bits_rs1 | io_sfence_bits_addr[38:12] == vpn | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at TLB.scala:385 assert(!io.sfence.bits.rs1 || (io.sfence.bits.addr >> pgIdxBits) === vpn)\n"
            ); // @[TLB.scala 385:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_sfence_valid & ~(~io_sfence_bits_rs1 | io_sfence_bits_addr[38:12] == vpn | reset)) begin
          $fatal; // @[TLB.scala 385:13]
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
  sectored_entries_0_0_tag = _RAND_0[26:0];
  _RAND_1 = {2{`RANDOM}};
  sectored_entries_0_0_data_0 = _RAND_1[34:0];
  _RAND_2 = {2{`RANDOM}};
  sectored_entries_0_0_data_1 = _RAND_2[34:0];
  _RAND_3 = {2{`RANDOM}};
  sectored_entries_0_0_data_2 = _RAND_3[34:0];
  _RAND_4 = {2{`RANDOM}};
  sectored_entries_0_0_data_3 = _RAND_4[34:0];
  _RAND_5 = {1{`RANDOM}};
  sectored_entries_0_0_valid_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  sectored_entries_0_0_valid_1 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  sectored_entries_0_0_valid_2 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  sectored_entries_0_0_valid_3 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  superpage_entries_0_level = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  superpage_entries_0_tag = _RAND_10[26:0];
  _RAND_11 = {2{`RANDOM}};
  superpage_entries_0_data_0 = _RAND_11[34:0];
  _RAND_12 = {1{`RANDOM}};
  superpage_entries_0_valid_0 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  superpage_entries_1_level = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  superpage_entries_1_tag = _RAND_14[26:0];
  _RAND_15 = {2{`RANDOM}};
  superpage_entries_1_data_0 = _RAND_15[34:0];
  _RAND_16 = {1{`RANDOM}};
  superpage_entries_1_valid_0 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  superpage_entries_2_level = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  superpage_entries_2_tag = _RAND_18[26:0];
  _RAND_19 = {2{`RANDOM}};
  superpage_entries_2_data_0 = _RAND_19[34:0];
  _RAND_20 = {1{`RANDOM}};
  superpage_entries_2_valid_0 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  superpage_entries_3_level = _RAND_21[1:0];
  _RAND_22 = {1{`RANDOM}};
  superpage_entries_3_tag = _RAND_22[26:0];
  _RAND_23 = {2{`RANDOM}};
  superpage_entries_3_data_0 = _RAND_23[34:0];
  _RAND_24 = {1{`RANDOM}};
  superpage_entries_3_valid_0 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  special_entry_level = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  special_entry_tag = _RAND_26[26:0];
  _RAND_27 = {2{`RANDOM}};
  special_entry_data_0 = _RAND_27[34:0];
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
