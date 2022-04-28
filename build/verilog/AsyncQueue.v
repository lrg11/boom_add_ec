module AsyncQueue(
  input        clock,
  input        reset,
  input        io_enq_clock,
  input        io_enq_reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [3:0] io_enq_bits,
  input        io_deq_clock,
  input        io_deq_reset,
  input        io_deq_ready,
  output       io_deq_valid,
  output [3:0] io_deq_bits
);
  wire  source_clock; // @[AsyncQueue.scala 224:22]
  wire  source_reset; // @[AsyncQueue.scala 224:22]
  wire  source_io_enq_ready; // @[AsyncQueue.scala 224:22]
  wire  source_io_enq_valid; // @[AsyncQueue.scala 224:22]
  wire [3:0] source_io_enq_bits; // @[AsyncQueue.scala 224:22]
  wire [3:0] source_io_async_mem_0; // @[AsyncQueue.scala 224:22]
  wire [3:0] source_io_async_mem_1; // @[AsyncQueue.scala 224:22]
  wire [3:0] source_io_async_mem_2; // @[AsyncQueue.scala 224:22]
  wire [3:0] source_io_async_mem_3; // @[AsyncQueue.scala 224:22]
  wire [3:0] source_io_async_mem_4; // @[AsyncQueue.scala 224:22]
  wire [3:0] source_io_async_mem_5; // @[AsyncQueue.scala 224:22]
  wire [3:0] source_io_async_mem_6; // @[AsyncQueue.scala 224:22]
  wire [3:0] source_io_async_mem_7; // @[AsyncQueue.scala 224:22]
  wire [3:0] source_io_async_ridx; // @[AsyncQueue.scala 224:22]
  wire [3:0] source_io_async_widx; // @[AsyncQueue.scala 224:22]
  wire  source_io_async_safe_ridx_valid; // @[AsyncQueue.scala 224:22]
  wire  source_io_async_safe_widx_valid; // @[AsyncQueue.scala 224:22]
  wire  source_io_async_safe_source_reset_n; // @[AsyncQueue.scala 224:22]
  wire  source_io_async_safe_sink_reset_n; // @[AsyncQueue.scala 224:22]
  wire  sink_clock; // @[AsyncQueue.scala 225:22]
  wire  sink_reset; // @[AsyncQueue.scala 225:22]
  wire  sink_io_deq_ready; // @[AsyncQueue.scala 225:22]
  wire  sink_io_deq_valid; // @[AsyncQueue.scala 225:22]
  wire [3:0] sink_io_deq_bits; // @[AsyncQueue.scala 225:22]
  wire [3:0] sink_io_async_mem_0; // @[AsyncQueue.scala 225:22]
  wire [3:0] sink_io_async_mem_1; // @[AsyncQueue.scala 225:22]
  wire [3:0] sink_io_async_mem_2; // @[AsyncQueue.scala 225:22]
  wire [3:0] sink_io_async_mem_3; // @[AsyncQueue.scala 225:22]
  wire [3:0] sink_io_async_mem_4; // @[AsyncQueue.scala 225:22]
  wire [3:0] sink_io_async_mem_5; // @[AsyncQueue.scala 225:22]
  wire [3:0] sink_io_async_mem_6; // @[AsyncQueue.scala 225:22]
  wire [3:0] sink_io_async_mem_7; // @[AsyncQueue.scala 225:22]
  wire [3:0] sink_io_async_ridx; // @[AsyncQueue.scala 225:22]
  wire [3:0] sink_io_async_widx; // @[AsyncQueue.scala 225:22]
  wire  sink_io_async_safe_ridx_valid; // @[AsyncQueue.scala 225:22]
  wire  sink_io_async_safe_widx_valid; // @[AsyncQueue.scala 225:22]
  wire  sink_io_async_safe_source_reset_n; // @[AsyncQueue.scala 225:22]
  wire  sink_io_async_safe_sink_reset_n; // @[AsyncQueue.scala 225:22]
  AsyncQueueSource_3 source ( // @[AsyncQueue.scala 224:22]
    .clock(source_clock),
    .reset(source_reset),
    .io_enq_ready(source_io_enq_ready),
    .io_enq_valid(source_io_enq_valid),
    .io_enq_bits(source_io_enq_bits),
    .io_async_mem_0(source_io_async_mem_0),
    .io_async_mem_1(source_io_async_mem_1),
    .io_async_mem_2(source_io_async_mem_2),
    .io_async_mem_3(source_io_async_mem_3),
    .io_async_mem_4(source_io_async_mem_4),
    .io_async_mem_5(source_io_async_mem_5),
    .io_async_mem_6(source_io_async_mem_6),
    .io_async_mem_7(source_io_async_mem_7),
    .io_async_ridx(source_io_async_ridx),
    .io_async_widx(source_io_async_widx),
    .io_async_safe_ridx_valid(source_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(source_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(source_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(source_io_async_safe_sink_reset_n)
  );
  AsyncQueueSink_3 sink ( // @[AsyncQueue.scala 225:22]
    .clock(sink_clock),
    .reset(sink_reset),
    .io_deq_ready(sink_io_deq_ready),
    .io_deq_valid(sink_io_deq_valid),
    .io_deq_bits(sink_io_deq_bits),
    .io_async_mem_0(sink_io_async_mem_0),
    .io_async_mem_1(sink_io_async_mem_1),
    .io_async_mem_2(sink_io_async_mem_2),
    .io_async_mem_3(sink_io_async_mem_3),
    .io_async_mem_4(sink_io_async_mem_4),
    .io_async_mem_5(sink_io_async_mem_5),
    .io_async_mem_6(sink_io_async_mem_6),
    .io_async_mem_7(sink_io_async_mem_7),
    .io_async_ridx(sink_io_async_ridx),
    .io_async_widx(sink_io_async_widx),
    .io_async_safe_ridx_valid(sink_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(sink_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(sink_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(sink_io_async_safe_sink_reset_n)
  );
  assign io_enq_ready = source_io_enq_ready; // @[AsyncQueue.scala 232:17]
  assign io_deq_valid = sink_io_deq_valid; // @[AsyncQueue.scala 233:10]
  assign io_deq_bits = sink_io_deq_bits; // @[AsyncQueue.scala 233:10]
  assign source_clock = io_enq_clock; // @[AsyncQueue.scala 227:16]
  assign source_reset = io_enq_reset; // @[AsyncQueue.scala 228:16]
  assign source_io_enq_valid = io_enq_valid; // @[AsyncQueue.scala 232:17]
  assign source_io_enq_bits = io_enq_bits; // @[AsyncQueue.scala 232:17]
  assign source_io_async_ridx = sink_io_async_ridx; // @[AsyncQueue.scala 234:17]
  assign source_io_async_safe_ridx_valid = sink_io_async_safe_ridx_valid; // @[AsyncQueue.scala 234:17]
  assign source_io_async_safe_sink_reset_n = sink_io_async_safe_sink_reset_n; // @[AsyncQueue.scala 234:17]
  assign sink_clock = io_deq_clock; // @[AsyncQueue.scala 229:14]
  assign sink_reset = io_deq_reset; // @[AsyncQueue.scala 230:14]
  assign sink_io_deq_ready = io_deq_ready; // @[AsyncQueue.scala 233:10]
  assign sink_io_async_mem_0 = source_io_async_mem_0; // @[AsyncQueue.scala 234:17]
  assign sink_io_async_mem_1 = source_io_async_mem_1; // @[AsyncQueue.scala 234:17]
  assign sink_io_async_mem_2 = source_io_async_mem_2; // @[AsyncQueue.scala 234:17]
  assign sink_io_async_mem_3 = source_io_async_mem_3; // @[AsyncQueue.scala 234:17]
  assign sink_io_async_mem_4 = source_io_async_mem_4; // @[AsyncQueue.scala 234:17]
  assign sink_io_async_mem_5 = source_io_async_mem_5; // @[AsyncQueue.scala 234:17]
  assign sink_io_async_mem_6 = source_io_async_mem_6; // @[AsyncQueue.scala 234:17]
  assign sink_io_async_mem_7 = source_io_async_mem_7; // @[AsyncQueue.scala 234:17]
  assign sink_io_async_widx = source_io_async_widx; // @[AsyncQueue.scala 234:17]
  assign sink_io_async_safe_widx_valid = source_io_async_safe_widx_valid; // @[AsyncQueue.scala 234:17]
  assign sink_io_async_safe_source_reset_n = source_io_async_safe_source_reset_n; // @[AsyncQueue.scala 234:17]
endmodule
