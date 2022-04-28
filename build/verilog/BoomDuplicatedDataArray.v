module BoomDuplicatedDataArray(
  input         clock,
  input         reset,
  input         io_read_0_valid,
  input         io_read_0_bits_way_en,
  input  [11:0] io_read_0_bits_addr,
  input         io_write_valid,
  input         io_write_bits_way_en,
  input  [11:0] io_write_bits_addr,
  input         io_write_bits_wmask,
  input  [63:0] io_write_bits_data,
  output [63:0] io_resp_0_0,
  output        io_nacks_0
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
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
  reg [63:0] REG; // @[dcache.scala 297:31]
  assign array_0_0_0_MPORT_1_addr = array_0_0_0_MPORT_1_addr_pipe_0;
  assign array_0_0_0_MPORT_1_data = array_0_0_0[array_0_0_0_MPORT_1_addr]; // @[DescribedSRAM.scala 19:26]
  assign array_0_0_0_MPORT_data = io_write_bits_data;
  assign array_0_0_0_MPORT_addr = io_write_bits_addr[11:3];
  assign array_0_0_0_MPORT_mask = io_write_bits_wmask;
  assign array_0_0_0_MPORT_en = io_write_bits_way_en & io_write_valid;
  assign io_resp_0_0 = REG; // @[dcache.scala 297:21]
  assign io_nacks_0 = 1'h0; // @[dcache.scala 299:17]
  always @(posedge clock) begin
    if(array_0_0_0_MPORT_en & array_0_0_0_MPORT_mask) begin
      array_0_0_0[array_0_0_0_MPORT_addr] <= array_0_0_0_MPORT_data; // @[DescribedSRAM.scala 19:26]
    end
    array_0_0_0_MPORT_1_en_pipe_0 <= io_read_0_bits_way_en & io_read_0_valid;
    if (io_read_0_bits_way_en & io_read_0_valid) begin
      array_0_0_0_MPORT_1_addr_pipe_0 <= io_read_0_bits_addr[11:3];
    end
    REG <= array_0_0_0_MPORT_1_data; // @[dcache.scala 297:31]
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
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  array_0_0_0_MPORT_1_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  array_0_0_0_MPORT_1_addr_pipe_0 = _RAND_2[8:0];
  _RAND_3 = {2{`RANDOM}};
  REG = _RAND_3[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
