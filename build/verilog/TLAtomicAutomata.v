module TLAtomicAutomata(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [2:0]  auto_in_a_bits_size,
  input  [4:0]  auto_in_a_bits_source,
  input  [30:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [2:0]  auto_in_d_bits_size,
  output [4:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_sink,
  output        auto_in_d_bits_denied,
  output [63:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [2:0]  auto_out_a_bits_param,
  output [2:0]  auto_out_a_bits_size,
  output [4:0]  auto_out_a_bits_source,
  output [30:0] auto_out_a_bits_address,
  output [7:0]  auto_out_a_bits_mask,
  output [63:0] auto_out_a_bits_data,
  output        auto_out_a_bits_corrupt,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [2:0]  auto_out_d_bits_size,
  input  [4:0]  auto_out_d_bits_source,
  input         auto_out_d_bits_sink,
  input         auto_out_d_bits_denied,
  input  [63:0] auto_out_d_bits_data,
  input         auto_out_d_bits_corrupt
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock; // @[Nodes.scala 24:25]
  wire  monitor_reset; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_param; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_size; // @[Nodes.scala 24:25]
  wire [4:0] monitor_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [30:0] monitor_io_in_a_bits_address; // @[Nodes.scala 24:25]
  wire [7:0] monitor_io_in_a_bits_mask; // @[Nodes.scala 24:25]
  wire [63:0] monitor_io_in_a_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_param; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_size; // @[Nodes.scala 24:25]
  wire [4:0] monitor_io_in_d_bits_source; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_sink; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_denied; // @[Nodes.scala 24:25]
  wire [63:0] monitor_io_in_d_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_corrupt; // @[Nodes.scala 24:25]
  reg [1:0] cam_s_0_state; // @[AtomicAutomata.scala 76:28]
  reg [2:0] cam_a_0_bits_opcode; // @[AtomicAutomata.scala 77:24]
  reg [2:0] cam_a_0_bits_param; // @[AtomicAutomata.scala 77:24]
  reg [2:0] cam_a_0_bits_size; // @[AtomicAutomata.scala 77:24]
  reg [4:0] cam_a_0_bits_source; // @[AtomicAutomata.scala 77:24]
  reg [30:0] cam_a_0_bits_address; // @[AtomicAutomata.scala 77:24]
  reg [7:0] cam_a_0_bits_mask; // @[AtomicAutomata.scala 77:24]
  reg [63:0] cam_a_0_bits_data; // @[AtomicAutomata.scala 77:24]
  reg  cam_a_0_bits_corrupt; // @[AtomicAutomata.scala 77:24]
  reg [3:0] cam_a_0_lut; // @[AtomicAutomata.scala 77:24]
  reg [63:0] cam_d_0_data; // @[AtomicAutomata.scala 78:24]
  reg  cam_d_0_denied; // @[AtomicAutomata.scala 78:24]
  reg  cam_d_0_corrupt; // @[AtomicAutomata.scala 78:24]
  wire  cam_free_0 = cam_s_0_state == 2'h0; // @[AtomicAutomata.scala 80:44]
  wire  cam_amo_0 = cam_s_0_state == 2'h2; // @[AtomicAutomata.scala 81:44]
  wire  cam_abusy_0 = cam_s_0_state == 2'h3 | cam_amo_0; // @[AtomicAutomata.scala 82:57]
  wire  cam_dmatch_0 = cam_s_0_state != 2'h0; // @[AtomicAutomata.scala 83:49]
  wire  a_isLogical = auto_in_a_bits_opcode == 3'h3; // @[AtomicAutomata.scala 90:47]
  wire  a_isArithmetic = auto_in_a_bits_opcode == 3'h2; // @[AtomicAutomata.scala 91:47]
  wire  _a_isSupported_T = a_isArithmetic ? 1'h0 : 1'h1; // @[AtomicAutomata.scala 92:63]
  wire  a_isSupported = a_isLogical ? 1'h0 : _a_isSupported_T; // @[AtomicAutomata.scala 92:32]
  wire  indexes_hi = cam_a_0_bits_data[0]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo = cam_d_0_data[0]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_0 = {indexes_hi,indexes_lo}; // @[Cat.scala 30:58]
  wire  indexes_hi_1 = cam_a_0_bits_data[1]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_1 = cam_d_0_data[1]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_1 = {indexes_hi_1,indexes_lo_1}; // @[Cat.scala 30:58]
  wire  indexes_hi_2 = cam_a_0_bits_data[2]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_2 = cam_d_0_data[2]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_2 = {indexes_hi_2,indexes_lo_2}; // @[Cat.scala 30:58]
  wire  indexes_hi_3 = cam_a_0_bits_data[3]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_3 = cam_d_0_data[3]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_3 = {indexes_hi_3,indexes_lo_3}; // @[Cat.scala 30:58]
  wire  indexes_hi_4 = cam_a_0_bits_data[4]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_4 = cam_d_0_data[4]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_4 = {indexes_hi_4,indexes_lo_4}; // @[Cat.scala 30:58]
  wire  indexes_hi_5 = cam_a_0_bits_data[5]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_5 = cam_d_0_data[5]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_5 = {indexes_hi_5,indexes_lo_5}; // @[Cat.scala 30:58]
  wire  indexes_hi_6 = cam_a_0_bits_data[6]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_6 = cam_d_0_data[6]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_6 = {indexes_hi_6,indexes_lo_6}; // @[Cat.scala 30:58]
  wire  indexes_hi_7 = cam_a_0_bits_data[7]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_7 = cam_d_0_data[7]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_7 = {indexes_hi_7,indexes_lo_7}; // @[Cat.scala 30:58]
  wire  indexes_hi_8 = cam_a_0_bits_data[8]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_8 = cam_d_0_data[8]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_8 = {indexes_hi_8,indexes_lo_8}; // @[Cat.scala 30:58]
  wire  indexes_hi_9 = cam_a_0_bits_data[9]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_9 = cam_d_0_data[9]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_9 = {indexes_hi_9,indexes_lo_9}; // @[Cat.scala 30:58]
  wire  indexes_hi_10 = cam_a_0_bits_data[10]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_10 = cam_d_0_data[10]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_10 = {indexes_hi_10,indexes_lo_10}; // @[Cat.scala 30:58]
  wire  indexes_hi_11 = cam_a_0_bits_data[11]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_11 = cam_d_0_data[11]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_11 = {indexes_hi_11,indexes_lo_11}; // @[Cat.scala 30:58]
  wire  indexes_hi_12 = cam_a_0_bits_data[12]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_12 = cam_d_0_data[12]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_12 = {indexes_hi_12,indexes_lo_12}; // @[Cat.scala 30:58]
  wire  indexes_hi_13 = cam_a_0_bits_data[13]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_13 = cam_d_0_data[13]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_13 = {indexes_hi_13,indexes_lo_13}; // @[Cat.scala 30:58]
  wire  indexes_hi_14 = cam_a_0_bits_data[14]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_14 = cam_d_0_data[14]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_14 = {indexes_hi_14,indexes_lo_14}; // @[Cat.scala 30:58]
  wire  indexes_hi_15 = cam_a_0_bits_data[15]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_15 = cam_d_0_data[15]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_15 = {indexes_hi_15,indexes_lo_15}; // @[Cat.scala 30:58]
  wire  indexes_hi_16 = cam_a_0_bits_data[16]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_16 = cam_d_0_data[16]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_16 = {indexes_hi_16,indexes_lo_16}; // @[Cat.scala 30:58]
  wire  indexes_hi_17 = cam_a_0_bits_data[17]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_17 = cam_d_0_data[17]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_17 = {indexes_hi_17,indexes_lo_17}; // @[Cat.scala 30:58]
  wire  indexes_hi_18 = cam_a_0_bits_data[18]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_18 = cam_d_0_data[18]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_18 = {indexes_hi_18,indexes_lo_18}; // @[Cat.scala 30:58]
  wire  indexes_hi_19 = cam_a_0_bits_data[19]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_19 = cam_d_0_data[19]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_19 = {indexes_hi_19,indexes_lo_19}; // @[Cat.scala 30:58]
  wire  indexes_hi_20 = cam_a_0_bits_data[20]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_20 = cam_d_0_data[20]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_20 = {indexes_hi_20,indexes_lo_20}; // @[Cat.scala 30:58]
  wire  indexes_hi_21 = cam_a_0_bits_data[21]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_21 = cam_d_0_data[21]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_21 = {indexes_hi_21,indexes_lo_21}; // @[Cat.scala 30:58]
  wire  indexes_hi_22 = cam_a_0_bits_data[22]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_22 = cam_d_0_data[22]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_22 = {indexes_hi_22,indexes_lo_22}; // @[Cat.scala 30:58]
  wire  indexes_hi_23 = cam_a_0_bits_data[23]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_23 = cam_d_0_data[23]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_23 = {indexes_hi_23,indexes_lo_23}; // @[Cat.scala 30:58]
  wire  indexes_hi_24 = cam_a_0_bits_data[24]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_24 = cam_d_0_data[24]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_24 = {indexes_hi_24,indexes_lo_24}; // @[Cat.scala 30:58]
  wire  indexes_hi_25 = cam_a_0_bits_data[25]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_25 = cam_d_0_data[25]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_25 = {indexes_hi_25,indexes_lo_25}; // @[Cat.scala 30:58]
  wire  indexes_hi_26 = cam_a_0_bits_data[26]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_26 = cam_d_0_data[26]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_26 = {indexes_hi_26,indexes_lo_26}; // @[Cat.scala 30:58]
  wire  indexes_hi_27 = cam_a_0_bits_data[27]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_27 = cam_d_0_data[27]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_27 = {indexes_hi_27,indexes_lo_27}; // @[Cat.scala 30:58]
  wire  indexes_hi_28 = cam_a_0_bits_data[28]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_28 = cam_d_0_data[28]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_28 = {indexes_hi_28,indexes_lo_28}; // @[Cat.scala 30:58]
  wire  indexes_hi_29 = cam_a_0_bits_data[29]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_29 = cam_d_0_data[29]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_29 = {indexes_hi_29,indexes_lo_29}; // @[Cat.scala 30:58]
  wire  indexes_hi_30 = cam_a_0_bits_data[30]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_30 = cam_d_0_data[30]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_30 = {indexes_hi_30,indexes_lo_30}; // @[Cat.scala 30:58]
  wire  indexes_hi_31 = cam_a_0_bits_data[31]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_31 = cam_d_0_data[31]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_31 = {indexes_hi_31,indexes_lo_31}; // @[Cat.scala 30:58]
  wire  indexes_hi_32 = cam_a_0_bits_data[32]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_32 = cam_d_0_data[32]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_32 = {indexes_hi_32,indexes_lo_32}; // @[Cat.scala 30:58]
  wire  indexes_hi_33 = cam_a_0_bits_data[33]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_33 = cam_d_0_data[33]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_33 = {indexes_hi_33,indexes_lo_33}; // @[Cat.scala 30:58]
  wire  indexes_hi_34 = cam_a_0_bits_data[34]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_34 = cam_d_0_data[34]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_34 = {indexes_hi_34,indexes_lo_34}; // @[Cat.scala 30:58]
  wire  indexes_hi_35 = cam_a_0_bits_data[35]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_35 = cam_d_0_data[35]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_35 = {indexes_hi_35,indexes_lo_35}; // @[Cat.scala 30:58]
  wire  indexes_hi_36 = cam_a_0_bits_data[36]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_36 = cam_d_0_data[36]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_36 = {indexes_hi_36,indexes_lo_36}; // @[Cat.scala 30:58]
  wire  indexes_hi_37 = cam_a_0_bits_data[37]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_37 = cam_d_0_data[37]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_37 = {indexes_hi_37,indexes_lo_37}; // @[Cat.scala 30:58]
  wire  indexes_hi_38 = cam_a_0_bits_data[38]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_38 = cam_d_0_data[38]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_38 = {indexes_hi_38,indexes_lo_38}; // @[Cat.scala 30:58]
  wire  indexes_hi_39 = cam_a_0_bits_data[39]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_39 = cam_d_0_data[39]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_39 = {indexes_hi_39,indexes_lo_39}; // @[Cat.scala 30:58]
  wire  indexes_hi_40 = cam_a_0_bits_data[40]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_40 = cam_d_0_data[40]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_40 = {indexes_hi_40,indexes_lo_40}; // @[Cat.scala 30:58]
  wire  indexes_hi_41 = cam_a_0_bits_data[41]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_41 = cam_d_0_data[41]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_41 = {indexes_hi_41,indexes_lo_41}; // @[Cat.scala 30:58]
  wire  indexes_hi_42 = cam_a_0_bits_data[42]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_42 = cam_d_0_data[42]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_42 = {indexes_hi_42,indexes_lo_42}; // @[Cat.scala 30:58]
  wire  indexes_hi_43 = cam_a_0_bits_data[43]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_43 = cam_d_0_data[43]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_43 = {indexes_hi_43,indexes_lo_43}; // @[Cat.scala 30:58]
  wire  indexes_hi_44 = cam_a_0_bits_data[44]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_44 = cam_d_0_data[44]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_44 = {indexes_hi_44,indexes_lo_44}; // @[Cat.scala 30:58]
  wire  indexes_hi_45 = cam_a_0_bits_data[45]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_45 = cam_d_0_data[45]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_45 = {indexes_hi_45,indexes_lo_45}; // @[Cat.scala 30:58]
  wire  indexes_hi_46 = cam_a_0_bits_data[46]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_46 = cam_d_0_data[46]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_46 = {indexes_hi_46,indexes_lo_46}; // @[Cat.scala 30:58]
  wire  indexes_hi_47 = cam_a_0_bits_data[47]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_47 = cam_d_0_data[47]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_47 = {indexes_hi_47,indexes_lo_47}; // @[Cat.scala 30:58]
  wire  indexes_hi_48 = cam_a_0_bits_data[48]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_48 = cam_d_0_data[48]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_48 = {indexes_hi_48,indexes_lo_48}; // @[Cat.scala 30:58]
  wire  indexes_hi_49 = cam_a_0_bits_data[49]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_49 = cam_d_0_data[49]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_49 = {indexes_hi_49,indexes_lo_49}; // @[Cat.scala 30:58]
  wire  indexes_hi_50 = cam_a_0_bits_data[50]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_50 = cam_d_0_data[50]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_50 = {indexes_hi_50,indexes_lo_50}; // @[Cat.scala 30:58]
  wire  indexes_hi_51 = cam_a_0_bits_data[51]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_51 = cam_d_0_data[51]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_51 = {indexes_hi_51,indexes_lo_51}; // @[Cat.scala 30:58]
  wire  indexes_hi_52 = cam_a_0_bits_data[52]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_52 = cam_d_0_data[52]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_52 = {indexes_hi_52,indexes_lo_52}; // @[Cat.scala 30:58]
  wire  indexes_hi_53 = cam_a_0_bits_data[53]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_53 = cam_d_0_data[53]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_53 = {indexes_hi_53,indexes_lo_53}; // @[Cat.scala 30:58]
  wire  indexes_hi_54 = cam_a_0_bits_data[54]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_54 = cam_d_0_data[54]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_54 = {indexes_hi_54,indexes_lo_54}; // @[Cat.scala 30:58]
  wire  indexes_hi_55 = cam_a_0_bits_data[55]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_55 = cam_d_0_data[55]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_55 = {indexes_hi_55,indexes_lo_55}; // @[Cat.scala 30:58]
  wire  indexes_hi_56 = cam_a_0_bits_data[56]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_56 = cam_d_0_data[56]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_56 = {indexes_hi_56,indexes_lo_56}; // @[Cat.scala 30:58]
  wire  indexes_hi_57 = cam_a_0_bits_data[57]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_57 = cam_d_0_data[57]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_57 = {indexes_hi_57,indexes_lo_57}; // @[Cat.scala 30:58]
  wire  indexes_hi_58 = cam_a_0_bits_data[58]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_58 = cam_d_0_data[58]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_58 = {indexes_hi_58,indexes_lo_58}; // @[Cat.scala 30:58]
  wire  indexes_hi_59 = cam_a_0_bits_data[59]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_59 = cam_d_0_data[59]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_59 = {indexes_hi_59,indexes_lo_59}; // @[Cat.scala 30:58]
  wire  indexes_hi_60 = cam_a_0_bits_data[60]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_60 = cam_d_0_data[60]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_60 = {indexes_hi_60,indexes_lo_60}; // @[Cat.scala 30:58]
  wire  indexes_hi_61 = cam_a_0_bits_data[61]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_61 = cam_d_0_data[61]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_61 = {indexes_hi_61,indexes_lo_61}; // @[Cat.scala 30:58]
  wire  indexes_hi_62 = cam_a_0_bits_data[62]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_62 = cam_d_0_data[62]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_62 = {indexes_hi_62,indexes_lo_62}; // @[Cat.scala 30:58]
  wire  indexes_hi_63 = cam_a_0_bits_data[63]; // @[AtomicAutomata.scala 113:63]
  wire  indexes_lo_63 = cam_d_0_data[63]; // @[AtomicAutomata.scala 113:73]
  wire [1:0] indexes_63 = {indexes_hi_63,indexes_lo_63}; // @[Cat.scala 30:58]
  wire [3:0] _logic_out_T = cam_a_0_lut >> indexes_0; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_lo_lo_lo_lo_lo = _logic_out_T[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_1 = cam_a_0_lut >> indexes_1; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_lo_lo_lo_lo_hi = _logic_out_T_1[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_2 = cam_a_0_lut >> indexes_2; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_lo_lo_lo_hi_lo = _logic_out_T_2[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_3 = cam_a_0_lut >> indexes_3; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_lo_lo_lo_hi_hi = _logic_out_T_3[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_4 = cam_a_0_lut >> indexes_4; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_lo_lo_hi_lo_lo = _logic_out_T_4[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_5 = cam_a_0_lut >> indexes_5; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_lo_lo_hi_lo_hi = _logic_out_T_5[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_6 = cam_a_0_lut >> indexes_6; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_lo_lo_hi_hi_lo = _logic_out_T_6[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_7 = cam_a_0_lut >> indexes_7; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_lo_lo_hi_hi_hi = _logic_out_T_7[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_8 = cam_a_0_lut >> indexes_8; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_lo_hi_lo_lo_lo = _logic_out_T_8[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_9 = cam_a_0_lut >> indexes_9; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_lo_hi_lo_lo_hi = _logic_out_T_9[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_10 = cam_a_0_lut >> indexes_10; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_lo_hi_lo_hi_lo = _logic_out_T_10[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_11 = cam_a_0_lut >> indexes_11; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_lo_hi_lo_hi_hi = _logic_out_T_11[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_12 = cam_a_0_lut >> indexes_12; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_lo_hi_hi_lo_lo = _logic_out_T_12[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_13 = cam_a_0_lut >> indexes_13; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_lo_hi_hi_lo_hi = _logic_out_T_13[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_14 = cam_a_0_lut >> indexes_14; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_lo_hi_hi_hi_lo = _logic_out_T_14[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_15 = cam_a_0_lut >> indexes_15; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_lo_hi_hi_hi_hi = _logic_out_T_15[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_16 = cam_a_0_lut >> indexes_16; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_hi_lo_lo_lo_lo = _logic_out_T_16[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_17 = cam_a_0_lut >> indexes_17; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_hi_lo_lo_lo_hi = _logic_out_T_17[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_18 = cam_a_0_lut >> indexes_18; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_hi_lo_lo_hi_lo = _logic_out_T_18[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_19 = cam_a_0_lut >> indexes_19; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_hi_lo_lo_hi_hi = _logic_out_T_19[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_20 = cam_a_0_lut >> indexes_20; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_hi_lo_hi_lo_lo = _logic_out_T_20[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_21 = cam_a_0_lut >> indexes_21; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_hi_lo_hi_lo_hi = _logic_out_T_21[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_22 = cam_a_0_lut >> indexes_22; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_hi_lo_hi_hi_lo = _logic_out_T_22[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_23 = cam_a_0_lut >> indexes_23; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_hi_lo_hi_hi_hi = _logic_out_T_23[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_24 = cam_a_0_lut >> indexes_24; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_hi_hi_lo_lo_lo = _logic_out_T_24[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_25 = cam_a_0_lut >> indexes_25; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_hi_hi_lo_lo_hi = _logic_out_T_25[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_26 = cam_a_0_lut >> indexes_26; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_hi_hi_lo_hi_lo = _logic_out_T_26[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_27 = cam_a_0_lut >> indexes_27; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_hi_hi_lo_hi_hi = _logic_out_T_27[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_28 = cam_a_0_lut >> indexes_28; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_hi_hi_hi_lo_lo = _logic_out_T_28[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_29 = cam_a_0_lut >> indexes_29; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_hi_hi_hi_lo_hi = _logic_out_T_29[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_30 = cam_a_0_lut >> indexes_30; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_hi_hi_hi_hi_lo = _logic_out_T_30[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_31 = cam_a_0_lut >> indexes_31; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_lo_hi_hi_hi_hi_hi = _logic_out_T_31[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_32 = cam_a_0_lut >> indexes_32; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_lo_lo_lo_lo_lo = _logic_out_T_32[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_33 = cam_a_0_lut >> indexes_33; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_lo_lo_lo_lo_hi = _logic_out_T_33[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_34 = cam_a_0_lut >> indexes_34; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_lo_lo_lo_hi_lo = _logic_out_T_34[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_35 = cam_a_0_lut >> indexes_35; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_lo_lo_lo_hi_hi = _logic_out_T_35[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_36 = cam_a_0_lut >> indexes_36; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_lo_lo_hi_lo_lo = _logic_out_T_36[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_37 = cam_a_0_lut >> indexes_37; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_lo_lo_hi_lo_hi = _logic_out_T_37[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_38 = cam_a_0_lut >> indexes_38; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_lo_lo_hi_hi_lo = _logic_out_T_38[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_39 = cam_a_0_lut >> indexes_39; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_lo_lo_hi_hi_hi = _logic_out_T_39[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_40 = cam_a_0_lut >> indexes_40; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_lo_hi_lo_lo_lo = _logic_out_T_40[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_41 = cam_a_0_lut >> indexes_41; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_lo_hi_lo_lo_hi = _logic_out_T_41[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_42 = cam_a_0_lut >> indexes_42; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_lo_hi_lo_hi_lo = _logic_out_T_42[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_43 = cam_a_0_lut >> indexes_43; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_lo_hi_lo_hi_hi = _logic_out_T_43[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_44 = cam_a_0_lut >> indexes_44; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_lo_hi_hi_lo_lo = _logic_out_T_44[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_45 = cam_a_0_lut >> indexes_45; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_lo_hi_hi_lo_hi = _logic_out_T_45[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_46 = cam_a_0_lut >> indexes_46; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_lo_hi_hi_hi_lo = _logic_out_T_46[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_47 = cam_a_0_lut >> indexes_47; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_lo_hi_hi_hi_hi = _logic_out_T_47[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_48 = cam_a_0_lut >> indexes_48; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_hi_lo_lo_lo_lo = _logic_out_T_48[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_49 = cam_a_0_lut >> indexes_49; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_hi_lo_lo_lo_hi = _logic_out_T_49[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_50 = cam_a_0_lut >> indexes_50; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_hi_lo_lo_hi_lo = _logic_out_T_50[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_51 = cam_a_0_lut >> indexes_51; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_hi_lo_lo_hi_hi = _logic_out_T_51[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_52 = cam_a_0_lut >> indexes_52; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_hi_lo_hi_lo_lo = _logic_out_T_52[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_53 = cam_a_0_lut >> indexes_53; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_hi_lo_hi_lo_hi = _logic_out_T_53[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_54 = cam_a_0_lut >> indexes_54; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_hi_lo_hi_hi_lo = _logic_out_T_54[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_55 = cam_a_0_lut >> indexes_55; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_hi_lo_hi_hi_hi = _logic_out_T_55[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_56 = cam_a_0_lut >> indexes_56; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_hi_hi_lo_lo_lo = _logic_out_T_56[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_57 = cam_a_0_lut >> indexes_57; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_hi_hi_lo_lo_hi = _logic_out_T_57[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_58 = cam_a_0_lut >> indexes_58; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_hi_hi_lo_hi_lo = _logic_out_T_58[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_59 = cam_a_0_lut >> indexes_59; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_hi_hi_lo_hi_hi = _logic_out_T_59[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_60 = cam_a_0_lut >> indexes_60; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_hi_hi_hi_lo_lo = _logic_out_T_60[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_61 = cam_a_0_lut >> indexes_61; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_hi_hi_hi_lo_hi = _logic_out_T_61[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_62 = cam_a_0_lut >> indexes_62; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_hi_hi_hi_hi_lo = _logic_out_T_62[0]; // @[AtomicAutomata.scala 114:57]
  wire [3:0] _logic_out_T_63 = cam_a_0_lut >> indexes_63; // @[AtomicAutomata.scala 114:57]
  wire  logic_out_hi_hi_hi_hi_hi_hi = _logic_out_T_63[0]; // @[AtomicAutomata.scala 114:57]
  wire [7:0] logic_out_lo_lo_lo = {logic_out_lo_lo_lo_hi_hi_hi,logic_out_lo_lo_lo_hi_hi_lo,logic_out_lo_lo_lo_hi_lo_hi,
    logic_out_lo_lo_lo_hi_lo_lo,logic_out_lo_lo_lo_lo_hi_hi,logic_out_lo_lo_lo_lo_hi_lo,logic_out_lo_lo_lo_lo_lo_hi,
    logic_out_lo_lo_lo_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [15:0] logic_out_lo_lo = {logic_out_lo_lo_hi_hi_hi_hi,logic_out_lo_lo_hi_hi_hi_lo,logic_out_lo_lo_hi_hi_lo_hi,
    logic_out_lo_lo_hi_hi_lo_lo,logic_out_lo_lo_hi_lo_hi_hi,logic_out_lo_lo_hi_lo_hi_lo,logic_out_lo_lo_hi_lo_lo_hi,
    logic_out_lo_lo_hi_lo_lo_lo,logic_out_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [7:0] logic_out_lo_hi_lo = {logic_out_lo_hi_lo_hi_hi_hi,logic_out_lo_hi_lo_hi_hi_lo,logic_out_lo_hi_lo_hi_lo_hi,
    logic_out_lo_hi_lo_hi_lo_lo,logic_out_lo_hi_lo_lo_hi_hi,logic_out_lo_hi_lo_lo_hi_lo,logic_out_lo_hi_lo_lo_lo_hi,
    logic_out_lo_hi_lo_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [31:0] logic_out_lo = {logic_out_lo_hi_hi_hi_hi_hi,logic_out_lo_hi_hi_hi_hi_lo,logic_out_lo_hi_hi_hi_lo_hi,
    logic_out_lo_hi_hi_hi_lo_lo,logic_out_lo_hi_hi_lo_hi_hi,logic_out_lo_hi_hi_lo_hi_lo,logic_out_lo_hi_hi_lo_lo_hi,
    logic_out_lo_hi_hi_lo_lo_lo,logic_out_lo_hi_lo,logic_out_lo_lo}; // @[Cat.scala 30:58]
  wire [7:0] logic_out_hi_lo_lo = {logic_out_hi_lo_lo_hi_hi_hi,logic_out_hi_lo_lo_hi_hi_lo,logic_out_hi_lo_lo_hi_lo_hi,
    logic_out_hi_lo_lo_hi_lo_lo,logic_out_hi_lo_lo_lo_hi_hi,logic_out_hi_lo_lo_lo_hi_lo,logic_out_hi_lo_lo_lo_lo_hi,
    logic_out_hi_lo_lo_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [15:0] logic_out_hi_lo = {logic_out_hi_lo_hi_hi_hi_hi,logic_out_hi_lo_hi_hi_hi_lo,logic_out_hi_lo_hi_hi_lo_hi,
    logic_out_hi_lo_hi_hi_lo_lo,logic_out_hi_lo_hi_lo_hi_hi,logic_out_hi_lo_hi_lo_hi_lo,logic_out_hi_lo_hi_lo_lo_hi,
    logic_out_hi_lo_hi_lo_lo_lo,logic_out_hi_lo_lo}; // @[Cat.scala 30:58]
  wire [7:0] logic_out_hi_hi_lo = {logic_out_hi_hi_lo_hi_hi_hi,logic_out_hi_hi_lo_hi_hi_lo,logic_out_hi_hi_lo_hi_lo_hi,
    logic_out_hi_hi_lo_hi_lo_lo,logic_out_hi_hi_lo_lo_hi_hi,logic_out_hi_hi_lo_lo_hi_lo,logic_out_hi_hi_lo_lo_lo_hi,
    logic_out_hi_hi_lo_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [31:0] logic_out_hi = {logic_out_hi_hi_hi_hi_hi_hi,logic_out_hi_hi_hi_hi_hi_lo,logic_out_hi_hi_hi_hi_lo_hi,
    logic_out_hi_hi_hi_hi_lo_lo,logic_out_hi_hi_hi_lo_hi_hi,logic_out_hi_hi_hi_lo_hi_lo,logic_out_hi_hi_hi_lo_lo_hi,
    logic_out_hi_hi_hi_lo_lo_lo,logic_out_hi_hi_lo,logic_out_hi_lo}; // @[Cat.scala 30:58]
  wire [63:0] logic_out = {logic_out_hi,logic_out_lo}; // @[Cat.scala 30:58]
  wire  unsigned_ = cam_a_0_bits_param[1]; // @[AtomicAutomata.scala 117:42]
  wire  take_max = cam_a_0_bits_param[0]; // @[AtomicAutomata.scala 118:42]
  wire  adder = cam_a_0_bits_param[2]; // @[AtomicAutomata.scala 119:39]
  wire [7:0] _signSel_T = ~cam_a_0_bits_mask; // @[AtomicAutomata.scala 121:25]
  wire [7:0] _GEN_39 = {{1'd0}, cam_a_0_bits_mask[7:1]}; // @[AtomicAutomata.scala 121:31]
  wire [7:0] _signSel_T_2 = _signSel_T | _GEN_39; // @[AtomicAutomata.scala 121:31]
  wire [7:0] signSel = ~_signSel_T_2; // @[AtomicAutomata.scala 121:23]
  wire [7:0] signbits_a = {indexes_hi_63,indexes_hi_55,indexes_hi_47,indexes_hi_39,indexes_hi_31,indexes_hi_23,
    indexes_hi_15,indexes_hi_7}; // @[Cat.scala 30:58]
  wire [7:0] signbits_d = {indexes_lo_63,indexes_lo_55,indexes_lo_47,indexes_lo_39,indexes_lo_31,indexes_lo_23,
    indexes_lo_15,indexes_lo_7}; // @[Cat.scala 30:58]
  wire [7:0] _signbit_a_T = signbits_a & signSel; // @[AtomicAutomata.scala 125:38]
  wire [8:0] _signbit_a_T_1 = {_signbit_a_T, 1'h0}; // @[AtomicAutomata.scala 125:49]
  wire [7:0] signbit_a = _signbit_a_T_1[7:0]; // @[AtomicAutomata.scala 125:54]
  wire [7:0] _signbit_d_T = signbits_d & signSel; // @[AtomicAutomata.scala 126:38]
  wire [8:0] _signbit_d_T_1 = {_signbit_d_T, 1'h0}; // @[AtomicAutomata.scala 126:49]
  wire [7:0] signbit_d = _signbit_d_T_1[7:0]; // @[AtomicAutomata.scala 126:54]
  wire [8:0] _signext_a_T = {signbit_a, 1'h0}; // @[package.scala 244:48]
  wire [7:0] _signext_a_T_2 = signbit_a | _signext_a_T[7:0]; // @[package.scala 244:43]
  wire [9:0] _signext_a_T_3 = {_signext_a_T_2, 2'h0}; // @[package.scala 244:48]
  wire [7:0] _signext_a_T_5 = _signext_a_T_2 | _signext_a_T_3[7:0]; // @[package.scala 244:43]
  wire [11:0] _signext_a_T_6 = {_signext_a_T_5, 4'h0}; // @[package.scala 244:48]
  wire [7:0] _signext_a_T_8 = _signext_a_T_5 | _signext_a_T_6[7:0]; // @[package.scala 244:43]
  wire [7:0] signext_a_lo_lo_lo = _signext_a_T_8[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] signext_a_lo_lo_hi = _signext_a_T_8[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] signext_a_lo_hi_lo = _signext_a_T_8[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] signext_a_lo_hi_hi = _signext_a_T_8[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] signext_a_hi_lo_lo = _signext_a_T_8[4] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] signext_a_hi_lo_hi = _signext_a_T_8[5] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] signext_a_hi_hi_lo = _signext_a_T_8[6] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] signext_a_hi_hi_hi = _signext_a_T_8[7] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [63:0] signext_a = {signext_a_hi_hi_hi,signext_a_hi_hi_lo,signext_a_hi_lo_hi,signext_a_hi_lo_lo,
    signext_a_lo_hi_hi,signext_a_lo_hi_lo,signext_a_lo_lo_hi,signext_a_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [8:0] _signext_d_T = {signbit_d, 1'h0}; // @[package.scala 244:48]
  wire [7:0] _signext_d_T_2 = signbit_d | _signext_d_T[7:0]; // @[package.scala 244:43]
  wire [9:0] _signext_d_T_3 = {_signext_d_T_2, 2'h0}; // @[package.scala 244:48]
  wire [7:0] _signext_d_T_5 = _signext_d_T_2 | _signext_d_T_3[7:0]; // @[package.scala 244:43]
  wire [11:0] _signext_d_T_6 = {_signext_d_T_5, 4'h0}; // @[package.scala 244:48]
  wire [7:0] _signext_d_T_8 = _signext_d_T_5 | _signext_d_T_6[7:0]; // @[package.scala 244:43]
  wire [7:0] signext_d_lo_lo_lo = _signext_d_T_8[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] signext_d_lo_lo_hi = _signext_d_T_8[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] signext_d_lo_hi_lo = _signext_d_T_8[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] signext_d_lo_hi_hi = _signext_d_T_8[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] signext_d_hi_lo_lo = _signext_d_T_8[4] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] signext_d_hi_lo_hi = _signext_d_T_8[5] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] signext_d_hi_hi_lo = _signext_d_T_8[6] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] signext_d_hi_hi_hi = _signext_d_T_8[7] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [63:0] signext_d = {signext_d_hi_hi_hi,signext_d_hi_hi_lo,signext_d_hi_lo_hi,signext_d_hi_lo_lo,
    signext_d_lo_hi_hi,signext_d_lo_hi_lo,signext_d_lo_lo_hi,signext_d_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [7:0] wide_mask_lo_lo_lo = cam_a_0_bits_mask[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] wide_mask_lo_lo_hi = cam_a_0_bits_mask[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] wide_mask_lo_hi_lo = cam_a_0_bits_mask[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] wide_mask_lo_hi_hi = cam_a_0_bits_mask[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] wide_mask_hi_lo_lo = cam_a_0_bits_mask[4] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] wide_mask_hi_lo_hi = cam_a_0_bits_mask[5] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] wide_mask_hi_hi_lo = cam_a_0_bits_mask[6] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] wide_mask_hi_hi_hi = cam_a_0_bits_mask[7] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [63:0] wide_mask = {wide_mask_hi_hi_hi,wide_mask_hi_hi_lo,wide_mask_hi_lo_hi,wide_mask_hi_lo_lo,
    wide_mask_lo_hi_hi,wide_mask_lo_hi_lo,wide_mask_lo_lo_hi,wide_mask_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [63:0] _a_a_ext_T = cam_a_0_bits_data & wide_mask; // @[AtomicAutomata.scala 131:28]
  wire [63:0] a_a_ext = _a_a_ext_T | signext_a; // @[AtomicAutomata.scala 131:41]
  wire [63:0] _a_d_ext_T = cam_d_0_data & wide_mask; // @[AtomicAutomata.scala 132:28]
  wire [63:0] a_d_ext = _a_d_ext_T | signext_d; // @[AtomicAutomata.scala 132:41]
  wire [63:0] _a_d_inv_T = ~a_d_ext; // @[AtomicAutomata.scala 133:43]
  wire [63:0] a_d_inv = adder ? a_d_ext : _a_d_inv_T; // @[AtomicAutomata.scala 133:26]
  wire [63:0] adder_out = a_a_ext + a_d_inv; // @[AtomicAutomata.scala 134:33]
  wire  a_bigger_uneq = unsigned_ == a_a_ext[63]; // @[AtomicAutomata.scala 136:38]
  wire  a_bigger = a_a_ext[63] == a_d_ext[63] ? ~adder_out[63] : a_bigger_uneq; // @[AtomicAutomata.scala 137:27]
  wire  pick_a = take_max == a_bigger; // @[AtomicAutomata.scala 138:31]
  wire [63:0] _arith_out_T = pick_a ? cam_a_0_bits_data : cam_d_0_data; // @[AtomicAutomata.scala 139:50]
  wire [63:0] arith_out = adder ? adder_out : _arith_out_T; // @[AtomicAutomata.scala 139:28]
  wire [63:0] amo_data = cam_a_0_bits_opcode[0] ? logic_out : arith_out; // @[AtomicAutomata.scala 145:14]
  wire  a_allow = ~cam_abusy_0 & (a_isSupported | cam_free_0); // @[AtomicAutomata.scala 149:35]
  reg [2:0] beatsLeft; // @[Arbiter.scala 87:30]
  wire  idle = beatsLeft == 3'h0; // @[Arbiter.scala 88:28]
  wire  source_i_valid = auto_in_a_valid & a_allow; // @[AtomicAutomata.scala 151:38]
  wire [1:0] _readys_T = {source_i_valid,cam_amo_0}; // @[Cat.scala 30:58]
  wire [2:0] _readys_T_1 = {_readys_T, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _readys_T_3 = _readys_T | _readys_T_1[1:0]; // @[package.scala 244:43]
  wire [2:0] _readys_T_5 = {_readys_T_3, 1'h0}; // @[Arbiter.scala 16:78]
  wire [1:0] _readys_T_7 = ~_readys_T_5[1:0]; // @[Arbiter.scala 16:61]
  wire  readys_1 = _readys_T_7[1]; // @[Arbiter.scala 95:86]
  reg  state_1; // @[Arbiter.scala 116:26]
  wire  allowed_1 = idle ? readys_1 : state_1; // @[Arbiter.scala 121:24]
  wire  out_1_ready = auto_out_a_ready & allowed_1; // @[Arbiter.scala 123:31]
  wire  _T = ~a_isSupported; // @[AtomicAutomata.scala 153:15]
  wire [2:0] source_i_bits_opcode = ~a_isSupported ? 3'h4 : auto_in_a_bits_opcode; // @[AtomicAutomata.scala 153:31 AtomicAutomata.scala 154:32 AtomicAutomata.scala 152:24]
  wire [2:0] source_i_bits_param = ~a_isSupported ? 3'h0 : auto_in_a_bits_param; // @[AtomicAutomata.scala 153:31 AtomicAutomata.scala 155:32 AtomicAutomata.scala 152:24]
  wire  source_c_bits_a_corrupt = cam_a_0_bits_corrupt | cam_d_0_corrupt; // @[AtomicAutomata.scala 166:45]
  wire [1:0] source_c_bits_a_mask_sizeOH_shiftAmount = cam_a_0_bits_size[1:0]; // @[OneHot.scala 64:49]
  wire [3:0] _source_c_bits_a_mask_sizeOH_T_1 = 4'h1 << source_c_bits_a_mask_sizeOH_shiftAmount; // @[OneHot.scala 65:12]
  wire [2:0] source_c_bits_a_mask_sizeOH = _source_c_bits_a_mask_sizeOH_T_1[2:0] | 3'h1; // @[Misc.scala 201:81]
  wire  _source_c_bits_a_mask_T = cam_a_0_bits_size >= 3'h3; // @[Misc.scala 205:21]
  wire  source_c_bits_a_mask_size = source_c_bits_a_mask_sizeOH[2]; // @[Misc.scala 208:26]
  wire  source_c_bits_a_mask_bit = cam_a_0_bits_address[2]; // @[Misc.scala 209:26]
  wire  source_c_bits_a_mask_nbit = ~source_c_bits_a_mask_bit; // @[Misc.scala 210:20]
  wire  source_c_bits_a_mask_acc = _source_c_bits_a_mask_T | source_c_bits_a_mask_size & source_c_bits_a_mask_nbit; // @[Misc.scala 214:29]
  wire  source_c_bits_a_mask_acc_1 = _source_c_bits_a_mask_T | source_c_bits_a_mask_size & source_c_bits_a_mask_bit; // @[Misc.scala 214:29]
  wire  source_c_bits_a_mask_size_1 = source_c_bits_a_mask_sizeOH[1]; // @[Misc.scala 208:26]
  wire  source_c_bits_a_mask_bit_1 = cam_a_0_bits_address[1]; // @[Misc.scala 209:26]
  wire  source_c_bits_a_mask_nbit_1 = ~source_c_bits_a_mask_bit_1; // @[Misc.scala 210:20]
  wire  source_c_bits_a_mask_eq_2 = source_c_bits_a_mask_nbit & source_c_bits_a_mask_nbit_1; // @[Misc.scala 213:27]
  wire  source_c_bits_a_mask_acc_2 = source_c_bits_a_mask_acc | source_c_bits_a_mask_size_1 & source_c_bits_a_mask_eq_2; // @[Misc.scala 214:29]
  wire  source_c_bits_a_mask_eq_3 = source_c_bits_a_mask_nbit & source_c_bits_a_mask_bit_1; // @[Misc.scala 213:27]
  wire  source_c_bits_a_mask_acc_3 = source_c_bits_a_mask_acc | source_c_bits_a_mask_size_1 & source_c_bits_a_mask_eq_3; // @[Misc.scala 214:29]
  wire  source_c_bits_a_mask_eq_4 = source_c_bits_a_mask_bit & source_c_bits_a_mask_nbit_1; // @[Misc.scala 213:27]
  wire  source_c_bits_a_mask_acc_4 = source_c_bits_a_mask_acc_1 | source_c_bits_a_mask_size_1 &
    source_c_bits_a_mask_eq_4; // @[Misc.scala 214:29]
  wire  source_c_bits_a_mask_eq_5 = source_c_bits_a_mask_bit & source_c_bits_a_mask_bit_1; // @[Misc.scala 213:27]
  wire  source_c_bits_a_mask_acc_5 = source_c_bits_a_mask_acc_1 | source_c_bits_a_mask_size_1 &
    source_c_bits_a_mask_eq_5; // @[Misc.scala 214:29]
  wire  source_c_bits_a_mask_size_2 = source_c_bits_a_mask_sizeOH[0]; // @[Misc.scala 208:26]
  wire  source_c_bits_a_mask_bit_2 = cam_a_0_bits_address[0]; // @[Misc.scala 209:26]
  wire  source_c_bits_a_mask_nbit_2 = ~source_c_bits_a_mask_bit_2; // @[Misc.scala 210:20]
  wire  source_c_bits_a_mask_eq_6 = source_c_bits_a_mask_eq_2 & source_c_bits_a_mask_nbit_2; // @[Misc.scala 213:27]
  wire  source_c_bits_a_mask_lo_lo_lo = source_c_bits_a_mask_acc_2 | source_c_bits_a_mask_size_2 &
    source_c_bits_a_mask_eq_6; // @[Misc.scala 214:29]
  wire  source_c_bits_a_mask_eq_7 = source_c_bits_a_mask_eq_2 & source_c_bits_a_mask_bit_2; // @[Misc.scala 213:27]
  wire  source_c_bits_a_mask_lo_lo_hi = source_c_bits_a_mask_acc_2 | source_c_bits_a_mask_size_2 &
    source_c_bits_a_mask_eq_7; // @[Misc.scala 214:29]
  wire  source_c_bits_a_mask_eq_8 = source_c_bits_a_mask_eq_3 & source_c_bits_a_mask_nbit_2; // @[Misc.scala 213:27]
  wire  source_c_bits_a_mask_lo_hi_lo = source_c_bits_a_mask_acc_3 | source_c_bits_a_mask_size_2 &
    source_c_bits_a_mask_eq_8; // @[Misc.scala 214:29]
  wire  source_c_bits_a_mask_eq_9 = source_c_bits_a_mask_eq_3 & source_c_bits_a_mask_bit_2; // @[Misc.scala 213:27]
  wire  source_c_bits_a_mask_lo_hi_hi = source_c_bits_a_mask_acc_3 | source_c_bits_a_mask_size_2 &
    source_c_bits_a_mask_eq_9; // @[Misc.scala 214:29]
  wire  source_c_bits_a_mask_eq_10 = source_c_bits_a_mask_eq_4 & source_c_bits_a_mask_nbit_2; // @[Misc.scala 213:27]
  wire  source_c_bits_a_mask_hi_lo_lo = source_c_bits_a_mask_acc_4 | source_c_bits_a_mask_size_2 &
    source_c_bits_a_mask_eq_10; // @[Misc.scala 214:29]
  wire  source_c_bits_a_mask_eq_11 = source_c_bits_a_mask_eq_4 & source_c_bits_a_mask_bit_2; // @[Misc.scala 213:27]
  wire  source_c_bits_a_mask_hi_lo_hi = source_c_bits_a_mask_acc_4 | source_c_bits_a_mask_size_2 &
    source_c_bits_a_mask_eq_11; // @[Misc.scala 214:29]
  wire  source_c_bits_a_mask_eq_12 = source_c_bits_a_mask_eq_5 & source_c_bits_a_mask_nbit_2; // @[Misc.scala 213:27]
  wire  source_c_bits_a_mask_hi_hi_lo = source_c_bits_a_mask_acc_5 | source_c_bits_a_mask_size_2 &
    source_c_bits_a_mask_eq_12; // @[Misc.scala 214:29]
  wire  source_c_bits_a_mask_eq_13 = source_c_bits_a_mask_eq_5 & source_c_bits_a_mask_bit_2; // @[Misc.scala 213:27]
  wire  source_c_bits_a_mask_hi_hi_hi = source_c_bits_a_mask_acc_5 | source_c_bits_a_mask_size_2 &
    source_c_bits_a_mask_eq_13; // @[Misc.scala 214:29]
  wire [7:0] source_c_bits_a_mask = {source_c_bits_a_mask_hi_hi_hi,source_c_bits_a_mask_hi_hi_lo,
    source_c_bits_a_mask_hi_lo_hi,source_c_bits_a_mask_hi_lo_lo,source_c_bits_a_mask_lo_hi_hi,
    source_c_bits_a_mask_lo_hi_lo,source_c_bits_a_mask_lo_lo_hi,source_c_bits_a_mask_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [12:0] _decode_T_1 = 13'h3f << auto_in_a_bits_size; // @[package.scala 234:77]
  wire [5:0] _decode_T_3 = ~_decode_T_1[5:0]; // @[package.scala 234:46]
  wire [2:0] decode = _decode_T_3[5:3]; // @[Edges.scala 219:59]
  wire  opdata = ~auto_in_a_bits_opcode[2]; // @[Edges.scala 91:28]
  wire  latch = idle & auto_out_a_ready; // @[Arbiter.scala 89:24]
  wire  readys_0 = _readys_T_7[0]; // @[Arbiter.scala 95:86]
  wire  earlyWinner_0 = readys_0 & cam_amo_0; // @[Arbiter.scala 97:79]
  wire  earlyWinner_1 = readys_1 & source_i_valid; // @[Arbiter.scala 97:79]
  wire  _prefixOR_T = earlyWinner_0 | earlyWinner_1; // @[Arbiter.scala 104:53]
  wire  _T_12 = cam_amo_0 | source_i_valid; // @[Arbiter.scala 107:36]
  wire  _T_13 = ~(cam_amo_0 | source_i_valid); // @[Arbiter.scala 107:15]
  reg  state_0; // @[Arbiter.scala 116:26]
  wire  muxStateEarly_0 = idle ? earlyWinner_0 : state_0; // @[Arbiter.scala 117:30]
  wire  muxStateEarly_1 = idle ? earlyWinner_1 : state_1; // @[Arbiter.scala 117:30]
  wire  _sink_ACancel_earlyValid_T_3 = state_0 & cam_amo_0 | state_1 & source_i_valid; // @[Mux.scala 27:72]
  wire  sink_ACancel_earlyValid = idle ? _T_12 : _sink_ACancel_earlyValid_T_3; // @[Arbiter.scala 125:29]
  wire  _beatsLeft_T_2 = auto_out_a_ready & sink_ACancel_earlyValid; // @[ReadyValidCancel.scala 50:33]
  wire [2:0] _GEN_40 = {{2'd0}, _beatsLeft_T_2}; // @[Arbiter.scala 113:52]
  wire [2:0] _beatsLeft_T_4 = beatsLeft - _GEN_40; // @[Arbiter.scala 113:52]
  wire  allowed_0 = idle ? readys_0 : state_0; // @[Arbiter.scala 121:24]
  wire  out_ready = auto_out_a_ready & allowed_0; // @[Arbiter.scala 123:31]
  wire [63:0] _T_29 = muxStateEarly_0 ? amo_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_30 = muxStateEarly_1 ? auto_in_a_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_32 = muxStateEarly_0 ? source_c_bits_a_mask : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_33 = muxStateEarly_1 ? auto_in_a_bits_mask : 8'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_35 = muxStateEarly_0 ? cam_a_0_bits_address : 31'h0; // @[Mux.scala 27:72]
  wire [30:0] _T_36 = muxStateEarly_1 ? auto_in_a_bits_address : 31'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_38 = muxStateEarly_0 ? cam_a_0_bits_source : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_39 = muxStateEarly_1 ? auto_in_a_bits_source : 5'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_41 = muxStateEarly_0 ? cam_a_0_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_42 = muxStateEarly_1 ? auto_in_a_bits_size : 3'h0; // @[Mux.scala 27:72]
  wire  _T_50 = out_1_ready & source_i_valid; // @[Decoupled.scala 40:37]
  wire [2:0] _GEN_41 = {{1'd0}, auto_in_a_bits_param[1:0]}; // @[Mux.scala 80:60]
  wire [3:0] _cam_a_0_lut_T_2 = 3'h1 == _GEN_41 ? 4'he : 4'h8; // @[Mux.scala 80:57]
  wire [1:0] _GEN_12 = cam_free_0 ? 2'h3 : cam_s_0_state; // @[AtomicAutomata.scala 187:23 AtomicAutomata.scala 188:23 AtomicAutomata.scala 76:28]
  wire [1:0] _GEN_23 = _T_50 & _T ? _GEN_12 : cam_s_0_state; // @[AtomicAutomata.scala 174:50 AtomicAutomata.scala 76:28]
  wire  _T_53 = out_ready & cam_amo_0; // @[Decoupled.scala 40:37]
  wire [1:0] _GEN_24 = cam_amo_0 ? 2'h1 : _GEN_23; // @[AtomicAutomata.scala 196:23 AtomicAutomata.scala 197:23]
  wire [1:0] _GEN_25 = _T_53 ? _GEN_24 : _GEN_23; // @[AtomicAutomata.scala 194:32]
  reg [2:0] d_first_counter; // @[Edges.scala 228:27]
  wire  d_first = d_first_counter == 3'h0; // @[Edges.scala 230:25]
  wire  d_ackd = auto_out_d_bits_opcode == 3'h1; // @[AtomicAutomata.scala 213:40]
  wire  d_cam_sel_raw_0 = cam_a_0_bits_source == auto_out_d_bits_source; // @[AtomicAutomata.scala 204:53]
  wire  d_cam_sel_match_0 = d_cam_sel_raw_0 & cam_dmatch_0; // @[AtomicAutomata.scala 205:83]
  wire  d_drop = d_first & d_ackd & d_cam_sel_match_0; // @[AtomicAutomata.scala 232:40]
  wire  bundleOut_0_d_ready = auto_in_d_ready | d_drop; // @[AtomicAutomata.scala 236:35]
  wire  _d_first_T = bundleOut_0_d_ready & auto_out_d_valid; // @[Decoupled.scala 40:37]
  wire [12:0] _d_first_beats1_decode_T_1 = 13'h3f << auto_out_d_bits_size; // @[package.scala 234:77]
  wire [5:0] _d_first_beats1_decode_T_3 = ~_d_first_beats1_decode_T_1[5:0]; // @[package.scala 234:46]
  wire [2:0] d_first_beats1_decode = _d_first_beats1_decode_T_3[5:3]; // @[Edges.scala 219:59]
  wire  d_first_beats1_opdata = auto_out_d_bits_opcode[0]; // @[Edges.scala 105:36]
  wire [2:0] d_first_counter1 = d_first_counter - 3'h1; // @[Edges.scala 229:28]
  wire  d_ack = auto_out_d_bits_opcode == 3'h0; // @[AtomicAutomata.scala 214:40]
  wire  d_replace = d_first & d_ack & d_cam_sel_match_0; // @[AtomicAutomata.scala 233:42]
  TLMonitor_7 monitor ( // @[Nodes.scala 24:25]
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
  assign auto_in_a_ready = out_1_ready & a_allow; // @[AtomicAutomata.scala 150:38]
  assign auto_in_d_valid = auto_out_d_valid & ~d_drop; // @[AtomicAutomata.scala 235:35]
  assign auto_in_d_bits_opcode = d_replace ? 3'h1 : auto_out_d_bits_opcode; // @[AtomicAutomata.scala 239:26 AtomicAutomata.scala 240:28 AtomicAutomata.scala 238:19]
  assign auto_in_d_bits_param = auto_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_size = auto_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_source = auto_out_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_sink = auto_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_denied = d_replace ? cam_d_0_denied | auto_out_d_bits_denied : auto_out_d_bits_denied; // @[AtomicAutomata.scala 239:26 AtomicAutomata.scala 243:29 AtomicAutomata.scala 238:19]
  assign auto_in_d_bits_data = d_replace ? cam_d_0_data : auto_out_d_bits_data; // @[AtomicAutomata.scala 239:26 AtomicAutomata.scala 241:26 AtomicAutomata.scala 238:19]
  assign auto_in_d_bits_corrupt = d_replace ? cam_d_0_corrupt | auto_out_d_bits_denied : auto_out_d_bits_corrupt; // @[AtomicAutomata.scala 239:26 AtomicAutomata.scala 242:29 AtomicAutomata.scala 238:19]
  assign auto_out_a_valid = idle ? _T_12 : _sink_ACancel_earlyValid_T_3; // @[Arbiter.scala 125:29]
  assign auto_out_a_bits_opcode = muxStateEarly_1 ? source_i_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  assign auto_out_a_bits_param = muxStateEarly_1 ? source_i_bits_param : 3'h0; // @[Mux.scala 27:72]
  assign auto_out_a_bits_size = _T_41 | _T_42; // @[Mux.scala 27:72]
  assign auto_out_a_bits_source = _T_38 | _T_39; // @[Mux.scala 27:72]
  assign auto_out_a_bits_address = _T_35 | _T_36; // @[Mux.scala 27:72]
  assign auto_out_a_bits_mask = _T_32 | _T_33; // @[Mux.scala 27:72]
  assign auto_out_a_bits_data = _T_29 | _T_30; // @[Mux.scala 27:72]
  assign auto_out_a_bits_corrupt = muxStateEarly_0 & source_c_bits_a_corrupt | muxStateEarly_1 & auto_in_a_bits_corrupt; // @[Mux.scala 27:72]
  assign auto_out_d_ready = auto_in_d_ready | d_drop; // @[AtomicAutomata.scala 236:35]
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = out_1_ready & a_allow; // @[AtomicAutomata.scala 150:38]
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
  assign monitor_io_in_d_valid = auto_out_d_valid & ~d_drop; // @[AtomicAutomata.scala 235:35]
  assign monitor_io_in_d_bits_opcode = d_replace ? 3'h1 : auto_out_d_bits_opcode; // @[AtomicAutomata.scala 239:26 AtomicAutomata.scala 240:28 AtomicAutomata.scala 238:19]
  assign monitor_io_in_d_bits_param = auto_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_size = auto_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_source = auto_out_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_sink = auto_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_denied = d_replace ? cam_d_0_denied | auto_out_d_bits_denied : auto_out_d_bits_denied; // @[AtomicAutomata.scala 239:26 AtomicAutomata.scala 243:29 AtomicAutomata.scala 238:19]
  assign monitor_io_in_d_bits_data = d_replace ? cam_d_0_data : auto_out_d_bits_data; // @[AtomicAutomata.scala 239:26 AtomicAutomata.scala 241:26 AtomicAutomata.scala 238:19]
  assign monitor_io_in_d_bits_corrupt = d_replace ? cam_d_0_corrupt | auto_out_d_bits_denied : auto_out_d_bits_corrupt; // @[AtomicAutomata.scala 239:26 AtomicAutomata.scala 242:29 AtomicAutomata.scala 238:19]
  always @(posedge clock) begin
    if (reset) begin // @[AtomicAutomata.scala 76:28]
      cam_s_0_state <= 2'h0; // @[AtomicAutomata.scala 76:28]
    end else if (_d_first_T & d_first) begin // @[AtomicAutomata.scala 216:40]
      if (d_cam_sel_match_0) begin // @[AtomicAutomata.scala 225:23]
        if (d_ackd) begin // @[AtomicAutomata.scala 227:29]
          cam_s_0_state <= 2'h2;
        end else begin
          cam_s_0_state <= 2'h0;
        end
      end else begin
        cam_s_0_state <= _GEN_25;
      end
    end else begin
      cam_s_0_state <= _GEN_25;
    end
    if (_T_50 & _T) begin // @[AtomicAutomata.scala 174:50]
      if (cam_free_0) begin // @[AtomicAutomata.scala 176:23]
        cam_a_0_bits_opcode <= auto_in_a_bits_opcode; // @[AtomicAutomata.scala 178:24]
      end
    end
    if (_T_50 & _T) begin // @[AtomicAutomata.scala 174:50]
      if (cam_free_0) begin // @[AtomicAutomata.scala 176:23]
        cam_a_0_bits_param <= auto_in_a_bits_param; // @[AtomicAutomata.scala 178:24]
      end
    end
    if (_T_50 & _T) begin // @[AtomicAutomata.scala 174:50]
      if (cam_free_0) begin // @[AtomicAutomata.scala 176:23]
        cam_a_0_bits_size <= auto_in_a_bits_size; // @[AtomicAutomata.scala 178:24]
      end
    end
    if (_T_50 & _T) begin // @[AtomicAutomata.scala 174:50]
      if (cam_free_0) begin // @[AtomicAutomata.scala 176:23]
        cam_a_0_bits_source <= auto_in_a_bits_source; // @[AtomicAutomata.scala 178:24]
      end
    end
    if (_T_50 & _T) begin // @[AtomicAutomata.scala 174:50]
      if (cam_free_0) begin // @[AtomicAutomata.scala 176:23]
        cam_a_0_bits_address <= auto_in_a_bits_address; // @[AtomicAutomata.scala 178:24]
      end
    end
    if (_T_50 & _T) begin // @[AtomicAutomata.scala 174:50]
      if (cam_free_0) begin // @[AtomicAutomata.scala 176:23]
        cam_a_0_bits_mask <= auto_in_a_bits_mask; // @[AtomicAutomata.scala 178:24]
      end
    end
    if (_T_50 & _T) begin // @[AtomicAutomata.scala 174:50]
      if (cam_free_0) begin // @[AtomicAutomata.scala 176:23]
        cam_a_0_bits_data <= auto_in_a_bits_data; // @[AtomicAutomata.scala 178:24]
      end
    end
    if (_T_50 & _T) begin // @[AtomicAutomata.scala 174:50]
      if (cam_free_0) begin // @[AtomicAutomata.scala 176:23]
        cam_a_0_bits_corrupt <= auto_in_a_bits_corrupt; // @[AtomicAutomata.scala 178:24]
      end
    end
    if (_T_50 & _T) begin // @[AtomicAutomata.scala 174:50]
      if (cam_free_0) begin // @[AtomicAutomata.scala 176:23]
        if (3'h3 == _GEN_41) begin // @[Mux.scala 80:57]
          cam_a_0_lut <= 4'hc;
        end else if (3'h0 == _GEN_41) begin // @[Mux.scala 80:57]
          cam_a_0_lut <= 4'h6;
        end else begin
          cam_a_0_lut <= _cam_a_0_lut_T_2;
        end
      end
    end
    if (_d_first_T & d_first) begin // @[AtomicAutomata.scala 216:40]
      if (d_cam_sel_match_0 & d_ackd) begin // @[AtomicAutomata.scala 218:33]
        cam_d_0_data <= auto_out_d_bits_data; // @[AtomicAutomata.scala 219:22]
      end
    end
    if (_d_first_T & d_first) begin // @[AtomicAutomata.scala 216:40]
      if (d_cam_sel_match_0 & d_ackd) begin // @[AtomicAutomata.scala 218:33]
        cam_d_0_denied <= auto_out_d_bits_denied; // @[AtomicAutomata.scala 220:24]
      end
    end
    if (_d_first_T & d_first) begin // @[AtomicAutomata.scala 216:40]
      if (d_cam_sel_match_0 & d_ackd) begin // @[AtomicAutomata.scala 218:33]
        cam_d_0_corrupt <= auto_out_d_bits_corrupt; // @[AtomicAutomata.scala 221:25]
      end
    end
    if (reset) begin // @[Arbiter.scala 87:30]
      beatsLeft <= 3'h0; // @[Arbiter.scala 87:30]
    end else if (latch) begin // @[Arbiter.scala 113:23]
      if (earlyWinner_1) begin // @[Arbiter.scala 111:73]
        if (opdata) begin // @[Edges.scala 220:14]
          beatsLeft <= decode;
        end else begin
          beatsLeft <= 3'h0;
        end
      end else begin
        beatsLeft <= 3'h0;
      end
    end else begin
      beatsLeft <= _beatsLeft_T_4;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle) begin // @[Arbiter.scala 117:30]
      state_1 <= earlyWinner_1;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle) begin // @[Arbiter.scala 117:30]
      state_0 <= earlyWinner_0;
    end
    if (reset) begin // @[Edges.scala 228:27]
      d_first_counter <= 3'h0; // @[Edges.scala 228:27]
    end else if (_d_first_T) begin // @[Edges.scala 234:17]
      if (d_first) begin // @[Edges.scala 235:21]
        if (d_first_beats1_opdata) begin // @[Edges.scala 220:14]
          d_first_counter <= d_first_beats1_decode;
        end else begin
          d_first_counter <= 3'h0;
        end
      end else begin
        d_first_counter <= d_first_counter1;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~earlyWinner_0 | ~earlyWinner_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:105 assert((prefixOR zip earlyWinner) map { case (p,w) => !p || !w } reduce {_ && _})\n"
            ); // @[Arbiter.scala 105:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~earlyWinner_0 | ~earlyWinner_1 | reset)) begin
          $fatal; // @[Arbiter.scala 105:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(cam_amo_0 | source_i_valid) | _prefixOR_T | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:107 assert (!earlyValids.reduce(_||_) || earlyWinner.reduce(_||_))\n"
            ); // @[Arbiter.scala 107:14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(cam_amo_0 | source_i_valid) | _prefixOR_T | reset)) begin
          $fatal; // @[Arbiter.scala 107:14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_T_13 | _T_12 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:108 assert (!validQuals .reduce(_||_) || validQuals .reduce(_||_))\n"
            ); // @[Arbiter.scala 108:14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_13 | _T_12 | reset)) begin
          $fatal; // @[Arbiter.scala 108:14]
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
  cam_s_0_state = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  cam_a_0_bits_opcode = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  cam_a_0_bits_param = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  cam_a_0_bits_size = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  cam_a_0_bits_source = _RAND_4[4:0];
  _RAND_5 = {1{`RANDOM}};
  cam_a_0_bits_address = _RAND_5[30:0];
  _RAND_6 = {1{`RANDOM}};
  cam_a_0_bits_mask = _RAND_6[7:0];
  _RAND_7 = {2{`RANDOM}};
  cam_a_0_bits_data = _RAND_7[63:0];
  _RAND_8 = {1{`RANDOM}};
  cam_a_0_bits_corrupt = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  cam_a_0_lut = _RAND_9[3:0];
  _RAND_10 = {2{`RANDOM}};
  cam_d_0_data = _RAND_10[63:0];
  _RAND_11 = {1{`RANDOM}};
  cam_d_0_denied = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  cam_d_0_corrupt = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  beatsLeft = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  state_1 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  state_0 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  d_first_counter = _RAND_16[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
