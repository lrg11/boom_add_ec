module TLBusBypassBar(
  input          clock,
  input          reset,
  output         auto_in_a_ready,
  input          auto_in_a_valid,
  input  [2:0]   auto_in_a_bits_opcode,
  input  [2:0]   auto_in_a_bits_param,
  input  [1:0]   auto_in_a_bits_size,
  input          auto_in_a_bits_source,
  input  [8:0]   auto_in_a_bits_address,
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
  output         auto_in_d_bits_corrupt,
  input          auto_out_1_a_ready,
  output         auto_out_1_a_valid,
  output [2:0]   auto_out_1_a_bits_opcode,
  output [2:0]   auto_out_1_a_bits_param,
  output [1:0]   auto_out_1_a_bits_size,
  output         auto_out_1_a_bits_source,
  output [8:0]   auto_out_1_a_bits_address,
  output [3:0]   auto_out_1_a_bits_mask,
  output [31:0]  auto_out_1_a_bits_data,
  output         auto_out_1_a_bits_corrupt,
  output         auto_out_1_d_ready,
  input          auto_out_1_d_valid,
  input  [2:0]   auto_out_1_d_bits_opcode,
  input  [1:0]   auto_out_1_d_bits_param,
  input  [1:0]   auto_out_1_d_bits_size,
  input          auto_out_1_d_bits_source,
  input          auto_out_1_d_bits_sink,
  input          auto_out_1_d_bits_denied,
  input  [31:0]  auto_out_1_d_bits_data,
  input          auto_out_1_d_bits_corrupt,
  input          auto_out_0_a_ready,
  output         auto_out_0_a_valid,
  output [2:0]   auto_out_0_a_bits_opcode,
  output [2:0]   auto_out_0_a_bits_param,
  output [1:0]   auto_out_0_a_bits_size,
  output         auto_out_0_a_bits_source,
  output [127:0] auto_out_0_a_bits_address,
  output [3:0]   auto_out_0_a_bits_mask,
  output [31:0]  auto_out_0_a_bits_data,
  output         auto_out_0_a_bits_corrupt,
  output         auto_out_0_d_ready,
  input          auto_out_0_d_valid,
  input  [2:0]   auto_out_0_d_bits_opcode,
  input  [1:0]   auto_out_0_d_bits_param,
  input  [1:0]   auto_out_0_d_bits_size,
  input          auto_out_0_d_bits_source,
  input          auto_out_0_d_bits_sink,
  input          auto_out_0_d_bits_denied,
  input  [31:0]  auto_out_0_d_bits_data,
  input          auto_out_0_d_bits_corrupt,
  input          io_bypass,
  output         io_pending
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock; // @[Nodes.scala 24:25]
  wire  monitor_reset; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_param; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_a_bits_size; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [8:0] monitor_io_in_a_bits_address; // @[Nodes.scala 24:25]
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
  reg  in_reset; // @[BusBypass.scala 77:27]
  reg  bypass_reg; // @[BusBypass.scala 78:25]
  wire  bypass = in_reset ? io_bypass : bypass_reg; // @[BusBypass.scala 79:21]
  reg [1:0] flight; // @[Edges.scala 294:25]
  reg  stall_counter; // @[Edges.scala 228:27]
  wire  stall_first = ~stall_counter; // @[Edges.scala 230:25]
  wire  stall = bypass != io_bypass & stall_first; // @[BusBypass.scala 84:40]
  wire  _bundleIn_0_a_ready_T = ~stall; // @[BusBypass.scala 88:21]
  wire  _bundleIn_0_a_ready_T_1 = bypass ? auto_out_0_a_ready : auto_out_1_a_ready; // @[BusBypass.scala 88:34]
  wire  in_a_ready = ~stall & _bundleIn_0_a_ready_T_1; // @[BusBypass.scala 88:28]
  wire  done = in_a_ready & auto_in_a_valid; // @[Decoupled.scala 40:37]
  reg  counter; // @[Edges.scala 228:27]
  wire  counter1 = counter - 1'h1; // @[Edges.scala 229:28]
  wire  a_first = ~counter; // @[Edges.scala 230:25]
  wire  in_d_valid = bypass ? auto_out_0_d_valid : auto_out_1_d_valid; // @[BusBypass.scala 94:24]
  wire  done_3 = auto_in_d_ready & in_d_valid; // @[Decoupled.scala 40:37]
  wire [2:0] in_d_bits_opcode = bypass ? auto_out_0_d_bits_opcode : auto_out_1_d_bits_opcode; // @[BusBypass.scala 96:21]
  reg  counter_3; // @[Edges.scala 228:27]
  wire  counter1_3 = counter_3 - 1'h1; // @[Edges.scala 229:28]
  wire  d_first = ~counter_3; // @[Edges.scala 230:25]
  wire  d_request = in_d_bits_opcode[2] & ~in_d_bits_opcode[1]; // @[Edges.scala 70:40]
  wire  inc_hi = done & a_first; // @[Edges.scala 309:28]
  wire  inc_lo = done_3 & d_first & d_request; // @[Edges.scala 312:39]
  wire [1:0] inc = {inc_hi,inc_lo}; // @[Cat.scala 30:58]
  wire [1:0] dec = {1'h0,done_3}; // @[Cat.scala 30:58]
  wire [1:0] _next_flight_T_2 = inc[0] + inc[1]; // @[Bitwise.scala 47:55]
  wire [1:0] _next_flight_T_5 = flight + _next_flight_T_2; // @[Edges.scala 323:30]
  wire [1:0] _next_flight_T_8 = dec[0] + dec[1]; // @[Bitwise.scala 47:55]
  wire [1:0] next_flight = _next_flight_T_5 - _next_flight_T_8; // @[Edges.scala 323:46]
  wire  stall_counter1 = stall_counter - 1'h1; // @[Edges.scala 229:28]
  wire  _bundleOut_0_a_valid_T_1 = _bundleIn_0_a_ready_T & auto_in_a_valid; // @[BusBypass.scala 86:28]
  wire  _bundleOut_1_a_valid_T_2 = ~bypass; // @[BusBypass.scala 87:45]
  TLMonitor_43 monitor ( // @[Nodes.scala 24:25]
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
  assign auto_in_a_ready = ~stall & _bundleIn_0_a_ready_T_1; // @[BusBypass.scala 88:28]
  assign auto_in_d_valid = bypass ? auto_out_0_d_valid : auto_out_1_d_valid; // @[BusBypass.scala 94:24]
  assign auto_in_d_bits_opcode = bypass ? auto_out_0_d_bits_opcode : auto_out_1_d_bits_opcode; // @[BusBypass.scala 96:21]
  assign auto_in_d_bits_param = bypass ? auto_out_0_d_bits_param : auto_out_1_d_bits_param; // @[BusBypass.scala 96:21]
  assign auto_in_d_bits_size = bypass ? auto_out_0_d_bits_size : auto_out_1_d_bits_size; // @[BusBypass.scala 96:21]
  assign auto_in_d_bits_source = bypass ? auto_out_0_d_bits_source : auto_out_1_d_bits_source; // @[BusBypass.scala 96:21]
  assign auto_in_d_bits_sink = bypass ? auto_out_0_d_bits_sink : auto_out_1_d_bits_sink; // @[BusBypass.scala 96:21]
  assign auto_in_d_bits_denied = bypass ? auto_out_0_d_bits_denied : auto_out_1_d_bits_denied; // @[BusBypass.scala 96:21]
  assign auto_in_d_bits_data = bypass ? auto_out_0_d_bits_data : auto_out_1_d_bits_data; // @[BusBypass.scala 96:21]
  assign auto_in_d_bits_corrupt = bypass ? auto_out_0_d_bits_corrupt : auto_out_1_d_bits_corrupt; // @[BusBypass.scala 96:21]
  assign auto_out_1_a_valid = _bundleOut_0_a_valid_T_1 & ~bypass; // @[BusBypass.scala 87:42]
  assign auto_out_1_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_a_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_a_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_a_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_a_bits_corrupt = auto_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_d_ready = auto_in_d_ready & _bundleOut_1_a_valid_T_2; // @[BusBypass.scala 93:32]
  assign auto_out_0_a_valid = _bundleIn_0_a_ready_T & auto_in_a_valid & bypass; // @[BusBypass.scala 86:42]
  assign auto_out_0_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_bits_address = {{119'd0}, auto_in_a_bits_address}; // @[Nodes.scala 1207:84 BusBypass.scala 89:18]
  assign auto_out_0_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_bits_corrupt = auto_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_d_ready = auto_in_d_ready & bypass; // @[BusBypass.scala 92:32]
  assign io_pending = flight > 2'h0; // @[BusBypass.scala 82:27]
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = ~stall & _bundleIn_0_a_ready_T_1; // @[BusBypass.scala 88:28]
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
  assign monitor_io_in_d_valid = bypass ? auto_out_0_d_valid : auto_out_1_d_valid; // @[BusBypass.scala 94:24]
  assign monitor_io_in_d_bits_opcode = bypass ? auto_out_0_d_bits_opcode : auto_out_1_d_bits_opcode; // @[BusBypass.scala 96:21]
  assign monitor_io_in_d_bits_param = bypass ? auto_out_0_d_bits_param : auto_out_1_d_bits_param; // @[BusBypass.scala 96:21]
  assign monitor_io_in_d_bits_size = bypass ? auto_out_0_d_bits_size : auto_out_1_d_bits_size; // @[BusBypass.scala 96:21]
  assign monitor_io_in_d_bits_source = bypass ? auto_out_0_d_bits_source : auto_out_1_d_bits_source; // @[BusBypass.scala 96:21]
  assign monitor_io_in_d_bits_sink = bypass ? auto_out_0_d_bits_sink : auto_out_1_d_bits_sink; // @[BusBypass.scala 96:21]
  assign monitor_io_in_d_bits_denied = bypass ? auto_out_0_d_bits_denied : auto_out_1_d_bits_denied; // @[BusBypass.scala 96:21]
  assign monitor_io_in_d_bits_data = bypass ? auto_out_0_d_bits_data : auto_out_1_d_bits_data; // @[BusBypass.scala 96:21]
  assign monitor_io_in_d_bits_corrupt = bypass ? auto_out_0_d_bits_corrupt : auto_out_1_d_bits_corrupt; // @[BusBypass.scala 96:21]
  always @(posedge clock) begin
    in_reset <= reset; // @[BusBypass.scala 77:27 BusBypass.scala 77:27 BusBypass.scala 77:27]
    if (in_reset | next_flight == 2'h0) begin // @[BusBypass.scala 83:50]
      bypass_reg <= io_bypass; // @[BusBypass.scala 83:63]
    end
    if (reset) begin // @[Edges.scala 294:25]
      flight <= 2'h0; // @[Edges.scala 294:25]
    end else begin
      flight <= next_flight; // @[Edges.scala 324:12]
    end
    if (reset) begin // @[Edges.scala 228:27]
      stall_counter <= 1'h0; // @[Edges.scala 228:27]
    end else if (done) begin // @[Edges.scala 234:17]
      if (stall_first) begin // @[Edges.scala 235:21]
        stall_counter <= 1'h0;
      end else begin
        stall_counter <= stall_counter1;
      end
    end
    if (reset) begin // @[Edges.scala 228:27]
      counter <= 1'h0; // @[Edges.scala 228:27]
    end else if (done) begin // @[Edges.scala 234:17]
      if (a_first) begin // @[Edges.scala 235:21]
        counter <= 1'h0;
      end else begin
        counter <= counter1;
      end
    end
    if (reset) begin // @[Edges.scala 228:27]
      counter_3 <= 1'h0; // @[Edges.scala 228:27]
    end else if (done_3) begin // @[Edges.scala 234:17]
      if (d_first) begin // @[Edges.scala 235:21]
        counter_3 <= 1'h0;
      end else begin
        counter_3 <= counter1_3;
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
  in_reset = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  bypass_reg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  flight = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  stall_counter = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  counter = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  counter_3 = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
