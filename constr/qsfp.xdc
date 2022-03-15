# qsfp.xdc
# Copyright (C) 2022 CESNET z.s.p.o.
# Author(s): Jakub Cabal <cabal@cesnet.cz>
#
# SPDX-License-Identifier: BSD-3-Clause

# QSFP port 0 - FB4CGG3 only ---------------------------------------------------
set_property PACKAGE_PIN R36 [get_ports {QSFP0_REFCLK_P}]
set_property PACKAGE_PIN R37 [get_ports {QSFP0_REFCLK_N}]
create_clock -name QSFP0_refclk -period 6.206 [get_ports QSFP0_REFCLK_P]

set_property LOC CMACE4_X0Y5 [get_cells -hierarchical -filter {NAME =~ *eth_core_g[3].network_mod_core_i/cmac_eth_1x100g_i/* && REF_NAME==CMACE4}]
set_property LOC GTYE4_CHANNEL_X0Y32 [get_cells {usp_i/network_mod_i/eth_core_g[3].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst//gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST}]
set_property LOC GTYE4_CHANNEL_X0Y33 [get_cells {usp_i/network_mod_i/eth_core_g[3].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst//gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[1].GTYE4_CHANNEL_PRIM_INST}]
set_property LOC GTYE4_CHANNEL_X0Y34 [get_cells {usp_i/network_mod_i/eth_core_g[3].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst//gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[2].GTYE4_CHANNEL_PRIM_INST}]
set_property LOC GTYE4_CHANNEL_X0Y35 [get_cells {usp_i/network_mod_i/eth_core_g[3].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst//gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[3].GTYE4_CHANNEL_PRIM_INST}]

set_property PACKAGE_PIN AR23 [get_ports {QSFP0_SCL}]       
set_property PACKAGE_PIN AT22 [get_ports {QSFP0_SDA}]       
set_property PACKAGE_PIN AR21 [get_ports {QSFP0_MODPRS_N}]  
set_property PACKAGE_PIN AT24 [get_ports {QSFP0_RESET_N}]   
set_property PACKAGE_PIN AU24 [get_ports {QSFP0_LPMODE}]    
set_property PACKAGE_PIN AT23 [get_ports {QSFP0_INT_N}]

# QSFP port 1 - FB4CGG3 only ---------------------------------------------------
set_property PACKAGE_PIN AC36 [get_ports {QSFP1_REFCLK_P}] 
set_property PACKAGE_PIN AC37 [get_ports {QSFP1_REFCLK_N}] 
create_clock -name QSFP1_refclk -period 6.206 [get_ports QSFP1_REFCLK_P]

set_property LOC CMACE4_X0Y4 [get_cells -hierarchical -filter {NAME =~ *eth_core_g[2].network_mod_core_i/cmac_eth_1x100g_i/* && REF_NAME==CMACE4}]
set_property LOC GTYE4_CHANNEL_X0Y24 [get_cells {usp_i/network_mod_i/eth_core_g[2].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST}]
set_property LOC GTYE4_CHANNEL_X0Y25 [get_cells {usp_i/network_mod_i/eth_core_g[2].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[1].GTYE4_CHANNEL_PRIM_INST}]
set_property LOC GTYE4_CHANNEL_X0Y26 [get_cells {usp_i/network_mod_i/eth_core_g[2].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[2].GTYE4_CHANNEL_PRIM_INST}]
set_property LOC GTYE4_CHANNEL_X0Y27 [get_cells {usp_i/network_mod_i/eth_core_g[2].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[3].GTYE4_CHANNEL_PRIM_INST}]

set_property PACKAGE_PIN BF22 [get_ports {QSFP1_SCL}]       
set_property PACKAGE_PIN BE22 [get_ports {QSFP1_SDA}]       
set_property PACKAGE_PIN BE20 [get_ports {QSFP1_MODPRS_N}]  
set_property PACKAGE_PIN BE21 [get_ports {QSFP1_RESET_N}]   
set_property PACKAGE_PIN BD20 [get_ports {QSFP1_LPMODE}]    
set_property PACKAGE_PIN BD21 [get_ports {QSFP1_INT_N}]     

# QSFP port 2 - FB4CGG3/FB2CGG3 ------------------------------------------------
set_property PACKAGE_PIN AL36 [get_ports {QSFP2_REFCLK_P}]
set_property PACKAGE_PIN AL37 [get_ports {QSFP2_REFCLK_N}]
create_clock -name QSFP2_refclk -period 6.206 [get_ports QSFP2_REFCLK_P]

set_property LOC CMACE4_X0Y2 [get_cells -hierarchical -filter {NAME =~ *eth_core_g[1].network_mod_core_i/cmac_eth_1x100g_i/* && REF_NAME==CMACE4}]
set_property LOC GTYE4_CHANNEL_X0Y16 [get_cells {usp_i/network_mod_i/eth_core_g[1].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST}]
set_property LOC GTYE4_CHANNEL_X0Y17 [get_cells {usp_i/network_mod_i/eth_core_g[1].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[1].GTYE4_CHANNEL_PRIM_INST}]
set_property LOC GTYE4_CHANNEL_X0Y18 [get_cells {usp_i/network_mod_i/eth_core_g[1].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[2].GTYE4_CHANNEL_PRIM_INST}]
set_property LOC GTYE4_CHANNEL_X0Y19 [get_cells {usp_i/network_mod_i/eth_core_g[1].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[3].GTYE4_CHANNEL_PRIM_INST}]

set_property PACKAGE_PIN BC23 [get_ports {QSFP2_SCL}]       
set_property PACKAGE_PIN BA23 [get_ports {QSFP2_SDA}]       
set_property PACKAGE_PIN BE23 [get_ports {QSFP2_MODPRS_N}]  
set_property PACKAGE_PIN BF23 [get_ports {QSFP2_RESET_N}]   
set_property PACKAGE_PIN BD23 [get_ports {QSFP2_LPMODE}]    
set_property PACKAGE_PIN BF24 [get_ports {QSFP2_INT_N}]

# QSFP port 3 - FB4CGG3/FB2CGG3 ------------------------------------------------
set_property PACKAGE_PIN AU36 [get_ports {QSFP3_REFCLK_P}]
set_property PACKAGE_PIN AU37 [get_ports {QSFP3_REFCLK_N}]
create_clock -name QSFP3_refclk -period 6.206 [get_ports QSFP3_REFCLK_P]

set_property LOC CMACE4_X0Y1 [get_cells -hierarchical -filter {NAME =~ *eth_core_g[0].network_mod_core_i/cmac_eth_1x100g_i/* && REF_NAME==CMACE4}]
set_property LOC GTYE4_CHANNEL_X0Y8  [get_cells {usp_i/network_mod_i/eth_core_g[0].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST}]
set_property LOC GTYE4_CHANNEL_X0Y9  [get_cells {usp_i/network_mod_i/eth_core_g[0].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[1].GTYE4_CHANNEL_PRIM_INST}]
set_property LOC GTYE4_CHANNEL_X0Y10 [get_cells {usp_i/network_mod_i/eth_core_g[0].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[2].GTYE4_CHANNEL_PRIM_INST}]
set_property LOC GTYE4_CHANNEL_X0Y11 [get_cells {usp_i/network_mod_i/eth_core_g[0].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[3].GTYE4_CHANNEL_PRIM_INST}]

set_property PACKAGE_PIN BB21 [get_ports {QSFP3_SCL}]       
set_property PACKAGE_PIN BB20 [get_ports {QSFP3_SDA}]       
set_property PACKAGE_PIN BA24 [get_ports {QSFP3_MODPRS_N}]
set_property PACKAGE_PIN BB22 [get_ports {QSFP3_RESET_N}] 
set_property PACKAGE_PIN BC22 [get_ports {QSFP3_LPMODE}]  
set_property PACKAGE_PIN BC21 [get_ports {QSFP3_INT_N}]

# Common -----------------------------------------------------------------------
set_property IOSTANDARD LVCMOS18 [get_ports {QSFP*_SCL}]
set_property IOSTANDARD LVCMOS18 [get_ports {QSFP*_SDA}]     
set_property IOSTANDARD LVCMOS18 [get_ports {QSFP*_MODPRS_N}]
set_property IOSTANDARD LVCMOS18 [get_ports {QSFP*_RESET_N}] 
set_property IOSTANDARD LVCMOS18 [get_ports {QSFP*_LPMODE}]  
set_property IOSTANDARD LVCMOS18 [get_ports {QSFP*_INT_N}]
