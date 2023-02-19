#include "common.S"

##~~~~~~~~~~~~~~~~~~~~~~~~##
##  Advanced Live Replay  ##
##     By WhatisLoaf      ##
##~~~~~~~~~~~~~~~~~~~~~~~~##

# 8052edf4 - RMCP
# 8052a2ac - RMCE
# 8052e774 - RMCJ
# 8051ce4c - RMCK

# region defined by build script
.if(region == "P")
    .set postInitControllers, 0x8052ed28
    GECKO_04(0x80522738, nop)
    GECKO_04(0x8052273C, nop)
.elseif(region == "E")
    .set postInitControllers, 0x8052a2ac
    GECKO_04(0x8051E2C4, nop)
    GECKO_04(0x8051E2C8, nop)
.elseif(region == "J")
    .set postInitControllers, 0x8052e774
    GECKO_04(0x805220B8, nop)
    GECKO_04(0x805220BC, nop)
.elseif(region == "K")
    .set postInitControllers, 0x8051ce4c
    GECKO_04(0x8051075C, nop)
    GECKO_04(0x80510760, nop)
.else
    .err
.endif

GECKO_C2_START(postInitControllers, 0xCC)
    lbz r12, 0x0b53 (r30) # get the current game mode
    cmpwi r12, 2
    bne store_address # only execute code when in time trial

    # make ghost saving possible
    lhz r12, 0x23de (r30) # get the input data length
    stw r12, 0xe4 (r4)
    lwz r12, 0xdc (r4) # get pointer to input data
    stw r12, 0xe0 (r4)

    addi r0, r4, 0x3e60 # set pointer to controller that contains the inputs
store_address:
    stw r0, 0x8 (r4) # default instruction
GECKO_C2_END(postInitControllers, 0xCC)