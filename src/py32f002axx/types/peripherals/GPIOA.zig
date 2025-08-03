const mmio = @import("mmio");
const types = @import("../../types.zig");

/// General-purpose I/Os
pub const GPIOA = extern struct {
    /// GPIO port mode register
    /// offset: 0x00
    MODER: mmio.Mmio(packed struct(u32) {
        /// Port x configuration bits (y = 0..15)
        MODE0: u2,
        /// Port x configuration bits (y = 0..15)
        MODE1: u2,
        /// Port x configuration bits (y = 0..15)
        MODE2: u2,
        /// Port x configuration bits (y = 0..15)
        MODE3: u2,
        /// Port x configuration bits (y = 0..15)
        MODE4: u2,
        /// Port x configuration bits (y = 0..15)
        MODE5: u2,
        /// Port x configuration bits (y = 0..15)
        MODE6: u2,
        /// Port x configuration bits (y = 0..15)
        MODE7: u2,
        /// Port x configuration bits (y = 0..15)
        MODE8: u2,
        /// Port x configuration bits (y = 0..15)
        MODE9: u2,
        /// Port x configuration bits (y = 0..15)
        MODE10: u2,
        /// Port x configuration bits (y = 0..15)
        MODE11: u2,
        /// Port x configuration bits (y = 0..15)
        MODE12: u2,
        /// Port x configuration bits (y = 0..15)
        MODE13: u2,
        /// Port x configuration bits (y = 0..15)
        MODE14: u2,
        /// Port x configuration bits (y = 0..15)
        MODE15: u2,
    }),
    /// GPIO port output type register
    /// offset: 0x04
    OTYPER: mmio.Mmio(packed struct(u32) {
        /// Port x configuration bits (y = 0..15)
        OT0: u1,
        /// Port x configuration bits (y = 0..15)
        OT1: u1,
        /// Port x configuration bits (y = 0..15)
        OT2: u1,
        /// Port x configuration bits (y = 0..15)
        OT3: u1,
        /// Port x configuration bits (y = 0..15)
        OT4: u1,
        /// Port x configuration bits (y = 0..15)
        OT5: u1,
        /// Port x configuration bits (y = 0..15)
        OT6: u1,
        /// Port x configuration bits (y = 0..15)
        OT7: u1,
        /// Port x configuration bits (y = 0..15)
        OT8: u1,
        /// Port x configuration bits (y = 0..15)
        OT9: u1,
        /// Port x configuration bits (y = 0..15)
        OT10: u1,
        /// Port x configuration bits (y = 0..15)
        OT11: u1,
        /// Port x configuration bits (y = 0..15)
        OT12: u1,
        /// Port x configuration bits (y = 0..15)
        OT13: u1,
        /// Port x configuration bits (y = 0..15)
        OT14: u1,
        /// Port x configuration bits (y = 0..15)
        OT15: u1,
        padding: u16 = 0,
    }),
    /// GPIO port output speed register
    /// offset: 0x08
    OSPEEDR: mmio.Mmio(packed struct(u32) {
        /// Port x configuration bits (y = 0..15)
        OSPEED0: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEED1: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEED2: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEED3: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEED4: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEED5: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEED6: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEED7: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEED8: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEED9: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEED10: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEED11: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEED12: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEED13: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEED14: u2,
        /// Port x configuration bits (y = 0..15)
        OSPEED15: u2,
    }),
    /// GPIO port pull-up/pull-down register
    /// offset: 0x0c
    PUPDR: mmio.Mmio(packed struct(u32) {
        /// Port x configuration bits (y = 0..15)
        PUPD0: u2,
        /// Port x configuration bits (y = 0..15)
        PUPD1: u2,
        /// Port x configuration bits (y = 0..15)
        PUPD2: u2,
        /// Port x configuration bits (y = 0..15)
        PUPD3: u2,
        /// Port x configuration bits (y = 0..15)
        PUPD4: u2,
        /// Port x configuration bits (y = 0..15)
        PUPD5: u2,
        /// Port x configuration bits (y = 0..15)
        PUPD6: u2,
        /// Port x configuration bits (y = 0..15)
        PUPD7: u2,
        /// Port x configuration bits (y = 0..15)
        PUPD8: u2,
        /// Port x configuration bits (y = 0..15)
        PUPD9: u2,
        /// Port x configuration bits (y = 0..15)
        PUPD10: u2,
        /// Port x configuration bits (y = 0..15)
        PUPD11: u2,
        /// Port x configuration bits (y = 0..15)
        PUPD12: u2,
        /// Port x configuration bits (y = 0..15)
        PUPD13: u2,
        /// Port x configuration bits (y = 0..15)
        PUPD14: u2,
        /// Port x configuration bits (y = 0..15)
        PUPD15: u2,
    }),
    /// GPIO port input data register
    /// offset: 0x10
    IDR: mmio.Mmio(packed struct(u32) {
        /// Port input data (y = 0..15)
        ID0: u1,
        /// Port input data (y = 0..15)
        ID1: u1,
        /// Port input data (y = 0..15)
        ID2: u1,
        /// Port input data (y = 0..15)
        ID3: u1,
        /// Port input data (y = 0..15)
        ID4: u1,
        /// Port input data (y = 0..15)
        ID5: u1,
        /// Port input data (y = 0..15)
        ID6: u1,
        /// Port input data (y = 0..15)
        ID7: u1,
        /// Port input data (y = 0..15)
        ID8: u1,
        /// Port input data (y = 0..15)
        ID9: u1,
        /// Port input data (y = 0..15)
        ID10: u1,
        /// Port input data (y = 0..15)
        ID11: u1,
        /// Port input data (y = 0..15)
        ID12: u1,
        /// Port input data (y = 0..15)
        ID13: u1,
        /// Port input data (y = 0..15)
        ID14: u1,
        /// Port input data (y = 0..15)
        ID15: u1,
        padding: u16 = 0,
    }),
    /// GPIO port output data register
    /// offset: 0x14
    ODR: mmio.Mmio(packed struct(u32) {
        /// Port output data (y = 0..15)
        OD0: u1,
        /// Port output data (y = 0..15)
        OD1: u1,
        /// Port output data (y = 0..15)
        OD2: u1,
        /// Port output data (y = 0..15)
        OD3: u1,
        /// Port output data (y = 0..15)
        OD4: u1,
        /// Port output data (y = 0..15)
        OD5: u1,
        /// Port output data (y = 0..15)
        OD6: u1,
        /// Port output data (y = 0..15)
        OD7: u1,
        /// Port output data (y = 0..15)
        OD8: u1,
        /// Port output data (y = 0..15)
        OD9: u1,
        /// Port output data (y = 0..15)
        OD10: u1,
        /// Port output data (y = 0..15)
        OD11: u1,
        /// Port output data (y = 0..15)
        OD12: u1,
        /// Port output data (y = 0..15)
        OD13: u1,
        /// Port output data (y = 0..15)
        OD14: u1,
        /// Port output data (y = 0..15)
        OD15: u1,
        padding: u16 = 0,
    }),
    /// GPIO port bit set/reset register
    /// offset: 0x18
    BSRR: mmio.Mmio(packed struct(u32) {
        /// Port x set bit y (y= 0..15)
        BS0: u1,
        /// Port x set bit y (y= 0..15)
        BS1: u1,
        /// Port x set bit y (y= 0..15)
        BS2: u1,
        /// Port x set bit y (y= 0..15)
        BS3: u1,
        /// Port x set bit y (y= 0..15)
        BS4: u1,
        /// Port x set bit y (y= 0..15)
        BS5: u1,
        /// Port x set bit y (y= 0..15)
        BS6: u1,
        /// Port x set bit y (y= 0..15)
        BS7: u1,
        /// Port x set bit y (y= 0..15)
        BS8: u1,
        /// Port x set bit y (y= 0..15)
        BS9: u1,
        /// Port x set bit y (y= 0..15)
        BS10: u1,
        /// Port x set bit y (y= 0..15)
        BS11: u1,
        /// Port x set bit y (y= 0..15)
        BS12: u1,
        /// Port x set bit y (y= 0..15)
        BS13: u1,
        /// Port x set bit y (y= 0..15)
        BS14: u1,
        /// Port x set bit y (y= 0..15)
        BS15: u1,
        /// Port x set bit y (y= 0..15)
        BR0: u1,
        /// Port x reset bit y (y = 0..15)
        BR1: u1,
        /// Port x reset bit y (y = 0..15)
        BR2: u1,
        /// Port x reset bit y (y = 0..15)
        BR3: u1,
        /// Port x reset bit y (y = 0..15)
        BR4: u1,
        /// Port x reset bit y (y = 0..15)
        BR5: u1,
        /// Port x reset bit y (y = 0..15)
        BR6: u1,
        /// Port x reset bit y (y = 0..15)
        BR7: u1,
        /// Port x reset bit y (y = 0..15)
        BR8: u1,
        /// Port x reset bit y (y = 0..15)
        BR9: u1,
        /// Port x reset bit y (y = 0..15)
        BR10: u1,
        /// Port x reset bit y (y = 0..15)
        BR11: u1,
        /// Port x reset bit y (y = 0..15)
        BR12: u1,
        /// Port x reset bit y (y = 0..15)
        BR13: u1,
        /// Port x reset bit y (y = 0..15)
        BR14: u1,
        /// Port x reset bit y (y = 0..15)
        BR15: u1,
    }),
    /// GPIO port configuration lock register
    /// offset: 0x1c
    LCKR: mmio.Mmio(packed struct(u32) {
        /// Port x lock bit y (y= 0..15)
        LCK0: u1,
        /// Port x lock bit y (y= 0..15)
        LCK1: u1,
        /// Port x lock bit y (y= 0..15)
        LCK2: u1,
        /// Port x lock bit y (y= 0..15)
        LCK3: u1,
        /// Port x lock bit y (y= 0..15)
        LCK4: u1,
        /// Port x lock bit y (y= 0..15)
        LCK5: u1,
        /// Port x lock bit y (y= 0..15)
        LCK6: u1,
        /// Port x lock bit y (y= 0..15)
        LCK7: u1,
        /// Port x lock bit y (y= 0..15)
        LCK8: u1,
        /// Port x lock bit y (y= 0..15)
        LCK9: u1,
        /// Port x lock bit y (y= 0..15)
        LCK10: u1,
        /// Port x lock bit y (y= 0..15)
        LCK11: u1,
        /// Port x lock bit y (y= 0..15)
        LCK12: u1,
        /// Port x lock bit y (y= 0..15)
        LCK13: u1,
        /// Port x lock bit y (y= 0..15)
        LCK14: u1,
        /// Port x lock bit y (y= 0..15)
        LCK15: u1,
        /// Port x lock bit y (y= 0..15)
        LCKK: u1,
        padding: u15 = 0,
    }),
    /// GPIO alternate function low register
    /// offset: 0x20
    AFRL: mmio.Mmio(packed struct(u32) {
        /// Alternate function selection for port x bit y (y = 0..7)
        AFSEL0: u4,
        /// Alternate function selection for port x bit y (y = 0..7)
        AFSEL1: u4,
        /// Alternate function selection for port x bit y (y = 0..7)
        AFSEL2: u4,
        /// Alternate function selection for port x bit y (y = 0..7)
        AFSEL3: u4,
        /// Alternate function selection for port x bit y (y = 0..7)
        AFSEL4: u4,
        /// Alternate function selection for port x bit y (y = 0..7)
        AFSEL5: u4,
        /// Alternate function selection for port x bit y (y = 0..7)
        AFSEL6: u4,
        /// Alternate function selection for port x bit y (y = 0..7)
        AFSEL7: u4,
    }),
    /// GPIO alternate function high register
    /// offset: 0x24
    AFRH: mmio.Mmio(packed struct(u32) {
        /// Alternate function selection for port x bit y (y = 8..15)
        AFSEL8: u4,
        /// Alternate function selection for port x bit y (y = 8..15)
        AFSEL9: u4,
        /// Alternate function selection for port x bit y (y = 8..15)
        AFSEL10: u4,
        /// Alternate function selection for port x bit y (y = 8..15)
        AFSEL11: u4,
        /// Alternate function selection for port x bit y (y = 8..15)
        AFSEL12: u4,
        /// Alternate function selection for port x bit y (y = 8..15)
        AFSEL13: u4,
        /// Alternate function selection for port x bit y (y = 8..15)
        AFSEL14: u4,
        /// Alternate function selection for port x bit y (y = 8..15)
        AFSEL15: u4,
    }),
    /// port bit reset register
    /// offset: 0x28
    BRR: mmio.Mmio(packed struct(u32) {
        /// Port Reset bit
        BR0: u1,
        /// Port Reset bit
        BR1: u1,
        /// Port Reset bit
        BR2: u1,
        /// Port Reset bit
        BR3: u1,
        /// Port Reset bit
        BR4: u1,
        /// Port Reset bit
        BR5: u1,
        /// Port Reset bit
        BR6: u1,
        /// Port Reset bit
        BR7: u1,
        /// Port Reset bit
        BR8: u1,
        /// Port Reset bit
        BR9: u1,
        /// Port Reset bit
        BR10: u1,
        /// Port Reset bit
        BR11: u1,
        /// Port Reset bit
        BR12: u1,
        /// Port Reset bit
        BR13: u1,
        /// Port Reset bit
        BR14: u1,
        /// Port Reset bit
        BR15: u1,
        padding: u16 = 0,
    }),
};
