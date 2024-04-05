module ICache(
  input         clock,
  input         reset,
  input         auto_master_out_a_ready,
  output        auto_master_out_a_valid,
  output [2:0]  auto_master_out_a_bits_opcode,
  output [2:0]  auto_master_out_a_bits_param,
  output [3:0]  auto_master_out_a_bits_size,
  output        auto_master_out_a_bits_source,
  output [31:0] auto_master_out_a_bits_address,
  output [7:0]  auto_master_out_a_bits_mask,
  output [63:0] auto_master_out_a_bits_data,
  output        auto_master_out_a_bits_corrupt,
  output        auto_master_out_d_ready,
  input         auto_master_out_d_valid,
  input  [2:0]  auto_master_out_d_bits_opcode,
  input  [1:0]  auto_master_out_d_bits_param,
  input  [3:0]  auto_master_out_d_bits_size,
  input         auto_master_out_d_bits_source,
  input  [1:0]  auto_master_out_d_bits_sink,
  input         auto_master_out_d_bits_denied,
  input  [63:0] auto_master_out_d_bits_data,
  input         auto_master_out_d_bits_corrupt,
  output        io_req_ready,
  input         io_req_valid,
  input  [38:0] io_req_bits_addr,
  input  [31:0] io_s1_paddr,
  input         io_s1_kill,
  input         io_s2_kill,
  input         io_s2_prefetch,
  output        io_resp_valid,
  output [63:0] io_resp_bits_data,
  output        io_resp_bits_replay,
  output        io_resp_bits_ae,
  input         io_invalidate,
  output        io_perf_acquire
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_9;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_15;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_21;
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
  reg [31:0] _RAND_24;
  reg [255:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [63:0] _RAND_34;
  reg [63:0] _RAND_35;
  reg [63:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
`endif // RANDOMIZE_REG_INIT
  wire  prng_clock; // @[PRNG.scala 82:22]
  wire  prng_reset; // @[PRNG.scala 82:22]
  wire  prng_io_seed_valid; // @[PRNG.scala 82:22]
  wire  prng_io_seed_bits_0; // @[PRNG.scala 82:22]
  wire  prng_io_seed_bits_1; // @[PRNG.scala 82:22]
  wire  prng_io_seed_bits_2; // @[PRNG.scala 82:22]
  wire  prng_io_seed_bits_3; // @[PRNG.scala 82:22]
  wire  prng_io_seed_bits_4; // @[PRNG.scala 82:22]
  wire  prng_io_seed_bits_5; // @[PRNG.scala 82:22]
  wire  prng_io_seed_bits_6; // @[PRNG.scala 82:22]
  wire  prng_io_seed_bits_7; // @[PRNG.scala 82:22]
  wire  prng_io_seed_bits_8; // @[PRNG.scala 82:22]
  wire  prng_io_seed_bits_9; // @[PRNG.scala 82:22]
  wire  prng_io_seed_bits_10; // @[PRNG.scala 82:22]
  wire  prng_io_seed_bits_11; // @[PRNG.scala 82:22]
  wire  prng_io_seed_bits_12; // @[PRNG.scala 82:22]
  wire  prng_io_seed_bits_13; // @[PRNG.scala 82:22]
  wire  prng_io_seed_bits_14; // @[PRNG.scala 82:22]
  wire  prng_io_seed_bits_15; // @[PRNG.scala 82:22]
  wire  prng_io_increment; // @[PRNG.scala 82:22]
  wire  prng_io_out_0; // @[PRNG.scala 82:22]
  wire  prng_io_out_1; // @[PRNG.scala 82:22]
  wire  prng_io_out_2; // @[PRNG.scala 82:22]
  wire  prng_io_out_3; // @[PRNG.scala 82:22]
  wire  prng_io_out_4; // @[PRNG.scala 82:22]
  wire  prng_io_out_5; // @[PRNG.scala 82:22]
  wire  prng_io_out_6; // @[PRNG.scala 82:22]
  wire  prng_io_out_7; // @[PRNG.scala 82:22]
  wire  prng_io_out_8; // @[PRNG.scala 82:22]
  wire  prng_io_out_9; // @[PRNG.scala 82:22]
  wire  prng_io_out_10; // @[PRNG.scala 82:22]
  wire  prng_io_out_11; // @[PRNG.scala 82:22]
  wire  prng_io_out_12; // @[PRNG.scala 82:22]
  wire  prng_io_out_13; // @[PRNG.scala 82:22]
  wire  prng_io_out_14; // @[PRNG.scala 82:22]
  wire  prng_io_out_15; // @[PRNG.scala 82:22]
  reg [19:0] tag_array_0 [0:63]; // @[icache.scala 180:30]
  wire [19:0] tag_array_0_tag_rdata_data; // @[icache.scala 180:30]
  wire [5:0] tag_array_0_tag_rdata_addr; // @[icache.scala 180:30]
  wire [19:0] tag_array_0_MPORT_data; // @[icache.scala 180:30]
  wire [5:0] tag_array_0_MPORT_addr; // @[icache.scala 180:30]
  wire  tag_array_0_MPORT_mask; // @[icache.scala 180:30]
  wire  tag_array_0_MPORT_en; // @[icache.scala 180:30]
  reg  tag_array_0_tag_rdata_en_pipe_0;
  reg [5:0] tag_array_0_tag_rdata_addr_pipe_0;
  reg [19:0] tag_array_1 [0:63]; // @[icache.scala 180:30]
  wire [19:0] tag_array_1_tag_rdata_data; // @[icache.scala 180:30]
  wire [5:0] tag_array_1_tag_rdata_addr; // @[icache.scala 180:30]
  wire [19:0] tag_array_1_MPORT_data; // @[icache.scala 180:30]
  wire [5:0] tag_array_1_MPORT_addr; // @[icache.scala 180:30]
  wire  tag_array_1_MPORT_mask; // @[icache.scala 180:30]
  wire  tag_array_1_MPORT_en; // @[icache.scala 180:30]
  reg  tag_array_1_tag_rdata_en_pipe_0;
  reg [5:0] tag_array_1_tag_rdata_addr_pipe_0;
  reg [19:0] tag_array_2 [0:63]; // @[icache.scala 180:30]
  wire [19:0] tag_array_2_tag_rdata_data; // @[icache.scala 180:30]
  wire [5:0] tag_array_2_tag_rdata_addr; // @[icache.scala 180:30]
  wire [19:0] tag_array_2_MPORT_data; // @[icache.scala 180:30]
  wire [5:0] tag_array_2_MPORT_addr; // @[icache.scala 180:30]
  wire  tag_array_2_MPORT_mask; // @[icache.scala 180:30]
  wire  tag_array_2_MPORT_en; // @[icache.scala 180:30]
  reg  tag_array_2_tag_rdata_en_pipe_0;
  reg [5:0] tag_array_2_tag_rdata_addr_pipe_0;
  reg [19:0] tag_array_3 [0:63]; // @[icache.scala 180:30]
  wire [19:0] tag_array_3_tag_rdata_data; // @[icache.scala 180:30]
  wire [5:0] tag_array_3_tag_rdata_addr; // @[icache.scala 180:30]
  wire [19:0] tag_array_3_MPORT_data; // @[icache.scala 180:30]
  wire [5:0] tag_array_3_MPORT_addr; // @[icache.scala 180:30]
  wire  tag_array_3_MPORT_mask; // @[icache.scala 180:30]
  wire  tag_array_3_MPORT_en; // @[icache.scala 180:30]
  reg  tag_array_3_tag_rdata_en_pipe_0;
  reg [5:0] tag_array_3_tag_rdata_addr_pipe_0;
  reg [63:0] dataArrayWay_0 [0:511]; // @[DescribedSRAM.scala 19:26]
  wire [63:0] dataArrayWay_0_MPORT_2_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] dataArrayWay_0_MPORT_2_addr; // @[DescribedSRAM.scala 19:26]
  wire [63:0] dataArrayWay_0_MPORT_1_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] dataArrayWay_0_MPORT_1_addr; // @[DescribedSRAM.scala 19:26]
  wire  dataArrayWay_0_MPORT_1_mask; // @[DescribedSRAM.scala 19:26]
  wire  dataArrayWay_0_MPORT_1_en; // @[DescribedSRAM.scala 19:26]
  reg  dataArrayWay_0_MPORT_2_en_pipe_0;
  reg [8:0] dataArrayWay_0_MPORT_2_addr_pipe_0;
  reg [63:0] dataArrayWay_1 [0:511]; // @[DescribedSRAM.scala 19:26]
  wire [63:0] dataArrayWay_1_MPORT_4_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] dataArrayWay_1_MPORT_4_addr; // @[DescribedSRAM.scala 19:26]
  wire [63:0] dataArrayWay_1_MPORT_3_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] dataArrayWay_1_MPORT_3_addr; // @[DescribedSRAM.scala 19:26]
  wire  dataArrayWay_1_MPORT_3_mask; // @[DescribedSRAM.scala 19:26]
  wire  dataArrayWay_1_MPORT_3_en; // @[DescribedSRAM.scala 19:26]
  reg  dataArrayWay_1_MPORT_4_en_pipe_0;
  reg [8:0] dataArrayWay_1_MPORT_4_addr_pipe_0;
  reg [63:0] dataArrayWay_2 [0:511]; // @[DescribedSRAM.scala 19:26]
  wire [63:0] dataArrayWay_2_MPORT_6_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] dataArrayWay_2_MPORT_6_addr; // @[DescribedSRAM.scala 19:26]
  wire [63:0] dataArrayWay_2_MPORT_5_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] dataArrayWay_2_MPORT_5_addr; // @[DescribedSRAM.scala 19:26]
  wire  dataArrayWay_2_MPORT_5_mask; // @[DescribedSRAM.scala 19:26]
  wire  dataArrayWay_2_MPORT_5_en; // @[DescribedSRAM.scala 19:26]
  reg  dataArrayWay_2_MPORT_6_en_pipe_0;
  reg [8:0] dataArrayWay_2_MPORT_6_addr_pipe_0;
  reg [63:0] dataArrayWay_3 [0:511]; // @[DescribedSRAM.scala 19:26]
  wire [63:0] dataArrayWay_3_MPORT_8_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] dataArrayWay_3_MPORT_8_addr; // @[DescribedSRAM.scala 19:26]
  wire [63:0] dataArrayWay_3_MPORT_7_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] dataArrayWay_3_MPORT_7_addr; // @[DescribedSRAM.scala 19:26]
  wire  dataArrayWay_3_MPORT_7_mask; // @[DescribedSRAM.scala 19:26]
  wire  dataArrayWay_3_MPORT_7_en; // @[DescribedSRAM.scala 19:26]
  reg  dataArrayWay_3_MPORT_8_en_pipe_0;
  reg [8:0] dataArrayWay_3_MPORT_8_addr_pipe_0;
  wire  s0_valid = io_req_ready & io_req_valid; // @[Decoupled.scala 40:37]
  reg  s1_valid; // @[icache.scala 155:25]
  reg [255:0] vb_array; // @[icache.scala 186:25]
  wire [5:0] s1_idx = io_s1_paddr[11:6]; // @[icache.scala 200:29]
  wire [6:0] _T_32 = {1'h0,s1_idx}; // @[Cat.scala 30:58]
  wire [255:0] _T_33 = vb_array >> _T_32; // @[icache.scala 202:25]
  wire  s1_vb = _T_33[0]; // @[icache.scala 202:25]
  wire [19:0] s1_tag = io_s1_paddr[31:12]; // @[icache.scala 201:29]
  wire  s1_tag_hit_0 = s1_vb & tag_array_0_tag_rdata_data == s1_tag; // @[icache.scala 204:28]
  wire [6:0] _T_36 = {1'h1,s1_idx}; // @[Cat.scala 30:58]
  wire [255:0] _T_37 = vb_array >> _T_36; // @[icache.scala 202:25]
  wire  s1_vb_1 = _T_37[0]; // @[icache.scala 202:25]
  wire  s1_tag_hit_1 = s1_vb_1 & tag_array_1_tag_rdata_data == s1_tag; // @[icache.scala 204:28]
  wire [7:0] _T_40 = {2'h2,s1_idx}; // @[Cat.scala 30:58]
  wire [255:0] _T_41 = vb_array >> _T_40; // @[icache.scala 202:25]
  wire  s1_vb_2 = _T_41[0]; // @[icache.scala 202:25]
  wire  s1_tag_hit_2 = s1_vb_2 & tag_array_2_tag_rdata_data == s1_tag; // @[icache.scala 204:28]
  wire [7:0] _T_44 = {2'h3,s1_idx}; // @[Cat.scala 30:58]
  wire [255:0] _T_45 = vb_array >> _T_44; // @[icache.scala 202:25]
  wire  s1_vb_3 = _T_45[0]; // @[icache.scala 202:25]
  wire  s1_tag_hit_3 = s1_vb_3 & tag_array_3_tag_rdata_data == s1_tag; // @[icache.scala 204:28]
  reg  s2_valid; // @[icache.scala 158:25]
  reg  s2_hit; // @[icache.scala 159:23]
  reg  invalidated; // @[icache.scala 162:24]
  reg  refill_valid; // @[icache.scala 163:29]
  reg  REG; // @[icache.scala 165:48]
  wire  s2_miss = s2_valid & ~s2_hit & ~REG; // @[icache.scala 165:37]
  wire  _bundleOut_0_a_valid_T = ~refill_valid; // @[icache.scala 351:32]
  wire  tl_out_a_valid = s2_miss & ~refill_valid & ~io_s2_kill; // @[icache.scala 351:46]
  wire  refill_fire = auto_master_out_a_ready & tl_out_a_valid; // @[Decoupled.scala 40:37]
  wire  _T_9 = s1_valid & ~(refill_valid | s2_miss); // @[icache.scala 166:54]
  reg [31:0] refill_paddr; // @[Reg.scala 15:16]
  wire [5:0] refill_idx = refill_paddr[11:6]; // @[icache.scala 168:32]
  wire  opdata = auto_master_out_d_bits_opcode[0]; // @[Edges.scala 105:36]
  wire  refill_one_beat = auto_master_out_d_valid & opdata; // @[icache.scala 169:41]
  wire [26:0] _beats1_decode_T_1 = 27'hfff << auto_master_out_d_bits_size; // @[package.scala 234:77]
  wire [11:0] _beats1_decode_T_3 = ~_beats1_decode_T_1[11:0]; // @[package.scala 234:46]
  wire [8:0] beats1_decode = _beats1_decode_T_3[11:3]; // @[Edges.scala 219:59]
  wire [8:0] beats1 = opdata ? beats1_decode : 9'h0; // @[Edges.scala 220:14]
  reg [8:0] counter; // @[Edges.scala 228:27]
  wire [8:0] counter1 = counter - 9'h1; // @[Edges.scala 229:28]
  wire  first = counter == 9'h0; // @[Edges.scala 230:25]
  wire  last = counter == 9'h1 | beats1 == 9'h0; // @[Edges.scala 231:37]
  wire  d_done = last & auto_master_out_d_valid; // @[Edges.scala 232:22]
  wire [8:0] _count_T = ~counter1; // @[Edges.scala 233:27]
  wire [8:0] refill_cnt = beats1 & _count_T; // @[Edges.scala 233:25]
  wire  refill_done = refill_one_beat & d_done; // @[icache.scala 174:37]
  wire [7:0] lo = {prng_io_out_7,prng_io_out_6,prng_io_out_5,prng_io_out_4,prng_io_out_3,prng_io_out_2,prng_io_out_1,
    prng_io_out_0}; // @[PRNG.scala 86:17]
  wire [15:0] _T_13 = {prng_io_out_15,prng_io_out_14,prng_io_out_13,prng_io_out_12,prng_io_out_11,prng_io_out_10,
    prng_io_out_9,prng_io_out_8,lo}; // @[PRNG.scala 86:17]
  wire [1:0] repl_way = _T_13[1:0]; // @[icache.scala 178:58]
  wire  _T_15 = ~refill_done; // @[icache.scala 181:71]
  wire  _T_19 = repl_way == 2'h0; // @[icache.scala 183:100]
  wire  _T_20 = repl_way == 2'h1; // @[icache.scala 183:100]
  wire  _T_21 = repl_way == 2'h2; // @[icache.scala 183:100]
  wire  _T_22 = repl_way == 2'h3; // @[icache.scala 183:100]
  wire [7:0] _T_23 = {repl_way,refill_idx}; // @[Cat.scala 30:58]
  wire  _T_24 = ~invalidated; // @[icache.scala 188:75]
  wire [255:0] _T_26 = 256'h1 << _T_23; // @[icache.scala 188:32]
  wire [255:0] _T_27 = vb_array | _T_26; // @[icache.scala 188:32]
  wire [255:0] _T_28 = ~vb_array; // @[icache.scala 188:32]
  wire [255:0] _T_29 = _T_28 | _T_26; // @[icache.scala 188:32]
  wire [255:0] _T_30 = ~_T_29; // @[icache.scala 188:32]
  wire  _GEN_27 = io_invalidate | invalidated; // @[icache.scala 191:24 icache.scala 193:17 icache.scala 162:24]
  wire [1:0] _T_48 = s1_tag_hit_0 + s1_tag_hit_1; // @[Bitwise.scala 47:55]
  wire [1:0] _T_50 = s1_tag_hit_2 + s1_tag_hit_3; // @[Bitwise.scala 47:55]
  wire [2:0] _T_52 = _T_48 + _T_50; // @[Bitwise.scala 47:55]
  wire  _T_61 = refill_one_beat & _T_24; // @[icache.scala 248:34]
  wire  wen = refill_one_beat & _T_24 & _T_19; // @[icache.scala 248:51]
  wire [8:0] _T_63 = {refill_idx, 3'h0}; // @[icache.scala 250:54]
  wire [8:0] _T_64 = _T_63 | refill_cnt; // @[icache.scala 250:81]
  wire  _T_66 = ~wen; // @[icache.scala 258:55]
  reg [63:0] REG_1; // @[icache.scala 258:30]
  wire  wen_1 = refill_one_beat & _T_24 & _T_20; // @[icache.scala 248:51]
  wire  _T_76 = ~wen_1; // @[icache.scala 258:55]
  reg [63:0] REG_2; // @[icache.scala 258:30]
  wire  wen_2 = refill_one_beat & _T_24 & _T_21; // @[icache.scala 248:51]
  wire  _T_86 = ~wen_2; // @[icache.scala 258:55]
  reg [63:0] REG_3; // @[icache.scala 258:30]
  wire  wen_3 = refill_one_beat & _T_24 & _T_22; // @[icache.scala 248:51]
  wire  _T_96 = ~wen_3; // @[icache.scala 258:55]
  reg [63:0] REG_4; // @[icache.scala 258:30]
  reg  s2_tag_hit_0; // @[icache.scala 329:27]
  reg  s2_tag_hit_1; // @[icache.scala 329:27]
  reg  s2_tag_hit_2; // @[icache.scala 329:27]
  reg  s2_tag_hit_3; // @[icache.scala 329:27]
  wire [63:0] _T_102 = s2_tag_hit_0 ? REG_1 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_103 = s2_tag_hit_1 ? REG_2 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_104 = s2_tag_hit_2 ? REG_3 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_105 = s2_tag_hit_3 ? REG_4 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_106 = _T_102 | _T_103; // @[Mux.scala 27:72]
  wire [63:0] _T_107 = _T_106 | _T_104; // @[Mux.scala 27:72]
  wire  _GEN_65 = refill_fire | refill_valid; // @[icache.scala 363:22 icache.scala 363:37 icache.scala 163:29]
  MaxPeriodFibonacciLFSR prng ( // @[PRNG.scala 82:22]
    .clock(prng_clock),
    .reset(prng_reset),
    .io_seed_valid(prng_io_seed_valid),
    .io_seed_bits_0(prng_io_seed_bits_0),
    .io_seed_bits_1(prng_io_seed_bits_1),
    .io_seed_bits_2(prng_io_seed_bits_2),
    .io_seed_bits_3(prng_io_seed_bits_3),
    .io_seed_bits_4(prng_io_seed_bits_4),
    .io_seed_bits_5(prng_io_seed_bits_5),
    .io_seed_bits_6(prng_io_seed_bits_6),
    .io_seed_bits_7(prng_io_seed_bits_7),
    .io_seed_bits_8(prng_io_seed_bits_8),
    .io_seed_bits_9(prng_io_seed_bits_9),
    .io_seed_bits_10(prng_io_seed_bits_10),
    .io_seed_bits_11(prng_io_seed_bits_11),
    .io_seed_bits_12(prng_io_seed_bits_12),
    .io_seed_bits_13(prng_io_seed_bits_13),
    .io_seed_bits_14(prng_io_seed_bits_14),
    .io_seed_bits_15(prng_io_seed_bits_15),
    .io_increment(prng_io_increment),
    .io_out_0(prng_io_out_0),
    .io_out_1(prng_io_out_1),
    .io_out_2(prng_io_out_2),
    .io_out_3(prng_io_out_3),
    .io_out_4(prng_io_out_4),
    .io_out_5(prng_io_out_5),
    .io_out_6(prng_io_out_6),
    .io_out_7(prng_io_out_7),
    .io_out_8(prng_io_out_8),
    .io_out_9(prng_io_out_9),
    .io_out_10(prng_io_out_10),
    .io_out_11(prng_io_out_11),
    .io_out_12(prng_io_out_12),
    .io_out_13(prng_io_out_13),
    .io_out_14(prng_io_out_14),
    .io_out_15(prng_io_out_15)
  );
  assign tag_array_0_tag_rdata_addr = tag_array_0_tag_rdata_addr_pipe_0;
  assign tag_array_0_tag_rdata_data = tag_array_0[tag_array_0_tag_rdata_addr]; // @[icache.scala 180:30]
  assign tag_array_0_MPORT_data = refill_paddr[31:12];
  assign tag_array_0_MPORT_addr = refill_paddr[11:6];
  assign tag_array_0_MPORT_mask = repl_way == 2'h0;
  assign tag_array_0_MPORT_en = refill_one_beat & d_done;
  assign tag_array_1_tag_rdata_addr = tag_array_1_tag_rdata_addr_pipe_0;
  assign tag_array_1_tag_rdata_data = tag_array_1[tag_array_1_tag_rdata_addr]; // @[icache.scala 180:30]
  assign tag_array_1_MPORT_data = refill_paddr[31:12];
  assign tag_array_1_MPORT_addr = refill_paddr[11:6];
  assign tag_array_1_MPORT_mask = repl_way == 2'h1;
  assign tag_array_1_MPORT_en = refill_one_beat & d_done;
  assign tag_array_2_tag_rdata_addr = tag_array_2_tag_rdata_addr_pipe_0;
  assign tag_array_2_tag_rdata_data = tag_array_2[tag_array_2_tag_rdata_addr]; // @[icache.scala 180:30]
  assign tag_array_2_MPORT_data = refill_paddr[31:12];
  assign tag_array_2_MPORT_addr = refill_paddr[11:6];
  assign tag_array_2_MPORT_mask = repl_way == 2'h2;
  assign tag_array_2_MPORT_en = refill_one_beat & d_done;
  assign tag_array_3_tag_rdata_addr = tag_array_3_tag_rdata_addr_pipe_0;
  assign tag_array_3_tag_rdata_data = tag_array_3[tag_array_3_tag_rdata_addr]; // @[icache.scala 180:30]
  assign tag_array_3_MPORT_data = refill_paddr[31:12];
  assign tag_array_3_MPORT_addr = refill_paddr[11:6];
  assign tag_array_3_MPORT_mask = repl_way == 2'h3;
  assign tag_array_3_MPORT_en = refill_one_beat & d_done;
  assign dataArrayWay_0_MPORT_2_addr = dataArrayWay_0_MPORT_2_addr_pipe_0;
  assign dataArrayWay_0_MPORT_2_data = dataArrayWay_0[dataArrayWay_0_MPORT_2_addr]; // @[DescribedSRAM.scala 19:26]
  assign dataArrayWay_0_MPORT_1_data = auto_master_out_d_bits_data;
  assign dataArrayWay_0_MPORT_1_addr = refill_one_beat ? _T_64 : io_req_bits_addr[11:3];
  assign dataArrayWay_0_MPORT_1_mask = 1'h1;
  assign dataArrayWay_0_MPORT_1_en = _T_61 & _T_19;
  assign dataArrayWay_1_MPORT_4_addr = dataArrayWay_1_MPORT_4_addr_pipe_0;
  assign dataArrayWay_1_MPORT_4_data = dataArrayWay_1[dataArrayWay_1_MPORT_4_addr]; // @[DescribedSRAM.scala 19:26]
  assign dataArrayWay_1_MPORT_3_data = auto_master_out_d_bits_data;
  assign dataArrayWay_1_MPORT_3_addr = refill_one_beat ? _T_64 : io_req_bits_addr[11:3];
  assign dataArrayWay_1_MPORT_3_mask = 1'h1;
  assign dataArrayWay_1_MPORT_3_en = _T_61 & _T_20;
  assign dataArrayWay_2_MPORT_6_addr = dataArrayWay_2_MPORT_6_addr_pipe_0;
  assign dataArrayWay_2_MPORT_6_data = dataArrayWay_2[dataArrayWay_2_MPORT_6_addr]; // @[DescribedSRAM.scala 19:26]
  assign dataArrayWay_2_MPORT_5_data = auto_master_out_d_bits_data;
  assign dataArrayWay_2_MPORT_5_addr = refill_one_beat ? _T_64 : io_req_bits_addr[11:3];
  assign dataArrayWay_2_MPORT_5_mask = 1'h1;
  assign dataArrayWay_2_MPORT_5_en = _T_61 & _T_21;
  assign dataArrayWay_3_MPORT_8_addr = dataArrayWay_3_MPORT_8_addr_pipe_0;
  assign dataArrayWay_3_MPORT_8_data = dataArrayWay_3[dataArrayWay_3_MPORT_8_addr]; // @[DescribedSRAM.scala 19:26]
  assign dataArrayWay_3_MPORT_7_data = auto_master_out_d_bits_data;
  assign dataArrayWay_3_MPORT_7_addr = refill_one_beat ? _T_64 : io_req_bits_addr[11:3];
  assign dataArrayWay_3_MPORT_7_mask = 1'h1;
  assign dataArrayWay_3_MPORT_7_en = _T_61 & _T_22;
  assign auto_master_out_a_valid = s2_miss & ~refill_valid & ~io_s2_kill; // @[icache.scala 351:46]
  assign auto_master_out_a_bits_opcode = 3'h4; // @[Edges.scala 447:17 Edges.scala 448:15]
  assign auto_master_out_a_bits_param = 3'h0; // @[Edges.scala 447:17 Edges.scala 449:15]
  assign auto_master_out_a_bits_size = 4'h6; // @[Edges.scala 447:17 Edges.scala 450:15]
  assign auto_master_out_a_bits_source = 1'h0; // @[Edges.scala 447:17 Edges.scala 451:15]
  assign auto_master_out_a_bits_address = {refill_paddr[31:6], 6'h0}; // @[icache.scala 354:48]
  assign auto_master_out_a_bits_mask = 8'hff; // @[Cat.scala 30:58]
  assign auto_master_out_a_bits_data = 64'h0; // @[Edges.scala 447:17 Edges.scala 454:15]
  assign auto_master_out_a_bits_corrupt = 1'h0; // @[Edges.scala 447:17 Edges.scala 455:15]
  assign auto_master_out_d_ready = 1'h1; // @[Nodes.scala 1207:84 icache.scala 175:18]
  assign io_req_ready = ~refill_one_beat; // @[icache.scala 171:19]
  assign io_resp_valid = s2_valid & s2_hit; // @[icache.scala 349:29]
  assign io_resp_bits_data = _T_107 | _T_105; // @[Mux.scala 27:72]
  assign io_resp_bits_replay = 1'h0;
  assign io_resp_bits_ae = 1'h0;
  assign io_perf_acquire = auto_master_out_a_ready & tl_out_a_valid; // @[Decoupled.scala 40:37]
  assign prng_clock = clock;
  assign prng_reset = reset;
  assign prng_io_seed_valid = 1'h0; // @[PRNG.scala 83:24]
  assign prng_io_seed_bits_0 = 1'h0;
  assign prng_io_seed_bits_1 = 1'h0;
  assign prng_io_seed_bits_2 = 1'h0;
  assign prng_io_seed_bits_3 = 1'h0;
  assign prng_io_seed_bits_4 = 1'h0;
  assign prng_io_seed_bits_5 = 1'h0;
  assign prng_io_seed_bits_6 = 1'h0;
  assign prng_io_seed_bits_7 = 1'h0;
  assign prng_io_seed_bits_8 = 1'h0;
  assign prng_io_seed_bits_9 = 1'h0;
  assign prng_io_seed_bits_10 = 1'h0;
  assign prng_io_seed_bits_11 = 1'h0;
  assign prng_io_seed_bits_12 = 1'h0;
  assign prng_io_seed_bits_13 = 1'h0;
  assign prng_io_seed_bits_14 = 1'h0;
  assign prng_io_seed_bits_15 = 1'h0;
  assign prng_io_increment = auto_master_out_a_ready & tl_out_a_valid; // @[Decoupled.scala 40:37]
  always @(posedge clock) begin
    if(tag_array_0_MPORT_en & tag_array_0_MPORT_mask) begin
      tag_array_0[tag_array_0_MPORT_addr] <= tag_array_0_MPORT_data; // @[icache.scala 180:30]
    end
    tag_array_0_tag_rdata_en_pipe_0 <= _T_15 & s0_valid;
    if (_T_15 & s0_valid) begin
      tag_array_0_tag_rdata_addr_pipe_0 <= io_req_bits_addr[11:6];
    end
    if(tag_array_1_MPORT_en & tag_array_1_MPORT_mask) begin
      tag_array_1[tag_array_1_MPORT_addr] <= tag_array_1_MPORT_data; // @[icache.scala 180:30]
    end
    tag_array_1_tag_rdata_en_pipe_0 <= _T_15 & s0_valid;
    if (_T_15 & s0_valid) begin
      tag_array_1_tag_rdata_addr_pipe_0 <= io_req_bits_addr[11:6];
    end
    if(tag_array_2_MPORT_en & tag_array_2_MPORT_mask) begin
      tag_array_2[tag_array_2_MPORT_addr] <= tag_array_2_MPORT_data; // @[icache.scala 180:30]
    end
    tag_array_2_tag_rdata_en_pipe_0 <= _T_15 & s0_valid;
    if (_T_15 & s0_valid) begin
      tag_array_2_tag_rdata_addr_pipe_0 <= io_req_bits_addr[11:6];
    end
    if(tag_array_3_MPORT_en & tag_array_3_MPORT_mask) begin
      tag_array_3[tag_array_3_MPORT_addr] <= tag_array_3_MPORT_data; // @[icache.scala 180:30]
    end
    tag_array_3_tag_rdata_en_pipe_0 <= _T_15 & s0_valid;
    if (_T_15 & s0_valid) begin
      tag_array_3_tag_rdata_addr_pipe_0 <= io_req_bits_addr[11:6];
    end
    if(dataArrayWay_0_MPORT_1_en & dataArrayWay_0_MPORT_1_mask) begin
      dataArrayWay_0[dataArrayWay_0_MPORT_1_addr] <= dataArrayWay_0_MPORT_1_data; // @[DescribedSRAM.scala 19:26]
    end
    dataArrayWay_0_MPORT_2_en_pipe_0 <= _T_66 & s0_valid;
    if (_T_66 & s0_valid) begin
      if (refill_one_beat) begin
        dataArrayWay_0_MPORT_2_addr_pipe_0 <= _T_64;
      end else begin
        dataArrayWay_0_MPORT_2_addr_pipe_0 <= io_req_bits_addr[11:3];
      end
    end
    if(dataArrayWay_1_MPORT_3_en & dataArrayWay_1_MPORT_3_mask) begin
      dataArrayWay_1[dataArrayWay_1_MPORT_3_addr] <= dataArrayWay_1_MPORT_3_data; // @[DescribedSRAM.scala 19:26]
    end
    dataArrayWay_1_MPORT_4_en_pipe_0 <= _T_76 & s0_valid;
    if (_T_76 & s0_valid) begin
      if (refill_one_beat) begin
        dataArrayWay_1_MPORT_4_addr_pipe_0 <= _T_64;
      end else begin
        dataArrayWay_1_MPORT_4_addr_pipe_0 <= io_req_bits_addr[11:3];
      end
    end
    if(dataArrayWay_2_MPORT_5_en & dataArrayWay_2_MPORT_5_mask) begin
      dataArrayWay_2[dataArrayWay_2_MPORT_5_addr] <= dataArrayWay_2_MPORT_5_data; // @[DescribedSRAM.scala 19:26]
    end
    dataArrayWay_2_MPORT_6_en_pipe_0 <= _T_86 & s0_valid;
    if (_T_86 & s0_valid) begin
      if (refill_one_beat) begin
        dataArrayWay_2_MPORT_6_addr_pipe_0 <= _T_64;
      end else begin
        dataArrayWay_2_MPORT_6_addr_pipe_0 <= io_req_bits_addr[11:3];
      end
    end
    if(dataArrayWay_3_MPORT_7_en & dataArrayWay_3_MPORT_7_mask) begin
      dataArrayWay_3[dataArrayWay_3_MPORT_7_addr] <= dataArrayWay_3_MPORT_7_data; // @[DescribedSRAM.scala 19:26]
    end
    dataArrayWay_3_MPORT_8_en_pipe_0 <= _T_96 & s0_valid;
    if (_T_96 & s0_valid) begin
      if (refill_one_beat) begin
        dataArrayWay_3_MPORT_8_addr_pipe_0 <= _T_64;
      end else begin
        dataArrayWay_3_MPORT_8_addr_pipe_0 <= io_req_bits_addr[11:3];
      end
    end
    s1_valid <= io_req_ready & io_req_valid; // @[Decoupled.scala 40:37]
    if (reset) begin // @[icache.scala 186:25]
      vb_array <= 256'h0; // @[icache.scala 186:25]
    end else if (io_invalidate) begin // @[icache.scala 191:24]
      vb_array <= 256'h0; // @[icache.scala 192:14]
    end else if (refill_one_beat) begin // @[icache.scala 187:26]
      if (refill_done & ~invalidated) begin // @[icache.scala 188:32]
        vb_array <= _T_27;
      end else begin
        vb_array <= _T_30;
      end
    end
    s2_valid <= s1_valid & ~io_s1_kill; // @[icache.scala 158:35]
    s2_hit <= s1_tag_hit_0 | s1_tag_hit_1 | s1_tag_hit_2 | s1_tag_hit_3; // @[icache.scala 157:35]
    if (_bundleOut_0_a_valid_T) begin // @[icache.scala 362:24]
      invalidated <= 1'h0; // @[icache.scala 362:38]
    end else begin
      invalidated <= _GEN_27;
    end
    if (reset) begin // @[icache.scala 163:29]
      refill_valid <= 1'h0; // @[icache.scala 163:29]
    end else if (refill_done) begin // @[icache.scala 364:22]
      refill_valid <= 1'h0; // @[icache.scala 364:37]
    end else begin
      refill_valid <= _GEN_65;
    end
    REG <= refill_valid; // @[icache.scala 165:48]
    if (_T_9) begin // @[Reg.scala 16:19]
      refill_paddr <= io_s1_paddr; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Edges.scala 228:27]
      counter <= 9'h0; // @[Edges.scala 228:27]
    end else if (auto_master_out_d_valid) begin // @[Edges.scala 234:17]
      if (first) begin // @[Edges.scala 235:21]
        if (opdata) begin // @[Edges.scala 220:14]
          counter <= beats1_decode;
        end else begin
          counter <= 9'h0;
        end
      end else begin
        counter <= counter1;
      end
    end
    REG_1 <= dataArrayWay_0_MPORT_2_data; // @[icache.scala 258:30]
    REG_2 <= dataArrayWay_1_MPORT_4_data; // @[icache.scala 258:30]
    REG_3 <= dataArrayWay_2_MPORT_6_data; // @[icache.scala 258:30]
    REG_4 <= dataArrayWay_3_MPORT_8_data; // @[icache.scala 258:30]
    s2_tag_hit_0 <= s1_vb & tag_array_0_tag_rdata_data == s1_tag; // @[icache.scala 204:28]
    s2_tag_hit_1 <= s1_vb_1 & tag_array_1_tag_rdata_data == s1_tag; // @[icache.scala 204:28]
    s2_tag_hit_2 <= s1_vb_2 & tag_array_2_tag_rdata_data == s1_tag; // @[icache.scala 204:28]
    s2_tag_hit_3 <= s1_vb_3 & tag_array_3_tag_rdata_data == s1_tag; // @[icache.scala 204:28]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_T_52 <= 3'h1 | ~s1_valid | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at icache.scala:206 assert(PopCount(s1_tag_hit) <= 1.U || !s1_valid)\n"); // @[icache.scala 206:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_52 <= 3'h1 | ~s1_valid | reset)) begin
          $fatal; // @[icache.scala 206:9]
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
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    tag_array_0[initvar] = _RAND_0[19:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    tag_array_1[initvar] = _RAND_3[19:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    tag_array_2[initvar] = _RAND_6[19:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    tag_array_3[initvar] = _RAND_9[19:0];
  _RAND_12 = {2{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    dataArrayWay_0[initvar] = _RAND_12[63:0];
  _RAND_15 = {2{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    dataArrayWay_1[initvar] = _RAND_15[63:0];
  _RAND_18 = {2{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    dataArrayWay_2[initvar] = _RAND_18[63:0];
  _RAND_21 = {2{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    dataArrayWay_3[initvar] = _RAND_21[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  tag_array_0_tag_rdata_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  tag_array_0_tag_rdata_addr_pipe_0 = _RAND_2[5:0];
  _RAND_4 = {1{`RANDOM}};
  tag_array_1_tag_rdata_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  tag_array_1_tag_rdata_addr_pipe_0 = _RAND_5[5:0];
  _RAND_7 = {1{`RANDOM}};
  tag_array_2_tag_rdata_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  tag_array_2_tag_rdata_addr_pipe_0 = _RAND_8[5:0];
  _RAND_10 = {1{`RANDOM}};
  tag_array_3_tag_rdata_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  tag_array_3_tag_rdata_addr_pipe_0 = _RAND_11[5:0];
  _RAND_13 = {1{`RANDOM}};
  dataArrayWay_0_MPORT_2_en_pipe_0 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  dataArrayWay_0_MPORT_2_addr_pipe_0 = _RAND_14[8:0];
  _RAND_16 = {1{`RANDOM}};
  dataArrayWay_1_MPORT_4_en_pipe_0 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  dataArrayWay_1_MPORT_4_addr_pipe_0 = _RAND_17[8:0];
  _RAND_19 = {1{`RANDOM}};
  dataArrayWay_2_MPORT_6_en_pipe_0 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  dataArrayWay_2_MPORT_6_addr_pipe_0 = _RAND_20[8:0];
  _RAND_22 = {1{`RANDOM}};
  dataArrayWay_3_MPORT_8_en_pipe_0 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  dataArrayWay_3_MPORT_8_addr_pipe_0 = _RAND_23[8:0];
  _RAND_24 = {1{`RANDOM}};
  s1_valid = _RAND_24[0:0];
  _RAND_25 = {8{`RANDOM}};
  vb_array = _RAND_25[255:0];
  _RAND_26 = {1{`RANDOM}};
  s2_valid = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  s2_hit = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  invalidated = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  refill_valid = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  REG = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  refill_paddr = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  counter = _RAND_32[8:0];
  _RAND_33 = {2{`RANDOM}};
  REG_1 = _RAND_33[63:0];
  _RAND_34 = {2{`RANDOM}};
  REG_2 = _RAND_34[63:0];
  _RAND_35 = {2{`RANDOM}};
  REG_3 = _RAND_35[63:0];
  _RAND_36 = {2{`RANDOM}};
  REG_4 = _RAND_36[63:0];
  _RAND_37 = {1{`RANDOM}};
  s2_tag_hit_0 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  s2_tag_hit_1 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  s2_tag_hit_2 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  s2_tag_hit_3 = _RAND_40[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
