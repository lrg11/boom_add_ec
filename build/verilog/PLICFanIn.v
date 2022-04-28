module PLICFanIn(
  input   clock,
  input   reset,
  input   io_prio_0,
  input   io_ip,
  output  io_dev,
  output  io_max
);
  wire [1:0] effectivePriority_1 = {io_ip,io_prio_0}; // @[Cat.scala 30:58]
  wire  _T = 2'h2 >= effectivePriority_1; // @[Plic.scala 345:20]
  wire [1:0] maxPri = _T ? 2'h2 : effectivePriority_1; // @[Misc.scala 34:9]
  assign io_dev = _T ? 1'h0 : 1'h1; // @[Misc.scala 34:36]
  assign io_max = maxPri[0]; // @[Plic.scala 351:10]
endmodule
