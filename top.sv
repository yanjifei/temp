
//SCPM2 FPGA RTL top level 
//jifei.yan@ncr.com

`include "axis_intf.svh"
`include "spi_intf.svh"
`include "semc_intf.svh"
`include "camera_cfg_intf.svh"
`include "mitsubishi_intf.svh"
`include "endorser_intf.svh"
`include "stkbin_intf.svh"
`include "sram_intf.svh"
`include "sdram_intf.svh"
`include "bram_intf.svh"
`include "scpm2.svh"

import scpm2::*;


module top (
  
  input wire clk,
  input wire reset_n,

  //Mitsubishi Cameras image data and led contorl
  mitsubishi.m top,
  mitsubishi.m bot,

  //Mitsubishi Camera SPI bus
  spi.m top_spi,
  spi.m bot_spi,

  //endorser
  endorser.m endorser,

  //sram
  sram.dut sram,

  //stacking bin
  stkbin.m stkbin,

  //sdram
  //sdram.m sdram,

  //bram.s bram[2],
  
  //sdram.m sdram_1,

  //bram.s s_bram_1[2],


  //i.mxRT processor SEMC interface
  semc.dut semc

);


axis axis_0(
  .aclk(clk),
  .aresetn(reset_n)
);

axis axis_1(
  .aclk(clk),
  .aresetn(reset_n)
);

camera_cfg camera_cfg_0();
camera_cfg camera_cfg_1();

semc_slave semc_slave_0(
  .clk(clk),
  .rst_n(reset_n),
  .semc(semc),
  .m_camera_cfg(camera_cfg_0.m)
);


camera_ctrl camera_ctrl_top(
  .clk(clk),
  .rst_n(reset_n),
  .camera(top),
  .m_axis(axis_0.m),
  .s_camera_cfg(camera_cfg_0.s)
);

camera_ctrl camera_ctrl_bot(
  .clk(clk),
  .rst_n(reset_n),
  .camera(bot),
  .m_axis(axis_1.m),
  .s_camera_cfg(camera_cfg_1.s)
);


// sdram_ctrl_sys sdram_ctrl_sys_0(
//   .sys_clk(clk),
//   .sdram_clk(clk),
//   .rst_n(reset_n),
//   .init_done(),
//   .sdram(sdram),
//   .s_bram(bram)
// );

// sdram_ctrl_wrapper #(.USE_VERILOG2005_MODEL (1))
// sdram_sys_0(
//   .sys_clk   (clk),
//   .sdram_clk (clk),
//   .rst_n     (reset_n),
//   .init_done (),
//   .sdram     (sdram),
//   .s_bram    (bram[0:1])
// );



// sdram_ctrl sdram_ctrl_0 (
//   .clk(clk),
//   .rst_n(reset_n),
//   .sdram(sdram),
//   .bram(bram)
// );


//img_proc img_proc_0(
//  .s_axis(axis_0.s)
//);


endmodule