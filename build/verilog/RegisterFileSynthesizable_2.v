module RegisterFileSynthesizable_2(
  input         clock,
  input         reset,
  input  [6:0]  io_read_ports_0_addr,
  output [63:0] io_read_ports_0_data,
  input  [6:0]  io_read_ports_1_addr,
  output [63:0] io_read_ports_1_data,
  input  [6:0]  io_read_ports_2_addr,
  output [63:0] io_read_ports_2_data,
  input  [6:0]  io_read_ports_3_addr,
  output [63:0] io_read_ports_3_data,
  input  [6:0]  io_read_ports_4_addr,
  output [63:0] io_read_ports_4_data,
  input  [6:0]  io_read_ports_5_addr,
  output [63:0] io_read_ports_5_data,
  input  [6:0]  io_read_ports_6_addr,
  output [63:0] io_read_ports_6_data,
  input  [6:0]  io_read_ports_7_addr,
  output [63:0] io_read_ports_7_data,
  input  [6:0]  io_read_ports_8_addr,
  output [63:0] io_read_ports_8_data,
  input         io_write_ports_0_valid,
  input  [6:0]  io_write_ports_0_bits_addr,
  input  [63:0] io_write_ports_0_bits_data,
  input         io_write_ports_1_valid,
  input  [6:0]  io_write_ports_1_bits_addr,
  input  [63:0] io_write_ports_1_bits_data,
  input         io_write_ports_2_valid,
  input  [6:0]  io_write_ports_2_bits_addr,
  input  [63:0] io_write_ports_2_bits_data
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] regfile [0:79]; // @[regfile.scala 118:20]
  wire [63:0] regfile_MPORT_data; // @[regfile.scala 118:20]
  wire [6:0] regfile_MPORT_addr; // @[regfile.scala 118:20]
  wire [63:0] regfile_MPORT_1_data; // @[regfile.scala 118:20]
  wire [6:0] regfile_MPORT_1_addr; // @[regfile.scala 118:20]
  wire [63:0] regfile_MPORT_2_data; // @[regfile.scala 118:20]
  wire [6:0] regfile_MPORT_2_addr; // @[regfile.scala 118:20]
  wire [63:0] regfile_MPORT_3_data; // @[regfile.scala 118:20]
  wire [6:0] regfile_MPORT_3_addr; // @[regfile.scala 118:20]
  wire [63:0] regfile_MPORT_4_data; // @[regfile.scala 118:20]
  wire [6:0] regfile_MPORT_4_addr; // @[regfile.scala 118:20]
  wire [63:0] regfile_MPORT_5_data; // @[regfile.scala 118:20]
  wire [6:0] regfile_MPORT_5_addr; // @[regfile.scala 118:20]
  wire [63:0] regfile_MPORT_6_data; // @[regfile.scala 118:20]
  wire [6:0] regfile_MPORT_6_addr; // @[regfile.scala 118:20]
  wire [63:0] regfile_MPORT_7_data; // @[regfile.scala 118:20]
  wire [6:0] regfile_MPORT_7_addr; // @[regfile.scala 118:20]
  wire [63:0] regfile_MPORT_8_data; // @[regfile.scala 118:20]
  wire [6:0] regfile_MPORT_8_addr; // @[regfile.scala 118:20]
  wire [63:0] regfile_MPORT_9_data; // @[regfile.scala 118:20]
  wire [6:0] regfile_MPORT_9_addr; // @[regfile.scala 118:20]
  wire  regfile_MPORT_9_mask; // @[regfile.scala 118:20]
  wire  regfile_MPORT_9_en; // @[regfile.scala 118:20]
  wire [63:0] regfile_MPORT_10_data; // @[regfile.scala 118:20]
  wire [6:0] regfile_MPORT_10_addr; // @[regfile.scala 118:20]
  wire  regfile_MPORT_10_mask; // @[regfile.scala 118:20]
  wire  regfile_MPORT_10_en; // @[regfile.scala 118:20]
  wire [63:0] regfile_MPORT_11_data; // @[regfile.scala 118:20]
  wire [6:0] regfile_MPORT_11_addr; // @[regfile.scala 118:20]
  wire  regfile_MPORT_11_mask; // @[regfile.scala 118:20]
  wire  regfile_MPORT_11_en; // @[regfile.scala 118:20]
  reg [6:0] read_addrs_0; // @[regfile.scala 126:50]
  reg [6:0] read_addrs_1; // @[regfile.scala 126:50]
  reg [6:0] read_addrs_2; // @[regfile.scala 126:50]
  reg [6:0] read_addrs_3; // @[regfile.scala 126:50]
  reg [6:0] read_addrs_4; // @[regfile.scala 126:50]
  reg [6:0] read_addrs_5; // @[regfile.scala 126:50]
  reg [6:0] read_addrs_6; // @[regfile.scala 126:50]
  reg [6:0] read_addrs_7; // @[regfile.scala 126:50]
  reg [6:0] read_addrs_8; // @[regfile.scala 126:50]
  wire  _T_18 = io_write_ports_0_bits_addr == read_addrs_0; // @[regfile.scala 147:21]
  wire  _T_19 = io_write_ports_0_valid & _T_18; // @[regfile.scala 146:59]
  wire  _T_20 = io_write_ports_1_bits_addr == read_addrs_0; // @[regfile.scala 147:21]
  wire  _T_21 = io_write_ports_1_valid & _T_20; // @[regfile.scala 146:59]
  wire  _T_22 = io_write_ports_2_bits_addr == read_addrs_0; // @[regfile.scala 147:21]
  wire  _T_23 = io_write_ports_2_valid & _T_22; // @[regfile.scala 146:59]
  wire [63:0] _T_24 = _T_19 ? io_write_ports_0_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_25 = _T_21 ? io_write_ports_1_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_26 = _T_23 ? io_write_ports_2_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_27 = _T_24 | _T_25; // @[Mux.scala 27:72]
  wire [63:0] _T_28 = _T_27 | _T_26; // @[Mux.scala 27:72]
  wire [63:0] read_data_0 = regfile_MPORT_data; // @[regfile.scala 123:23 regfile.scala 129:18]
  wire  _T_32 = io_write_ports_0_bits_addr == read_addrs_1; // @[regfile.scala 147:21]
  wire  _T_33 = io_write_ports_0_valid & _T_32; // @[regfile.scala 146:59]
  wire  _T_34 = io_write_ports_1_bits_addr == read_addrs_1; // @[regfile.scala 147:21]
  wire  _T_35 = io_write_ports_1_valid & _T_34; // @[regfile.scala 146:59]
  wire  _T_36 = io_write_ports_2_bits_addr == read_addrs_1; // @[regfile.scala 147:21]
  wire  _T_37 = io_write_ports_2_valid & _T_36; // @[regfile.scala 146:59]
  wire [63:0] _T_38 = _T_33 ? io_write_ports_0_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_39 = _T_35 ? io_write_ports_1_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_40 = _T_37 ? io_write_ports_2_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_41 = _T_38 | _T_39; // @[Mux.scala 27:72]
  wire [63:0] _T_42 = _T_41 | _T_40; // @[Mux.scala 27:72]
  wire [63:0] read_data_1 = regfile_MPORT_1_data; // @[regfile.scala 123:23 regfile.scala 129:18]
  wire  _T_46 = io_write_ports_0_bits_addr == read_addrs_2; // @[regfile.scala 147:21]
  wire  _T_47 = io_write_ports_0_valid & _T_46; // @[regfile.scala 146:59]
  wire  _T_48 = io_write_ports_1_bits_addr == read_addrs_2; // @[regfile.scala 147:21]
  wire  _T_49 = io_write_ports_1_valid & _T_48; // @[regfile.scala 146:59]
  wire  _T_50 = io_write_ports_2_bits_addr == read_addrs_2; // @[regfile.scala 147:21]
  wire  _T_51 = io_write_ports_2_valid & _T_50; // @[regfile.scala 146:59]
  wire [63:0] _T_52 = _T_47 ? io_write_ports_0_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_53 = _T_49 ? io_write_ports_1_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_54 = _T_51 ? io_write_ports_2_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_55 = _T_52 | _T_53; // @[Mux.scala 27:72]
  wire [63:0] _T_56 = _T_55 | _T_54; // @[Mux.scala 27:72]
  wire [63:0] read_data_2 = regfile_MPORT_2_data; // @[regfile.scala 123:23 regfile.scala 129:18]
  wire  _T_60 = io_write_ports_0_bits_addr == read_addrs_3; // @[regfile.scala 147:21]
  wire  _T_61 = io_write_ports_0_valid & _T_60; // @[regfile.scala 146:59]
  wire  _T_62 = io_write_ports_1_bits_addr == read_addrs_3; // @[regfile.scala 147:21]
  wire  _T_63 = io_write_ports_1_valid & _T_62; // @[regfile.scala 146:59]
  wire  _T_64 = io_write_ports_2_bits_addr == read_addrs_3; // @[regfile.scala 147:21]
  wire  _T_65 = io_write_ports_2_valid & _T_64; // @[regfile.scala 146:59]
  wire [63:0] _T_66 = _T_61 ? io_write_ports_0_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_67 = _T_63 ? io_write_ports_1_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_68 = _T_65 ? io_write_ports_2_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_69 = _T_66 | _T_67; // @[Mux.scala 27:72]
  wire [63:0] _T_70 = _T_69 | _T_68; // @[Mux.scala 27:72]
  wire [63:0] read_data_3 = regfile_MPORT_3_data; // @[regfile.scala 123:23 regfile.scala 129:18]
  wire  _T_74 = io_write_ports_0_bits_addr == read_addrs_4; // @[regfile.scala 147:21]
  wire  _T_75 = io_write_ports_0_valid & _T_74; // @[regfile.scala 146:59]
  wire  _T_76 = io_write_ports_1_bits_addr == read_addrs_4; // @[regfile.scala 147:21]
  wire  _T_77 = io_write_ports_1_valid & _T_76; // @[regfile.scala 146:59]
  wire  _T_78 = io_write_ports_2_bits_addr == read_addrs_4; // @[regfile.scala 147:21]
  wire  _T_79 = io_write_ports_2_valid & _T_78; // @[regfile.scala 146:59]
  wire [63:0] _T_80 = _T_75 ? io_write_ports_0_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_81 = _T_77 ? io_write_ports_1_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_82 = _T_79 ? io_write_ports_2_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_83 = _T_80 | _T_81; // @[Mux.scala 27:72]
  wire [63:0] _T_84 = _T_83 | _T_82; // @[Mux.scala 27:72]
  wire [63:0] read_data_4 = regfile_MPORT_4_data; // @[regfile.scala 123:23 regfile.scala 129:18]
  wire  _T_88 = io_write_ports_0_bits_addr == read_addrs_5; // @[regfile.scala 147:21]
  wire  _T_89 = io_write_ports_0_valid & _T_88; // @[regfile.scala 146:59]
  wire  _T_90 = io_write_ports_1_bits_addr == read_addrs_5; // @[regfile.scala 147:21]
  wire  _T_91 = io_write_ports_1_valid & _T_90; // @[regfile.scala 146:59]
  wire  _T_92 = io_write_ports_2_bits_addr == read_addrs_5; // @[regfile.scala 147:21]
  wire  _T_93 = io_write_ports_2_valid & _T_92; // @[regfile.scala 146:59]
  wire [63:0] _T_94 = _T_89 ? io_write_ports_0_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_95 = _T_91 ? io_write_ports_1_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_96 = _T_93 ? io_write_ports_2_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_97 = _T_94 | _T_95; // @[Mux.scala 27:72]
  wire [63:0] _T_98 = _T_97 | _T_96; // @[Mux.scala 27:72]
  wire [63:0] read_data_5 = regfile_MPORT_5_data; // @[regfile.scala 123:23 regfile.scala 129:18]
  wire  _T_102 = io_write_ports_0_bits_addr == read_addrs_6; // @[regfile.scala 147:21]
  wire  _T_103 = io_write_ports_0_valid & _T_102; // @[regfile.scala 146:59]
  wire  _T_104 = io_write_ports_1_bits_addr == read_addrs_6; // @[regfile.scala 147:21]
  wire  _T_105 = io_write_ports_1_valid & _T_104; // @[regfile.scala 146:59]
  wire  _T_106 = io_write_ports_2_bits_addr == read_addrs_6; // @[regfile.scala 147:21]
  wire  _T_107 = io_write_ports_2_valid & _T_106; // @[regfile.scala 146:59]
  wire [63:0] _T_108 = _T_103 ? io_write_ports_0_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_109 = _T_105 ? io_write_ports_1_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_110 = _T_107 ? io_write_ports_2_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_111 = _T_108 | _T_109; // @[Mux.scala 27:72]
  wire [63:0] _T_112 = _T_111 | _T_110; // @[Mux.scala 27:72]
  wire [63:0] read_data_6 = regfile_MPORT_6_data; // @[regfile.scala 123:23 regfile.scala 129:18]
  wire  _T_116 = io_write_ports_0_bits_addr == read_addrs_7; // @[regfile.scala 147:21]
  wire  _T_117 = io_write_ports_0_valid & _T_116; // @[regfile.scala 146:59]
  wire  _T_118 = io_write_ports_1_bits_addr == read_addrs_7; // @[regfile.scala 147:21]
  wire  _T_119 = io_write_ports_1_valid & _T_118; // @[regfile.scala 146:59]
  wire  _T_120 = io_write_ports_2_bits_addr == read_addrs_7; // @[regfile.scala 147:21]
  wire  _T_121 = io_write_ports_2_valid & _T_120; // @[regfile.scala 146:59]
  wire [63:0] _T_122 = _T_117 ? io_write_ports_0_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_123 = _T_119 ? io_write_ports_1_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_124 = _T_121 ? io_write_ports_2_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_125 = _T_122 | _T_123; // @[Mux.scala 27:72]
  wire [63:0] _T_126 = _T_125 | _T_124; // @[Mux.scala 27:72]
  wire [63:0] read_data_7 = regfile_MPORT_7_data; // @[regfile.scala 123:23 regfile.scala 129:18]
  wire  _T_130 = io_write_ports_0_bits_addr == read_addrs_8; // @[regfile.scala 147:21]
  wire  _T_131 = io_write_ports_0_valid & _T_130; // @[regfile.scala 146:59]
  wire  _T_132 = io_write_ports_1_bits_addr == read_addrs_8; // @[regfile.scala 147:21]
  wire  _T_133 = io_write_ports_1_valid & _T_132; // @[regfile.scala 146:59]
  wire  _T_134 = io_write_ports_2_bits_addr == read_addrs_8; // @[regfile.scala 147:21]
  wire  _T_135 = io_write_ports_2_valid & _T_134; // @[regfile.scala 146:59]
  wire [63:0] _T_136 = _T_131 ? io_write_ports_0_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_137 = _T_133 ? io_write_ports_1_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_138 = _T_135 ? io_write_ports_2_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_139 = _T_136 | _T_137; // @[Mux.scala 27:72]
  wire [63:0] _T_140 = _T_139 | _T_138; // @[Mux.scala 27:72]
  wire [63:0] read_data_8 = regfile_MPORT_8_data; // @[regfile.scala 123:23 regfile.scala 129:18]
  wire  _T_145 = ~io_write_ports_1_valid; // @[regfile.scala 173:16]
  wire  _T_146 = ~io_write_ports_0_valid | _T_145; // @[regfile.scala 172:41]
  wire  _T_147 = io_write_ports_0_bits_addr != io_write_ports_1_bits_addr; // @[regfile.scala 174:45]
  wire  _T_148 = _T_146 | _T_147; // @[regfile.scala 173:41]
  wire  _T_149 = io_write_ports_0_bits_addr == 7'h0; // @[regfile.scala 175:45]
  wire  _T_150 = _T_148 | _T_149; // @[regfile.scala 174:78]
  wire  _T_155 = ~io_write_ports_2_valid; // @[regfile.scala 173:16]
  wire  _T_156 = ~io_write_ports_0_valid | _T_155; // @[regfile.scala 172:41]
  wire  _T_157 = io_write_ports_0_bits_addr != io_write_ports_2_bits_addr; // @[regfile.scala 174:45]
  wire  _T_158 = _T_156 | _T_157; // @[regfile.scala 173:41]
  wire  _T_160 = _T_158 | _T_149; // @[regfile.scala 174:78]
  wire  _T_166 = _T_145 | _T_155; // @[regfile.scala 172:41]
  wire  _T_167 = io_write_ports_1_bits_addr != io_write_ports_2_bits_addr; // @[regfile.scala 174:45]
  wire  _T_168 = _T_166 | _T_167; // @[regfile.scala 173:41]
  wire  _T_169 = io_write_ports_1_bits_addr == 7'h0; // @[regfile.scala 175:45]
  wire  _T_170 = _T_168 | _T_169; // @[regfile.scala 174:78]
  assign regfile_MPORT_addr = read_addrs_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regfile_MPORT_data = regfile[regfile_MPORT_addr]; // @[regfile.scala 118:20]
  `else
  assign regfile_MPORT_data = regfile_MPORT_addr >= 7'h50 ? _RAND_1[63:0] : regfile[regfile_MPORT_addr]; // @[regfile.scala 118:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regfile_MPORT_1_addr = read_addrs_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regfile_MPORT_1_data = regfile[regfile_MPORT_1_addr]; // @[regfile.scala 118:20]
  `else
  assign regfile_MPORT_1_data = regfile_MPORT_1_addr >= 7'h50 ? _RAND_2[63:0] : regfile[regfile_MPORT_1_addr]; // @[regfile.scala 118:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regfile_MPORT_2_addr = read_addrs_2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regfile_MPORT_2_data = regfile[regfile_MPORT_2_addr]; // @[regfile.scala 118:20]
  `else
  assign regfile_MPORT_2_data = regfile_MPORT_2_addr >= 7'h50 ? _RAND_3[63:0] : regfile[regfile_MPORT_2_addr]; // @[regfile.scala 118:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regfile_MPORT_3_addr = read_addrs_3;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regfile_MPORT_3_data = regfile[regfile_MPORT_3_addr]; // @[regfile.scala 118:20]
  `else
  assign regfile_MPORT_3_data = regfile_MPORT_3_addr >= 7'h50 ? _RAND_4[63:0] : regfile[regfile_MPORT_3_addr]; // @[regfile.scala 118:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regfile_MPORT_4_addr = read_addrs_4;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regfile_MPORT_4_data = regfile[regfile_MPORT_4_addr]; // @[regfile.scala 118:20]
  `else
  assign regfile_MPORT_4_data = regfile_MPORT_4_addr >= 7'h50 ? _RAND_5[63:0] : regfile[regfile_MPORT_4_addr]; // @[regfile.scala 118:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regfile_MPORT_5_addr = read_addrs_5;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regfile_MPORT_5_data = regfile[regfile_MPORT_5_addr]; // @[regfile.scala 118:20]
  `else
  assign regfile_MPORT_5_data = regfile_MPORT_5_addr >= 7'h50 ? _RAND_6[63:0] : regfile[regfile_MPORT_5_addr]; // @[regfile.scala 118:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regfile_MPORT_6_addr = read_addrs_6;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regfile_MPORT_6_data = regfile[regfile_MPORT_6_addr]; // @[regfile.scala 118:20]
  `else
  assign regfile_MPORT_6_data = regfile_MPORT_6_addr >= 7'h50 ? _RAND_7[63:0] : regfile[regfile_MPORT_6_addr]; // @[regfile.scala 118:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regfile_MPORT_7_addr = read_addrs_7;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regfile_MPORT_7_data = regfile[regfile_MPORT_7_addr]; // @[regfile.scala 118:20]
  `else
  assign regfile_MPORT_7_data = regfile_MPORT_7_addr >= 7'h50 ? _RAND_8[63:0] : regfile[regfile_MPORT_7_addr]; // @[regfile.scala 118:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regfile_MPORT_8_addr = read_addrs_8;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign regfile_MPORT_8_data = regfile[regfile_MPORT_8_addr]; // @[regfile.scala 118:20]
  `else
  assign regfile_MPORT_8_data = regfile_MPORT_8_addr >= 7'h50 ? _RAND_9[63:0] : regfile[regfile_MPORT_8_addr]; // @[regfile.scala 118:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign regfile_MPORT_9_data = io_write_ports_0_bits_data;
  assign regfile_MPORT_9_addr = io_write_ports_0_bits_addr;
  assign regfile_MPORT_9_mask = 1'h1;
  assign regfile_MPORT_9_en = io_write_ports_0_valid;
  assign regfile_MPORT_10_data = io_write_ports_1_bits_data;
  assign regfile_MPORT_10_addr = io_write_ports_1_bits_addr;
  assign regfile_MPORT_10_mask = 1'h1;
  assign regfile_MPORT_10_en = io_write_ports_1_valid;
  assign regfile_MPORT_11_data = io_write_ports_2_bits_data;
  assign regfile_MPORT_11_addr = io_write_ports_2_bits_addr;
  assign regfile_MPORT_11_mask = 1'h1;
  assign regfile_MPORT_11_en = io_write_ports_2_valid;
  assign io_read_ports_0_data = _T_19 | _T_21 | _T_23 ? _T_28 : read_data_0; // @[regfile.scala 151:35]
  assign io_read_ports_1_data = _T_33 | _T_35 | _T_37 ? _T_42 : read_data_1; // @[regfile.scala 151:35]
  assign io_read_ports_2_data = _T_47 | _T_49 | _T_51 ? _T_56 : read_data_2; // @[regfile.scala 151:35]
  assign io_read_ports_3_data = _T_61 | _T_63 | _T_65 ? _T_70 : read_data_3; // @[regfile.scala 151:35]
  assign io_read_ports_4_data = _T_75 | _T_77 | _T_79 ? _T_84 : read_data_4; // @[regfile.scala 151:35]
  assign io_read_ports_5_data = _T_89 | _T_91 | _T_93 ? _T_98 : read_data_5; // @[regfile.scala 151:35]
  assign io_read_ports_6_data = _T_103 | _T_105 | _T_107 ? _T_112 : read_data_6; // @[regfile.scala 151:35]
  assign io_read_ports_7_data = _T_117 | _T_119 | _T_121 ? _T_126 : read_data_7; // @[regfile.scala 151:35]
  assign io_read_ports_8_data = _T_131 | _T_133 | _T_135 ? _T_140 : read_data_8; // @[regfile.scala 151:35]
  always @(posedge clock) begin
    if(regfile_MPORT_9_en & regfile_MPORT_9_mask) begin
      regfile[regfile_MPORT_9_addr] <= regfile_MPORT_9_data; // @[regfile.scala 118:20]
    end
    if(regfile_MPORT_10_en & regfile_MPORT_10_mask) begin
      regfile[regfile_MPORT_10_addr] <= regfile_MPORT_10_data; // @[regfile.scala 118:20]
    end
    if(regfile_MPORT_11_en & regfile_MPORT_11_mask) begin
      regfile[regfile_MPORT_11_addr] <= regfile_MPORT_11_data; // @[regfile.scala 118:20]
    end
    read_addrs_0 <= io_read_ports_0_addr; // @[regfile.scala 126:50]
    read_addrs_1 <= io_read_ports_1_addr; // @[regfile.scala 126:50]
    read_addrs_2 <= io_read_ports_2_addr; // @[regfile.scala 126:50]
    read_addrs_3 <= io_read_ports_3_addr; // @[regfile.scala 126:50]
    read_addrs_4 <= io_read_ports_4_addr; // @[regfile.scala 126:50]
    read_addrs_5 <= io_read_ports_5_addr; // @[regfile.scala 126:50]
    read_addrs_6 <= io_read_ports_6_addr; // @[regfile.scala 126:50]
    read_addrs_7 <= io_read_ports_7_addr; // @[regfile.scala 126:50]
    read_addrs_8 <= io_read_ports_8_addr; // @[regfile.scala 126:50]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_T_150 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: [regfile] too many writers a register\n    at regfile.scala:172 assert(!io.write_ports(i).valid ||\n"
            ); // @[regfile.scala 172:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_150 | reset)) begin
          $fatal; // @[regfile.scala 172:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_T_160 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: [regfile] too many writers a register\n    at regfile.scala:172 assert(!io.write_ports(i).valid ||\n"
            ); // @[regfile.scala 172:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_160 | reset)) begin
          $fatal; // @[regfile.scala 172:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_T_170 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: [regfile] too many writers a register\n    at regfile.scala:172 assert(!io.write_ports(i).valid ||\n"
            ); // @[regfile.scala 172:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_170 | reset)) begin
          $fatal; // @[regfile.scala 172:15]
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {2{`RANDOM}};
  _RAND_2 = {2{`RANDOM}};
  _RAND_3 = {2{`RANDOM}};
  _RAND_4 = {2{`RANDOM}};
  _RAND_5 = {2{`RANDOM}};
  _RAND_6 = {2{`RANDOM}};
  _RAND_7 = {2{`RANDOM}};
  _RAND_8 = {2{`RANDOM}};
  _RAND_9 = {2{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 80; initvar = initvar+1)
    regfile[initvar] = _RAND_0[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  read_addrs_0 = _RAND_10[6:0];
  _RAND_11 = {1{`RANDOM}};
  read_addrs_1 = _RAND_11[6:0];
  _RAND_12 = {1{`RANDOM}};
  read_addrs_2 = _RAND_12[6:0];
  _RAND_13 = {1{`RANDOM}};
  read_addrs_3 = _RAND_13[6:0];
  _RAND_14 = {1{`RANDOM}};
  read_addrs_4 = _RAND_14[6:0];
  _RAND_15 = {1{`RANDOM}};
  read_addrs_5 = _RAND_15[6:0];
  _RAND_16 = {1{`RANDOM}};
  read_addrs_6 = _RAND_16[6:0];
  _RAND_17 = {1{`RANDOM}};
  read_addrs_7 = _RAND_17[6:0];
  _RAND_18 = {1{`RANDOM}};
  read_addrs_8 = _RAND_18[6:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
