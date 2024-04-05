module RegisterFileSynthesizable_1(
  input         clock,
  input         reset,
  input  [5:0]  io_read_ports_0_addr,
  output [63:0] io_read_ports_0_data,
  input  [5:0]  io_read_ports_1_addr,
  output [63:0] io_read_ports_1_data,
  input  [5:0]  io_read_ports_2_addr,
  output [63:0] io_read_ports_2_data,
  input  [5:0]  io_read_ports_3_addr,
  output [63:0] io_read_ports_3_data,
  input  [5:0]  io_read_ports_4_addr,
  output [63:0] io_read_ports_4_data,
  input  [5:0]  io_read_ports_5_addr,
  output [63:0] io_read_ports_5_data,
  input         io_write_ports_0_valid,
  input  [5:0]  io_write_ports_0_bits_addr,
  input  [63:0] io_write_ports_0_bits_data,
  input         io_write_ports_1_valid,
  input  [5:0]  io_write_ports_1_bits_addr,
  input  [63:0] io_write_ports_1_bits_data,
  input         io_write_ports_2_valid,
  input  [5:0]  io_write_ports_2_bits_addr,
  input  [63:0] io_write_ports_2_bits_data
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
`endif // RANDOMIZE_REG_INIT
  reg [63:0] regfile [0:63]; // @[regfile.scala 117:20]
  wire [63:0] regfile_MPORT_data; // @[regfile.scala 117:20]
  wire [5:0] regfile_MPORT_addr; // @[regfile.scala 117:20]
  wire [63:0] regfile_MPORT_1_data; // @[regfile.scala 117:20]
  wire [5:0] regfile_MPORT_1_addr; // @[regfile.scala 117:20]
  wire [63:0] regfile_MPORT_2_data; // @[regfile.scala 117:20]
  wire [5:0] regfile_MPORT_2_addr; // @[regfile.scala 117:20]
  wire [63:0] regfile_MPORT_3_data; // @[regfile.scala 117:20]
  wire [5:0] regfile_MPORT_3_addr; // @[regfile.scala 117:20]
  wire [63:0] regfile_MPORT_4_data; // @[regfile.scala 117:20]
  wire [5:0] regfile_MPORT_4_addr; // @[regfile.scala 117:20]
  wire [63:0] regfile_MPORT_5_data; // @[regfile.scala 117:20]
  wire [5:0] regfile_MPORT_5_addr; // @[regfile.scala 117:20]
  wire [63:0] regfile_MPORT_6_data; // @[regfile.scala 117:20]
  wire [5:0] regfile_MPORT_6_addr; // @[regfile.scala 117:20]
  wire  regfile_MPORT_6_mask; // @[regfile.scala 117:20]
  wire  regfile_MPORT_6_en; // @[regfile.scala 117:20]
  wire [63:0] regfile_MPORT_7_data; // @[regfile.scala 117:20]
  wire [5:0] regfile_MPORT_7_addr; // @[regfile.scala 117:20]
  wire  regfile_MPORT_7_mask; // @[regfile.scala 117:20]
  wire  regfile_MPORT_7_en; // @[regfile.scala 117:20]
  wire [63:0] regfile_MPORT_8_data; // @[regfile.scala 117:20]
  wire [5:0] regfile_MPORT_8_addr; // @[regfile.scala 117:20]
  wire  regfile_MPORT_8_mask; // @[regfile.scala 117:20]
  wire  regfile_MPORT_8_en; // @[regfile.scala 117:20]
  reg [5:0] read_addrs_0; // @[regfile.scala 125:50]
  reg [5:0] read_addrs_1; // @[regfile.scala 125:50]
  reg [5:0] read_addrs_2; // @[regfile.scala 125:50]
  reg [5:0] read_addrs_3; // @[regfile.scala 125:50]
  reg [5:0] read_addrs_4; // @[regfile.scala 125:50]
  reg [5:0] read_addrs_5; // @[regfile.scala 125:50]
  wire  _T_12 = io_write_ports_0_bits_addr == read_addrs_0; // @[regfile.scala 146:21]
  wire  _T_13 = io_write_ports_0_valid & _T_12; // @[regfile.scala 145:59]
  wire  _T_14 = io_write_ports_1_bits_addr == read_addrs_0; // @[regfile.scala 146:21]
  wire  _T_15 = io_write_ports_1_valid & _T_14; // @[regfile.scala 145:59]
  wire  _T_16 = io_write_ports_2_bits_addr == read_addrs_0; // @[regfile.scala 146:21]
  wire  _T_17 = io_write_ports_2_valid & _T_16; // @[regfile.scala 145:59]
  wire [63:0] _T_18 = _T_13 ? io_write_ports_0_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_19 = _T_15 ? io_write_ports_1_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_20 = _T_17 ? io_write_ports_2_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_21 = _T_18 | _T_19; // @[Mux.scala 27:72]
  wire [63:0] _T_22 = _T_21 | _T_20; // @[Mux.scala 27:72]
  wire [63:0] read_data_0 = regfile_MPORT_data; // @[regfile.scala 122:23 regfile.scala 128:18]
  wire  _T_26 = io_write_ports_0_bits_addr == read_addrs_1; // @[regfile.scala 146:21]
  wire  _T_27 = io_write_ports_0_valid & _T_26; // @[regfile.scala 145:59]
  wire  _T_28 = io_write_ports_1_bits_addr == read_addrs_1; // @[regfile.scala 146:21]
  wire  _T_29 = io_write_ports_1_valid & _T_28; // @[regfile.scala 145:59]
  wire  _T_30 = io_write_ports_2_bits_addr == read_addrs_1; // @[regfile.scala 146:21]
  wire  _T_31 = io_write_ports_2_valid & _T_30; // @[regfile.scala 145:59]
  wire [63:0] _T_32 = _T_27 ? io_write_ports_0_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_33 = _T_29 ? io_write_ports_1_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_34 = _T_31 ? io_write_ports_2_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_35 = _T_32 | _T_33; // @[Mux.scala 27:72]
  wire [63:0] _T_36 = _T_35 | _T_34; // @[Mux.scala 27:72]
  wire [63:0] read_data_1 = regfile_MPORT_1_data; // @[regfile.scala 122:23 regfile.scala 128:18]
  wire  _T_40 = io_write_ports_0_bits_addr == read_addrs_2; // @[regfile.scala 146:21]
  wire  _T_41 = io_write_ports_0_valid & _T_40; // @[regfile.scala 145:59]
  wire  _T_42 = io_write_ports_1_bits_addr == read_addrs_2; // @[regfile.scala 146:21]
  wire  _T_43 = io_write_ports_1_valid & _T_42; // @[regfile.scala 145:59]
  wire  _T_44 = io_write_ports_2_bits_addr == read_addrs_2; // @[regfile.scala 146:21]
  wire  _T_45 = io_write_ports_2_valid & _T_44; // @[regfile.scala 145:59]
  wire [63:0] _T_46 = _T_41 ? io_write_ports_0_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_47 = _T_43 ? io_write_ports_1_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_48 = _T_45 ? io_write_ports_2_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_49 = _T_46 | _T_47; // @[Mux.scala 27:72]
  wire [63:0] _T_50 = _T_49 | _T_48; // @[Mux.scala 27:72]
  wire [63:0] read_data_2 = regfile_MPORT_2_data; // @[regfile.scala 122:23 regfile.scala 128:18]
  wire  _T_54 = io_write_ports_0_bits_addr == read_addrs_3; // @[regfile.scala 146:21]
  wire  _T_55 = io_write_ports_0_valid & _T_54; // @[regfile.scala 145:59]
  wire  _T_56 = io_write_ports_1_bits_addr == read_addrs_3; // @[regfile.scala 146:21]
  wire  _T_57 = io_write_ports_1_valid & _T_56; // @[regfile.scala 145:59]
  wire  _T_58 = io_write_ports_2_bits_addr == read_addrs_3; // @[regfile.scala 146:21]
  wire  _T_59 = io_write_ports_2_valid & _T_58; // @[regfile.scala 145:59]
  wire [63:0] _T_60 = _T_55 ? io_write_ports_0_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_61 = _T_57 ? io_write_ports_1_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_62 = _T_59 ? io_write_ports_2_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_63 = _T_60 | _T_61; // @[Mux.scala 27:72]
  wire [63:0] _T_64 = _T_63 | _T_62; // @[Mux.scala 27:72]
  wire [63:0] read_data_3 = regfile_MPORT_3_data; // @[regfile.scala 122:23 regfile.scala 128:18]
  wire  _T_68 = io_write_ports_0_bits_addr == read_addrs_4; // @[regfile.scala 146:21]
  wire  _T_69 = io_write_ports_0_valid & _T_68; // @[regfile.scala 145:59]
  wire  _T_70 = io_write_ports_1_bits_addr == read_addrs_4; // @[regfile.scala 146:21]
  wire  _T_71 = io_write_ports_1_valid & _T_70; // @[regfile.scala 145:59]
  wire  _T_72 = io_write_ports_2_bits_addr == read_addrs_4; // @[regfile.scala 146:21]
  wire  _T_73 = io_write_ports_2_valid & _T_72; // @[regfile.scala 145:59]
  wire [63:0] _T_74 = _T_69 ? io_write_ports_0_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_75 = _T_71 ? io_write_ports_1_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_76 = _T_73 ? io_write_ports_2_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_77 = _T_74 | _T_75; // @[Mux.scala 27:72]
  wire [63:0] _T_78 = _T_77 | _T_76; // @[Mux.scala 27:72]
  wire [63:0] read_data_4 = regfile_MPORT_4_data; // @[regfile.scala 122:23 regfile.scala 128:18]
  wire  _T_82 = io_write_ports_0_bits_addr == read_addrs_5; // @[regfile.scala 146:21]
  wire  _T_83 = io_write_ports_0_valid & _T_82; // @[regfile.scala 145:59]
  wire  _T_84 = io_write_ports_1_bits_addr == read_addrs_5; // @[regfile.scala 146:21]
  wire  _T_85 = io_write_ports_1_valid & _T_84; // @[regfile.scala 145:59]
  wire  _T_86 = io_write_ports_2_bits_addr == read_addrs_5; // @[regfile.scala 146:21]
  wire  _T_87 = io_write_ports_2_valid & _T_86; // @[regfile.scala 145:59]
  wire [63:0] _T_88 = _T_83 ? io_write_ports_0_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_89 = _T_85 ? io_write_ports_1_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_90 = _T_87 ? io_write_ports_2_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_91 = _T_88 | _T_89; // @[Mux.scala 27:72]
  wire [63:0] _T_92 = _T_91 | _T_90; // @[Mux.scala 27:72]
  wire [63:0] read_data_5 = regfile_MPORT_5_data; // @[regfile.scala 122:23 regfile.scala 128:18]
  wire  _T_97 = ~io_write_ports_1_valid; // @[regfile.scala 172:16]
  wire  _T_98 = ~io_write_ports_0_valid | _T_97; // @[regfile.scala 171:41]
  wire  _T_99 = io_write_ports_0_bits_addr != io_write_ports_1_bits_addr; // @[regfile.scala 173:45]
  wire  _T_100 = _T_98 | _T_99; // @[regfile.scala 172:41]
  wire  _T_101 = io_write_ports_0_bits_addr == 6'h0; // @[regfile.scala 174:45]
  wire  _T_102 = _T_100 | _T_101; // @[regfile.scala 173:78]
  wire  _T_107 = ~io_write_ports_2_valid; // @[regfile.scala 172:16]
  wire  _T_108 = ~io_write_ports_0_valid | _T_107; // @[regfile.scala 171:41]
  wire  _T_109 = io_write_ports_0_bits_addr != io_write_ports_2_bits_addr; // @[regfile.scala 173:45]
  wire  _T_110 = _T_108 | _T_109; // @[regfile.scala 172:41]
  wire  _T_112 = _T_110 | _T_101; // @[regfile.scala 173:78]
  wire  _T_118 = _T_97 | _T_107; // @[regfile.scala 171:41]
  wire  _T_119 = io_write_ports_1_bits_addr != io_write_ports_2_bits_addr; // @[regfile.scala 173:45]
  wire  _T_120 = _T_118 | _T_119; // @[regfile.scala 172:41]
  wire  _T_121 = io_write_ports_1_bits_addr == 6'h0; // @[regfile.scala 174:45]
  wire  _T_122 = _T_120 | _T_121; // @[regfile.scala 173:78]
  assign regfile_MPORT_addr = read_addrs_0;
  assign regfile_MPORT_data = regfile[regfile_MPORT_addr]; // @[regfile.scala 117:20]
  assign regfile_MPORT_1_addr = read_addrs_1;
  assign regfile_MPORT_1_data = regfile[regfile_MPORT_1_addr]; // @[regfile.scala 117:20]
  assign regfile_MPORT_2_addr = read_addrs_2;
  assign regfile_MPORT_2_data = regfile[regfile_MPORT_2_addr]; // @[regfile.scala 117:20]
  assign regfile_MPORT_3_addr = read_addrs_3;
  assign regfile_MPORT_3_data = regfile[regfile_MPORT_3_addr]; // @[regfile.scala 117:20]
  assign regfile_MPORT_4_addr = read_addrs_4;
  assign regfile_MPORT_4_data = regfile[regfile_MPORT_4_addr]; // @[regfile.scala 117:20]
  assign regfile_MPORT_5_addr = read_addrs_5;
  assign regfile_MPORT_5_data = regfile[regfile_MPORT_5_addr]; // @[regfile.scala 117:20]
  assign regfile_MPORT_6_data = io_write_ports_0_bits_data;
  assign regfile_MPORT_6_addr = io_write_ports_0_bits_addr;
  assign regfile_MPORT_6_mask = 1'h1;
  assign regfile_MPORT_6_en = io_write_ports_0_valid;
  assign regfile_MPORT_7_data = io_write_ports_1_bits_data;
  assign regfile_MPORT_7_addr = io_write_ports_1_bits_addr;
  assign regfile_MPORT_7_mask = 1'h1;
  assign regfile_MPORT_7_en = io_write_ports_1_valid;
  assign regfile_MPORT_8_data = io_write_ports_2_bits_data;
  assign regfile_MPORT_8_addr = io_write_ports_2_bits_addr;
  assign regfile_MPORT_8_mask = 1'h1;
  assign regfile_MPORT_8_en = io_write_ports_2_valid;
  assign io_read_ports_0_data = _T_13 | _T_15 | _T_17 ? _T_22 : read_data_0; // @[regfile.scala 150:35]
  assign io_read_ports_1_data = _T_27 | _T_29 | _T_31 ? _T_36 : read_data_1; // @[regfile.scala 150:35]
  assign io_read_ports_2_data = _T_41 | _T_43 | _T_45 ? _T_50 : read_data_2; // @[regfile.scala 150:35]
  assign io_read_ports_3_data = _T_55 | _T_57 | _T_59 ? _T_64 : read_data_3; // @[regfile.scala 150:35]
  assign io_read_ports_4_data = _T_69 | _T_71 | _T_73 ? _T_78 : read_data_4; // @[regfile.scala 150:35]
  assign io_read_ports_5_data = _T_83 | _T_85 | _T_87 ? _T_92 : read_data_5; // @[regfile.scala 150:35]
  always @(posedge clock) begin
    if(regfile_MPORT_6_en & regfile_MPORT_6_mask) begin
      regfile[regfile_MPORT_6_addr] <= regfile_MPORT_6_data; // @[regfile.scala 117:20]
    end
    if(regfile_MPORT_7_en & regfile_MPORT_7_mask) begin
      regfile[regfile_MPORT_7_addr] <= regfile_MPORT_7_data; // @[regfile.scala 117:20]
    end
    if(regfile_MPORT_8_en & regfile_MPORT_8_mask) begin
      regfile[regfile_MPORT_8_addr] <= regfile_MPORT_8_data; // @[regfile.scala 117:20]
    end
    read_addrs_0 <= io_read_ports_0_addr; // @[regfile.scala 125:50]
    read_addrs_1 <= io_read_ports_1_addr; // @[regfile.scala 125:50]
    read_addrs_2 <= io_read_ports_2_addr; // @[regfile.scala 125:50]
    read_addrs_3 <= io_read_ports_3_addr; // @[regfile.scala 125:50]
    read_addrs_4 <= io_read_ports_4_addr; // @[regfile.scala 125:50]
    read_addrs_5 <= io_read_ports_5_addr; // @[regfile.scala 125:50]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_T_102 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n"
            ); // @[regfile.scala 171:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_102 | reset)) begin
          $fatal; // @[regfile.scala 171:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_T_112 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n"
            ); // @[regfile.scala 171:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_112 | reset)) begin
          $fatal; // @[regfile.scala 171:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_T_122 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n"
            ); // @[regfile.scala 171:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_122 | reset)) begin
          $fatal; // @[regfile.scala 171:15]
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
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    regfile[initvar] = _RAND_0[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  read_addrs_0 = _RAND_1[5:0];
  _RAND_2 = {1{`RANDOM}};
  read_addrs_1 = _RAND_2[5:0];
  _RAND_3 = {1{`RANDOM}};
  read_addrs_2 = _RAND_3[5:0];
  _RAND_4 = {1{`RANDOM}};
  read_addrs_3 = _RAND_4[5:0];
  _RAND_5 = {1{`RANDOM}};
  read_addrs_4 = _RAND_5[5:0];
  _RAND_6 = {1{`RANDOM}};
  read_addrs_5 = _RAND_6[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
