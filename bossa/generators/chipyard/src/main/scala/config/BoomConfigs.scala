package chipyard

import freechips.rocketchip.config.{Config}

// ---------------------
// UniCore BOOM Configs
// ---------------------

// for simulation only
// class UniCoreSmallBoomConfig extends Config(  // medium boom without tage and fpu
//   new boom.common.WithNSmallUniCoreBooms(1) ++
//   new chipyard.config.AbstractConfig)

// class MediumUnicoreBoomConfig extends Config(
//   new boom.common.WithNMediumBooms(1) ++                         // medium boom config with tage and fpu
//   new chipyard.config.AbstractConfig)

// class MediumUniCoreConfig extends Config(
//   new boom.common.WithNMediumUniCoreBooms(1) ++             // medium boom with fpu but no tage
//   new chipyard.config.AbstractConfig)

// ---------------------
// BOOM Configs
// ---------------------

class SmallBoomConfig extends Config(
  new boom.common.WithNSmallBooms(1) ++                          // small boom config
  new chipyard.config.AbstractConfig)

class MediumBoomConfig extends Config(
  new boom.common.WithNMediumBooms(1) ++                         // medium boom config
  new chipyard.config.AbstractConfig)

class LargeBoomConfig extends Config(
  new boom.common.WithNLargeBooms(1) ++                          // large boom config
  new chipyard.config.AbstractConfig)

class MegaBoomConfig extends Config(
  new boom.common.WithNMegaBooms(1) ++                           // mega boom config
  new chipyard.config.AbstractConfig)

class DualSmallBoomConfig extends Config(
  new boom.common.WithNSmallBooms(2) ++                          // 2 boom cores
  new chipyard.config.AbstractConfig)

