module TLRAM(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [1:0]  auto_in_a_bits_size,
  input  [7:0]  auto_in_a_bits_source,
  input  [28:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [1:0]  auto_in_d_bits_size,
  output [7:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_sink,
  output        auto_in_d_bits_denied,
  output [63:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt
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
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock; // @[Nodes.scala 24:25]
  wire  monitor_reset; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_param; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_a_bits_size; // @[Nodes.scala 24:25]
  wire [7:0] monitor_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [28:0] monitor_io_in_a_bits_address; // @[Nodes.scala 24:25]
  wire [7:0] monitor_io_in_a_bits_mask; // @[Nodes.scala 24:25]
  wire [63:0] monitor_io_in_a_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_param; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_size; // @[Nodes.scala 24:25]
  wire [7:0] monitor_io_in_d_bits_source; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_sink; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_denied; // @[Nodes.scala 24:25]
  wire [63:0] monitor_io_in_d_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_corrupt; // @[Nodes.scala 24:25]
  reg [7:0] mem_0 [0:511]; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_0_MPORT_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] mem_0_MPORT_addr; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_0_MPORT_1_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] mem_0_MPORT_1_addr; // @[DescribedSRAM.scala 19:26]
  wire  mem_0_MPORT_1_mask; // @[DescribedSRAM.scala 19:26]
  wire  mem_0_MPORT_1_en; // @[DescribedSRAM.scala 19:26]
  reg  mem_0_MPORT_en_pipe_0;
  reg [8:0] mem_0_MPORT_addr_pipe_0;
  reg [7:0] mem_1 [0:511]; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_1_MPORT_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] mem_1_MPORT_addr; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_1_MPORT_1_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] mem_1_MPORT_1_addr; // @[DescribedSRAM.scala 19:26]
  wire  mem_1_MPORT_1_mask; // @[DescribedSRAM.scala 19:26]
  wire  mem_1_MPORT_1_en; // @[DescribedSRAM.scala 19:26]
  reg  mem_1_MPORT_en_pipe_0;
  reg [8:0] mem_1_MPORT_addr_pipe_0;
  reg [7:0] mem_2 [0:511]; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_2_MPORT_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] mem_2_MPORT_addr; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_2_MPORT_1_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] mem_2_MPORT_1_addr; // @[DescribedSRAM.scala 19:26]
  wire  mem_2_MPORT_1_mask; // @[DescribedSRAM.scala 19:26]
  wire  mem_2_MPORT_1_en; // @[DescribedSRAM.scala 19:26]
  reg  mem_2_MPORT_en_pipe_0;
  reg [8:0] mem_2_MPORT_addr_pipe_0;
  reg [7:0] mem_3 [0:511]; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_3_MPORT_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] mem_3_MPORT_addr; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_3_MPORT_1_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] mem_3_MPORT_1_addr; // @[DescribedSRAM.scala 19:26]
  wire  mem_3_MPORT_1_mask; // @[DescribedSRAM.scala 19:26]
  wire  mem_3_MPORT_1_en; // @[DescribedSRAM.scala 19:26]
  reg  mem_3_MPORT_en_pipe_0;
  reg [8:0] mem_3_MPORT_addr_pipe_0;
  reg [7:0] mem_4 [0:511]; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_4_MPORT_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] mem_4_MPORT_addr; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_4_MPORT_1_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] mem_4_MPORT_1_addr; // @[DescribedSRAM.scala 19:26]
  wire  mem_4_MPORT_1_mask; // @[DescribedSRAM.scala 19:26]
  wire  mem_4_MPORT_1_en; // @[DescribedSRAM.scala 19:26]
  reg  mem_4_MPORT_en_pipe_0;
  reg [8:0] mem_4_MPORT_addr_pipe_0;
  reg [7:0] mem_5 [0:511]; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_5_MPORT_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] mem_5_MPORT_addr; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_5_MPORT_1_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] mem_5_MPORT_1_addr; // @[DescribedSRAM.scala 19:26]
  wire  mem_5_MPORT_1_mask; // @[DescribedSRAM.scala 19:26]
  wire  mem_5_MPORT_1_en; // @[DescribedSRAM.scala 19:26]
  reg  mem_5_MPORT_en_pipe_0;
  reg [8:0] mem_5_MPORT_addr_pipe_0;
  reg [7:0] mem_6 [0:511]; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_6_MPORT_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] mem_6_MPORT_addr; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_6_MPORT_1_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] mem_6_MPORT_1_addr; // @[DescribedSRAM.scala 19:26]
  wire  mem_6_MPORT_1_mask; // @[DescribedSRAM.scala 19:26]
  wire  mem_6_MPORT_1_en; // @[DescribedSRAM.scala 19:26]
  reg  mem_6_MPORT_en_pipe_0;
  reg [8:0] mem_6_MPORT_addr_pipe_0;
  reg [7:0] mem_7 [0:511]; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_7_MPORT_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] mem_7_MPORT_addr; // @[DescribedSRAM.scala 19:26]
  wire [7:0] mem_7_MPORT_1_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] mem_7_MPORT_1_addr; // @[DescribedSRAM.scala 19:26]
  wire  mem_7_MPORT_1_mask; // @[DescribedSRAM.scala 19:26]
  wire  mem_7_MPORT_1_en; // @[DescribedSRAM.scala 19:26]
  reg  mem_7_MPORT_en_pipe_0;
  reg [8:0] mem_7_MPORT_addr_pipe_0;
  reg  r_full; // @[SRAM.scala 134:30]
  reg [1:0] r_size; // @[SRAM.scala 137:26]
  reg [7:0] r_source; // @[SRAM.scala 138:26]
  reg  r_read; // @[SRAM.scala 139:26]
  reg  REG; // @[SRAM.scala 321:58]
  reg [7:0] r_1; // @[Reg.scala 15:16]
  wire [7:0] r_raw_data_1 = REG ? mem_1_MPORT_data : r_1; // @[package.scala 79:42]
  reg [7:0] r_0; // @[Reg.scala 15:16]
  wire [7:0] r_raw_data_0 = REG ? mem_0_MPORT_data : r_0; // @[package.scala 79:42]
  reg [7:0] r_3; // @[Reg.scala 15:16]
  wire [7:0] r_raw_data_3 = REG ? mem_3_MPORT_data : r_3; // @[package.scala 79:42]
  reg [7:0] r_2; // @[Reg.scala 15:16]
  wire [7:0] r_raw_data_2 = REG ? mem_2_MPORT_data : r_2; // @[package.scala 79:42]
  wire [31:0] r_corrected_lo = {r_raw_data_3,r_raw_data_2,r_raw_data_1,r_raw_data_0}; // @[Cat.scala 30:58]
  reg [7:0] r_5; // @[Reg.scala 15:16]
  wire [7:0] r_raw_data_5 = REG ? mem_5_MPORT_data : r_5; // @[package.scala 79:42]
  reg [7:0] r_4; // @[Reg.scala 15:16]
  wire [7:0] r_raw_data_4 = REG ? mem_4_MPORT_data : r_4; // @[package.scala 79:42]
  reg [7:0] r_7; // @[Reg.scala 15:16]
  wire [7:0] r_raw_data_7 = REG ? mem_7_MPORT_data : r_7; // @[package.scala 79:42]
  reg [7:0] r_6; // @[Reg.scala 15:16]
  wire [7:0] r_raw_data_6 = REG ? mem_6_MPORT_data : r_6; // @[package.scala 79:42]
  wire [31:0] r_corrected_hi = {r_raw_data_7,r_raw_data_6,r_raw_data_5,r_raw_data_4}; // @[Cat.scala 30:58]
  wire  in_a_ready = ~r_full | auto_in_d_ready; // @[SRAM.scala 243:49]
  wire  a_read = auto_in_a_bits_opcode == 3'h4; // @[SRAM.scala 251:35]
  wire  _GEN_22 = auto_in_d_ready ? 1'h0 : r_full; // @[SRAM.scala 273:20 SRAM.scala 273:29 SRAM.scala 134:30]
  wire  _T_18 = in_a_ready & auto_in_a_valid; // @[Decoupled.scala 40:37]
  wire  _T_19 = ~a_read; // @[SRAM.scala 287:13]
  wire  _GEN_24 = _T_18 | _GEN_22; // @[SRAM.scala 274:24 SRAM.scala 275:18]
  wire  a_lanes_lo_lo_lo = |auto_in_a_bits_mask[0]; // @[SRAM.scala 303:95]
  wire  a_lanes_lo_lo_hi = |auto_in_a_bits_mask[1]; // @[SRAM.scala 303:95]
  wire  a_lanes_lo_hi_lo = |auto_in_a_bits_mask[2]; // @[SRAM.scala 303:95]
  wire  a_lanes_lo_hi_hi = |auto_in_a_bits_mask[3]; // @[SRAM.scala 303:95]
  wire  a_lanes_hi_lo_lo = |auto_in_a_bits_mask[4]; // @[SRAM.scala 303:95]
  wire  a_lanes_hi_lo_hi = |auto_in_a_bits_mask[5]; // @[SRAM.scala 303:95]
  wire  a_lanes_hi_hi_lo = |auto_in_a_bits_mask[6]; // @[SRAM.scala 303:95]
  wire  a_lanes_hi_hi_hi = |auto_in_a_bits_mask[7]; // @[SRAM.scala 303:95]
  wire [7:0] a_lanes = {a_lanes_hi_hi_hi,a_lanes_hi_hi_lo,a_lanes_hi_lo_hi,a_lanes_hi_lo_lo,a_lanes_lo_hi_hi,
    a_lanes_lo_hi_lo,a_lanes_lo_lo_hi,a_lanes_lo_lo_lo}; // @[Cat.scala 30:58]
  wire  wen = _T_18 & _T_19; // @[SRAM.scala 309:52]
  wire  _ren_T = ~wen; // @[SRAM.scala 310:15]
  wire  index_lo_lo_lo = auto_in_a_bits_address[3]; // @[SRAM.scala 320:60]
  wire  index_lo_lo_hi = auto_in_a_bits_address[4]; // @[SRAM.scala 320:60]
  wire  index_lo_hi_lo = auto_in_a_bits_address[5]; // @[SRAM.scala 320:60]
  wire  index_lo_hi_hi = auto_in_a_bits_address[6]; // @[SRAM.scala 320:60]
  wire  index_hi_lo_lo = auto_in_a_bits_address[7]; // @[SRAM.scala 320:60]
  wire  index_hi_lo_hi = auto_in_a_bits_address[8]; // @[SRAM.scala 320:60]
  wire  index_hi_hi_lo = auto_in_a_bits_address[9]; // @[SRAM.scala 320:60]
  wire  index_hi_hi_hi_lo = auto_in_a_bits_address[10]; // @[SRAM.scala 320:60]
  wire  index_hi_hi_hi_hi = auto_in_a_bits_address[11]; // @[SRAM.scala 320:60]
  wire [3:0] index_lo = {index_lo_hi_hi,index_lo_hi_lo,index_lo_lo_hi,index_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [4:0] index_hi = {index_hi_hi_hi_hi,index_hi_hi_hi_lo,index_hi_hi_lo,index_hi_lo_hi,index_hi_lo_lo}; // @[Cat.scala 30:58]
  TLMonitor_54 monitor ( // @[Nodes.scala 24:25]
    .clock(monitor_clock),
    .reset(monitor_reset),
    .io_in_a_ready(monitor_io_in_a_ready),
    .io_in_a_valid(monitor_io_in_a_valid),
    .io_in_a_bits_opcode(monitor_io_in_a_bits_opcode),
    .io_in_a_bits_param(monitor_io_in_a_bits_param),
    .io_in_a_bits_size(monitor_io_in_a_bits_size),
    .io_in_a_bits_source(monitor_io_in_a_bits_source),
    .io_in_a_bits_address(monitor_io_in_a_bits_address),
    .io_in_a_bits_mask(monitor_io_in_a_bits_mask),
    .io_in_a_bits_data(monitor_io_in_a_bits_data),
    .io_in_a_bits_corrupt(monitor_io_in_a_bits_corrupt),
    .io_in_d_ready(monitor_io_in_d_ready),
    .io_in_d_valid(monitor_io_in_d_valid),
    .io_in_d_bits_opcode(monitor_io_in_d_bits_opcode),
    .io_in_d_bits_param(monitor_io_in_d_bits_param),
    .io_in_d_bits_size(monitor_io_in_d_bits_size),
    .io_in_d_bits_source(monitor_io_in_d_bits_source),
    .io_in_d_bits_sink(monitor_io_in_d_bits_sink),
    .io_in_d_bits_denied(monitor_io_in_d_bits_denied),
    .io_in_d_bits_data(monitor_io_in_d_bits_data),
    .io_in_d_bits_corrupt(monitor_io_in_d_bits_corrupt)
  );
  assign mem_0_MPORT_addr = mem_0_MPORT_addr_pipe_0;
  assign mem_0_MPORT_data = mem_0[mem_0_MPORT_addr]; // @[DescribedSRAM.scala 19:26]
  assign mem_0_MPORT_1_data = auto_in_a_bits_data[7:0];
  assign mem_0_MPORT_1_addr = {index_hi,index_lo};
  assign mem_0_MPORT_1_mask = a_lanes[0];
  assign mem_0_MPORT_1_en = _T_18 & _T_19;
  assign mem_1_MPORT_addr = mem_1_MPORT_addr_pipe_0;
  assign mem_1_MPORT_data = mem_1[mem_1_MPORT_addr]; // @[DescribedSRAM.scala 19:26]
  assign mem_1_MPORT_1_data = auto_in_a_bits_data[15:8];
  assign mem_1_MPORT_1_addr = {index_hi,index_lo};
  assign mem_1_MPORT_1_mask = a_lanes[1];
  assign mem_1_MPORT_1_en = _T_18 & _T_19;
  assign mem_2_MPORT_addr = mem_2_MPORT_addr_pipe_0;
  assign mem_2_MPORT_data = mem_2[mem_2_MPORT_addr]; // @[DescribedSRAM.scala 19:26]
  assign mem_2_MPORT_1_data = auto_in_a_bits_data[23:16];
  assign mem_2_MPORT_1_addr = {index_hi,index_lo};
  assign mem_2_MPORT_1_mask = a_lanes[2];
  assign mem_2_MPORT_1_en = _T_18 & _T_19;
  assign mem_3_MPORT_addr = mem_3_MPORT_addr_pipe_0;
  assign mem_3_MPORT_data = mem_3[mem_3_MPORT_addr]; // @[DescribedSRAM.scala 19:26]
  assign mem_3_MPORT_1_data = auto_in_a_bits_data[31:24];
  assign mem_3_MPORT_1_addr = {index_hi,index_lo};
  assign mem_3_MPORT_1_mask = a_lanes[3];
  assign mem_3_MPORT_1_en = _T_18 & _T_19;
  assign mem_4_MPORT_addr = mem_4_MPORT_addr_pipe_0;
  assign mem_4_MPORT_data = mem_4[mem_4_MPORT_addr]; // @[DescribedSRAM.scala 19:26]
  assign mem_4_MPORT_1_data = auto_in_a_bits_data[39:32];
  assign mem_4_MPORT_1_addr = {index_hi,index_lo};
  assign mem_4_MPORT_1_mask = a_lanes[4];
  assign mem_4_MPORT_1_en = _T_18 & _T_19;
  assign mem_5_MPORT_addr = mem_5_MPORT_addr_pipe_0;
  assign mem_5_MPORT_data = mem_5[mem_5_MPORT_addr]; // @[DescribedSRAM.scala 19:26]
  assign mem_5_MPORT_1_data = auto_in_a_bits_data[47:40];
  assign mem_5_MPORT_1_addr = {index_hi,index_lo};
  assign mem_5_MPORT_1_mask = a_lanes[5];
  assign mem_5_MPORT_1_en = _T_18 & _T_19;
  assign mem_6_MPORT_addr = mem_6_MPORT_addr_pipe_0;
  assign mem_6_MPORT_data = mem_6[mem_6_MPORT_addr]; // @[DescribedSRAM.scala 19:26]
  assign mem_6_MPORT_1_data = auto_in_a_bits_data[55:48];
  assign mem_6_MPORT_1_addr = {index_hi,index_lo};
  assign mem_6_MPORT_1_mask = a_lanes[6];
  assign mem_6_MPORT_1_en = _T_18 & _T_19;
  assign mem_7_MPORT_addr = mem_7_MPORT_addr_pipe_0;
  assign mem_7_MPORT_data = mem_7[mem_7_MPORT_addr]; // @[DescribedSRAM.scala 19:26]
  assign mem_7_MPORT_1_data = auto_in_a_bits_data[63:56];
  assign mem_7_MPORT_1_addr = {index_hi,index_lo};
  assign mem_7_MPORT_1_mask = a_lanes[7];
  assign mem_7_MPORT_1_en = _T_18 & _T_19;
  assign auto_in_a_ready = ~r_full | auto_in_d_ready; // @[SRAM.scala 243:49]
  assign auto_in_d_valid = r_full; // @[SRAM.scala 240:65]
  assign auto_in_d_bits_opcode = {{2'd0}, r_read}; // @[Nodes.scala 1210:84 SRAM.scala 209:23]
  assign auto_in_d_bits_param = 2'h0; // @[Nodes.scala 1210:84 SRAM.scala 210:23]
  assign auto_in_d_bits_size = r_size; // @[SRAM.scala 211:29]
  assign auto_in_d_bits_source = r_source; // @[SRAM.scala 212:29]
  assign auto_in_d_bits_sink = 1'h0; // @[Nodes.scala 1210:84 SRAM.scala 213:23]
  assign auto_in_d_bits_denied = 1'h0; // @[Nodes.scala 1210:84 SRAM.scala 214:23]
  assign auto_in_d_bits_data = {r_corrected_hi,r_corrected_lo}; // @[Cat.scala 30:58]
  assign auto_in_d_bits_corrupt = 1'h0; // @[SRAM.scala 216:55]
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = ~r_full | auto_in_d_ready; // @[SRAM.scala 243:49]
  assign monitor_io_in_a_valid = auto_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_ready = auto_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_valid = r_full; // @[SRAM.scala 240:65]
  assign monitor_io_in_d_bits_opcode = {{2'd0}, r_read}; // @[Nodes.scala 1210:84 SRAM.scala 209:23]
  assign monitor_io_in_d_bits_param = 2'h0; // @[Nodes.scala 1210:84 SRAM.scala 210:23]
  assign monitor_io_in_d_bits_size = r_size; // @[SRAM.scala 211:29]
  assign monitor_io_in_d_bits_source = r_source; // @[SRAM.scala 212:29]
  assign monitor_io_in_d_bits_sink = 1'h0; // @[Nodes.scala 1210:84 SRAM.scala 213:23]
  assign monitor_io_in_d_bits_denied = 1'h0; // @[Nodes.scala 1210:84 SRAM.scala 214:23]
  assign monitor_io_in_d_bits_data = {r_corrected_hi,r_corrected_lo}; // @[Cat.scala 30:58]
  assign monitor_io_in_d_bits_corrupt = 1'h0; // @[SRAM.scala 216:55]
  always @(posedge clock) begin
    if(mem_0_MPORT_1_en & mem_0_MPORT_1_mask) begin
      mem_0[mem_0_MPORT_1_addr] <= mem_0_MPORT_1_data; // @[DescribedSRAM.scala 19:26]
    end
    mem_0_MPORT_en_pipe_0 <= _ren_T & _T_18;
    if (_ren_T & _T_18) begin
      mem_0_MPORT_addr_pipe_0 <= {index_hi,index_lo};
    end
    if(mem_1_MPORT_1_en & mem_1_MPORT_1_mask) begin
      mem_1[mem_1_MPORT_1_addr] <= mem_1_MPORT_1_data; // @[DescribedSRAM.scala 19:26]
    end
    mem_1_MPORT_en_pipe_0 <= _ren_T & _T_18;
    if (_ren_T & _T_18) begin
      mem_1_MPORT_addr_pipe_0 <= {index_hi,index_lo};
    end
    if(mem_2_MPORT_1_en & mem_2_MPORT_1_mask) begin
      mem_2[mem_2_MPORT_1_addr] <= mem_2_MPORT_1_data; // @[DescribedSRAM.scala 19:26]
    end
    mem_2_MPORT_en_pipe_0 <= _ren_T & _T_18;
    if (_ren_T & _T_18) begin
      mem_2_MPORT_addr_pipe_0 <= {index_hi,index_lo};
    end
    if(mem_3_MPORT_1_en & mem_3_MPORT_1_mask) begin
      mem_3[mem_3_MPORT_1_addr] <= mem_3_MPORT_1_data; // @[DescribedSRAM.scala 19:26]
    end
    mem_3_MPORT_en_pipe_0 <= _ren_T & _T_18;
    if (_ren_T & _T_18) begin
      mem_3_MPORT_addr_pipe_0 <= {index_hi,index_lo};
    end
    if(mem_4_MPORT_1_en & mem_4_MPORT_1_mask) begin
      mem_4[mem_4_MPORT_1_addr] <= mem_4_MPORT_1_data; // @[DescribedSRAM.scala 19:26]
    end
    mem_4_MPORT_en_pipe_0 <= _ren_T & _T_18;
    if (_ren_T & _T_18) begin
      mem_4_MPORT_addr_pipe_0 <= {index_hi,index_lo};
    end
    if(mem_5_MPORT_1_en & mem_5_MPORT_1_mask) begin
      mem_5[mem_5_MPORT_1_addr] <= mem_5_MPORT_1_data; // @[DescribedSRAM.scala 19:26]
    end
    mem_5_MPORT_en_pipe_0 <= _ren_T & _T_18;
    if (_ren_T & _T_18) begin
      mem_5_MPORT_addr_pipe_0 <= {index_hi,index_lo};
    end
    if(mem_6_MPORT_1_en & mem_6_MPORT_1_mask) begin
      mem_6[mem_6_MPORT_1_addr] <= mem_6_MPORT_1_data; // @[DescribedSRAM.scala 19:26]
    end
    mem_6_MPORT_en_pipe_0 <= _ren_T & _T_18;
    if (_ren_T & _T_18) begin
      mem_6_MPORT_addr_pipe_0 <= {index_hi,index_lo};
    end
    if(mem_7_MPORT_1_en & mem_7_MPORT_1_mask) begin
      mem_7[mem_7_MPORT_1_addr] <= mem_7_MPORT_1_data; // @[DescribedSRAM.scala 19:26]
    end
    mem_7_MPORT_en_pipe_0 <= _ren_T & _T_18;
    if (_ren_T & _T_18) begin
      mem_7_MPORT_addr_pipe_0 <= {index_hi,index_lo};
    end
    if (reset) begin // @[SRAM.scala 134:30]
      r_full <= 1'h0; // @[SRAM.scala 134:30]
    end else begin
      r_full <= _GEN_24;
    end
    if (_T_18) begin // @[SRAM.scala 274:24]
      r_size <= auto_in_a_bits_size; // @[SRAM.scala 279:18]
    end
    if (_T_18) begin // @[SRAM.scala 274:24]
      r_source <= auto_in_a_bits_source; // @[SRAM.scala 280:18]
    end
    if (_T_18) begin // @[SRAM.scala 274:24]
      r_read <= a_read; // @[SRAM.scala 281:18]
    end
    REG <= ~wen & _T_18; // @[SRAM.scala 310:20]
    if (REG) begin // @[Reg.scala 16:19]
      r_1 <= mem_1_MPORT_data; // @[Reg.scala 16:23]
    end
    if (REG) begin // @[Reg.scala 16:19]
      r_0 <= mem_0_MPORT_data; // @[Reg.scala 16:23]
    end
    if (REG) begin // @[Reg.scala 16:19]
      r_3 <= mem_3_MPORT_data; // @[Reg.scala 16:23]
    end
    if (REG) begin // @[Reg.scala 16:19]
      r_2 <= mem_2_MPORT_data; // @[Reg.scala 16:23]
    end
    if (REG) begin // @[Reg.scala 16:19]
      r_5 <= mem_5_MPORT_data; // @[Reg.scala 16:23]
    end
    if (REG) begin // @[Reg.scala 16:19]
      r_4 <= mem_4_MPORT_data; // @[Reg.scala 16:23]
    end
    if (REG) begin // @[Reg.scala 16:19]
      r_7 <= mem_7_MPORT_data; // @[Reg.scala 16:23]
    end
    if (REG) begin // @[Reg.scala 16:19]
      r_6 <= mem_6_MPORT_data; // @[Reg.scala 16:23]
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
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    mem_0[initvar] = _RAND_0[7:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    mem_1[initvar] = _RAND_3[7:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    mem_2[initvar] = _RAND_6[7:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    mem_3[initvar] = _RAND_9[7:0];
  _RAND_12 = {1{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    mem_4[initvar] = _RAND_12[7:0];
  _RAND_15 = {1{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    mem_5[initvar] = _RAND_15[7:0];
  _RAND_18 = {1{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    mem_6[initvar] = _RAND_18[7:0];
  _RAND_21 = {1{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    mem_7[initvar] = _RAND_21[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_0_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_0_MPORT_addr_pipe_0 = _RAND_2[8:0];
  _RAND_4 = {1{`RANDOM}};
  mem_1_MPORT_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  mem_1_MPORT_addr_pipe_0 = _RAND_5[8:0];
  _RAND_7 = {1{`RANDOM}};
  mem_2_MPORT_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  mem_2_MPORT_addr_pipe_0 = _RAND_8[8:0];
  _RAND_10 = {1{`RANDOM}};
  mem_3_MPORT_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  mem_3_MPORT_addr_pipe_0 = _RAND_11[8:0];
  _RAND_13 = {1{`RANDOM}};
  mem_4_MPORT_en_pipe_0 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  mem_4_MPORT_addr_pipe_0 = _RAND_14[8:0];
  _RAND_16 = {1{`RANDOM}};
  mem_5_MPORT_en_pipe_0 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  mem_5_MPORT_addr_pipe_0 = _RAND_17[8:0];
  _RAND_19 = {1{`RANDOM}};
  mem_6_MPORT_en_pipe_0 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  mem_6_MPORT_addr_pipe_0 = _RAND_20[8:0];
  _RAND_22 = {1{`RANDOM}};
  mem_7_MPORT_en_pipe_0 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  mem_7_MPORT_addr_pipe_0 = _RAND_23[8:0];
  _RAND_24 = {1{`RANDOM}};
  r_full = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  r_size = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  r_source = _RAND_26[7:0];
  _RAND_27 = {1{`RANDOM}};
  r_read = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  REG = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  r_1 = _RAND_29[7:0];
  _RAND_30 = {1{`RANDOM}};
  r_0 = _RAND_30[7:0];
  _RAND_31 = {1{`RANDOM}};
  r_3 = _RAND_31[7:0];
  _RAND_32 = {1{`RANDOM}};
  r_2 = _RAND_32[7:0];
  _RAND_33 = {1{`RANDOM}};
  r_5 = _RAND_33[7:0];
  _RAND_34 = {1{`RANDOM}};
  r_4 = _RAND_34[7:0];
  _RAND_35 = {1{`RANDOM}};
  r_7 = _RAND_35[7:0];
  _RAND_36 = {1{`RANDOM}};
  r_6 = _RAND_36[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
