module ClockGroupResetSynchronizer(
  input   auto_in_member_allClocks_subsystem_cbus_0_clock,
  input   auto_in_member_allClocks_subsystem_cbus_0_reset,
  input   auto_in_member_allClocks_subsystem_mbus_0_clock,
  input   auto_in_member_allClocks_subsystem_mbus_0_reset,
  input   auto_in_member_allClocks_subsystem_fbus_0_clock,
  input   auto_in_member_allClocks_subsystem_fbus_0_reset,
  input   auto_in_member_allClocks_subsystem_pbus_0_clock,
  input   auto_in_member_allClocks_subsystem_pbus_0_reset,
  input   auto_in_member_allClocks_subsystem_sbus_1_clock,
  input   auto_in_member_allClocks_subsystem_sbus_1_reset,
  input   auto_in_member_allClocks_subsystem_sbus_0_clock,
  input   auto_in_member_allClocks_subsystem_sbus_0_reset,
  input   auto_in_member_allClocks_implicit_clock_clock,
  input   auto_in_member_allClocks_implicit_clock_reset,
  output  auto_out_member_allClocks_subsystem_cbus_0_clock,
  output  auto_out_member_allClocks_subsystem_cbus_0_reset,
  output  auto_out_member_allClocks_subsystem_mbus_0_clock,
  output  auto_out_member_allClocks_subsystem_mbus_0_reset,
  output  auto_out_member_allClocks_subsystem_fbus_0_clock,
  output  auto_out_member_allClocks_subsystem_fbus_0_reset,
  output  auto_out_member_allClocks_subsystem_pbus_0_clock,
  output  auto_out_member_allClocks_subsystem_pbus_0_reset,
  output  auto_out_member_allClocks_subsystem_sbus_1_clock,
  output  auto_out_member_allClocks_subsystem_sbus_1_reset,
  output  auto_out_member_allClocks_subsystem_sbus_0_clock,
  output  auto_out_member_allClocks_subsystem_sbus_0_reset,
  output  auto_out_member_allClocks_implicit_clock_clock,
  output  auto_out_member_allClocks_implicit_clock_reset
);
  wire  bundleOut_0_member_allClocks_implicit_clock_reset_catcher_clock; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_implicit_clock_reset_catcher_reset; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_implicit_clock_reset_catcher_io_sync_reset; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_implicit_clock_reset_catcher_io_psd_test_mode; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_implicit_clock_reset_catcher_io_psd_test_mode_reset; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_sbus_0_reset_catcher_clock; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_sbus_0_reset_catcher_reset; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_sbus_0_reset_catcher_io_sync_reset; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_sbus_0_reset_catcher_io_psd_test_mode; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_sbus_0_reset_catcher_io_psd_test_mode_reset; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_sbus_1_reset_catcher_clock; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_sbus_1_reset_catcher_reset; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_sbus_1_reset_catcher_io_sync_reset; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_sbus_1_reset_catcher_io_psd_test_mode; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_sbus_1_reset_catcher_io_psd_test_mode_reset; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_pbus_0_reset_catcher_clock; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_pbus_0_reset_catcher_reset; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_pbus_0_reset_catcher_io_sync_reset; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_pbus_0_reset_catcher_io_psd_test_mode; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_pbus_0_reset_catcher_io_psd_test_mode_reset; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_fbus_0_reset_catcher_clock; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_fbus_0_reset_catcher_reset; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_fbus_0_reset_catcher_io_sync_reset; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_fbus_0_reset_catcher_io_psd_test_mode; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_fbus_0_reset_catcher_io_psd_test_mode_reset; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_mbus_0_reset_catcher_clock; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_mbus_0_reset_catcher_reset; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_mbus_0_reset_catcher_io_sync_reset; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_mbus_0_reset_catcher_io_psd_test_mode; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_mbus_0_reset_catcher_io_psd_test_mode_reset; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_cbus_0_reset_catcher_clock; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_cbus_0_reset_catcher_reset; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_cbus_0_reset_catcher_io_sync_reset; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_cbus_0_reset_catcher_io_psd_test_mode; // @[ResetCatchAndSync.scala 39:28]
  wire  bundleOut_0_member_allClocks_subsystem_cbus_0_reset_catcher_io_psd_test_mode_reset; // @[ResetCatchAndSync.scala 39:28]
  ResetCatchAndSync_d3 bundleOut_0_member_allClocks_implicit_clock_reset_catcher ( // @[ResetCatchAndSync.scala 39:28]
    .clock(bundleOut_0_member_allClocks_implicit_clock_reset_catcher_clock),
    .reset(bundleOut_0_member_allClocks_implicit_clock_reset_catcher_reset),
    .io_sync_reset(bundleOut_0_member_allClocks_implicit_clock_reset_catcher_io_sync_reset),
    .io_psd_test_mode(bundleOut_0_member_allClocks_implicit_clock_reset_catcher_io_psd_test_mode),
    .io_psd_test_mode_reset(bundleOut_0_member_allClocks_implicit_clock_reset_catcher_io_psd_test_mode_reset)
  );
  ResetCatchAndSync_d3 bundleOut_0_member_allClocks_subsystem_sbus_0_reset_catcher ( // @[ResetCatchAndSync.scala 39:28]
    .clock(bundleOut_0_member_allClocks_subsystem_sbus_0_reset_catcher_clock),
    .reset(bundleOut_0_member_allClocks_subsystem_sbus_0_reset_catcher_reset),
    .io_sync_reset(bundleOut_0_member_allClocks_subsystem_sbus_0_reset_catcher_io_sync_reset),
    .io_psd_test_mode(bundleOut_0_member_allClocks_subsystem_sbus_0_reset_catcher_io_psd_test_mode),
    .io_psd_test_mode_reset(bundleOut_0_member_allClocks_subsystem_sbus_0_reset_catcher_io_psd_test_mode_reset)
  );
  ResetCatchAndSync_d3 bundleOut_0_member_allClocks_subsystem_sbus_1_reset_catcher ( // @[ResetCatchAndSync.scala 39:28]
    .clock(bundleOut_0_member_allClocks_subsystem_sbus_1_reset_catcher_clock),
    .reset(bundleOut_0_member_allClocks_subsystem_sbus_1_reset_catcher_reset),
    .io_sync_reset(bundleOut_0_member_allClocks_subsystem_sbus_1_reset_catcher_io_sync_reset),
    .io_psd_test_mode(bundleOut_0_member_allClocks_subsystem_sbus_1_reset_catcher_io_psd_test_mode),
    .io_psd_test_mode_reset(bundleOut_0_member_allClocks_subsystem_sbus_1_reset_catcher_io_psd_test_mode_reset)
  );
  ResetCatchAndSync_d3 bundleOut_0_member_allClocks_subsystem_pbus_0_reset_catcher ( // @[ResetCatchAndSync.scala 39:28]
    .clock(bundleOut_0_member_allClocks_subsystem_pbus_0_reset_catcher_clock),
    .reset(bundleOut_0_member_allClocks_subsystem_pbus_0_reset_catcher_reset),
    .io_sync_reset(bundleOut_0_member_allClocks_subsystem_pbus_0_reset_catcher_io_sync_reset),
    .io_psd_test_mode(bundleOut_0_member_allClocks_subsystem_pbus_0_reset_catcher_io_psd_test_mode),
    .io_psd_test_mode_reset(bundleOut_0_member_allClocks_subsystem_pbus_0_reset_catcher_io_psd_test_mode_reset)
  );
  ResetCatchAndSync_d3 bundleOut_0_member_allClocks_subsystem_fbus_0_reset_catcher ( // @[ResetCatchAndSync.scala 39:28]
    .clock(bundleOut_0_member_allClocks_subsystem_fbus_0_reset_catcher_clock),
    .reset(bundleOut_0_member_allClocks_subsystem_fbus_0_reset_catcher_reset),
    .io_sync_reset(bundleOut_0_member_allClocks_subsystem_fbus_0_reset_catcher_io_sync_reset),
    .io_psd_test_mode(bundleOut_0_member_allClocks_subsystem_fbus_0_reset_catcher_io_psd_test_mode),
    .io_psd_test_mode_reset(bundleOut_0_member_allClocks_subsystem_fbus_0_reset_catcher_io_psd_test_mode_reset)
  );
  ResetCatchAndSync_d3 bundleOut_0_member_allClocks_subsystem_mbus_0_reset_catcher ( // @[ResetCatchAndSync.scala 39:28]
    .clock(bundleOut_0_member_allClocks_subsystem_mbus_0_reset_catcher_clock),
    .reset(bundleOut_0_member_allClocks_subsystem_mbus_0_reset_catcher_reset),
    .io_sync_reset(bundleOut_0_member_allClocks_subsystem_mbus_0_reset_catcher_io_sync_reset),
    .io_psd_test_mode(bundleOut_0_member_allClocks_subsystem_mbus_0_reset_catcher_io_psd_test_mode),
    .io_psd_test_mode_reset(bundleOut_0_member_allClocks_subsystem_mbus_0_reset_catcher_io_psd_test_mode_reset)
  );
  ResetCatchAndSync_d3 bundleOut_0_member_allClocks_subsystem_cbus_0_reset_catcher ( // @[ResetCatchAndSync.scala 39:28]
    .clock(bundleOut_0_member_allClocks_subsystem_cbus_0_reset_catcher_clock),
    .reset(bundleOut_0_member_allClocks_subsystem_cbus_0_reset_catcher_reset),
    .io_sync_reset(bundleOut_0_member_allClocks_subsystem_cbus_0_reset_catcher_io_sync_reset),
    .io_psd_test_mode(bundleOut_0_member_allClocks_subsystem_cbus_0_reset_catcher_io_psd_test_mode),
    .io_psd_test_mode_reset(bundleOut_0_member_allClocks_subsystem_cbus_0_reset_catcher_io_psd_test_mode_reset)
  );
  assign auto_out_member_allClocks_subsystem_cbus_0_clock = auto_in_member_allClocks_subsystem_cbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_member_allClocks_subsystem_cbus_0_reset =
    bundleOut_0_member_allClocks_subsystem_cbus_0_reset_catcher_io_sync_reset; // @[Nodes.scala 1207:84 ResetSynchronizer.scala 35:17]
  assign auto_out_member_allClocks_subsystem_mbus_0_clock = auto_in_member_allClocks_subsystem_mbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_member_allClocks_subsystem_mbus_0_reset =
    bundleOut_0_member_allClocks_subsystem_mbus_0_reset_catcher_io_sync_reset; // @[Nodes.scala 1207:84 ResetSynchronizer.scala 35:17]
  assign auto_out_member_allClocks_subsystem_fbus_0_clock = auto_in_member_allClocks_subsystem_fbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_member_allClocks_subsystem_fbus_0_reset =
    bundleOut_0_member_allClocks_subsystem_fbus_0_reset_catcher_io_sync_reset; // @[Nodes.scala 1207:84 ResetSynchronizer.scala 35:17]
  assign auto_out_member_allClocks_subsystem_pbus_0_clock = auto_in_member_allClocks_subsystem_pbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_member_allClocks_subsystem_pbus_0_reset =
    bundleOut_0_member_allClocks_subsystem_pbus_0_reset_catcher_io_sync_reset; // @[Nodes.scala 1207:84 ResetSynchronizer.scala 35:17]
  assign auto_out_member_allClocks_subsystem_sbus_1_clock = auto_in_member_allClocks_subsystem_sbus_1_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_member_allClocks_subsystem_sbus_1_reset =
    bundleOut_0_member_allClocks_subsystem_sbus_1_reset_catcher_io_sync_reset; // @[Nodes.scala 1207:84 ResetSynchronizer.scala 35:17]
  assign auto_out_member_allClocks_subsystem_sbus_0_clock = auto_in_member_allClocks_subsystem_sbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_member_allClocks_subsystem_sbus_0_reset =
    bundleOut_0_member_allClocks_subsystem_sbus_0_reset_catcher_io_sync_reset; // @[Nodes.scala 1207:84 ResetSynchronizer.scala 35:17]
  assign auto_out_member_allClocks_implicit_clock_clock = auto_in_member_allClocks_implicit_clock_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_member_allClocks_implicit_clock_reset =
    bundleOut_0_member_allClocks_implicit_clock_reset_catcher_io_sync_reset; // @[Nodes.scala 1207:84 ResetSynchronizer.scala 35:17]
  assign bundleOut_0_member_allClocks_implicit_clock_reset_catcher_clock = auto_in_member_allClocks_implicit_clock_clock
    ; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_member_allClocks_implicit_clock_reset_catcher_reset = auto_in_member_allClocks_implicit_clock_reset
    ; // @[ResetSynchronizer.scala 35:55]
  assign bundleOut_0_member_allClocks_implicit_clock_reset_catcher_io_psd_test_mode = 1'h0; // @[ResetCatchAndSync.scala 41:71 ResetCatchAndSync.scala 41:71]
  assign bundleOut_0_member_allClocks_implicit_clock_reset_catcher_io_psd_test_mode_reset = 1'h0; // @[ResetCatchAndSync.scala 41:71 ResetCatchAndSync.scala 41:71]
  assign bundleOut_0_member_allClocks_subsystem_sbus_0_reset_catcher_clock =
    auto_in_member_allClocks_subsystem_sbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_member_allClocks_subsystem_sbus_0_reset_catcher_reset =
    auto_in_member_allClocks_subsystem_sbus_0_reset; // @[ResetSynchronizer.scala 35:55]
  assign bundleOut_0_member_allClocks_subsystem_sbus_0_reset_catcher_io_psd_test_mode = 1'h0; // @[ResetCatchAndSync.scala 41:71 ResetCatchAndSync.scala 41:71]
  assign bundleOut_0_member_allClocks_subsystem_sbus_0_reset_catcher_io_psd_test_mode_reset = 1'h0; // @[ResetCatchAndSync.scala 41:71 ResetCatchAndSync.scala 41:71]
  assign bundleOut_0_member_allClocks_subsystem_sbus_1_reset_catcher_clock =
    auto_in_member_allClocks_subsystem_sbus_1_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_member_allClocks_subsystem_sbus_1_reset_catcher_reset =
    auto_in_member_allClocks_subsystem_sbus_1_reset; // @[ResetSynchronizer.scala 35:55]
  assign bundleOut_0_member_allClocks_subsystem_sbus_1_reset_catcher_io_psd_test_mode = 1'h0; // @[ResetCatchAndSync.scala 41:71 ResetCatchAndSync.scala 41:71]
  assign bundleOut_0_member_allClocks_subsystem_sbus_1_reset_catcher_io_psd_test_mode_reset = 1'h0; // @[ResetCatchAndSync.scala 41:71 ResetCatchAndSync.scala 41:71]
  assign bundleOut_0_member_allClocks_subsystem_pbus_0_reset_catcher_clock =
    auto_in_member_allClocks_subsystem_pbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_member_allClocks_subsystem_pbus_0_reset_catcher_reset =
    auto_in_member_allClocks_subsystem_pbus_0_reset; // @[ResetSynchronizer.scala 35:55]
  assign bundleOut_0_member_allClocks_subsystem_pbus_0_reset_catcher_io_psd_test_mode = 1'h0; // @[ResetCatchAndSync.scala 41:71 ResetCatchAndSync.scala 41:71]
  assign bundleOut_0_member_allClocks_subsystem_pbus_0_reset_catcher_io_psd_test_mode_reset = 1'h0; // @[ResetCatchAndSync.scala 41:71 ResetCatchAndSync.scala 41:71]
  assign bundleOut_0_member_allClocks_subsystem_fbus_0_reset_catcher_clock =
    auto_in_member_allClocks_subsystem_fbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_member_allClocks_subsystem_fbus_0_reset_catcher_reset =
    auto_in_member_allClocks_subsystem_fbus_0_reset; // @[ResetSynchronizer.scala 35:55]
  assign bundleOut_0_member_allClocks_subsystem_fbus_0_reset_catcher_io_psd_test_mode = 1'h0; // @[ResetCatchAndSync.scala 41:71 ResetCatchAndSync.scala 41:71]
  assign bundleOut_0_member_allClocks_subsystem_fbus_0_reset_catcher_io_psd_test_mode_reset = 1'h0; // @[ResetCatchAndSync.scala 41:71 ResetCatchAndSync.scala 41:71]
  assign bundleOut_0_member_allClocks_subsystem_mbus_0_reset_catcher_clock =
    auto_in_member_allClocks_subsystem_mbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_member_allClocks_subsystem_mbus_0_reset_catcher_reset =
    auto_in_member_allClocks_subsystem_mbus_0_reset; // @[ResetSynchronizer.scala 35:55]
  assign bundleOut_0_member_allClocks_subsystem_mbus_0_reset_catcher_io_psd_test_mode = 1'h0; // @[ResetCatchAndSync.scala 41:71 ResetCatchAndSync.scala 41:71]
  assign bundleOut_0_member_allClocks_subsystem_mbus_0_reset_catcher_io_psd_test_mode_reset = 1'h0; // @[ResetCatchAndSync.scala 41:71 ResetCatchAndSync.scala 41:71]
  assign bundleOut_0_member_allClocks_subsystem_cbus_0_reset_catcher_clock =
    auto_in_member_allClocks_subsystem_cbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_member_allClocks_subsystem_cbus_0_reset_catcher_reset =
    auto_in_member_allClocks_subsystem_cbus_0_reset; // @[ResetSynchronizer.scala 35:55]
  assign bundleOut_0_member_allClocks_subsystem_cbus_0_reset_catcher_io_psd_test_mode = 1'h0; // @[ResetCatchAndSync.scala 41:71 ResetCatchAndSync.scala 41:71]
  assign bundleOut_0_member_allClocks_subsystem_cbus_0_reset_catcher_io_psd_test_mode_reset = 1'h0; // @[ResetCatchAndSync.scala 41:71 ResetCatchAndSync.scala 41:71]
endmodule
