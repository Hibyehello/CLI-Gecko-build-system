#define GECKO_C2_START(dst, offset) \
    .long 0xC2000000 + ## dst + ## offset - 0x80000000; \
    .long ( ( dst_end_ ## dst ## _ ## offset ) - ( dst_ ## dst ## _ ## offset ) ) >> 3; \
    dst_ ## dst ## _ ## offset:

#define GECKO_C2_END(dst, offset) \
    .balign 8; \
    dst_end_ ## dst ## _ ## offset:

#define GECKO_C0() \
    .byte 0xC0; \
    .byte 0x0; \
    .balign 8;
