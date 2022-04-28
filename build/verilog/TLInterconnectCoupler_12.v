module TLInterconnectCoupler_12(
  input   clock,
  input   reset
);
  wire  widget_clock; // @[WidthWidget.scala 212:28]
  wire  widget_reset; // @[WidthWidget.scala 212:28]
  BundleBridgeNexus widget ( // @[WidthWidget.scala 212:28]
    .clock(widget_clock),
    .reset(widget_reset)
  );
  assign widget_clock = clock;
  assign widget_reset = reset;
endmodule
