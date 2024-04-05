module TageTable(
  input         clock,
  input         reset,
  input         io_f1_req_valid,
  input  [39:0] io_f1_req_pc,
  input  [63:0] io_f1_req_ghist,
  output        io_f3_resp_0_valid,
  output [2:0]  io_f3_resp_0_bits_ctr,
  output [1:0]  io_f3_resp_0_bits_u,
  output        io_f3_resp_1_valid,
  output [2:0]  io_f3_resp_1_bits_ctr,
  output [1:0]  io_f3_resp_1_bits_u,
  output        io_f3_resp_2_valid,
  output [2:0]  io_f3_resp_2_bits_ctr,
  output [1:0]  io_f3_resp_2_bits_u,
  output        io_f3_resp_3_valid,
  output [2:0]  io_f3_resp_3_bits_ctr,
  output [1:0]  io_f3_resp_3_bits_u,
  input         io_update_mask_0,
  input         io_update_mask_1,
  input         io_update_mask_2,
  input         io_update_mask_3,
  input         io_update_taken_0,
  input         io_update_taken_1,
  input         io_update_taken_2,
  input         io_update_taken_3,
  input         io_update_alloc_0,
  input         io_update_alloc_1,
  input         io_update_alloc_2,
  input         io_update_alloc_3,
  input  [2:0]  io_update_old_ctr_0,
  input  [2:0]  io_update_old_ctr_1,
  input  [2:0]  io_update_old_ctr_2,
  input  [2:0]  io_update_old_ctr_3,
  input  [39:0] io_update_pc,
  input  [63:0] io_update_hist,
  input         io_update_u_mask_0,
  input         io_update_u_mask_1,
  input         io_update_u_mask_2,
  input         io_update_u_mask_3,
  input  [1:0]  io_update_u_0,
  input  [1:0]  io_update_u_1,
  input  [1:0]  io_update_u_2,
  input  [1:0]  io_update_u_3
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_33;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
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
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
`endif // RANDOMIZE_REG_INIT
  reg  hi_us_0 [0:127]; // @[tage.scala 89:27]
  wire  hi_us_0_s2_req_rhius_data; // @[tage.scala 89:27]
  wire [6:0] hi_us_0_s2_req_rhius_addr; // @[tage.scala 89:27]
  wire  hi_us_0_MPORT_2_data; // @[tage.scala 89:27]
  wire [6:0] hi_us_0_MPORT_2_addr; // @[tage.scala 89:27]
  wire  hi_us_0_MPORT_2_mask; // @[tage.scala 89:27]
  wire  hi_us_0_MPORT_2_en; // @[tage.scala 89:27]
  reg  hi_us_0_s2_req_rhius_en_pipe_0;
  reg [6:0] hi_us_0_s2_req_rhius_addr_pipe_0;
  reg  hi_us_1 [0:127]; // @[tage.scala 89:27]
  wire  hi_us_1_s2_req_rhius_data; // @[tage.scala 89:27]
  wire [6:0] hi_us_1_s2_req_rhius_addr; // @[tage.scala 89:27]
  wire  hi_us_1_MPORT_2_data; // @[tage.scala 89:27]
  wire [6:0] hi_us_1_MPORT_2_addr; // @[tage.scala 89:27]
  wire  hi_us_1_MPORT_2_mask; // @[tage.scala 89:27]
  wire  hi_us_1_MPORT_2_en; // @[tage.scala 89:27]
  reg  hi_us_1_s2_req_rhius_en_pipe_0;
  reg [6:0] hi_us_1_s2_req_rhius_addr_pipe_0;
  reg  hi_us_2 [0:127]; // @[tage.scala 89:27]
  wire  hi_us_2_s2_req_rhius_data; // @[tage.scala 89:27]
  wire [6:0] hi_us_2_s2_req_rhius_addr; // @[tage.scala 89:27]
  wire  hi_us_2_MPORT_2_data; // @[tage.scala 89:27]
  wire [6:0] hi_us_2_MPORT_2_addr; // @[tage.scala 89:27]
  wire  hi_us_2_MPORT_2_mask; // @[tage.scala 89:27]
  wire  hi_us_2_MPORT_2_en; // @[tage.scala 89:27]
  reg  hi_us_2_s2_req_rhius_en_pipe_0;
  reg [6:0] hi_us_2_s2_req_rhius_addr_pipe_0;
  reg  hi_us_3 [0:127]; // @[tage.scala 89:27]
  wire  hi_us_3_s2_req_rhius_data; // @[tage.scala 89:27]
  wire [6:0] hi_us_3_s2_req_rhius_addr; // @[tage.scala 89:27]
  wire  hi_us_3_MPORT_2_data; // @[tage.scala 89:27]
  wire [6:0] hi_us_3_MPORT_2_addr; // @[tage.scala 89:27]
  wire  hi_us_3_MPORT_2_mask; // @[tage.scala 89:27]
  wire  hi_us_3_MPORT_2_en; // @[tage.scala 89:27]
  reg  hi_us_3_s2_req_rhius_en_pipe_0;
  reg [6:0] hi_us_3_s2_req_rhius_addr_pipe_0;
  reg  lo_us_0 [0:127]; // @[tage.scala 90:27]
  wire  lo_us_0_s2_req_rlous_data; // @[tage.scala 90:27]
  wire [6:0] lo_us_0_s2_req_rlous_addr; // @[tage.scala 90:27]
  wire  lo_us_0_MPORT_3_data; // @[tage.scala 90:27]
  wire [6:0] lo_us_0_MPORT_3_addr; // @[tage.scala 90:27]
  wire  lo_us_0_MPORT_3_mask; // @[tage.scala 90:27]
  wire  lo_us_0_MPORT_3_en; // @[tage.scala 90:27]
  reg  lo_us_0_s2_req_rlous_en_pipe_0;
  reg [6:0] lo_us_0_s2_req_rlous_addr_pipe_0;
  reg  lo_us_1 [0:127]; // @[tage.scala 90:27]
  wire  lo_us_1_s2_req_rlous_data; // @[tage.scala 90:27]
  wire [6:0] lo_us_1_s2_req_rlous_addr; // @[tage.scala 90:27]
  wire  lo_us_1_MPORT_3_data; // @[tage.scala 90:27]
  wire [6:0] lo_us_1_MPORT_3_addr; // @[tage.scala 90:27]
  wire  lo_us_1_MPORT_3_mask; // @[tage.scala 90:27]
  wire  lo_us_1_MPORT_3_en; // @[tage.scala 90:27]
  reg  lo_us_1_s2_req_rlous_en_pipe_0;
  reg [6:0] lo_us_1_s2_req_rlous_addr_pipe_0;
  reg  lo_us_2 [0:127]; // @[tage.scala 90:27]
  wire  lo_us_2_s2_req_rlous_data; // @[tage.scala 90:27]
  wire [6:0] lo_us_2_s2_req_rlous_addr; // @[tage.scala 90:27]
  wire  lo_us_2_MPORT_3_data; // @[tage.scala 90:27]
  wire [6:0] lo_us_2_MPORT_3_addr; // @[tage.scala 90:27]
  wire  lo_us_2_MPORT_3_mask; // @[tage.scala 90:27]
  wire  lo_us_2_MPORT_3_en; // @[tage.scala 90:27]
  reg  lo_us_2_s2_req_rlous_en_pipe_0;
  reg [6:0] lo_us_2_s2_req_rlous_addr_pipe_0;
  reg  lo_us_3 [0:127]; // @[tage.scala 90:27]
  wire  lo_us_3_s2_req_rlous_data; // @[tage.scala 90:27]
  wire [6:0] lo_us_3_s2_req_rlous_addr; // @[tage.scala 90:27]
  wire  lo_us_3_MPORT_3_data; // @[tage.scala 90:27]
  wire [6:0] lo_us_3_MPORT_3_addr; // @[tage.scala 90:27]
  wire  lo_us_3_MPORT_3_mask; // @[tage.scala 90:27]
  wire  lo_us_3_MPORT_3_en; // @[tage.scala 90:27]
  reg  lo_us_3_s2_req_rlous_en_pipe_0;
  reg [6:0] lo_us_3_s2_req_rlous_addr_pipe_0;
  reg [10:0] table_0 [0:127]; // @[tage.scala 91:27]
  wire [10:0] table_0_MPORT_data; // @[tage.scala 91:27]
  wire [6:0] table_0_MPORT_addr; // @[tage.scala 91:27]
  wire [10:0] table_0_MPORT_1_data; // @[tage.scala 91:27]
  wire [6:0] table_0_MPORT_1_addr; // @[tage.scala 91:27]
  wire  table_0_MPORT_1_mask; // @[tage.scala 91:27]
  wire  table_0_MPORT_1_en; // @[tage.scala 91:27]
  reg  table_0_MPORT_en_pipe_0;
  reg [6:0] table_0_MPORT_addr_pipe_0;
  reg [10:0] table_1 [0:127]; // @[tage.scala 91:27]
  wire [10:0] table_1_MPORT_data; // @[tage.scala 91:27]
  wire [6:0] table_1_MPORT_addr; // @[tage.scala 91:27]
  wire [10:0] table_1_MPORT_1_data; // @[tage.scala 91:27]
  wire [6:0] table_1_MPORT_1_addr; // @[tage.scala 91:27]
  wire  table_1_MPORT_1_mask; // @[tage.scala 91:27]
  wire  table_1_MPORT_1_en; // @[tage.scala 91:27]
  reg  table_1_MPORT_en_pipe_0;
  reg [6:0] table_1_MPORT_addr_pipe_0;
  reg [10:0] table_2 [0:127]; // @[tage.scala 91:27]
  wire [10:0] table_2_MPORT_data; // @[tage.scala 91:27]
  wire [6:0] table_2_MPORT_addr; // @[tage.scala 91:27]
  wire [10:0] table_2_MPORT_1_data; // @[tage.scala 91:27]
  wire [6:0] table_2_MPORT_1_addr; // @[tage.scala 91:27]
  wire  table_2_MPORT_1_mask; // @[tage.scala 91:27]
  wire  table_2_MPORT_1_en; // @[tage.scala 91:27]
  reg  table_2_MPORT_en_pipe_0;
  reg [6:0] table_2_MPORT_addr_pipe_0;
  reg [10:0] table_3 [0:127]; // @[tage.scala 91:27]
  wire [10:0] table_3_MPORT_data; // @[tage.scala 91:27]
  wire [6:0] table_3_MPORT_addr; // @[tage.scala 91:27]
  wire [10:0] table_3_MPORT_1_data; // @[tage.scala 91:27]
  wire [6:0] table_3_MPORT_1_addr; // @[tage.scala 91:27]
  wire  table_3_MPORT_1_mask; // @[tage.scala 91:27]
  wire  table_3_MPORT_1_en; // @[tage.scala 91:27]
  reg  table_3_MPORT_en_pipe_0;
  reg [6:0] table_3_MPORT_addr_pipe_0;
  reg  doing_reset; // @[tage.scala 72:28]
  reg [6:0] reset_idx; // @[tage.scala 73:26]
  wire [6:0] _GEN_86 = {{6'd0}, doing_reset}; // @[tage.scala 74:26]
  wire [6:0] _T_1 = reset_idx + _GEN_86; // @[tage.scala 74:26]
  wire  _GEN_0 = reset_idx == 7'h7f ? 1'h0 : doing_reset; // @[tage.scala 75:36 tage.scala 75:50 tage.scala 72:28]
  wire [36:0] _GEN_87 = {{35'd0}, io_f1_req_ghist[1:0]}; // @[tage.scala 60:29]
  wire [36:0] _T_5 = io_f1_req_pc[39:3] ^ _GEN_87; // @[tage.scala 60:29]
  wire [29:0] _GEN_88 = {{28'd0}, io_f1_req_ghist[1:0]}; // @[tage.scala 62:50]
  wire [29:0] _T_8 = io_f1_req_pc[39:10] ^ _GEN_88; // @[tage.scala 62:50]
  reg [6:0] s2_tag; // @[tage.scala 95:29]
  wire [10:0] _WIRE_2 = table_0_MPORT_data;
  wire [6:0] s2_req_rtage_0_tag = _WIRE_2[9:3]; // @[tage.scala 97:87]
  wire  s2_req_rtage_0_valid = _WIRE_2[10]; // @[tage.scala 97:87]
  wire [10:0] _WIRE_4 = table_1_MPORT_data;
  wire [6:0] s2_req_rtage_1_tag = _WIRE_4[9:3]; // @[tage.scala 97:87]
  wire  s2_req_rtage_1_valid = _WIRE_4[10]; // @[tage.scala 97:87]
  wire [10:0] _WIRE_6 = table_2_MPORT_data;
  wire [6:0] s2_req_rtage_2_tag = _WIRE_6[9:3]; // @[tage.scala 97:87]
  wire  s2_req_rtage_2_valid = _WIRE_6[10]; // @[tage.scala 97:87]
  wire [10:0] _WIRE_8 = table_3_MPORT_data;
  wire [6:0] s2_req_rtage_3_tag = _WIRE_8[9:3]; // @[tage.scala 97:87]
  wire  s2_req_rtage_3_valid = _WIRE_8[10]; // @[tage.scala 97:87]
  wire  _T_29 = ~doing_reset; // @[tage.scala 100:83]
  reg  REG; // @[tage.scala 104:38]
  reg [1:0] REG_1; // @[tage.scala 105:38]
  reg [2:0] REG_2; // @[tage.scala 106:38]
  reg  REG_3; // @[tage.scala 104:38]
  reg [1:0] REG_4; // @[tage.scala 105:38]
  reg [2:0] REG_5; // @[tage.scala 106:38]
  reg  REG_6; // @[tage.scala 104:38]
  reg [1:0] REG_7; // @[tage.scala 105:38]
  reg [2:0] REG_8; // @[tage.scala 106:38]
  reg  REG_9; // @[tage.scala 104:38]
  reg [1:0] REG_10; // @[tage.scala 105:38]
  reg [2:0] REG_11; // @[tage.scala 106:38]
  reg [18:0] clear_u_ctr; // @[tage.scala 109:28]
  wire [18:0] _T_48 = clear_u_ctr + 19'h1; // @[tage.scala 110:85]
  wire  doing_clear_u = clear_u_ctr[10:0] == 11'h0; // @[tage.scala 112:61]
  wire  doing_clear_u_hi = doing_clear_u & clear_u_ctr[18]; // @[tage.scala 113:40]
  wire  doing_clear_u_lo = doing_clear_u & ~clear_u_ctr[18]; // @[tage.scala 114:40]
  wire [7:0] clear_u_idx = clear_u_ctr[18:11]; // @[tage.scala 115:33]
  wire [36:0] _GEN_89 = {{35'd0}, io_update_hist[1:0]}; // @[tage.scala 60:29]
  wire [36:0] _T_56 = io_update_pc[39:3] ^ _GEN_89; // @[tage.scala 60:29]
  wire [6:0] update_idx = _T_56[6:0]; // @[tage.scala 60:43]
  wire [29:0] _GEN_90 = {{28'd0}, io_update_hist[1:0]}; // @[tage.scala 62:50]
  wire [29:0] _T_59 = io_update_pc[39:10] ^ _GEN_90; // @[tage.scala 62:50]
  wire [6:0] update_tag = _T_59[6:0]; // @[tage.scala 62:64]
  wire [2:0] _T_109 = io_update_taken_0 ? 3'h4 : 3'h3; // @[tage.scala 156:10]
  reg [6:0] wrbypass_tags_0; // @[tage.scala 141:29]
  wire  _T_100 = wrbypass_tags_0 == update_tag; // @[tage.scala 148:22]
  wire  _T_101 = _T_29 & _T_100; // @[tage.scala 147:18]
  reg [6:0] wrbypass_idxs_0; // @[tage.scala 142:29]
  wire  _T_102 = wrbypass_idxs_0 == update_idx; // @[tage.scala 149:22]
  wire  wrbypass_hits_0 = _T_101 & _T_102; // @[tage.scala 148:37]
  reg [6:0] wrbypass_tags_1; // @[tage.scala 141:29]
  wire  _T_105 = wrbypass_tags_1 == update_tag; // @[tage.scala 148:22]
  wire  _T_106 = _T_29 & _T_105; // @[tage.scala 147:18]
  reg [6:0] wrbypass_idxs_1; // @[tage.scala 142:29]
  wire  _T_107 = wrbypass_idxs_1 == update_idx; // @[tage.scala 149:22]
  wire  wrbypass_hits_1 = _T_106 & _T_107; // @[tage.scala 148:37]
  wire  wrbypass_hit = wrbypass_hits_0 | wrbypass_hits_1; // @[tage.scala 151:48]
  wire  wrbypass_hit_idx = wrbypass_hits_0 ? 1'h0 : 1'h1; // @[Mux.scala 47:69]
  reg [2:0] wrbypass_1_0; // @[tage.scala 143:29]
  reg [2:0] wrbypass_0_0; // @[tage.scala 143:29]
  wire [2:0] _GEN_33 = wrbypass_hit_idx ? wrbypass_1_0 : wrbypass_0_0; // @[tage.scala 67:25 tage.scala 67:25]
  wire [2:0] _T_113 = _GEN_33 - 3'h1; // @[tage.scala 67:43]
  wire [2:0] _T_114 = _GEN_33 == 3'h0 ? 3'h0 : _T_113; // @[tage.scala 67:20]
  wire [2:0] _T_117 = _GEN_33 + 3'h1; // @[tage.scala 68:43]
  wire [2:0] _T_118 = _GEN_33 == 3'h7 ? 3'h7 : _T_117; // @[tage.scala 68:20]
  wire [2:0] _T_119 = ~io_update_taken_0 ? _T_114 : _T_118; // @[tage.scala 67:8]
  wire [2:0] _T_123 = io_update_old_ctr_0 - 3'h1; // @[tage.scala 67:43]
  wire [2:0] _T_124 = io_update_old_ctr_0 == 3'h0 ? 3'h0 : _T_123; // @[tage.scala 67:20]
  wire [2:0] _T_127 = io_update_old_ctr_0 + 3'h1; // @[tage.scala 68:43]
  wire [2:0] _T_128 = io_update_old_ctr_0 == 3'h7 ? 3'h7 : _T_127; // @[tage.scala 68:20]
  wire [2:0] _T_129 = ~io_update_taken_0 ? _T_124 : _T_128; // @[tage.scala 67:8]
  wire [2:0] _T_130 = wrbypass_hit ? _T_119 : _T_129; // @[tage.scala 159:10]
  wire [2:0] update_wdata_0_ctr = io_update_alloc_0 ? _T_109 : _T_130; // @[tage.scala 155:33]
  wire [10:0] _T_61 = {1'h1,update_tag,update_wdata_0_ctr}; // @[tage.scala 123:102]
  wire [2:0] _T_134 = io_update_taken_1 ? 3'h4 : 3'h3; // @[tage.scala 156:10]
  reg [2:0] wrbypass_1_1; // @[tage.scala 143:29]
  reg [2:0] wrbypass_0_1; // @[tage.scala 143:29]
  wire [2:0] _GEN_35 = wrbypass_hit_idx ? wrbypass_1_1 : wrbypass_0_1; // @[tage.scala 67:25 tage.scala 67:25]
  wire [2:0] _T_138 = _GEN_35 - 3'h1; // @[tage.scala 67:43]
  wire [2:0] _T_139 = _GEN_35 == 3'h0 ? 3'h0 : _T_138; // @[tage.scala 67:20]
  wire [2:0] _T_142 = _GEN_35 + 3'h1; // @[tage.scala 68:43]
  wire [2:0] _T_143 = _GEN_35 == 3'h7 ? 3'h7 : _T_142; // @[tage.scala 68:20]
  wire [2:0] _T_144 = ~io_update_taken_1 ? _T_139 : _T_143; // @[tage.scala 67:8]
  wire [2:0] _T_148 = io_update_old_ctr_1 - 3'h1; // @[tage.scala 67:43]
  wire [2:0] _T_149 = io_update_old_ctr_1 == 3'h0 ? 3'h0 : _T_148; // @[tage.scala 67:20]
  wire [2:0] _T_152 = io_update_old_ctr_1 + 3'h1; // @[tage.scala 68:43]
  wire [2:0] _T_153 = io_update_old_ctr_1 == 3'h7 ? 3'h7 : _T_152; // @[tage.scala 68:20]
  wire [2:0] _T_154 = ~io_update_taken_1 ? _T_149 : _T_153; // @[tage.scala 67:8]
  wire [2:0] _T_155 = wrbypass_hit ? _T_144 : _T_154; // @[tage.scala 159:10]
  wire [2:0] update_wdata_1_ctr = io_update_alloc_1 ? _T_134 : _T_155; // @[tage.scala 155:33]
  wire [10:0] _T_62 = {1'h1,update_tag,update_wdata_1_ctr}; // @[tage.scala 123:102]
  wire [2:0] _T_159 = io_update_taken_2 ? 3'h4 : 3'h3; // @[tage.scala 156:10]
  reg [2:0] wrbypass_1_2; // @[tage.scala 143:29]
  reg [2:0] wrbypass_0_2; // @[tage.scala 143:29]
  wire [2:0] _GEN_37 = wrbypass_hit_idx ? wrbypass_1_2 : wrbypass_0_2; // @[tage.scala 67:25 tage.scala 67:25]
  wire [2:0] _T_163 = _GEN_37 - 3'h1; // @[tage.scala 67:43]
  wire [2:0] _T_164 = _GEN_37 == 3'h0 ? 3'h0 : _T_163; // @[tage.scala 67:20]
  wire [2:0] _T_167 = _GEN_37 + 3'h1; // @[tage.scala 68:43]
  wire [2:0] _T_168 = _GEN_37 == 3'h7 ? 3'h7 : _T_167; // @[tage.scala 68:20]
  wire [2:0] _T_169 = ~io_update_taken_2 ? _T_164 : _T_168; // @[tage.scala 67:8]
  wire [2:0] _T_173 = io_update_old_ctr_2 - 3'h1; // @[tage.scala 67:43]
  wire [2:0] _T_174 = io_update_old_ctr_2 == 3'h0 ? 3'h0 : _T_173; // @[tage.scala 67:20]
  wire [2:0] _T_177 = io_update_old_ctr_2 + 3'h1; // @[tage.scala 68:43]
  wire [2:0] _T_178 = io_update_old_ctr_2 == 3'h7 ? 3'h7 : _T_177; // @[tage.scala 68:20]
  wire [2:0] _T_179 = ~io_update_taken_2 ? _T_174 : _T_178; // @[tage.scala 67:8]
  wire [2:0] _T_180 = wrbypass_hit ? _T_169 : _T_179; // @[tage.scala 159:10]
  wire [2:0] update_wdata_2_ctr = io_update_alloc_2 ? _T_159 : _T_180; // @[tage.scala 155:33]
  wire [10:0] _T_63 = {1'h1,update_tag,update_wdata_2_ctr}; // @[tage.scala 123:102]
  wire [2:0] _T_184 = io_update_taken_3 ? 3'h4 : 3'h3; // @[tage.scala 156:10]
  reg [2:0] wrbypass_1_3; // @[tage.scala 143:29]
  reg [2:0] wrbypass_0_3; // @[tage.scala 143:29]
  wire [2:0] _GEN_39 = wrbypass_hit_idx ? wrbypass_1_3 : wrbypass_0_3; // @[tage.scala 67:25 tage.scala 67:25]
  wire [2:0] _T_188 = _GEN_39 - 3'h1; // @[tage.scala 67:43]
  wire [2:0] _T_189 = _GEN_39 == 3'h0 ? 3'h0 : _T_188; // @[tage.scala 67:20]
  wire [2:0] _T_192 = _GEN_39 + 3'h1; // @[tage.scala 68:43]
  wire [2:0] _T_193 = _GEN_39 == 3'h7 ? 3'h7 : _T_192; // @[tage.scala 68:20]
  wire [2:0] _T_194 = ~io_update_taken_3 ? _T_189 : _T_193; // @[tage.scala 67:8]
  wire [2:0] _T_198 = io_update_old_ctr_3 - 3'h1; // @[tage.scala 67:43]
  wire [2:0] _T_199 = io_update_old_ctr_3 == 3'h0 ? 3'h0 : _T_198; // @[tage.scala 67:20]
  wire [2:0] _T_202 = io_update_old_ctr_3 + 3'h1; // @[tage.scala 68:43]
  wire [2:0] _T_203 = io_update_old_ctr_3 == 3'h7 ? 3'h7 : _T_202; // @[tage.scala 68:20]
  wire [2:0] _T_204 = ~io_update_taken_3 ? _T_199 : _T_203; // @[tage.scala 67:8]
  wire [2:0] _T_205 = wrbypass_hit ? _T_194 : _T_204; // @[tage.scala 159:10]
  wire [2:0] update_wdata_3_ctr = io_update_alloc_3 ? _T_184 : _T_205; // @[tage.scala 155:33]
  wire [10:0] _T_64 = {1'h1,update_tag,update_wdata_3_ctr}; // @[tage.scala 123:102]
  wire [3:0] _T_67 = {io_update_mask_3,io_update_mask_2,io_update_mask_1,io_update_mask_0}; // @[tage.scala 124:90]
  wire [3:0] _T_68 = doing_reset ? 4'hf : _T_67; // @[tage.scala 124:8]
  wire [7:0] _T_73 = doing_clear_u_hi ? clear_u_idx : {{1'd0}, update_idx}; // @[tage.scala 129:36]
  wire [7:0] _T_74 = doing_reset ? {{1'd0}, reset_idx} : _T_73; // @[tage.scala 129:8]
  wire  _T_75 = doing_reset | doing_clear_u_hi; // @[tage.scala 130:21]
  wire  update_hi_wdata_0 = io_update_u_0[1]; // @[tage.scala 166:44]
  wire  update_hi_wdata_1 = io_update_u_1[1]; // @[tage.scala 166:44]
  wire  update_hi_wdata_2 = io_update_u_2[1]; // @[tage.scala 166:44]
  wire  update_hi_wdata_3 = io_update_u_3[1]; // @[tage.scala 166:44]
  wire [3:0] _T_79 = {io_update_u_mask_3,io_update_u_mask_2,io_update_u_mask_1,io_update_u_mask_0}; // @[tage.scala 131:80]
  wire [3:0] _T_80 = _T_75 ? 4'hf : _T_79; // @[tage.scala 131:8]
  wire [7:0] _T_86 = doing_clear_u_lo ? clear_u_idx : {{1'd0}, update_idx}; // @[tage.scala 136:36]
  wire [7:0] _T_87 = doing_reset ? {{1'd0}, reset_idx} : _T_86; // @[tage.scala 136:8]
  wire  _T_88 = doing_reset | doing_clear_u_lo; // @[tage.scala 137:21]
  wire  update_lo_wdata_0 = io_update_u_0[0]; // @[tage.scala 167:44]
  wire  update_lo_wdata_1 = io_update_u_1[0]; // @[tage.scala 167:44]
  wire  update_lo_wdata_2 = io_update_u_2[0]; // @[tage.scala 167:44]
  wire  update_lo_wdata_3 = io_update_u_3[0]; // @[tage.scala 167:44]
  wire [3:0] _T_93 = _T_88 ? 4'hf : _T_79; // @[tage.scala 138:8]
  reg  wrbypass_enq_idx; // @[tage.scala 144:33]
  wire  _T_214 = wrbypass_enq_idx + 1'h1; // @[util.scala 203:14]
  assign hi_us_0_s2_req_rhius_addr = hi_us_0_s2_req_rhius_addr_pipe_0;
  assign hi_us_0_s2_req_rhius_data = hi_us_0[hi_us_0_s2_req_rhius_addr]; // @[tage.scala 89:27]
  assign hi_us_0_MPORT_2_data = _T_75 ? 1'h0 : update_hi_wdata_0;
  assign hi_us_0_MPORT_2_addr = _T_74[6:0];
  assign hi_us_0_MPORT_2_mask = _T_80[0];
  assign hi_us_0_MPORT_2_en = 1'h1;
  assign hi_us_1_s2_req_rhius_addr = hi_us_1_s2_req_rhius_addr_pipe_0;
  assign hi_us_1_s2_req_rhius_data = hi_us_1[hi_us_1_s2_req_rhius_addr]; // @[tage.scala 89:27]
  assign hi_us_1_MPORT_2_data = _T_75 ? 1'h0 : update_hi_wdata_1;
  assign hi_us_1_MPORT_2_addr = _T_74[6:0];
  assign hi_us_1_MPORT_2_mask = _T_80[1];
  assign hi_us_1_MPORT_2_en = 1'h1;
  assign hi_us_2_s2_req_rhius_addr = hi_us_2_s2_req_rhius_addr_pipe_0;
  assign hi_us_2_s2_req_rhius_data = hi_us_2[hi_us_2_s2_req_rhius_addr]; // @[tage.scala 89:27]
  assign hi_us_2_MPORT_2_data = _T_75 ? 1'h0 : update_hi_wdata_2;
  assign hi_us_2_MPORT_2_addr = _T_74[6:0];
  assign hi_us_2_MPORT_2_mask = _T_80[2];
  assign hi_us_2_MPORT_2_en = 1'h1;
  assign hi_us_3_s2_req_rhius_addr = hi_us_3_s2_req_rhius_addr_pipe_0;
  assign hi_us_3_s2_req_rhius_data = hi_us_3[hi_us_3_s2_req_rhius_addr]; // @[tage.scala 89:27]
  assign hi_us_3_MPORT_2_data = _T_75 ? 1'h0 : update_hi_wdata_3;
  assign hi_us_3_MPORT_2_addr = _T_74[6:0];
  assign hi_us_3_MPORT_2_mask = _T_80[3];
  assign hi_us_3_MPORT_2_en = 1'h1;
  assign lo_us_0_s2_req_rlous_addr = lo_us_0_s2_req_rlous_addr_pipe_0;
  assign lo_us_0_s2_req_rlous_data = lo_us_0[lo_us_0_s2_req_rlous_addr]; // @[tage.scala 90:27]
  assign lo_us_0_MPORT_3_data = _T_88 ? 1'h0 : update_lo_wdata_0;
  assign lo_us_0_MPORT_3_addr = _T_87[6:0];
  assign lo_us_0_MPORT_3_mask = _T_93[0];
  assign lo_us_0_MPORT_3_en = 1'h1;
  assign lo_us_1_s2_req_rlous_addr = lo_us_1_s2_req_rlous_addr_pipe_0;
  assign lo_us_1_s2_req_rlous_data = lo_us_1[lo_us_1_s2_req_rlous_addr]; // @[tage.scala 90:27]
  assign lo_us_1_MPORT_3_data = _T_88 ? 1'h0 : update_lo_wdata_1;
  assign lo_us_1_MPORT_3_addr = _T_87[6:0];
  assign lo_us_1_MPORT_3_mask = _T_93[1];
  assign lo_us_1_MPORT_3_en = 1'h1;
  assign lo_us_2_s2_req_rlous_addr = lo_us_2_s2_req_rlous_addr_pipe_0;
  assign lo_us_2_s2_req_rlous_data = lo_us_2[lo_us_2_s2_req_rlous_addr]; // @[tage.scala 90:27]
  assign lo_us_2_MPORT_3_data = _T_88 ? 1'h0 : update_lo_wdata_2;
  assign lo_us_2_MPORT_3_addr = _T_87[6:0];
  assign lo_us_2_MPORT_3_mask = _T_93[2];
  assign lo_us_2_MPORT_3_en = 1'h1;
  assign lo_us_3_s2_req_rlous_addr = lo_us_3_s2_req_rlous_addr_pipe_0;
  assign lo_us_3_s2_req_rlous_data = lo_us_3[lo_us_3_s2_req_rlous_addr]; // @[tage.scala 90:27]
  assign lo_us_3_MPORT_3_data = _T_88 ? 1'h0 : update_lo_wdata_3;
  assign lo_us_3_MPORT_3_addr = _T_87[6:0];
  assign lo_us_3_MPORT_3_mask = _T_93[3];
  assign lo_us_3_MPORT_3_en = 1'h1;
  assign table_0_MPORT_addr = table_0_MPORT_addr_pipe_0;
  assign table_0_MPORT_data = table_0[table_0_MPORT_addr]; // @[tage.scala 91:27]
  assign table_0_MPORT_1_data = doing_reset ? 11'h0 : _T_61;
  assign table_0_MPORT_1_addr = doing_reset ? reset_idx : update_idx;
  assign table_0_MPORT_1_mask = _T_68[0];
  assign table_0_MPORT_1_en = 1'h1;
  assign table_1_MPORT_addr = table_1_MPORT_addr_pipe_0;
  assign table_1_MPORT_data = table_1[table_1_MPORT_addr]; // @[tage.scala 91:27]
  assign table_1_MPORT_1_data = doing_reset ? 11'h0 : _T_62;
  assign table_1_MPORT_1_addr = doing_reset ? reset_idx : update_idx;
  assign table_1_MPORT_1_mask = _T_68[1];
  assign table_1_MPORT_1_en = 1'h1;
  assign table_2_MPORT_addr = table_2_MPORT_addr_pipe_0;
  assign table_2_MPORT_data = table_2[table_2_MPORT_addr]; // @[tage.scala 91:27]
  assign table_2_MPORT_1_data = doing_reset ? 11'h0 : _T_63;
  assign table_2_MPORT_1_addr = doing_reset ? reset_idx : update_idx;
  assign table_2_MPORT_1_mask = _T_68[2];
  assign table_2_MPORT_1_en = 1'h1;
  assign table_3_MPORT_addr = table_3_MPORT_addr_pipe_0;
  assign table_3_MPORT_data = table_3[table_3_MPORT_addr]; // @[tage.scala 91:27]
  assign table_3_MPORT_1_data = doing_reset ? 11'h0 : _T_64;
  assign table_3_MPORT_1_addr = doing_reset ? reset_idx : update_idx;
  assign table_3_MPORT_1_mask = _T_68[3];
  assign table_3_MPORT_1_en = 1'h1;
  assign io_f3_resp_0_valid = REG; // @[tage.scala 104:28]
  assign io_f3_resp_0_bits_ctr = REG_2; // @[tage.scala 106:28]
  assign io_f3_resp_0_bits_u = REG_1; // @[tage.scala 105:28]
  assign io_f3_resp_1_valid = REG_3; // @[tage.scala 104:28]
  assign io_f3_resp_1_bits_ctr = REG_5; // @[tage.scala 106:28]
  assign io_f3_resp_1_bits_u = REG_4; // @[tage.scala 105:28]
  assign io_f3_resp_2_valid = REG_6; // @[tage.scala 104:28]
  assign io_f3_resp_2_bits_ctr = REG_8; // @[tage.scala 106:28]
  assign io_f3_resp_2_bits_u = REG_7; // @[tage.scala 105:28]
  assign io_f3_resp_3_valid = REG_9; // @[tage.scala 104:28]
  assign io_f3_resp_3_bits_ctr = REG_11; // @[tage.scala 106:28]
  assign io_f3_resp_3_bits_u = REG_10; // @[tage.scala 105:28]
  always @(posedge clock) begin
    if(hi_us_0_MPORT_2_en & hi_us_0_MPORT_2_mask) begin
      hi_us_0[hi_us_0_MPORT_2_addr] <= hi_us_0_MPORT_2_data; // @[tage.scala 89:27]
    end
    hi_us_0_s2_req_rhius_en_pipe_0 <= io_f1_req_valid;
    if (io_f1_req_valid) begin
      hi_us_0_s2_req_rhius_addr_pipe_0 <= _T_5[6:0];
    end
    if(hi_us_1_MPORT_2_en & hi_us_1_MPORT_2_mask) begin
      hi_us_1[hi_us_1_MPORT_2_addr] <= hi_us_1_MPORT_2_data; // @[tage.scala 89:27]
    end
    hi_us_1_s2_req_rhius_en_pipe_0 <= io_f1_req_valid;
    if (io_f1_req_valid) begin
      hi_us_1_s2_req_rhius_addr_pipe_0 <= _T_5[6:0];
    end
    if(hi_us_2_MPORT_2_en & hi_us_2_MPORT_2_mask) begin
      hi_us_2[hi_us_2_MPORT_2_addr] <= hi_us_2_MPORT_2_data; // @[tage.scala 89:27]
    end
    hi_us_2_s2_req_rhius_en_pipe_0 <= io_f1_req_valid;
    if (io_f1_req_valid) begin
      hi_us_2_s2_req_rhius_addr_pipe_0 <= _T_5[6:0];
    end
    if(hi_us_3_MPORT_2_en & hi_us_3_MPORT_2_mask) begin
      hi_us_3[hi_us_3_MPORT_2_addr] <= hi_us_3_MPORT_2_data; // @[tage.scala 89:27]
    end
    hi_us_3_s2_req_rhius_en_pipe_0 <= io_f1_req_valid;
    if (io_f1_req_valid) begin
      hi_us_3_s2_req_rhius_addr_pipe_0 <= _T_5[6:0];
    end
    if(lo_us_0_MPORT_3_en & lo_us_0_MPORT_3_mask) begin
      lo_us_0[lo_us_0_MPORT_3_addr] <= lo_us_0_MPORT_3_data; // @[tage.scala 90:27]
    end
    lo_us_0_s2_req_rlous_en_pipe_0 <= io_f1_req_valid;
    if (io_f1_req_valid) begin
      lo_us_0_s2_req_rlous_addr_pipe_0 <= _T_5[6:0];
    end
    if(lo_us_1_MPORT_3_en & lo_us_1_MPORT_3_mask) begin
      lo_us_1[lo_us_1_MPORT_3_addr] <= lo_us_1_MPORT_3_data; // @[tage.scala 90:27]
    end
    lo_us_1_s2_req_rlous_en_pipe_0 <= io_f1_req_valid;
    if (io_f1_req_valid) begin
      lo_us_1_s2_req_rlous_addr_pipe_0 <= _T_5[6:0];
    end
    if(lo_us_2_MPORT_3_en & lo_us_2_MPORT_3_mask) begin
      lo_us_2[lo_us_2_MPORT_3_addr] <= lo_us_2_MPORT_3_data; // @[tage.scala 90:27]
    end
    lo_us_2_s2_req_rlous_en_pipe_0 <= io_f1_req_valid;
    if (io_f1_req_valid) begin
      lo_us_2_s2_req_rlous_addr_pipe_0 <= _T_5[6:0];
    end
    if(lo_us_3_MPORT_3_en & lo_us_3_MPORT_3_mask) begin
      lo_us_3[lo_us_3_MPORT_3_addr] <= lo_us_3_MPORT_3_data; // @[tage.scala 90:27]
    end
    lo_us_3_s2_req_rlous_en_pipe_0 <= io_f1_req_valid;
    if (io_f1_req_valid) begin
      lo_us_3_s2_req_rlous_addr_pipe_0 <= _T_5[6:0];
    end
    if(table_0_MPORT_1_en & table_0_MPORT_1_mask) begin
      table_0[table_0_MPORT_1_addr] <= table_0_MPORT_1_data; // @[tage.scala 91:27]
    end
    table_0_MPORT_en_pipe_0 <= io_f1_req_valid;
    if (io_f1_req_valid) begin
      table_0_MPORT_addr_pipe_0 <= _T_5[6:0];
    end
    if(table_1_MPORT_1_en & table_1_MPORT_1_mask) begin
      table_1[table_1_MPORT_1_addr] <= table_1_MPORT_1_data; // @[tage.scala 91:27]
    end
    table_1_MPORT_en_pipe_0 <= io_f1_req_valid;
    if (io_f1_req_valid) begin
      table_1_MPORT_addr_pipe_0 <= _T_5[6:0];
    end
    if(table_2_MPORT_1_en & table_2_MPORT_1_mask) begin
      table_2[table_2_MPORT_1_addr] <= table_2_MPORT_1_data; // @[tage.scala 91:27]
    end
    table_2_MPORT_en_pipe_0 <= io_f1_req_valid;
    if (io_f1_req_valid) begin
      table_2_MPORT_addr_pipe_0 <= _T_5[6:0];
    end
    if(table_3_MPORT_1_en & table_3_MPORT_1_mask) begin
      table_3[table_3_MPORT_1_addr] <= table_3_MPORT_1_data; // @[tage.scala 91:27]
    end
    table_3_MPORT_en_pipe_0 <= io_f1_req_valid;
    if (io_f1_req_valid) begin
      table_3_MPORT_addr_pipe_0 <= _T_5[6:0];
    end
    doing_reset <= reset | _GEN_0; // @[tage.scala 72:28 tage.scala 72:28]
    if (reset) begin // @[tage.scala 73:26]
      reset_idx <= 7'h0; // @[tage.scala 73:26]
    end else begin
      reset_idx <= _T_1; // @[tage.scala 74:13]
    end
    s2_tag <= _T_8[6:0]; // @[tage.scala 62:64]
    REG <= s2_req_rtage_0_valid & s2_req_rtage_0_tag == s2_tag & ~doing_reset; // @[tage.scala 100:80]
    REG_1 <= {hi_us_0_s2_req_rhius_data,lo_us_0_s2_req_rlous_data}; // @[Cat.scala 30:58]
    REG_2 <= _WIRE_2[2:0]; // @[tage.scala 97:87]
    REG_3 <= s2_req_rtage_1_valid & s2_req_rtage_1_tag == s2_tag & ~doing_reset; // @[tage.scala 100:80]
    REG_4 <= {hi_us_1_s2_req_rhius_data,lo_us_1_s2_req_rlous_data}; // @[Cat.scala 30:58]
    REG_5 <= _WIRE_4[2:0]; // @[tage.scala 97:87]
    REG_6 <= s2_req_rtage_2_valid & s2_req_rtage_2_tag == s2_tag & ~doing_reset; // @[tage.scala 100:80]
    REG_7 <= {hi_us_2_s2_req_rhius_data,lo_us_2_s2_req_rlous_data}; // @[Cat.scala 30:58]
    REG_8 <= _WIRE_6[2:0]; // @[tage.scala 97:87]
    REG_9 <= s2_req_rtage_3_valid & s2_req_rtage_3_tag == s2_tag & ~doing_reset; // @[tage.scala 100:80]
    REG_10 <= {hi_us_3_s2_req_rhius_data,lo_us_3_s2_req_rlous_data}; // @[Cat.scala 30:58]
    REG_11 <= _WIRE_8[2:0]; // @[tage.scala 97:87]
    if (reset) begin // @[tage.scala 109:28]
      clear_u_ctr <= 19'h0; // @[tage.scala 109:28]
    end else if (doing_reset) begin // @[tage.scala 110:22]
      clear_u_ctr <= 19'h1; // @[tage.scala 110:36]
    end else begin
      clear_u_ctr <= _T_48; // @[tage.scala 110:70]
    end
    if (io_update_mask_0 | io_update_mask_1 | io_update_mask_2 | io_update_mask_3) begin // @[tage.scala 170:38]
      if (!(wrbypass_hit)) begin // @[tage.scala 171:39]
        if (~wrbypass_enq_idx) begin // @[tage.scala 175:39]
          wrbypass_tags_0 <= update_tag; // @[tage.scala 175:39]
        end
      end
    end
    if (io_update_mask_0 | io_update_mask_1 | io_update_mask_2 | io_update_mask_3) begin // @[tage.scala 170:38]
      if (!(wrbypass_hit)) begin // @[tage.scala 171:39]
        if (~wrbypass_enq_idx) begin // @[tage.scala 176:39]
          wrbypass_idxs_0 <= update_idx; // @[tage.scala 176:39]
        end
      end
    end
    if (io_update_mask_0 | io_update_mask_1 | io_update_mask_2 | io_update_mask_3) begin // @[tage.scala 170:38]
      if (!(wrbypass_hit)) begin // @[tage.scala 171:39]
        if (wrbypass_enq_idx) begin // @[tage.scala 175:39]
          wrbypass_tags_1 <= update_tag; // @[tage.scala 175:39]
        end
      end
    end
    if (io_update_mask_0 | io_update_mask_1 | io_update_mask_2 | io_update_mask_3) begin // @[tage.scala 170:38]
      if (!(wrbypass_hit)) begin // @[tage.scala 171:39]
        if (wrbypass_enq_idx) begin // @[tage.scala 176:39]
          wrbypass_idxs_1 <= update_idx; // @[tage.scala 176:39]
        end
      end
    end
    if (io_update_mask_0 | io_update_mask_1 | io_update_mask_2 | io_update_mask_3) begin // @[tage.scala 170:38]
      if (wrbypass_hit) begin // @[tage.scala 171:39]
        if (wrbypass_hit_idx) begin // @[tage.scala 172:34]
          wrbypass_1_0 <= update_wdata_0_ctr; // @[tage.scala 172:34]
        end
      end else if (wrbypass_enq_idx) begin // @[tage.scala 174:39]
        wrbypass_1_0 <= update_wdata_0_ctr; // @[tage.scala 174:39]
      end
    end
    if (io_update_mask_0 | io_update_mask_1 | io_update_mask_2 | io_update_mask_3) begin // @[tage.scala 170:38]
      if (wrbypass_hit) begin // @[tage.scala 171:39]
        if (~wrbypass_hit_idx) begin // @[tage.scala 172:34]
          wrbypass_0_0 <= update_wdata_0_ctr; // @[tage.scala 172:34]
        end
      end else if (~wrbypass_enq_idx) begin // @[tage.scala 174:39]
        wrbypass_0_0 <= update_wdata_0_ctr; // @[tage.scala 174:39]
      end
    end
    if (io_update_mask_0 | io_update_mask_1 | io_update_mask_2 | io_update_mask_3) begin // @[tage.scala 170:38]
      if (wrbypass_hit) begin // @[tage.scala 171:39]
        if (wrbypass_hit_idx) begin // @[tage.scala 172:34]
          wrbypass_1_1 <= update_wdata_1_ctr; // @[tage.scala 172:34]
        end
      end else if (wrbypass_enq_idx) begin // @[tage.scala 174:39]
        wrbypass_1_1 <= update_wdata_1_ctr; // @[tage.scala 174:39]
      end
    end
    if (io_update_mask_0 | io_update_mask_1 | io_update_mask_2 | io_update_mask_3) begin // @[tage.scala 170:38]
      if (wrbypass_hit) begin // @[tage.scala 171:39]
        if (~wrbypass_hit_idx) begin // @[tage.scala 172:34]
          wrbypass_0_1 <= update_wdata_1_ctr; // @[tage.scala 172:34]
        end
      end else if (~wrbypass_enq_idx) begin // @[tage.scala 174:39]
        wrbypass_0_1 <= update_wdata_1_ctr; // @[tage.scala 174:39]
      end
    end
    if (io_update_mask_0 | io_update_mask_1 | io_update_mask_2 | io_update_mask_3) begin // @[tage.scala 170:38]
      if (wrbypass_hit) begin // @[tage.scala 171:39]
        if (wrbypass_hit_idx) begin // @[tage.scala 172:34]
          wrbypass_1_2 <= update_wdata_2_ctr; // @[tage.scala 172:34]
        end
      end else if (wrbypass_enq_idx) begin // @[tage.scala 174:39]
        wrbypass_1_2 <= update_wdata_2_ctr; // @[tage.scala 174:39]
      end
    end
    if (io_update_mask_0 | io_update_mask_1 | io_update_mask_2 | io_update_mask_3) begin // @[tage.scala 170:38]
      if (wrbypass_hit) begin // @[tage.scala 171:39]
        if (~wrbypass_hit_idx) begin // @[tage.scala 172:34]
          wrbypass_0_2 <= update_wdata_2_ctr; // @[tage.scala 172:34]
        end
      end else if (~wrbypass_enq_idx) begin // @[tage.scala 174:39]
        wrbypass_0_2 <= update_wdata_2_ctr; // @[tage.scala 174:39]
      end
    end
    if (io_update_mask_0 | io_update_mask_1 | io_update_mask_2 | io_update_mask_3) begin // @[tage.scala 170:38]
      if (wrbypass_hit) begin // @[tage.scala 171:39]
        if (wrbypass_hit_idx) begin // @[tage.scala 172:34]
          wrbypass_1_3 <= update_wdata_3_ctr; // @[tage.scala 172:34]
        end
      end else if (wrbypass_enq_idx) begin // @[tage.scala 174:39]
        wrbypass_1_3 <= update_wdata_3_ctr; // @[tage.scala 174:39]
      end
    end
    if (io_update_mask_0 | io_update_mask_1 | io_update_mask_2 | io_update_mask_3) begin // @[tage.scala 170:38]
      if (wrbypass_hit) begin // @[tage.scala 171:39]
        if (~wrbypass_hit_idx) begin // @[tage.scala 172:34]
          wrbypass_0_3 <= update_wdata_3_ctr; // @[tage.scala 172:34]
        end
      end else if (~wrbypass_enq_idx) begin // @[tage.scala 174:39]
        wrbypass_0_3 <= update_wdata_3_ctr; // @[tage.scala 174:39]
      end
    end
    if (reset) begin // @[tage.scala 144:33]
      wrbypass_enq_idx <= 1'h0; // @[tage.scala 144:33]
    end else if (io_update_mask_0 | io_update_mask_1 | io_update_mask_2 | io_update_mask_3) begin // @[tage.scala 170:38]
      if (!(wrbypass_hit)) begin // @[tage.scala 171:39]
        wrbypass_enq_idx <= _T_214; // @[tage.scala 177:24]
      end
    end
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
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    hi_us_0[initvar] = _RAND_0[0:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    hi_us_1[initvar] = _RAND_3[0:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    hi_us_2[initvar] = _RAND_6[0:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    hi_us_3[initvar] = _RAND_9[0:0];
  _RAND_12 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    lo_us_0[initvar] = _RAND_12[0:0];
  _RAND_15 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    lo_us_1[initvar] = _RAND_15[0:0];
  _RAND_18 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    lo_us_2[initvar] = _RAND_18[0:0];
  _RAND_21 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    lo_us_3[initvar] = _RAND_21[0:0];
  _RAND_24 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    table_0[initvar] = _RAND_24[10:0];
  _RAND_27 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    table_1[initvar] = _RAND_27[10:0];
  _RAND_30 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    table_2[initvar] = _RAND_30[10:0];
  _RAND_33 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    table_3[initvar] = _RAND_33[10:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  hi_us_0_s2_req_rhius_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  hi_us_0_s2_req_rhius_addr_pipe_0 = _RAND_2[6:0];
  _RAND_4 = {1{`RANDOM}};
  hi_us_1_s2_req_rhius_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  hi_us_1_s2_req_rhius_addr_pipe_0 = _RAND_5[6:0];
  _RAND_7 = {1{`RANDOM}};
  hi_us_2_s2_req_rhius_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  hi_us_2_s2_req_rhius_addr_pipe_0 = _RAND_8[6:0];
  _RAND_10 = {1{`RANDOM}};
  hi_us_3_s2_req_rhius_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  hi_us_3_s2_req_rhius_addr_pipe_0 = _RAND_11[6:0];
  _RAND_13 = {1{`RANDOM}};
  lo_us_0_s2_req_rlous_en_pipe_0 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  lo_us_0_s2_req_rlous_addr_pipe_0 = _RAND_14[6:0];
  _RAND_16 = {1{`RANDOM}};
  lo_us_1_s2_req_rlous_en_pipe_0 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  lo_us_1_s2_req_rlous_addr_pipe_0 = _RAND_17[6:0];
  _RAND_19 = {1{`RANDOM}};
  lo_us_2_s2_req_rlous_en_pipe_0 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  lo_us_2_s2_req_rlous_addr_pipe_0 = _RAND_20[6:0];
  _RAND_22 = {1{`RANDOM}};
  lo_us_3_s2_req_rlous_en_pipe_0 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  lo_us_3_s2_req_rlous_addr_pipe_0 = _RAND_23[6:0];
  _RAND_25 = {1{`RANDOM}};
  table_0_MPORT_en_pipe_0 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  table_0_MPORT_addr_pipe_0 = _RAND_26[6:0];
  _RAND_28 = {1{`RANDOM}};
  table_1_MPORT_en_pipe_0 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  table_1_MPORT_addr_pipe_0 = _RAND_29[6:0];
  _RAND_31 = {1{`RANDOM}};
  table_2_MPORT_en_pipe_0 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  table_2_MPORT_addr_pipe_0 = _RAND_32[6:0];
  _RAND_34 = {1{`RANDOM}};
  table_3_MPORT_en_pipe_0 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  table_3_MPORT_addr_pipe_0 = _RAND_35[6:0];
  _RAND_36 = {1{`RANDOM}};
  doing_reset = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  reset_idx = _RAND_37[6:0];
  _RAND_38 = {1{`RANDOM}};
  s2_tag = _RAND_38[6:0];
  _RAND_39 = {1{`RANDOM}};
  REG = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  REG_1 = _RAND_40[1:0];
  _RAND_41 = {1{`RANDOM}};
  REG_2 = _RAND_41[2:0];
  _RAND_42 = {1{`RANDOM}};
  REG_3 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  REG_4 = _RAND_43[1:0];
  _RAND_44 = {1{`RANDOM}};
  REG_5 = _RAND_44[2:0];
  _RAND_45 = {1{`RANDOM}};
  REG_6 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  REG_7 = _RAND_46[1:0];
  _RAND_47 = {1{`RANDOM}};
  REG_8 = _RAND_47[2:0];
  _RAND_48 = {1{`RANDOM}};
  REG_9 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  REG_10 = _RAND_49[1:0];
  _RAND_50 = {1{`RANDOM}};
  REG_11 = _RAND_50[2:0];
  _RAND_51 = {1{`RANDOM}};
  clear_u_ctr = _RAND_51[18:0];
  _RAND_52 = {1{`RANDOM}};
  wrbypass_tags_0 = _RAND_52[6:0];
  _RAND_53 = {1{`RANDOM}};
  wrbypass_idxs_0 = _RAND_53[6:0];
  _RAND_54 = {1{`RANDOM}};
  wrbypass_tags_1 = _RAND_54[6:0];
  _RAND_55 = {1{`RANDOM}};
  wrbypass_idxs_1 = _RAND_55[6:0];
  _RAND_56 = {1{`RANDOM}};
  wrbypass_1_0 = _RAND_56[2:0];
  _RAND_57 = {1{`RANDOM}};
  wrbypass_0_0 = _RAND_57[2:0];
  _RAND_58 = {1{`RANDOM}};
  wrbypass_1_1 = _RAND_58[2:0];
  _RAND_59 = {1{`RANDOM}};
  wrbypass_0_1 = _RAND_59[2:0];
  _RAND_60 = {1{`RANDOM}};
  wrbypass_1_2 = _RAND_60[2:0];
  _RAND_61 = {1{`RANDOM}};
  wrbypass_0_2 = _RAND_61[2:0];
  _RAND_62 = {1{`RANDOM}};
  wrbypass_1_3 = _RAND_62[2:0];
  _RAND_63 = {1{`RANDOM}};
  wrbypass_0_3 = _RAND_63[2:0];
  _RAND_64 = {1{`RANDOM}};
  wrbypass_enq_idx = _RAND_64[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
