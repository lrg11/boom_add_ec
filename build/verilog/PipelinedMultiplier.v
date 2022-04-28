module PipelinedMultiplier(
  input         clock,
  input         reset,
  input         io_req_valid,
  input  [3:0]  io_req_bits_fn,
  input         io_req_bits_dw,
  input  [63:0] io_req_bits_in1,
  input  [63:0] io_req_bits_in2,
  input  [4:0]  io_req_bits_tag,
  output        io_resp_valid,
  output [63:0] io_resp_bits_data,
  output [4:0]  io_resp_bits_tag
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
`endif // RANDOMIZE_REG_INIT
  reg  inPipe_valid; // @[Valid.scala 117:22]
  reg [3:0] inPipe_bits_fn; // @[Reg.scala 15:16]
  reg  inPipe_bits_dw; // @[Reg.scala 15:16]
  reg [63:0] inPipe_bits_in1; // @[Reg.scala 15:16]
  reg [63:0] inPipe_bits_in2; // @[Reg.scala 15:16]
  reg [4:0] inPipe_bits_tag; // @[Reg.scala 15:16]
  wire [3:0] _T = inPipe_bits_fn & 4'h1; // @[Decode.scala 14:65]
  wire  _T_1 = _T == 4'h1; // @[Decode.scala 14:121]
  wire [3:0] _T_2 = inPipe_bits_fn & 4'h2; // @[Decode.scala 14:65]
  wire  _T_3 = _T_2 == 4'h2; // @[Decode.scala 14:121]
  wire  cmdHi = _T_1 | _T_3; // @[Decode.scala 15:30]
  wire  rhsSigned = _T_2 == 4'h0; // @[Decode.scala 14:121]
  wire  _T_9 = _T == 4'h0; // @[Decode.scala 14:121]
  wire  lhsSigned = rhsSigned | _T_9; // @[Decode.scala 15:30]
  wire  cmdHalf = ~inPipe_bits_dw; // @[Multiplier.scala 201:46]
  wire  lhs_hi = lhsSigned & inPipe_bits_in1[63]; // @[Multiplier.scala 203:27]
  wire [64:0] lhs = {lhs_hi,inPipe_bits_in1}; // @[Multiplier.scala 203:65]
  wire  rhs_hi = rhsSigned & inPipe_bits_in2[63]; // @[Multiplier.scala 204:27]
  wire [64:0] rhs = {rhs_hi,inPipe_bits_in2}; // @[Multiplier.scala 204:65]
  wire [129:0] prod = $signed(lhs) * $signed(rhs); // @[Multiplier.scala 205:18]
  wire [31:0] muxed_lo = prod[31:0]; // @[Multiplier.scala 206:67]
  wire [31:0] muxed_hi = muxed_lo[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _muxed_T_3 = {muxed_hi,muxed_lo}; // @[Cat.scala 30:58]
  reg  respPipe_valid; // @[Valid.scala 117:22]
  reg [4:0] respPipe_bits_tag; // @[Reg.scala 15:16]
  reg  respPipe_valid_1; // @[Valid.scala 117:22]
  reg [4:0] respPipe_bits_1_tag; // @[Reg.scala 15:16]
  reg  io_resp_bits_data_v; // @[Valid.scala 117:22]
  reg [63:0] io_resp_bits_data_b; // @[Reg.scala 15:16]
  reg [63:0] io_resp_bits_data_outPipe_bits; // @[Reg.scala 15:16]
  assign io_resp_valid = respPipe_valid_1; // @[Valid.scala 112:21 Valid.scala 113:17]
  assign io_resp_bits_data = io_resp_bits_data_outPipe_bits; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_tag = respPipe_bits_1_tag; // @[Valid.scala 112:21 Valid.scala 114:16]
  always @(posedge clock) begin
    if (reset) begin // @[Valid.scala 117:22]
      inPipe_valid <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      inPipe_valid <= io_req_valid; // @[Valid.scala 117:22]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      inPipe_bits_fn <= io_req_bits_fn; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      inPipe_bits_dw <= io_req_bits_dw; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      inPipe_bits_in1 <= io_req_bits_in1; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      inPipe_bits_in2 <= io_req_bits_in2; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      inPipe_bits_tag <= io_req_bits_tag; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      respPipe_valid <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      respPipe_valid <= inPipe_valid; // @[Valid.scala 117:22]
    end
    if (inPipe_valid) begin // @[Reg.scala 16:19]
      respPipe_bits_tag <= inPipe_bits_tag; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      respPipe_valid_1 <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      respPipe_valid_1 <= respPipe_valid; // @[Valid.scala 117:22]
    end
    if (respPipe_valid) begin // @[Reg.scala 16:19]
      respPipe_bits_1_tag <= respPipe_bits_tag; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      io_resp_bits_data_v <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      io_resp_bits_data_v <= inPipe_valid; // @[Valid.scala 117:22]
    end
    if (inPipe_valid) begin // @[Reg.scala 16:19]
      if (cmdHi) begin // @[Multiplier.scala 206:18]
        io_resp_bits_data_b <= prod[127:64];
      end else if (cmdHalf) begin // @[Multiplier.scala 206:53]
        io_resp_bits_data_b <= _muxed_T_3;
      end else begin
        io_resp_bits_data_b <= prod[63:0];
      end
    end
    if (io_resp_bits_data_v) begin // @[Reg.scala 16:19]
      io_resp_bits_data_outPipe_bits <= io_resp_bits_data_b; // @[Reg.scala 16:23]
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
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  inPipe_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  inPipe_bits_fn = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  inPipe_bits_dw = _RAND_2[0:0];
  _RAND_3 = {2{`RANDOM}};
  inPipe_bits_in1 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  inPipe_bits_in2 = _RAND_4[63:0];
  _RAND_5 = {1{`RANDOM}};
  inPipe_bits_tag = _RAND_5[4:0];
  _RAND_6 = {1{`RANDOM}};
  respPipe_valid = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  respPipe_bits_tag = _RAND_7[4:0];
  _RAND_8 = {1{`RANDOM}};
  respPipe_valid_1 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  respPipe_bits_1_tag = _RAND_9[4:0];
  _RAND_10 = {1{`RANDOM}};
  io_resp_bits_data_v = _RAND_10[0:0];
  _RAND_11 = {2{`RANDOM}};
  io_resp_bits_data_b = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  io_resp_bits_data_outPipe_bits = _RAND_12[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
