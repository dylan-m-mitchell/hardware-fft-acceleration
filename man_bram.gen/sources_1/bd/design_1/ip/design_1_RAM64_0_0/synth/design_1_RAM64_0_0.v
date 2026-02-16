// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2026 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:RAM64:1.0
// IP Revision: 1

(* X_CORE_INFO = "RAM64,Vivado 2025.1" *)
(* CHECK_LICENSE_TYPE = "design_1_RAM64_0_0,RAM64,{}" *)
(* CORE_GENERATION_INFO = "design_1_RAM64_0_0,RAM64,{x_ipProduct=Vivado 2025.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=RAM64,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,WIDTH=64,DEPTH=256}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_RAM64_0_0 (
  i_Wr_Clk,
  i_Wr_Addr,
  i_Wr_DV,
  i_Wr_Data,
  i_Rd_Clk,
  i_Rd_Addr,
  i_Rd_En,
  o_Rd_DV,
  o_Rd_Data
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 i_Wr_Clk CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_Wr_Clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_in1_0, INSERT_VIP 0" *)
input wire i_Wr_Clk;
input wire [7 : 0] i_Wr_Addr;
input wire i_Wr_DV;
input wire [63 : 0] i_Wr_Data;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 i_Rd_Clk CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME i_Rd_Clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_in1_0, INSERT_VIP 0" *)
input wire i_Rd_Clk;
input wire [7 : 0] i_Rd_Addr;
input wire i_Rd_En;
output wire o_Rd_DV;
output wire [63 : 0] o_Rd_Data;

  RAM64 #(
    .WIDTH(64),
    .DEPTH(256)
  ) inst (
    .i_Wr_Clk(i_Wr_Clk),
    .i_Wr_Addr(i_Wr_Addr),
    .i_Wr_DV(i_Wr_DV),
    .i_Wr_Data(i_Wr_Data),
    .i_Rd_Clk(i_Rd_Clk),
    .i_Rd_Addr(i_Rd_Addr),
    .i_Rd_En(i_Rd_En),
    .o_Rd_DV(o_Rd_DV),
    .o_Rd_Data(o_Rd_Data)
  );
endmodule
