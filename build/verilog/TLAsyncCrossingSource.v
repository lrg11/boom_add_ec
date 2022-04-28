module TLAsyncCrossingSource(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [1:0]  auto_in_a_bits_size,
  input         auto_in_a_bits_source,
  input  [8:0]  auto_in_a_bits_address,
  input  [3:0]  auto_in_a_bits_mask,
  input  [31:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [1:0]  auto_in_d_bits_size,
  output        auto_in_d_bits_source,
  output        auto_in_d_bits_sink,
  output        auto_in_d_bits_denied,
  output [31:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  output [2:0]  auto_out_a_mem_0_opcode,
  output [2:0]  auto_out_a_mem_0_param,
  output [1:0]  auto_out_a_mem_0_size,
  output        auto_out_a_mem_0_source,
  output [8:0]  auto_out_a_mem_0_address,
  output [3:0]  auto_out_a_mem_0_mask,
  output [31:0] auto_out_a_mem_0_data,
  output        auto_out_a_mem_0_corrupt,
  input         auto_out_a_ridx,
  output        auto_out_a_widx,
  input         auto_out_a_safe_ridx_valid,
  output        auto_out_a_safe_widx_valid,
  output        auto_out_a_safe_source_reset_n,
  input         auto_out_a_safe_sink_reset_n,
  input  [2:0]  auto_out_b_mem_0_opcode,
  input  [1:0]  auto_out_b_mem_0_param,
  input  [1:0]  auto_out_b_mem_0_size,
  input         auto_out_b_mem_0_source,
  input  [8:0]  auto_out_b_mem_0_address,
  input  [3:0]  auto_out_b_mem_0_mask,
  input  [31:0] auto_out_b_mem_0_data,
  input         auto_out_b_mem_0_corrupt,
  output        auto_out_b_ridx,
  input         auto_out_b_widx,
  output        auto_out_b_safe_ridx_valid,
  input         auto_out_b_safe_widx_valid,
  input         auto_out_b_safe_source_reset_n,
  output        auto_out_b_safe_sink_reset_n,
  output [2:0]  auto_out_c_mem_0_opcode,
  output [2:0]  auto_out_c_mem_0_param,
  output [1:0]  auto_out_c_mem_0_size,
  output        auto_out_c_mem_0_source,
  output [8:0]  auto_out_c_mem_0_address,
  output [31:0] auto_out_c_mem_0_data,
  output        auto_out_c_mem_0_corrupt,
  input         auto_out_c_ridx,
  output        auto_out_c_widx,
  input         auto_out_c_safe_ridx_valid,
  output        auto_out_c_safe_widx_valid,
  output        auto_out_c_safe_source_reset_n,
  input         auto_out_c_safe_sink_reset_n,
  input  [2:0]  auto_out_d_mem_0_opcode,
  input  [1:0]  auto_out_d_mem_0_param,
  input  [1:0]  auto_out_d_mem_0_size,
  input         auto_out_d_mem_0_source,
  input         auto_out_d_mem_0_sink,
  input         auto_out_d_mem_0_denied,
  input  [31:0] auto_out_d_mem_0_data,
  input         auto_out_d_mem_0_corrupt,
  output        auto_out_d_ridx,
  input         auto_out_d_widx,
  output        auto_out_d_safe_ridx_valid,
  input         auto_out_d_safe_widx_valid,
  input         auto_out_d_safe_source_reset_n,
  output        auto_out_d_safe_sink_reset_n,
  output        auto_out_e_mem_0_sink,
  input         auto_out_e_ridx,
  output        auto_out_e_widx,
  input         auto_out_e_safe_ridx_valid,
  output        auto_out_e_safe_widx_valid,
  output        auto_out_e_safe_source_reset_n,
  input         auto_out_e_safe_sink_reset_n
);
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
  wire  bundleOut_0_a_source_clock; // @[AsyncQueue.scala 216:24]
  wire  bundleOut_0_a_source_reset; // @[AsyncQueue.scala 216:24]
  wire  bundleOut_0_a_source_io_enq_ready; // @[AsyncQueue.scala 216:24]
  wire  bundleOut_0_a_source_io_enq_valid; // @[AsyncQueue.scala 216:24]
  wire [2:0] bundleOut_0_a_source_io_enq_bits_opcode; // @[AsyncQueue.scala 216:24]
  wire [2:0] bundleOut_0_a_source_io_enq_bits_param; // @[AsyncQueue.scala 216:24]
  wire [1:0] bundleOut_0_a_source_io_enq_bits_size; // @[AsyncQueue.scala 216:24]
  wire  bundleOut_0_a_source_io_enq_bits_source; // @[AsyncQueue.scala 216:24]
  wire [8:0] bundleOut_0_a_source_io_enq_bits_address; // @[AsyncQueue.scala 216:24]
  wire [3:0] bundleOut_0_a_source_io_enq_bits_mask; // @[AsyncQueue.scala 216:24]
  wire [31:0] bundleOut_0_a_source_io_enq_bits_data; // @[AsyncQueue.scala 216:24]
  wire  bundleOut_0_a_source_io_enq_bits_corrupt; // @[AsyncQueue.scala 216:24]
  wire [2:0] bundleOut_0_a_source_io_async_mem_0_opcode; // @[AsyncQueue.scala 216:24]
  wire [2:0] bundleOut_0_a_source_io_async_mem_0_param; // @[AsyncQueue.scala 216:24]
  wire [1:0] bundleOut_0_a_source_io_async_mem_0_size; // @[AsyncQueue.scala 216:24]
  wire  bundleOut_0_a_source_io_async_mem_0_source; // @[AsyncQueue.scala 216:24]
  wire [8:0] bundleOut_0_a_source_io_async_mem_0_address; // @[AsyncQueue.scala 216:24]
  wire [3:0] bundleOut_0_a_source_io_async_mem_0_mask; // @[AsyncQueue.scala 216:24]
  wire [31:0] bundleOut_0_a_source_io_async_mem_0_data; // @[AsyncQueue.scala 216:24]
  wire  bundleOut_0_a_source_io_async_mem_0_corrupt; // @[AsyncQueue.scala 216:24]
  wire  bundleOut_0_a_source_io_async_ridx; // @[AsyncQueue.scala 216:24]
  wire  bundleOut_0_a_source_io_async_widx; // @[AsyncQueue.scala 216:24]
  wire  bundleOut_0_a_source_io_async_safe_ridx_valid; // @[AsyncQueue.scala 216:24]
  wire  bundleOut_0_a_source_io_async_safe_widx_valid; // @[AsyncQueue.scala 216:24]
  wire  bundleOut_0_a_source_io_async_safe_source_reset_n; // @[AsyncQueue.scala 216:24]
  wire  bundleOut_0_a_source_io_async_safe_sink_reset_n; // @[AsyncQueue.scala 216:24]
  wire  bundleIn_0_d_sink_clock; // @[AsyncQueue.scala 207:22]
  wire  bundleIn_0_d_sink_reset; // @[AsyncQueue.scala 207:22]
  wire  bundleIn_0_d_sink_io_deq_ready; // @[AsyncQueue.scala 207:22]
  wire  bundleIn_0_d_sink_io_deq_valid; // @[AsyncQueue.scala 207:22]
  wire [2:0] bundleIn_0_d_sink_io_deq_bits_opcode; // @[AsyncQueue.scala 207:22]
  wire [1:0] bundleIn_0_d_sink_io_deq_bits_param; // @[AsyncQueue.scala 207:22]
  wire [1:0] bundleIn_0_d_sink_io_deq_bits_size; // @[AsyncQueue.scala 207:22]
  wire  bundleIn_0_d_sink_io_deq_bits_source; // @[AsyncQueue.scala 207:22]
  wire  bundleIn_0_d_sink_io_deq_bits_sink; // @[AsyncQueue.scala 207:22]
  wire  bundleIn_0_d_sink_io_deq_bits_denied; // @[AsyncQueue.scala 207:22]
  wire [31:0] bundleIn_0_d_sink_io_deq_bits_data; // @[AsyncQueue.scala 207:22]
  wire  bundleIn_0_d_sink_io_deq_bits_corrupt; // @[AsyncQueue.scala 207:22]
  wire [2:0] bundleIn_0_d_sink_io_async_mem_0_opcode; // @[AsyncQueue.scala 207:22]
  wire [1:0] bundleIn_0_d_sink_io_async_mem_0_param; // @[AsyncQueue.scala 207:22]
  wire [1:0] bundleIn_0_d_sink_io_async_mem_0_size; // @[AsyncQueue.scala 207:22]
  wire  bundleIn_0_d_sink_io_async_mem_0_source; // @[AsyncQueue.scala 207:22]
  wire  bundleIn_0_d_sink_io_async_mem_0_sink; // @[AsyncQueue.scala 207:22]
  wire  bundleIn_0_d_sink_io_async_mem_0_denied; // @[AsyncQueue.scala 207:22]
  wire [31:0] bundleIn_0_d_sink_io_async_mem_0_data; // @[AsyncQueue.scala 207:22]
  wire  bundleIn_0_d_sink_io_async_mem_0_corrupt; // @[AsyncQueue.scala 207:22]
  wire  bundleIn_0_d_sink_io_async_ridx; // @[AsyncQueue.scala 207:22]
  wire  bundleIn_0_d_sink_io_async_widx; // @[AsyncQueue.scala 207:22]
  wire  bundleIn_0_d_sink_io_async_safe_ridx_valid; // @[AsyncQueue.scala 207:22]
  wire  bundleIn_0_d_sink_io_async_safe_widx_valid; // @[AsyncQueue.scala 207:22]
  wire  bundleIn_0_d_sink_io_async_safe_source_reset_n; // @[AsyncQueue.scala 207:22]
  wire  bundleIn_0_d_sink_io_async_safe_sink_reset_n; // @[AsyncQueue.scala 207:22]
  TLMonitor_45 monitor ( // @[Nodes.scala 24:25]
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
  AsyncQueueSource bundleOut_0_a_source ( // @[AsyncQueue.scala 216:24]
    .clock(bundleOut_0_a_source_clock),
    .reset(bundleOut_0_a_source_reset),
    .io_enq_ready(bundleOut_0_a_source_io_enq_ready),
    .io_enq_valid(bundleOut_0_a_source_io_enq_valid),
    .io_enq_bits_opcode(bundleOut_0_a_source_io_enq_bits_opcode),
    .io_enq_bits_param(bundleOut_0_a_source_io_enq_bits_param),
    .io_enq_bits_size(bundleOut_0_a_source_io_enq_bits_size),
    .io_enq_bits_source(bundleOut_0_a_source_io_enq_bits_source),
    .io_enq_bits_address(bundleOut_0_a_source_io_enq_bits_address),
    .io_enq_bits_mask(bundleOut_0_a_source_io_enq_bits_mask),
    .io_enq_bits_data(bundleOut_0_a_source_io_enq_bits_data),
    .io_enq_bits_corrupt(bundleOut_0_a_source_io_enq_bits_corrupt),
    .io_async_mem_0_opcode(bundleOut_0_a_source_io_async_mem_0_opcode),
    .io_async_mem_0_param(bundleOut_0_a_source_io_async_mem_0_param),
    .io_async_mem_0_size(bundleOut_0_a_source_io_async_mem_0_size),
    .io_async_mem_0_source(bundleOut_0_a_source_io_async_mem_0_source),
    .io_async_mem_0_address(bundleOut_0_a_source_io_async_mem_0_address),
    .io_async_mem_0_mask(bundleOut_0_a_source_io_async_mem_0_mask),
    .io_async_mem_0_data(bundleOut_0_a_source_io_async_mem_0_data),
    .io_async_mem_0_corrupt(bundleOut_0_a_source_io_async_mem_0_corrupt),
    .io_async_ridx(bundleOut_0_a_source_io_async_ridx),
    .io_async_widx(bundleOut_0_a_source_io_async_widx),
    .io_async_safe_ridx_valid(bundleOut_0_a_source_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(bundleOut_0_a_source_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(bundleOut_0_a_source_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(bundleOut_0_a_source_io_async_safe_sink_reset_n)
  );
  AsyncQueueSink bundleIn_0_d_sink ( // @[AsyncQueue.scala 207:22]
    .clock(bundleIn_0_d_sink_clock),
    .reset(bundleIn_0_d_sink_reset),
    .io_deq_ready(bundleIn_0_d_sink_io_deq_ready),
    .io_deq_valid(bundleIn_0_d_sink_io_deq_valid),
    .io_deq_bits_opcode(bundleIn_0_d_sink_io_deq_bits_opcode),
    .io_deq_bits_param(bundleIn_0_d_sink_io_deq_bits_param),
    .io_deq_bits_size(bundleIn_0_d_sink_io_deq_bits_size),
    .io_deq_bits_source(bundleIn_0_d_sink_io_deq_bits_source),
    .io_deq_bits_sink(bundleIn_0_d_sink_io_deq_bits_sink),
    .io_deq_bits_denied(bundleIn_0_d_sink_io_deq_bits_denied),
    .io_deq_bits_data(bundleIn_0_d_sink_io_deq_bits_data),
    .io_deq_bits_corrupt(bundleIn_0_d_sink_io_deq_bits_corrupt),
    .io_async_mem_0_opcode(bundleIn_0_d_sink_io_async_mem_0_opcode),
    .io_async_mem_0_param(bundleIn_0_d_sink_io_async_mem_0_param),
    .io_async_mem_0_size(bundleIn_0_d_sink_io_async_mem_0_size),
    .io_async_mem_0_source(bundleIn_0_d_sink_io_async_mem_0_source),
    .io_async_mem_0_sink(bundleIn_0_d_sink_io_async_mem_0_sink),
    .io_async_mem_0_denied(bundleIn_0_d_sink_io_async_mem_0_denied),
    .io_async_mem_0_data(bundleIn_0_d_sink_io_async_mem_0_data),
    .io_async_mem_0_corrupt(bundleIn_0_d_sink_io_async_mem_0_corrupt),
    .io_async_ridx(bundleIn_0_d_sink_io_async_ridx),
    .io_async_widx(bundleIn_0_d_sink_io_async_widx),
    .io_async_safe_ridx_valid(bundleIn_0_d_sink_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(bundleIn_0_d_sink_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(bundleIn_0_d_sink_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(bundleIn_0_d_sink_io_async_safe_sink_reset_n)
  );
  assign auto_in_a_ready = bundleOut_0_a_source_io_enq_ready; // @[Nodes.scala 1210:84 AsyncQueue.scala 217:19]
  assign auto_in_d_valid = bundleIn_0_d_sink_io_deq_valid; // @[Nodes.scala 1210:84 AsyncCrossing.scala 26:12]
  assign auto_in_d_bits_opcode = bundleIn_0_d_sink_io_deq_bits_opcode; // @[Nodes.scala 1210:84 AsyncCrossing.scala 26:12]
  assign auto_in_d_bits_param = bundleIn_0_d_sink_io_deq_bits_param; // @[Nodes.scala 1210:84 AsyncCrossing.scala 26:12]
  assign auto_in_d_bits_size = bundleIn_0_d_sink_io_deq_bits_size; // @[Nodes.scala 1210:84 AsyncCrossing.scala 26:12]
  assign auto_in_d_bits_source = bundleIn_0_d_sink_io_deq_bits_source; // @[Nodes.scala 1210:84 AsyncCrossing.scala 26:12]
  assign auto_in_d_bits_sink = bundleIn_0_d_sink_io_deq_bits_sink; // @[Nodes.scala 1210:84 AsyncCrossing.scala 26:12]
  assign auto_in_d_bits_denied = bundleIn_0_d_sink_io_deq_bits_denied; // @[Nodes.scala 1210:84 AsyncCrossing.scala 26:12]
  assign auto_in_d_bits_data = bundleIn_0_d_sink_io_deq_bits_data; // @[Nodes.scala 1210:84 AsyncCrossing.scala 26:12]
  assign auto_in_d_bits_corrupt = bundleIn_0_d_sink_io_deq_bits_corrupt; // @[Nodes.scala 1210:84 AsyncCrossing.scala 26:12]
  assign auto_out_a_mem_0_opcode = bundleOut_0_a_source_io_async_mem_0_opcode; // @[Nodes.scala 1207:84 AsyncCrossing.scala 25:13]
  assign auto_out_a_mem_0_param = bundleOut_0_a_source_io_async_mem_0_param; // @[Nodes.scala 1207:84 AsyncCrossing.scala 25:13]
  assign auto_out_a_mem_0_size = bundleOut_0_a_source_io_async_mem_0_size; // @[Nodes.scala 1207:84 AsyncCrossing.scala 25:13]
  assign auto_out_a_mem_0_source = bundleOut_0_a_source_io_async_mem_0_source; // @[Nodes.scala 1207:84 AsyncCrossing.scala 25:13]
  assign auto_out_a_mem_0_address = bundleOut_0_a_source_io_async_mem_0_address; // @[Nodes.scala 1207:84 AsyncCrossing.scala 25:13]
  assign auto_out_a_mem_0_mask = bundleOut_0_a_source_io_async_mem_0_mask; // @[Nodes.scala 1207:84 AsyncCrossing.scala 25:13]
  assign auto_out_a_mem_0_data = bundleOut_0_a_source_io_async_mem_0_data; // @[Nodes.scala 1207:84 AsyncCrossing.scala 25:13]
  assign auto_out_a_mem_0_corrupt = bundleOut_0_a_source_io_async_mem_0_corrupt; // @[Nodes.scala 1207:84 AsyncCrossing.scala 25:13]
  assign auto_out_a_widx = bundleOut_0_a_source_io_async_widx; // @[Nodes.scala 1207:84 AsyncCrossing.scala 25:13]
  assign auto_out_a_safe_widx_valid = bundleOut_0_a_source_io_async_safe_widx_valid; // @[Nodes.scala 1207:84 AsyncCrossing.scala 25:13]
  assign auto_out_a_safe_source_reset_n = bundleOut_0_a_source_io_async_safe_source_reset_n; // @[Nodes.scala 1207:84 AsyncCrossing.scala 25:13]
  assign auto_out_b_ridx = 1'h0; // @[Nodes.scala 1207:84 AsyncCrossing.scala 41:20]
  assign auto_out_b_safe_ridx_valid = 1'h0; // @[LazyModule.scala 311:12]
  assign auto_out_b_safe_sink_reset_n = 1'h0; // @[LazyModule.scala 311:12]
  assign auto_out_c_mem_0_opcode = 3'h0; // @[LazyModule.scala 311:12]
  assign auto_out_c_mem_0_param = 3'h0; // @[LazyModule.scala 311:12]
  assign auto_out_c_mem_0_size = 2'h0; // @[LazyModule.scala 311:12]
  assign auto_out_c_mem_0_source = 1'h0; // @[LazyModule.scala 311:12]
  assign auto_out_c_mem_0_address = 9'h0; // @[LazyModule.scala 311:12]
  assign auto_out_c_mem_0_data = 32'h0; // @[LazyModule.scala 311:12]
  assign auto_out_c_mem_0_corrupt = 1'h0; // @[LazyModule.scala 311:12]
  assign auto_out_c_widx = 1'h0; // @[Nodes.scala 1207:84 AsyncCrossing.scala 42:20]
  assign auto_out_c_safe_widx_valid = 1'h0; // @[LazyModule.scala 311:12]
  assign auto_out_c_safe_source_reset_n = 1'h0; // @[LazyModule.scala 311:12]
  assign auto_out_d_ridx = bundleIn_0_d_sink_io_async_ridx; // @[Nodes.scala 1207:84 AsyncQueue.scala 208:19]
  assign auto_out_d_safe_ridx_valid = bundleIn_0_d_sink_io_async_safe_ridx_valid; // @[Nodes.scala 1207:84 AsyncQueue.scala 208:19]
  assign auto_out_d_safe_sink_reset_n = bundleIn_0_d_sink_io_async_safe_sink_reset_n; // @[Nodes.scala 1207:84 AsyncQueue.scala 208:19]
  assign auto_out_e_mem_0_sink = 1'h0; // @[LazyModule.scala 311:12]
  assign auto_out_e_widx = 1'h0; // @[Nodes.scala 1207:84 AsyncCrossing.scala 43:20]
  assign auto_out_e_safe_widx_valid = 1'h0; // @[LazyModule.scala 311:12]
  assign auto_out_e_safe_source_reset_n = 1'h0; // @[LazyModule.scala 311:12]
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = bundleOut_0_a_source_io_enq_ready; // @[Nodes.scala 1210:84 AsyncQueue.scala 217:19]
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
  assign monitor_io_in_d_valid = bundleIn_0_d_sink_io_deq_valid; // @[Nodes.scala 1210:84 AsyncCrossing.scala 26:12]
  assign monitor_io_in_d_bits_opcode = bundleIn_0_d_sink_io_deq_bits_opcode; // @[Nodes.scala 1210:84 AsyncCrossing.scala 26:12]
  assign monitor_io_in_d_bits_param = bundleIn_0_d_sink_io_deq_bits_param; // @[Nodes.scala 1210:84 AsyncCrossing.scala 26:12]
  assign monitor_io_in_d_bits_size = bundleIn_0_d_sink_io_deq_bits_size; // @[Nodes.scala 1210:84 AsyncCrossing.scala 26:12]
  assign monitor_io_in_d_bits_source = bundleIn_0_d_sink_io_deq_bits_source; // @[Nodes.scala 1210:84 AsyncCrossing.scala 26:12]
  assign monitor_io_in_d_bits_sink = bundleIn_0_d_sink_io_deq_bits_sink; // @[Nodes.scala 1210:84 AsyncCrossing.scala 26:12]
  assign monitor_io_in_d_bits_denied = bundleIn_0_d_sink_io_deq_bits_denied; // @[Nodes.scala 1210:84 AsyncCrossing.scala 26:12]
  assign monitor_io_in_d_bits_data = bundleIn_0_d_sink_io_deq_bits_data; // @[Nodes.scala 1210:84 AsyncCrossing.scala 26:12]
  assign monitor_io_in_d_bits_corrupt = bundleIn_0_d_sink_io_deq_bits_corrupt; // @[Nodes.scala 1210:84 AsyncCrossing.scala 26:12]
  assign bundleOut_0_a_source_clock = clock;
  assign bundleOut_0_a_source_reset = reset;
  assign bundleOut_0_a_source_io_enq_valid = auto_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_a_source_io_enq_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_a_source_io_enq_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_a_source_io_enq_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_a_source_io_enq_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_a_source_io_enq_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_a_source_io_enq_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_a_source_io_enq_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_a_source_io_enq_bits_corrupt = auto_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_a_source_io_async_ridx = auto_out_a_ridx; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleOut_0_a_source_io_async_safe_ridx_valid = auto_out_a_safe_ridx_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleOut_0_a_source_io_async_safe_sink_reset_n = auto_out_a_safe_sink_reset_n; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_d_sink_clock = clock;
  assign bundleIn_0_d_sink_reset = reset;
  assign bundleIn_0_d_sink_io_deq_ready = auto_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleIn_0_d_sink_io_async_mem_0_opcode = auto_out_d_mem_0_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_d_sink_io_async_mem_0_param = auto_out_d_mem_0_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_d_sink_io_async_mem_0_size = auto_out_d_mem_0_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_d_sink_io_async_mem_0_source = auto_out_d_mem_0_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_d_sink_io_async_mem_0_sink = auto_out_d_mem_0_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_d_sink_io_async_mem_0_denied = auto_out_d_mem_0_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_d_sink_io_async_mem_0_data = auto_out_d_mem_0_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_d_sink_io_async_mem_0_corrupt = auto_out_d_mem_0_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_d_sink_io_async_widx = auto_out_d_widx; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_d_sink_io_async_safe_widx_valid = auto_out_d_safe_widx_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_d_sink_io_async_safe_source_reset_n = auto_out_d_safe_source_reset_n; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
endmodule
