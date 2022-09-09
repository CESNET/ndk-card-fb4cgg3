# qsfp_loc.xdc
# Copyright (C) 2022 CESNET z.s.p.o.
# Author(s): Jakub Cabal <cabal@cesnet.cz>
#
# SPDX-License-Identifier: BSD-3-Clause

set_property LOC CMACE4_X0Y1 [get_cells -hierarchical -filter {NAME =~ *eth_core_g[0].network_mod_core_i/cmac_eth_1x100g_i/* && REF_NAME==CMACE4}]
set_property LOC GTYE4_CHANNEL_X0Y8  [get_cells {usp_i/network_mod_i/eth_core_g[0].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST}]
set_property LOC GTYE4_CHANNEL_X0Y9  [get_cells {usp_i/network_mod_i/eth_core_g[0].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[1].GTYE4_CHANNEL_PRIM_INST}]
set_property LOC GTYE4_CHANNEL_X0Y10 [get_cells {usp_i/network_mod_i/eth_core_g[0].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[2].GTYE4_CHANNEL_PRIM_INST}]
set_property LOC GTYE4_CHANNEL_X0Y11 [get_cells {usp_i/network_mod_i/eth_core_g[0].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[3].GTYE4_CHANNEL_PRIM_INST}]

set_property LOC CMACE4_X0Y2 [get_cells -hierarchical -filter {NAME =~ *eth_core_g[1].network_mod_core_i/cmac_eth_1x100g_i/* && REF_NAME==CMACE4}]
set_property LOC GTYE4_CHANNEL_X0Y16 [get_cells {usp_i/network_mod_i/eth_core_g[1].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST}]
set_property LOC GTYE4_CHANNEL_X0Y17 [get_cells {usp_i/network_mod_i/eth_core_g[1].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[1].GTYE4_CHANNEL_PRIM_INST}]
set_property LOC GTYE4_CHANNEL_X0Y18 [get_cells {usp_i/network_mod_i/eth_core_g[1].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[2].GTYE4_CHANNEL_PRIM_INST}]
set_property LOC GTYE4_CHANNEL_X0Y19 [get_cells {usp_i/network_mod_i/eth_core_g[1].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[3].GTYE4_CHANNEL_PRIM_INST}]

set_property LOC CMACE4_X0Y4 [get_cells -hierarchical -filter {NAME =~ *eth_core_g[2].network_mod_core_i/cmac_eth_1x100g_i/* && REF_NAME==CMACE4}]
set_property LOC GTYE4_CHANNEL_X0Y24 [get_cells {usp_i/network_mod_i/eth_core_g[2].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST}]
set_property LOC GTYE4_CHANNEL_X0Y25 [get_cells {usp_i/network_mod_i/eth_core_g[2].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[1].GTYE4_CHANNEL_PRIM_INST}]
set_property LOC GTYE4_CHANNEL_X0Y26 [get_cells {usp_i/network_mod_i/eth_core_g[2].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[2].GTYE4_CHANNEL_PRIM_INST}]
set_property LOC GTYE4_CHANNEL_X0Y27 [get_cells {usp_i/network_mod_i/eth_core_g[2].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[3].GTYE4_CHANNEL_PRIM_INST}]

set_property LOC CMACE4_X0Y5 [get_cells -hierarchical -filter {NAME =~ *eth_core_g[3].network_mod_core_i/cmac_eth_1x100g_i/* && REF_NAME==CMACE4}]
set_property LOC GTYE4_CHANNEL_X0Y32 [get_cells {usp_i/network_mod_i/eth_core_g[3].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst//gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[0].GTYE4_CHANNEL_PRIM_INST}]
set_property LOC GTYE4_CHANNEL_X0Y33 [get_cells {usp_i/network_mod_i/eth_core_g[3].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst//gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[1].GTYE4_CHANNEL_PRIM_INST}]
set_property LOC GTYE4_CHANNEL_X0Y34 [get_cells {usp_i/network_mod_i/eth_core_g[3].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst//gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[2].GTYE4_CHANNEL_PRIM_INST}]
set_property LOC GTYE4_CHANNEL_X0Y35 [get_cells {usp_i/network_mod_i/eth_core_g[3].network_mod_core_i/cmac_eth_1x100g_i/inst/cmac_eth_1x100g_gt_i/inst/gen_gtwizard_gtye4_top.cmac_eth_1x100g_gt_gtwizard_gtye4_inst//gen_gtwizard_gtye4.gen_channel_container[5].gen_enabled_channel.gtye4_channel_wrapper_inst/channel_inst/gtye4_channel_gen.gen_gtye4_channel_inst[3].GTYE4_CHANNEL_PRIM_INST}]
