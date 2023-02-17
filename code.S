#include "common.S"

.set region, "U"

.if (region == "P")
    .set CCAddress, 0x8083FAFC
.elseif (region == "U")
    .set CCAddress, 0x8082509C
.elseif (region == "J")
    .set CCAddress, 0x8083F168
.elseif (region == "K")
    .set CCAddress, 0x8082DEBC
.else
    .err
.endif

GECKO_C2_START(CCAddress, 0x0)
    li r0, 0
    stw r0, 0x175C (r5)
GECKO_C2_END(CCAddress, 0x0)