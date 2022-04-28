module AsyncQueueSource_3(
  input        clock,
  input        reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [3:0] io_enq_bits,
  output [3:0] io_async_mem_0,
  output [3:0] io_async_mem_1,
  output [3:0] io_async_mem_2,
  output [3:0] io_async_mem_3,
  output [3:0] io_async_mem_4,
  output [3:0] io_async_mem_5,
  output [3:0] io_async_mem_6,
  output [3:0] io_async_mem_7,
  input  [3:0] io_async_ridx,
  output [3:0] io_async_widx,
  input        io_async_safe_ridx_valid,
  output       io_async_safe_widx_valid,
  output       io_async_safe_source_reset_n,
  input        io_async_safe_sink_reset_n
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  wire  ridx_ridx_gray_clock; // @[ShiftReg.scala 45:23]
  wire  ridx_ridx_gray_reset; // @[ShiftReg.scala 45:23]
  wire [3:0] ridx_ridx_gray_io_d; // @[ShiftReg.scala 45:23]
  wire [3:0] ridx_ridx_gray_io_q; // @[ShiftReg.scala 45:23]
  wire  source_valid_0_io_in; // @[AsyncQueue.scala 100:32]
  wire  source_valid_0_io_out; // @[AsyncQueue.scala 100:32]
  wire  source_valid_0_clock; // @[AsyncQueue.scala 100:32]
  wire  source_valid_0_reset; // @[AsyncQueue.scala 100:32]
  wire  source_valid_1_io_in; // @[AsyncQueue.scala 101:32]
  wire  source_valid_1_io_out; // @[AsyncQueue.scala 101:32]
  wire  source_valid_1_clock; // @[AsyncQueue.scala 101:32]
  wire  source_valid_1_reset; // @[AsyncQueue.scala 101:32]
  wire  sink_extend_io_in; // @[AsyncQueue.scala 103:30]
  wire  sink_extend_io_out; // @[AsyncQueue.scala 103:30]
  wire  sink_extend_clock; // @[AsyncQueue.scala 103:30]
  wire  sink_extend_reset; // @[AsyncQueue.scala 103:30]
  wire  sink_valid_io_in; // @[AsyncQueue.scala 104:30]
  wire  sink_valid_io_out; // @[AsyncQueue.scala 104:30]
  wire  sink_valid_clock; // @[AsyncQueue.scala 104:30]
  wire  sink_valid_reset; // @[AsyncQueue.scala 104:30]
  reg [3:0] mem_0; // @[AsyncQueue.scala 80:16]
  reg [3:0] mem_1; // @[AsyncQueue.scala 80:16]
  reg [3:0] mem_2; // @[AsyncQueue.scala 80:16]
  reg [3:0] mem_3; // @[AsyncQueue.scala 80:16]
  reg [3:0] mem_4; // @[AsyncQueue.scala 80:16]
  reg [3:0] mem_5; // @[AsyncQueue.scala 80:16]
  reg [3:0] mem_6; // @[AsyncQueue.scala 80:16]
  reg [3:0] mem_7; // @[AsyncQueue.scala 80:16]
  wire  _widx_T_1 = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  sink_ready = sink_valid_io_out;
  wire  _widx_T_2 = ~sink_ready; // @[AsyncQueue.scala 81:79]
  reg [3:0] widx_widx_bin; // @[AsyncQueue.scala 52:25]
  wire [3:0] _GEN_16 = {{3'd0}, _widx_T_1}; // @[AsyncQueue.scala 53:43]
  wire [3:0] _widx_incremented_T_1 = widx_widx_bin + _GEN_16; // @[AsyncQueue.scala 53:43]
  wire [3:0] widx_incremented = _widx_T_2 ? 4'h0 : _widx_incremented_T_1; // @[AsyncQueue.scala 53:23]
  wire [3:0] _GEN_17 = {{1'd0}, widx_incremented[3:1]}; // @[AsyncQueue.scala 54:17]
  wire [3:0] widx = widx_incremented ^ _GEN_17; // @[AsyncQueue.scala 54:17]
  wire [3:0] ridx = ridx_ridx_gray_io_q; // @[ShiftReg.scala 48:24 ShiftReg.scala 48:24]
  wire [3:0] _ready_T = ridx ^ 4'hc; // @[AsyncQueue.scala 83:44]
  wire [2:0] _index_T_2 = {io_async_widx[3], 2'h0}; // @[AsyncQueue.scala 85:93]
  wire [2:0] index = io_async_widx[2:0] ^ _index_T_2; // @[AsyncQueue.scala 85:64]
  reg  ready_reg; // @[AsyncQueue.scala 88:56]
  reg [3:0] widx_gray; // @[AsyncQueue.scala 91:55]
  AsyncResetSynchronizerShiftReg_w4_d3_i0 ridx_ridx_gray ( // @[ShiftReg.scala 45:23]
    .clock(ridx_ridx_gray_clock),
    .reset(ridx_ridx_gray_reset),
    .io_d(ridx_ridx_gray_io_d),
    .io_q(ridx_ridx_gray_io_q)
  );
  AsyncValidSync source_valid_0 ( // @[AsyncQueue.scala 100:32]
    .io_in(source_valid_0_io_in),
    .io_out(source_valid_0_io_out),
    .clock(source_valid_0_clock),
    .reset(source_valid_0_reset)
  );
  AsyncValidSync source_valid_1 ( // @[AsyncQueue.scala 101:32]
    .io_in(source_valid_1_io_in),
    .io_out(source_valid_1_io_out),
    .clock(source_valid_1_clock),
    .reset(source_valid_1_reset)
  );
  AsyncValidSync sink_extend ( // @[AsyncQueue.scala 103:30]
    .io_in(sink_extend_io_in),
    .io_out(sink_extend_io_out),
    .clock(sink_extend_clock),
    .reset(sink_extend_reset)
  );
  AsyncValidSync sink_valid ( // @[AsyncQueue.scala 104:30]
    .io_in(sink_valid_io_in),
    .io_out(sink_valid_io_out),
    .clock(sink_valid_clock),
    .reset(sink_valid_reset)
  );
  assign io_enq_ready = ready_reg & sink_ready; // @[AsyncQueue.scala 89:29]
  assign io_async_mem_0 = mem_0; // @[AsyncQueue.scala 96:31]
  assign io_async_mem_1 = mem_1; // @[AsyncQueue.scala 96:31]
  assign io_async_mem_2 = mem_2; // @[AsyncQueue.scala 96:31]
  assign io_async_mem_3 = mem_3; // @[AsyncQueue.scala 96:31]
  assign io_async_mem_4 = mem_4; // @[AsyncQueue.scala 96:31]
  assign io_async_mem_5 = mem_5; // @[AsyncQueue.scala 96:31]
  assign io_async_mem_6 = mem_6; // @[AsyncQueue.scala 96:31]
  assign io_async_mem_7 = mem_7; // @[AsyncQueue.scala 96:31]
  assign io_async_widx = widx_gray; // @[AsyncQueue.scala 92:17]
  assign io_async_safe_widx_valid = source_valid_1_io_out; // @[AsyncQueue.scala 117:20]
  assign io_async_safe_source_reset_n = ~reset; // @[AsyncQueue.scala 121:27]
  assign ridx_ridx_gray_clock = clock;
  assign ridx_ridx_gray_reset = reset;
  assign ridx_ridx_gray_io_d = io_async_ridx; // @[ShiftReg.scala 47:16]
  assign source_valid_0_io_in = 1'h1; // @[AsyncQueue.scala 115:26]
  assign source_valid_0_clock = clock; // @[AsyncQueue.scala 110:26]
  assign source_valid_0_reset = reset | ~io_async_safe_sink_reset_n; // @[AsyncQueue.scala 105:65]
  assign source_valid_1_io_in = source_valid_0_io_out; // @[AsyncQueue.scala 116:26]
  assign source_valid_1_clock = clock; // @[AsyncQueue.scala 111:26]
  assign source_valid_1_reset = reset | ~io_async_safe_sink_reset_n; // @[AsyncQueue.scala 106:65]
  assign sink_extend_io_in = io_async_safe_ridx_valid; // @[AsyncQueue.scala 118:23]
  assign sink_extend_clock = clock; // @[AsyncQueue.scala 112:26]
  assign sink_extend_reset = reset | ~io_async_safe_sink_reset_n; // @[AsyncQueue.scala 107:65]
  assign sink_valid_io_in = sink_extend_io_out; // @[AsyncQueue.scala 119:22]
  assign sink_valid_clock = clock; // @[AsyncQueue.scala 113:26]
  assign sink_valid_reset = reset; // @[AsyncQueue.scala 108:35]
  always @(posedge clock) begin
    if (_widx_T_1) begin // @[AsyncQueue.scala 86:24]
      if (3'h0 == index) begin // @[AsyncQueue.scala 86:37]
        mem_0 <= io_enq_bits; // @[AsyncQueue.scala 86:37]
      end
    end
    if (_widx_T_1) begin // @[AsyncQueue.scala 86:24]
      if (3'h1 == index) begin // @[AsyncQueue.scala 86:37]
        mem_1 <= io_enq_bits; // @[AsyncQueue.scala 86:37]
      end
    end
    if (_widx_T_1) begin // @[AsyncQueue.scala 86:24]
      if (3'h2 == index) begin // @[AsyncQueue.scala 86:37]
        mem_2 <= io_enq_bits; // @[AsyncQueue.scala 86:37]
      end
    end
    if (_widx_T_1) begin // @[AsyncQueue.scala 86:24]
      if (3'h3 == index) begin // @[AsyncQueue.scala 86:37]
        mem_3 <= io_enq_bits; // @[AsyncQueue.scala 86:37]
      end
    end
    if (_widx_T_1) begin // @[AsyncQueue.scala 86:24]
      if (3'h4 == index) begin // @[AsyncQueue.scala 86:37]
        mem_4 <= io_enq_bits; // @[AsyncQueue.scala 86:37]
      end
    end
    if (_widx_T_1) begin // @[AsyncQueue.scala 86:24]
      if (3'h5 == index) begin // @[AsyncQueue.scala 86:37]
        mem_5 <= io_enq_bits; // @[AsyncQueue.scala 86:37]
      end
    end
    if (_widx_T_1) begin // @[AsyncQueue.scala 86:24]
      if (3'h6 == index) begin // @[AsyncQueue.scala 86:37]
        mem_6 <= io_enq_bits; // @[AsyncQueue.scala 86:37]
      end
    end
    if (_widx_T_1) begin // @[AsyncQueue.scala 86:24]
      if (3'h7 == index) begin // @[AsyncQueue.scala 86:37]
        mem_7 <= io_enq_bits; // @[AsyncQueue.scala 86:37]
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      widx_widx_bin <= 4'h0;
    end else if (_widx_T_2) begin
      widx_widx_bin <= 4'h0;
    end else begin
      widx_widx_bin <= _widx_incremented_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ready_reg <= 1'h0;
    end else begin
      ready_reg <= sink_ready & widx != _ready_T;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      widx_gray <= 4'h0;
    end else begin
      widx_gray <= widx_incremented ^ _GEN_17;
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
  mem_0 = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  mem_1 = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  mem_2 = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  mem_3 = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  mem_4 = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  mem_5 = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  mem_6 = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  mem_7 = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  widx_widx_bin = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  ready_reg = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  widx_gray = _RAND_10[3:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    widx_widx_bin = 4'h0;
  end
  if (reset) begin
    ready_reg = 1'h0;
  end
  if (reset) begin
    widx_gray = 4'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
