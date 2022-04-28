module L1MetadataArray(
  input         clock,
  input         reset,
  output        io_read_ready,
  input         io_read_valid,
  input  [5:0]  io_read_bits_idx,
  input         io_read_bits_way_en,
  input  [19:0] io_read_bits_tag,
  output        io_write_ready,
  input         io_write_valid,
  input  [5:0]  io_write_bits_idx,
  input         io_write_bits_way_en,
  input  [19:0] io_write_bits_tag,
  input  [1:0]  io_write_bits_data_coh_state,
  input  [19:0] io_write_bits_data_tag,
  output [1:0]  io_resp_0_coh_state,
  output [19:0] io_resp_0_tag
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [21:0] tag_array_0 [0:63]; // @[HellaCache.scala 322:25]
  wire [21:0] tag_array_0_MPORT_1_data; // @[HellaCache.scala 322:25]
  wire [5:0] tag_array_0_MPORT_1_addr; // @[HellaCache.scala 322:25]
  wire [21:0] tag_array_0_MPORT_data; // @[HellaCache.scala 322:25]
  wire [5:0] tag_array_0_MPORT_addr; // @[HellaCache.scala 322:25]
  wire  tag_array_0_MPORT_mask; // @[HellaCache.scala 322:25]
  wire  tag_array_0_MPORT_en; // @[HellaCache.scala 322:25]
  reg  tag_array_0_MPORT_1_en_pipe_0;
  reg [5:0] tag_array_0_MPORT_1_addr_pipe_0;
  reg [6:0] rst_cnt; // @[HellaCache.scala 313:20]
  wire  rst = rst_cnt < 7'h40; // @[HellaCache.scala 314:21]
  wire [6:0] waddr = rst ? rst_cnt : {{1'd0}, io_write_bits_idx}; // @[HellaCache.scala 315:18]
  wire [1:0] _wdata_T_coh_state = rst ? 2'h0 : io_write_bits_data_coh_state; // @[HellaCache.scala 316:18]
  wire [19:0] _wdata_T_tag = rst ? 20'h0 : io_write_bits_data_tag; // @[HellaCache.scala 316:18]
  wire [6:0] _rst_cnt_T_1 = rst_cnt + 7'h1; // @[HellaCache.scala 319:34]
  wire  wen = rst | io_write_valid; // @[HellaCache.scala 323:17]
  wire [21:0] _WIRE_3 = tag_array_0_MPORT_1_data;
  assign tag_array_0_MPORT_1_addr = tag_array_0_MPORT_1_addr_pipe_0;
  assign tag_array_0_MPORT_1_data = tag_array_0[tag_array_0_MPORT_1_addr]; // @[HellaCache.scala 322:25]
  assign tag_array_0_MPORT_data = {_wdata_T_coh_state,_wdata_T_tag};
  assign tag_array_0_MPORT_addr = waddr[5:0];
  assign tag_array_0_MPORT_mask = 1'h1;
  assign tag_array_0_MPORT_en = rst | io_write_valid;
  assign io_read_ready = ~wen; // @[HellaCache.scala 329:20]
  assign io_write_ready = ~rst; // @[HellaCache.scala 330:21]
  assign io_resp_0_coh_state = _WIRE_3[21:20]; // @[HellaCache.scala 327:82]
  assign io_resp_0_tag = _WIRE_3[19:0]; // @[HellaCache.scala 327:82]
  always @(posedge clock) begin
    if(tag_array_0_MPORT_en & tag_array_0_MPORT_mask) begin
      tag_array_0[tag_array_0_MPORT_addr] <= tag_array_0_MPORT_data; // @[HellaCache.scala 322:25]
    end
    tag_array_0_MPORT_1_en_pipe_0 <= io_read_ready & io_read_valid;
    if (io_read_ready & io_read_valid) begin
      tag_array_0_MPORT_1_addr_pipe_0 <= io_read_bits_idx;
    end
    if (reset) begin // @[HellaCache.scala 313:20]
      rst_cnt <= 7'h0; // @[HellaCache.scala 313:20]
    end else if (rst) begin // @[HellaCache.scala 319:14]
      rst_cnt <= _rst_cnt_T_1; // @[HellaCache.scala 319:24]
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
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    tag_array_0[initvar] = _RAND_0[21:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  tag_array_0_MPORT_1_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  tag_array_0_MPORT_1_addr_pipe_0 = _RAND_2[5:0];
  _RAND_3 = {1{`RANDOM}};
  rst_cnt = _RAND_3[6:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
