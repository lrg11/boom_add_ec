module TLError(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [3:0]  auto_in_a_bits_size,
  input  [4:0]  auto_in_a_bits_source,
  input  [13:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [3:0]  auto_in_d_bits_size,
  output [4:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_sink,
  output        auto_in_d_bits_denied,
  output [63:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock; // @[Nodes.scala 24:25]
  wire  monitor_reset; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_param; // @[Nodes.scala 24:25]
  wire [3:0] monitor_io_in_a_bits_size; // @[Nodes.scala 24:25]
  wire [4:0] monitor_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [13:0] monitor_io_in_a_bits_address; // @[Nodes.scala 24:25]
  wire [7:0] monitor_io_in_a_bits_mask; // @[Nodes.scala 24:25]
  wire [63:0] monitor_io_in_a_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_param; // @[Nodes.scala 24:25]
  wire [3:0] monitor_io_in_d_bits_size; // @[Nodes.scala 24:25]
  wire [4:0] monitor_io_in_d_bits_source; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_sink; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_denied; // @[Nodes.scala 24:25]
  wire [63:0] monitor_io_in_d_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_corrupt; // @[Nodes.scala 24:25]
  wire  a_clock; // @[Decoupled.scala 296:21]
  wire  a_reset; // @[Decoupled.scala 296:21]
  wire  a_io_enq_ready; // @[Decoupled.scala 296:21]
  wire  a_io_enq_valid; // @[Decoupled.scala 296:21]
  wire [2:0] a_io_enq_bits_opcode; // @[Decoupled.scala 296:21]
  wire [2:0] a_io_enq_bits_param; // @[Decoupled.scala 296:21]
  wire [3:0] a_io_enq_bits_size; // @[Decoupled.scala 296:21]
  wire [4:0] a_io_enq_bits_source; // @[Decoupled.scala 296:21]
  wire [13:0] a_io_enq_bits_address; // @[Decoupled.scala 296:21]
  wire [7:0] a_io_enq_bits_mask; // @[Decoupled.scala 296:21]
  wire [63:0] a_io_enq_bits_data; // @[Decoupled.scala 296:21]
  wire  a_io_enq_bits_corrupt; // @[Decoupled.scala 296:21]
  wire  a_io_deq_ready; // @[Decoupled.scala 296:21]
  wire  a_io_deq_valid; // @[Decoupled.scala 296:21]
  wire [2:0] a_io_deq_bits_opcode; // @[Decoupled.scala 296:21]
  wire [2:0] a_io_deq_bits_param; // @[Decoupled.scala 296:21]
  wire [3:0] a_io_deq_bits_size; // @[Decoupled.scala 296:21]
  wire [4:0] a_io_deq_bits_source; // @[Decoupled.scala 296:21]
  wire [13:0] a_io_deq_bits_address; // @[Decoupled.scala 296:21]
  wire [7:0] a_io_deq_bits_mask; // @[Decoupled.scala 296:21]
  wire [63:0] a_io_deq_bits_data; // @[Decoupled.scala 296:21]
  wire  a_io_deq_bits_corrupt; // @[Decoupled.scala 296:21]
  wire  a_io_count; // @[Decoupled.scala 296:21]
  wire  _a_last_T = a_io_deq_ready & a_io_deq_valid; // @[Decoupled.scala 40:37]
  wire [26:0] _a_last_beats1_decode_T_1 = 27'hfff << a_io_deq_bits_size; // @[package.scala 234:77]
  wire [11:0] _a_last_beats1_decode_T_3 = ~_a_last_beats1_decode_T_1[11:0]; // @[package.scala 234:46]
  wire [8:0] a_last_beats1_decode = _a_last_beats1_decode_T_3[11:3]; // @[Edges.scala 219:59]
  wire  a_last_beats1_opdata = ~a_io_deq_bits_opcode[2]; // @[Edges.scala 91:28]
  wire [8:0] a_last_beats1 = a_last_beats1_opdata ? a_last_beats1_decode : 9'h0; // @[Edges.scala 220:14]
  reg [8:0] a_last_counter; // @[Edges.scala 228:27]
  wire [8:0] a_last_counter1 = a_last_counter - 9'h1; // @[Edges.scala 229:28]
  wire  a_last_first = a_last_counter == 9'h0; // @[Edges.scala 230:25]
  wire  a_last = a_last_counter == 9'h1 | a_last_beats1 == 9'h0; // @[Edges.scala 231:37]
  wire  da_valid = a_io_deq_valid & a_last; // @[Error.scala 51:25]
  wire  _T = auto_in_d_ready & da_valid; // @[Decoupled.scala 40:37]
  wire [3:0] da_bits_size = a_io_deq_bits_size; // @[Error.scala 43:18 Error.scala 55:21]
  wire [26:0] _beats1_decode_T_1 = 27'hfff << da_bits_size; // @[package.scala 234:77]
  wire [11:0] _beats1_decode_T_3 = ~_beats1_decode_T_1[11:0]; // @[package.scala 234:46]
  wire [8:0] beats1_decode = _beats1_decode_T_3[11:3]; // @[Edges.scala 219:59]
  wire [2:0] _GEN_4 = 3'h2 == a_io_deq_bits_opcode ? 3'h1 : 3'h0; // @[Error.scala 53:21 Error.scala 53:21]
  wire [2:0] _GEN_5 = 3'h3 == a_io_deq_bits_opcode ? 3'h1 : _GEN_4; // @[Error.scala 53:21 Error.scala 53:21]
  wire [2:0] _GEN_6 = 3'h4 == a_io_deq_bits_opcode ? 3'h1 : _GEN_5; // @[Error.scala 53:21 Error.scala 53:21]
  wire [2:0] _GEN_7 = 3'h5 == a_io_deq_bits_opcode ? 3'h2 : _GEN_6; // @[Error.scala 53:21 Error.scala 53:21]
  wire [2:0] _GEN_8 = 3'h6 == a_io_deq_bits_opcode ? 3'h4 : _GEN_7; // @[Error.scala 53:21 Error.scala 53:21]
  wire [2:0] da_bits_opcode = 3'h7 == a_io_deq_bits_opcode ? 3'h4 : _GEN_8; // @[Error.scala 53:21 Error.scala 53:21]
  wire  beats1_opdata = da_bits_opcode[0]; // @[Edges.scala 105:36]
  wire [8:0] beats1 = beats1_opdata ? beats1_decode : 9'h0; // @[Edges.scala 220:14]
  reg [8:0] counter; // @[Edges.scala 228:27]
  wire [8:0] counter1 = counter - 9'h1; // @[Edges.scala 229:28]
  wire  da_first = counter == 9'h0; // @[Edges.scala 230:25]
  wire  da_last = counter == 9'h1 | beats1 == 9'h0; // @[Edges.scala 231:37]
  TLMonitor_22 monitor ( // @[Nodes.scala 24:25]
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
  Queue_12 a ( // @[Decoupled.scala 296:21]
    .clock(a_clock),
    .reset(a_reset),
    .io_enq_ready(a_io_enq_ready),
    .io_enq_valid(a_io_enq_valid),
    .io_enq_bits_opcode(a_io_enq_bits_opcode),
    .io_enq_bits_param(a_io_enq_bits_param),
    .io_enq_bits_size(a_io_enq_bits_size),
    .io_enq_bits_source(a_io_enq_bits_source),
    .io_enq_bits_address(a_io_enq_bits_address),
    .io_enq_bits_mask(a_io_enq_bits_mask),
    .io_enq_bits_data(a_io_enq_bits_data),
    .io_enq_bits_corrupt(a_io_enq_bits_corrupt),
    .io_deq_ready(a_io_deq_ready),
    .io_deq_valid(a_io_deq_valid),
    .io_deq_bits_opcode(a_io_deq_bits_opcode),
    .io_deq_bits_param(a_io_deq_bits_param),
    .io_deq_bits_size(a_io_deq_bits_size),
    .io_deq_bits_source(a_io_deq_bits_source),
    .io_deq_bits_address(a_io_deq_bits_address),
    .io_deq_bits_mask(a_io_deq_bits_mask),
    .io_deq_bits_data(a_io_deq_bits_data),
    .io_deq_bits_corrupt(a_io_deq_bits_corrupt),
    .io_count(a_io_count)
  );
  assign auto_in_a_ready = a_io_enq_ready; // @[Nodes.scala 1210:84 Decoupled.scala 299:17]
  assign auto_in_d_valid = a_io_deq_valid & a_last; // @[Error.scala 51:25]
  assign auto_in_d_bits_opcode = 3'h7 == a_io_deq_bits_opcode ? 3'h4 : _GEN_8; // @[Error.scala 53:21 Error.scala 53:21]
  assign auto_in_d_bits_param = 2'h0; // @[Error.scala 43:18 Error.scala 54:21]
  assign auto_in_d_bits_size = a_io_deq_bits_size; // @[Error.scala 43:18 Error.scala 55:21]
  assign auto_in_d_bits_source = a_io_deq_bits_source; // @[Error.scala 43:18 Error.scala 56:21]
  assign auto_in_d_bits_sink = 1'h0; // @[Error.scala 43:18 Error.scala 57:21]
  assign auto_in_d_bits_denied = 1'h1; // @[Error.scala 43:18 Error.scala 58:21]
  assign auto_in_d_bits_data = 64'h0; // @[Error.scala 43:18 Error.scala 59:21]
  assign auto_in_d_bits_corrupt = da_bits_opcode[0]; // @[Edges.scala 105:36]
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = a_io_enq_ready; // @[Nodes.scala 1210:84 Decoupled.scala 299:17]
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
  assign monitor_io_in_d_valid = a_io_deq_valid & a_last; // @[Error.scala 51:25]
  assign monitor_io_in_d_bits_opcode = 3'h7 == a_io_deq_bits_opcode ? 3'h4 : _GEN_8; // @[Error.scala 53:21 Error.scala 53:21]
  assign monitor_io_in_d_bits_param = 2'h0; // @[Error.scala 43:18 Error.scala 54:21]
  assign monitor_io_in_d_bits_size = a_io_deq_bits_size; // @[Error.scala 43:18 Error.scala 55:21]
  assign monitor_io_in_d_bits_source = a_io_deq_bits_source; // @[Error.scala 43:18 Error.scala 56:21]
  assign monitor_io_in_d_bits_sink = 1'h0; // @[Error.scala 43:18 Error.scala 57:21]
  assign monitor_io_in_d_bits_denied = 1'h1; // @[Error.scala 43:18 Error.scala 58:21]
  assign monitor_io_in_d_bits_data = 64'h0; // @[Error.scala 43:18 Error.scala 59:21]
  assign monitor_io_in_d_bits_corrupt = da_bits_opcode[0]; // @[Edges.scala 105:36]
  assign a_clock = clock;
  assign a_reset = reset;
  assign a_io_enq_valid = auto_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign a_io_enq_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign a_io_enq_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign a_io_enq_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign a_io_enq_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign a_io_enq_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign a_io_enq_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign a_io_enq_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign a_io_enq_bits_corrupt = auto_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign a_io_deq_ready = auto_in_d_ready & da_last | ~a_last; // @[Error.scala 50:46]
  always @(posedge clock) begin
    if (reset) begin // @[Edges.scala 228:27]
      a_last_counter <= 9'h0; // @[Edges.scala 228:27]
    end else if (_a_last_T) begin // @[Edges.scala 234:17]
      if (a_last_first) begin // @[Edges.scala 235:21]
        if (a_last_beats1_opdata) begin // @[Edges.scala 220:14]
          a_last_counter <= a_last_beats1_decode;
        end else begin
          a_last_counter <= 9'h0;
        end
      end else begin
        a_last_counter <= a_last_counter1;
      end
    end
    if (reset) begin // @[Edges.scala 228:27]
      counter <= 9'h0; // @[Edges.scala 228:27]
    end else if (_T) begin // @[Edges.scala 234:17]
      if (da_first) begin // @[Edges.scala 235:21]
        if (beats1_opdata) begin // @[Edges.scala 220:14]
          counter <= beats1_decode;
        end else begin
          counter <= 9'h0;
        end
      end else begin
        counter <= counter1;
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
  _RAND_0 = {1{`RANDOM}};
  a_last_counter = _RAND_0[8:0];
  _RAND_1 = {1{`RANDOM}};
  counter = _RAND_1[8:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
