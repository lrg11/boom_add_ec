module InterruptBusWrapper(
  input   auto_int_bus_int_in_0,
  output  auto_int_bus_int_out_0,
  input   auto_clock_in_clock,
  input   auto_clock_in_reset,
  output  clock,
  output  reset
);
  wire  int_bus_clock; // @[InterruptBus.scala 14:27]
  wire  int_bus_reset; // @[InterruptBus.scala 14:27]
  wire  int_bus_auto_int_in_0; // @[InterruptBus.scala 14:27]
  wire  int_bus_auto_int_out_0; // @[InterruptBus.scala 14:27]
  IntXbar int_bus ( // @[InterruptBus.scala 14:27]
    .clock(int_bus_clock),
    .reset(int_bus_reset),
    .auto_int_in_0(int_bus_auto_int_in_0),
    .auto_int_out_0(int_bus_auto_int_out_0)
  );
  assign auto_int_bus_int_out_0 = int_bus_auto_int_out_0; // @[LazyModule.scala 311:12]
  assign clock = auto_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign reset = auto_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign int_bus_clock = auto_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign int_bus_reset = auto_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign int_bus_auto_int_in_0 = auto_int_bus_int_in_0; // @[LazyModule.scala 309:16]
endmodule
