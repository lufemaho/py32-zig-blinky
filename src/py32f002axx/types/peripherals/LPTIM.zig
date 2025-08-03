const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Low power timer
pub const LPTIM = extern struct {
    /// Interrupt and Status Register
    /// offset: 0x00
    ISR: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Autoreload match
        ARRM: u1,
        padding: u30 = 0,
    }),
    /// Interrupt Clear Register
    /// offset: 0x04
    ICR: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Autoreload match Clear Flag
        ARRMCF: u1,
        padding: u30 = 0,
    }),
    /// Interrupt Enable Register
    /// offset: 0x08
    IER: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Autoreload match Interrupt Enable
        ARRMIE: u1,
        padding: u30 = 0,
    }),
    /// Configuration Register
    /// offset: 0x0c
    CFGR: mmio.Mmio(packed struct(u32) {
        reserved9: u9 = 0,
        /// Clock prescaler
        PRESC: u3,
        reserved22: u10 = 0,
        /// Registers update mode
        PRELOAD: u1,
        padding: u9 = 0,
    }),
    /// Control Register
    /// offset: 0x10
    CR: mmio.Mmio(packed struct(u32) {
        /// LPTIM Enable
        ENABLE: u1,
        /// LPTIM start in single mode
        SNGSTRT: u1,
        reserved4: u2 = 0,
        /// Reset after read enable
        RSTARE: u1,
        padding: u27 = 0,
    }),
    /// offset: 0x14
    reserved20: [4]u8,
    /// Autoreload Register
    /// offset: 0x18
    ARR: mmio.Mmio(packed struct(u32) {
        /// Auto reload value
        ARR: u16,
        padding: u16 = 0,
    }),
    /// Counter Register
    /// offset: 0x1c
    CNT: mmio.Mmio(packed struct(u32) {
        /// Counter value
        CNT: u16,
        padding: u16 = 0,
    }),
};
