#define GECKO_C2_START(dst, offset) \
    .long 0xC2000000 + ## dst + ## offset - 0x80000000; \
    .long ( ( dst_end_ ## dst ## _ ## offset ) - ( dst_ ## dst ## _ ## offset ) ) >> 3; \
    dst_ ## dst ## _ ## offset:

#define GECKO_C2_END(dst, offset) \
    .balign 8, 0; \
    dst_end_ ## dst ## _ ## offset:

#define GECKO_C0_START() \
    .byte 0xC0; \
    .byte 0x0; \
    .balign 8

#define GECKO_C0_END() \
    .balign 8, 0;

#define GECKO_04(dst, ...) \
    .long 0x04000000 + ## dst - 0x80000000; \
    __VA_ARGS__;

#define GECKO_04_DATA(dst, data) \
    .long 0x04000000 + ## dst - 0x80000000; \
    .long data;
