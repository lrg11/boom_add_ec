module BoomDuplicatedDataArray(
  input         clock,
  input         reset,
  input         io_read_0_valid,
  input  [3:0]  io_read_0_bits_way_en,
  input  [11:0] io_read_0_bits_addr,
  input         io_write_valid,
  input  [3:0]  io_write_bits_way_en,
  input  [11:0] io_write_bits_addr,
  input         io_write_bits_wmask,
  input  [63:0] io_write_bits_data,
  output [63:0] io_resp_0_0,
  output [63:0] io_resp_0_1,
  output [63:0] io_resp_0_2,
  output [63:0] io_resp_0_3,
  output        io_nacks_0
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_9;
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
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] array_0_0_0 [0:511]; // @[DescribedSRAM.scala 19:26]
  wire [63:0] array_0_0_0_MPORT_1_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] array_0_0_0_MPORT_1_addr; // @[DescribedSRAM.scala 19:26]
  wire [63:0] array_0_0_0_MPORT_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] array_0_0_0_MPORT_addr; // @[DescribedSRAM.scala 19:26]
  wire  array_0_0_0_MPORT_mask; // @[DescribedSRAM.scala 19:26]
  wire  array_0_0_0_MPORT_en; // @[DescribedSRAM.scala 19:26]
  reg  array_0_0_0_MPORT_1_en_pipe_0;
  reg [8:0] array_0_0_0_MPORT_1_addr_pipe_0;
  reg [63:0] array_1_0_0 [0:511]; // @[DescribedSRAM.scala 19:26]
  wire [63:0] array_1_0_0_MPORT_3_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] array_1_0_0_MPORT_3_addr; // @[DescribedSRAM.scala 19:26]
  wire [63:0] array_1_0_0_MPORT_2_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] array_1_0_0_MPORT_2_addr; // @[DescribedSRAM.scala 19:26]
  wire  array_1_0_0_MPORT_2_mask; // @[DescribedSRAM.scala 19:26]
  wire  array_1_0_0_MPORT_2_en; // @[DescribedSRAM.scala 19:26]
  reg  array_1_0_0_MPORT_3_en_pipe_0;
  reg [8:0] array_1_0_0_MPORT_3_addr_pipe_0;
  reg [63:0] array_2_0_0 [0:511]; // @[DescribedSRAM.scala 19:26]
  wire [63:0] array_2_0_0_MPORT_5_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] array_2_0_0_MPORT_5_addr; // @[DescribedSRAM.scala 19:26]
  wire [63:0] array_2_0_0_MPORT_4_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] array_2_0_0_MPORT_4_addr; // @[DescribedSRAM.scala 19:26]
  wire  array_2_0_0_MPORT_4_mask; // @[DescribedSRAM.scala 19:26]
  wire  array_2_0_0_MPORT_4_en; // @[DescribedSRAM.scala 19:26]
  reg  array_2_0_0_MPORT_5_en_pipe_0;
  reg [8:0] array_2_0_0_MPORT_5_addr_pipe_0;
  reg [63:0] array_3_0_0 [0:511]; // @[DescribedSRAM.scala 19:26]
  wire [63:0] array_3_0_0_MPORT_7_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] array_3_0_0_MPORT_7_addr; // @[DescribedSRAM.scala 19:26]
  wire [63:0] array_3_0_0_MPORT_6_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] array_3_0_0_MPORT_6_addr; // @[DescribedSRAM.scala 19:26]
  wire  array_3_0_0_MPORT_6_mask; // @[DescribedSRAM.scala 19:26]
  wire  array_3_0_0_MPORT_6_en; // @[DescribedSRAM.scala 19:26]
  reg  array_3_0_0_MPORT_7_en_pipe_0;
  reg [8:0] array_3_0_0_MPORT_7_addr_pipe_0;
  reg [63:0] REG; // @[dcache.scala 297:31]
  reg [63:0] REG_1; // @[dcache.scala 297:31]
  reg [63:0] REG_2; // @[dcache.scala 297:31]
  reg [63:0] REG_3; // @[dcache.scala 297:31]
  assign array_0_0_0_MPORT_1_addr = array_0_0_0_MPORT_1_addr_pipe_0;
  assign array_0_0_0_MPORT_1_data = array_0_0_0[array_0_0_0_MPORT_1_addr]; // @[DescribedSRAM.scala 19:26]
  assign array_0_0_0_MPORT_data = io_write_bits_data;
  assign array_0_0_0_MPORT_addr = io_write_bits_addr[11:3];
  assign array_0_0_0_MPORT_mask = io_write_bits_wmask;
  assign array_0_0_0_MPORT_en = io_write_bits_way_en[0] & io_write_valid;
  assign array_1_0_0_MPORT_3_addr = array_1_0_0_MPORT_3_addr_pipe_0;
  assign array_1_0_0_MPORT_3_data = array_1_0_0[array_1_0_0_MPORT_3_addr]; // @[DescribedSRAM.scala 19:26]
  assign array_1_0_0_MPORT_2_data = io_write_bits_data;
  assign array_1_0_0_MPORT_2_addr = io_write_bits_addr[11:3];
  assign array_1_0_0_MPORT_2_mask = io_write_bits_wmask;
  assign array_1_0_0_MPORT_2_en = io_write_bits_way_en[1] & io_write_valid;
  assign array_2_0_0_MPORT_5_addr = array_2_0_0_MPORT_5_addr_pipe_0;
  assign array_2_0_0_MPORT_5_data = array_2_0_0[array_2_0_0_MPORT_5_addr]; // @[DescribedSRAM.scala 19:26]
  assign array_2_0_0_MPORT_4_data = io_write_bits_data;
  assign array_2_0_0_MPORT_4_addr = io_write_bits_addr[11:3];
  assign array_2_0_0_MPORT_4_mask = io_write_bits_wmask;
  assign array_2_0_0_MPORT_4_en = io_write_bits_way_en[2] & io_write_valid;
  assign array_3_0_0_MPORT_7_addr = array_3_0_0_MPORT_7_addr_pipe_0;
  assign array_3_0_0_MPORT_7_data = array_3_0_0[array_3_0_0_MPORT_7_addr]; // @[DescribedSRAM.scala 19:26]
  assign array_3_0_0_MPORT_6_data = io_write_bits_data;
  assign array_3_0_0_MPORT_6_addr = io_write_bits_addr[11:3];
  assign array_3_0_0_MPORT_6_mask = io_write_bits_wmask;
  assign array_3_0_0_MPORT_6_en = io_write_bits_way_en[3] & io_write_valid;
  assign io_resp_0_0 = REG; // @[dcache.scala 297:21]
  assign io_resp_0_1 = REG_1; // @[dcache.scala 297:21]
  assign io_resp_0_2 = REG_2; // @[dcache.scala 297:21]
  assign io_resp_0_3 = REG_3; // @[dcache.scala 297:21]
  assign io_nacks_0 = 1'h0; // @[dcache.scala 299:17]
  always @(posedge clock) begin
    if(array_0_0_0_MPORT_en & array_0_0_0_MPORT_mask) begin
      array_0_0_0[array_0_0_0_MPORT_addr] <= array_0_0_0_MPORT_data; // @[DescribedSRAM.scala 19:26]
    end
    array_0_0_0_MPORT_1_en_pipe_0 <= io_read_0_bits_way_en[0] & io_read_0_valid;
    if (io_read_0_bits_way_en[0] & io_read_0_valid) begin
      array_0_0_0_MPORT_1_addr_pipe_0 <= io_read_0_bits_addr[11:3];
    end
    if(array_1_0_0_MPORT_2_en & array_1_0_0_MPORT_2_mask) begin
      array_1_0_0[array_1_0_0_MPORT_2_addr] <= array_1_0_0_MPORT_2_data; // @[DescribedSRAM.scala 19:26]
    end
    array_1_0_0_MPORT_3_en_pipe_0 <= io_read_0_bits_way_en[1] & io_read_0_valid;
    if (io_read_0_bits_way_en[1] & io_read_0_valid) begin
      array_1_0_0_MPORT_3_addr_pipe_0 <= io_read_0_bits_addr[11:3];
    end
    if(array_2_0_0_MPORT_4_en & array_2_0_0_MPORT_4_mask) begin
      array_2_0_0[array_2_0_0_MPORT_4_addr] <= array_2_0_0_MPORT_4_data; // @[DescribedSRAM.scala 19:26]
    end
    array_2_0_0_MPORT_5_en_pipe_0 <= io_read_0_bits_way_en[2] & io_read_0_valid;
    if (io_read_0_bits_way_en[2] & io_read_0_valid) begin
      array_2_0_0_MPORT_5_addr_pipe_0 <= io_read_0_bits_addr[11:3];
    end
    if(array_3_0_0_MPORT_6_en & array_3_0_0_MPORT_6_mask) begin
      array_3_0_0[array_3_0_0_MPORT_6_addr] <= array_3_0_0_MPORT_6_data; // @[DescribedSRAM.scala 19:26]
    end
    array_3_0_0_MPORT_7_en_pipe_0 <= io_read_0_bits_way_en[3] & io_read_0_valid;
    if (io_read_0_bits_way_en[3] & io_read_0_valid) begin
      array_3_0_0_MPORT_7_addr_pipe_0 <= io_read_0_bits_addr[11:3];
    end
    REG <= array_0_0_0_MPORT_1_data; // @[dcache.scala 297:31]
    REG_1 <= array_1_0_0_MPORT_3_data; // @[dcache.scala 297:31]
    REG_2 <= array_2_0_0_MPORT_5_data; // @[dcache.scala 297:31]
    REG_3 <= array_3_0_0_MPORT_7_data; // @[dcache.scala 297:31]
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
    array_0_0_0[initvar] = _RAND_0[63:0];
  _RAND_3 = {2{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    array_1_0_0[initvar] = _RAND_3[63:0];
  _RAND_6 = {2{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    array_2_0_0[initvar] = _RAND_6[63:0];
  _RAND_9 = {2{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    array_3_0_0[initvar] = _RAND_9[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  array_0_0_0_MPORT_1_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  array_0_0_0_MPORT_1_addr_pipe_0 = _RAND_2[8:0];
  _RAND_4 = {1{`RANDOM}};
  array_1_0_0_MPORT_3_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  array_1_0_0_MPORT_3_addr_pipe_0 = _RAND_5[8:0];
  _RAND_7 = {1{`RANDOM}};
  array_2_0_0_MPORT_5_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  array_2_0_0_MPORT_5_addr_pipe_0 = _RAND_8[8:0];
  _RAND_10 = {1{`RANDOM}};
  array_3_0_0_MPORT_7_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  array_3_0_0_MPORT_7_addr_pipe_0 = _RAND_11[8:0];
  _RAND_12 = {2{`RANDOM}};
  REG = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  REG_1 = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  REG_2 = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  REG_3 = _RAND_15[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
