module OptimizationBarrier_37(
  input         clock,
  input         reset,
  input  [53:0] io_x_ppn,
  input  [1:0]  io_x_reserved_for_software,
  input         io_x_d,
  input         io_x_a,
  input         io_x_g,
  input         io_x_u,
  input         io_x_x,
  input         io_x_w,
  input         io_x_r,
  input         io_x_v,
  output [53:0] io_y_ppn,
  output [1:0]  io_y_reserved_for_software,
  output        io_y_d,
  output        io_y_a,
  output        io_y_g,
  output        io_y_u,
  output        io_y_x,
  output        io_y_w,
  output        io_y_r,
  output        io_y_v
);
  assign io_y_ppn = io_x_ppn; // @[package.scala 263:12]
  assign io_y_reserved_for_software = io_x_reserved_for_software; // @[package.scala 263:12]
  assign io_y_d = io_x_d; // @[package.scala 263:12]
  assign io_y_a = io_x_a; // @[package.scala 263:12]
  assign io_y_g = io_x_g; // @[package.scala 263:12]
  assign io_y_u = io_x_u; // @[package.scala 263:12]
  assign io_y_x = io_x_x; // @[package.scala 263:12]
  assign io_y_w = io_x_w; // @[package.scala 263:12]
  assign io_y_r = io_x_r; // @[package.scala 263:12]
  assign io_y_v = io_x_v; // @[package.scala 263:12]
endmodule
