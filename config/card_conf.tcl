# user_const.tcl: Default parameters
# Copyright (C) 2022 CESNET z. s. p. o.
# Author(s): Jakub Cabal <cabal@cesnet.cz>
#
# SPDX-License-Identifier: BSD-3-Clause

# Source default common values
source $CARD_COMMON_BASE/config/user_const.tcl

set PROJECT_NAME ""

# ------------------------------------------------------------------------------

# ==============================================================================
# DMA parameters:
# ==============================================================================
# If you do not have access to a non-public repository with DMA IP, set to false.
# If the DMA module is disabled, loopback will be implemented instead.
set DMA_ENABLE           true
# The minimum number of RX/TX DMA channels for this card is 16.
set DMA_RX_CHANNELS      16
set DMA_TX_CHANNELS      16
# In blocking mode, packets are dropped only when the RX DMA channel is off.
# In non-blocking mode, packets are dropped whenever they cannot be sent.
set DMA_RX_BLOCKING_MODE true
# ------------------------------------------------------------------------------

# Other parameters:
# =================
set TSU_ENABLE true
