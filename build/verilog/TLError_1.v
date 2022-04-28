module TLError_1(
  input          clock,
  input          reset,
  output         auto_in_a_ready,
  input          auto_in_a_valid,
  input  [2:0]   auto_in_a_bits_opcode,
  input  [2:0]   auto_in_a_bits_param,
  input  [1:0]   auto_in_a_bits_size,
  input          auto_in_a_bits_source,
  input  [127:0] auto_in_a_bits_address,
  input  [3:0]   auto_in_a_bits_mask,
  input  [31:0]  auto_in_a_bits_data,
  input          auto_in_a_bits_corrupt,
  input          auto_in_d_ready,
  output         auto_in_d_valid,
  output [2:0]   auto_in_d_bits_opcode,
  output [1:0]   auto_in_d_bits_param,
  output [1:0]   auto_in_d_bits_size,
  output         auto_in_d_bits_source,
  output         auto_in_d_bits_sink,
  output         auto_in_d_bits_denied,
  output [31:0]  auto_in_d_bits_data,
  output         auto_in_d_bits_corrupt
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock; // @[Nodes.scala 24:25]
  wire  monitor_reset; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_param; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_a_bits_size; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [127:0] monitor_io_in_a_bits_address; // @[Nodes.scala 24:25]
  wire [3:0] monitor_io_in_a_bits_mask; // @[Nodes.scala 24:25]
  wire [31:0] monitor_io_in_a_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_param; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_size; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_source; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_sink; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_denied; // @[Nodes.scala 24:25]
  wire [31:0] monitor_io_in_d_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_corrupt; // @[Nodes.scala 24:25]
  reg  idle; // @[Error.scala 44:23]
  reg  beatsLeft; // @[Arbiter.scala 87:30]
  wire  idle_1 = ~beatsLeft; // @[Arbiter.scala 88:28]
  wire  da_valid = auto_in_a_valid & idle; // @[Error.scala 51:35]
  wire [1:0] _readys_T = {da_valid,1'h0}; // @[Cat.scala 30:58]
  wire [2:0] _readys_T_1 = {_readys_T, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _readys_T_3 = _readys_T | _readys_T_1[1:0]; // @[package.scala 244:43]
  wire [2:0] _readys_T_5 = {_readys_T_3, 1'h0}; // @[Arbiter.scala 16:78]
  wire [1:0] _readys_T_7 = ~_readys_T_5[1:0]; // @[Arbiter.scala 16:61]
  wire  readys_1 = _readys_T_7[1]; // @[Arbiter.scala 95:86]
  reg  state_1; // @[Arbiter.scala 116:26]
  wire  allowed_1 = idle_1 ? readys_1 : state_1; // @[Arbiter.scala 121:24]
  wire  out_1_ready = auto_in_d_ready & allowed_1; // @[Arbiter.scala 123:31]
  reg  counter; // @[Edges.scala 228:27]
  wire [2:0] _GEN_4 = 3'h2 == auto_in_a_bits_opcode ? 3'h1 : 3'h0; // @[Error.scala 53:21 Error.scala 53:21]
  wire [2:0] _GEN_5 = 3'h3 == auto_in_a_bits_opcode ? 3'h1 : _GEN_4; // @[Error.scala 53:21 Error.scala 53:21]
  wire [2:0] _GEN_6 = 3'h4 == auto_in_a_bits_opcode ? 3'h1 : _GEN_5; // @[Error.scala 53:21 Error.scala 53:21]
  wire [2:0] _GEN_7 = 3'h5 == auto_in_a_bits_opcode ? 3'h2 : _GEN_6; // @[Error.scala 53:21 Error.scala 53:21]
  wire [2:0] _GEN_8 = 3'h6 == auto_in_a_bits_opcode ? 3'h4 : _GEN_7; // @[Error.scala 53:21 Error.scala 53:21]
  wire [2:0] da_bits_opcode = 3'h7 == auto_in_a_bits_opcode ? 3'h4 : _GEN_8; // @[Error.scala 53:21 Error.scala 53:21]
  wire  beats1_opdata = da_bits_opcode[0]; // @[Edges.scala 105:36]
  wire  done = out_1_ready & da_valid; // @[Decoupled.scala 40:37]
  wire  counter1 = counter - 1'h1; // @[Edges.scala 229:28]
  wire  da_first = ~counter; // @[Edges.scala 230:25]
  wire  _GEN_12 = done & da_bits_opcode == 3'h4 ? 1'h0 : idle; // @[Error.scala 70:52 Error.scala 70:59 Error.scala 44:23]
  wire  latch = idle_1 & auto_in_d_ready; // @[Arbiter.scala 89:24]
  wire  earlyWinner_1 = readys_1 & da_valid; // @[Arbiter.scala 97:79]
  wire  _T_22 = ~da_valid; // @[Arbiter.scala 107:15]
  wire  muxStateEarly_1 = idle_1 ? earlyWinner_1 : state_1; // @[Arbiter.scala 117:30]
  wire  _sink_ACancel_earlyValid_T_2 = state_1 & da_valid; // @[Mux.scala 27:72]
  wire  sink_ACancel_earlyValid = idle_1 ? da_valid : _sink_ACancel_earlyValid_T_2; // @[Arbiter.scala 125:29]
  wire  _beatsLeft_T_2 = auto_in_d_ready & sink_ACancel_earlyValid; // @[ReadyValidCancel.scala 50:33]
  TLMonitor_44 monitor ( // @[Nodes.scala 24:25]
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
  assign auto_in_a_ready = out_1_ready & idle; // @[Error.scala 50:37]
  assign auto_in_d_valid = idle_1 ? da_valid : _sink_ACancel_earlyValid_T_2; // @[Arbiter.scala 125:29]
  assign auto_in_d_bits_opcode = muxStateEarly_1 ? da_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  assign auto_in_d_bits_param = 2'h0; // @[Mux.scala 27:72]
  assign auto_in_d_bits_size = muxStateEarly_1 ? auto_in_a_bits_size : 2'h0; // @[Mux.scala 27:72]
  assign auto_in_d_bits_source = muxStateEarly_1 & auto_in_a_bits_source; // @[Mux.scala 27:72]
  assign auto_in_d_bits_sink = 1'h0; // @[Mux.scala 27:72]
  assign auto_in_d_bits_denied = idle_1 ? earlyWinner_1 : state_1; // @[Arbiter.scala 117:30]
  assign auto_in_d_bits_data = 32'h0; // @[Mux.scala 27:72]
  assign auto_in_d_bits_corrupt = muxStateEarly_1 & beats1_opdata; // @[Mux.scala 27:72]
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = out_1_ready & idle; // @[Error.scala 50:37]
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
  assign monitor_io_in_d_valid = idle_1 ? da_valid : _sink_ACancel_earlyValid_T_2; // @[Arbiter.scala 125:29]
  assign monitor_io_in_d_bits_opcode = muxStateEarly_1 ? da_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  assign monitor_io_in_d_bits_param = 2'h0; // @[Mux.scala 27:72]
  assign monitor_io_in_d_bits_size = muxStateEarly_1 ? auto_in_a_bits_size : 2'h0; // @[Mux.scala 27:72]
  assign monitor_io_in_d_bits_source = muxStateEarly_1 & auto_in_a_bits_source; // @[Mux.scala 27:72]
  assign monitor_io_in_d_bits_sink = 1'h0; // @[Mux.scala 27:72]
  assign monitor_io_in_d_bits_denied = idle_1 ? earlyWinner_1 : state_1; // @[Arbiter.scala 117:30]
  assign monitor_io_in_d_bits_data = 32'h0; // @[Mux.scala 27:72]
  assign monitor_io_in_d_bits_corrupt = muxStateEarly_1 & beats1_opdata; // @[Mux.scala 27:72]
  always @(posedge clock) begin
    idle <= reset | _GEN_12; // @[Error.scala 44:23 Error.scala 44:23]
    if (reset) begin // @[Arbiter.scala 87:30]
      beatsLeft <= 1'h0; // @[Arbiter.scala 87:30]
    end else if (latch) begin // @[Arbiter.scala 113:23]
      beatsLeft <= 1'h0;
    end else begin
      beatsLeft <= beatsLeft - _beatsLeft_T_2;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle_1) begin // @[Arbiter.scala 117:30]
      state_1 <= earlyWinner_1;
    end
    if (reset) begin // @[Edges.scala 228:27]
      counter <= 1'h0; // @[Edges.scala 228:27]
    end else if (done) begin // @[Edges.scala 234:17]
      if (da_first) begin // @[Edges.scala 235:21]
        counter <= 1'h0;
      end else begin
        counter <= counter1;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(idle | da_first | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Error.scala:49 assert (idle || da_first) // we only send Grant, never GrantData => simplified flow control below\n"
            ); // @[Error.scala 49:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(idle | da_first | reset)) begin
          $fatal; // @[Error.scala 49:12]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~da_valid | earlyWinner_1 | reset)) begin
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
        if (~(~da_valid | earlyWinner_1 | reset)) begin
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
        if (~(_T_22 | da_valid | reset)) begin
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
        if (~(_T_22 | da_valid | reset)) begin
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
  idle = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  beatsLeft = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  state_1 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  counter = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
