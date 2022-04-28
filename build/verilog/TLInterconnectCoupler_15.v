module TLInterconnectCoupler_15(
  input   clock,
  input   reset
);
  wire  buffer_clock; // @[Buffer.scala 68:28]
  wire  buffer_reset; // @[Buffer.scala 68:28]
  wire  shrinker_clock; // @[SourceShrinker.scala 88:30]
  wire  shrinker_reset; // @[SourceShrinker.scala 88:30]
  wire  widget_clock; // @[WidthWidget.scala 212:28]
  wire  widget_reset; // @[WidthWidget.scala 212:28]
  BundleBridgeNexus buffer ( // @[Buffer.scala 68:28]
    .clock(buffer_clock),
    .reset(buffer_reset)
  );
  BundleBridgeNexus shrinker ( // @[SourceShrinker.scala 88:30]
    .clock(shrinker_clock),
    .reset(shrinker_reset)
  );
  BundleBridgeNexus widget ( // @[WidthWidget.scala 212:28]
    .clock(widget_clock),
    .reset(widget_reset)
  );
  assign buffer_clock = clock;
  assign buffer_reset = reset;
  assign shrinker_clock = clock;
  assign shrinker_reset = reset;
  assign widget_clock = clock;
  assign widget_reset = reset;
endmodule
