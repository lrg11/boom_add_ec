module GenericSerializer(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [2:0]  io_in_bits_chanId,
  input  [2:0]  io_in_bits_opcode,
  input  [2:0]  io_in_bits_param,
  input  [3:0]  io_in_bits_size,
  input  [3:0]  io_in_bits_source,
  input  [31:0] io_in_bits_address,
  input  [63:0] io_in_bits_data,
  input         io_in_bits_corrupt,
  input  [7:0]  io_in_bits_union,
  input         io_in_bits_last,
  input         io_out_ready,
  output        io_out_valid,
  output [3:0]  io_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [127:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [122:0] data; // @[Serdes.scala 175:17]
  reg  sending; // @[Serdes.scala 177:24]
  wire  _T = io_out_ready & io_out_valid; // @[Decoupled.scala 40:37]
  reg [4:0] sendCount; // @[Counter.scala 60:40]
  wire  wrap_wrap = sendCount == 5'h1e; // @[Counter.scala 72:24]
  wire [4:0] _wrap_value_T_1 = sendCount + 5'h1; // @[Counter.scala 76:24]
  wire  sendDone = _T & wrap_wrap; // @[Counter.scala 118:17 Counter.scala 118:24]
  wire  _T_3 = io_in_ready & io_in_valid; // @[Decoupled.scala 40:37]
  wire [122:0] _T_4 = {io_in_bits_chanId,io_in_bits_opcode,io_in_bits_param,io_in_bits_size,io_in_bits_source,
    io_in_bits_address,io_in_bits_data,io_in_bits_corrupt,io_in_bits_union,io_in_bits_last}; // @[Serdes.scala 185:24]
  wire  _GEN_4 = _T_3 | sending; // @[Serdes.scala 184:23 Serdes.scala 186:13 Serdes.scala 177:24]
  wire [122:0] _T_6 = {{4'd0}, data[122:4]}; // @[Serdes.scala 189:39]
  assign io_in_ready = ~sending; // @[Serdes.scala 180:18]
  assign io_out_valid = sending; // @[Serdes.scala 181:16]
  assign io_out_bits = data[3:0]; // @[Serdes.scala 182:22]
  always @(posedge clock) begin
    if (_T) begin // @[Serdes.scala 189:24]
      data <= _T_6; // @[Serdes.scala 189:31]
    end else if (_T_3) begin // @[Serdes.scala 184:23]
      data <= _T_4; // @[Serdes.scala 185:10]
    end
    if (reset) begin // @[Serdes.scala 177:24]
      sending <= 1'h0; // @[Serdes.scala 177:24]
    end else if (sendDone) begin // @[Serdes.scala 191:19]
      sending <= 1'h0; // @[Serdes.scala 191:29]
    end else begin
      sending <= _GEN_4;
    end
    if (reset) begin // @[Counter.scala 60:40]
      sendCount <= 5'h0; // @[Counter.scala 60:40]
    end else if (_T) begin // @[Counter.scala 118:17]
      if (wrap_wrap) begin // @[Counter.scala 86:20]
        sendCount <= 5'h0; // @[Counter.scala 86:28]
      end else begin
        sendCount <= _wrap_value_T_1; // @[Counter.scala 76:15]
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
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {4{`RANDOM}};
  data = _RAND_0[122:0];
  _RAND_1 = {1{`RANDOM}};
  sending = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  sendCount = _RAND_2[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
