const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Power control
pub const PWR = extern struct {
    /// control register 1
    /// offset: 0x00
    CR1: mmio.Mmio(packed struct(u32) {
        /// Bias control
        BIAS_CR: u4,
        /// Bias current selection
        BIAS_CR_SEL: u1,
        reserved8: u3 = 0,
        DBP: u1,
        VOS: u1,
        MRRDY_TIME: u2,
        FLS_SLPTIME: u2,
        LPR: u1,
        reserved16: u1 = 0,
        SRAM_RETV: u3,
        HSION_CTRL: u1,
        padding: u12 = 0,
    }),
    /// Power control register 2
    /// offset: 0x04
    CR2: mmio.Mmio(packed struct(u32) {
        PVDE: u1,
        reserved2: u1 = 0,
        SRCSEL: u1,
        reserved4: u1 = 0,
        PVDT: u3,
        reserved8: u1 = 0,
        FLTEN: u1,
        /// Digital filter time configuration
        FLK_TIME: u3,
        padding: u20 = 0,
    }),
    /// offset: 0x08
    reserved8: [12]u8,
    /// control register 1
    /// offset: 0x14
    SR: mmio.Mmio(packed struct(u32) {
        reserved11: u11 = 0,
        /// PVD test result
        PVDO: u1,
        padding: u20 = 0,
    }),
};
