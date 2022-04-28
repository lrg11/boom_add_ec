module OptimizationBarrier_36(
  input        clock,
  input        reset,
  input  [2:0] io_x,
  output [2:0] io_y
);
  assign io_y = io_x; // @[package.scala 263:12]
endmodule
