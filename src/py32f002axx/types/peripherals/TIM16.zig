const mmio = @import("mmio");
const types = @import("../../types.zig");

/// General purpose timer
pub const TIM16 = extern struct {
    /// TIM16 control register1
    /// offset: 0x00
    CR1: mmio.Mmio(packed struct(u32) {
        /// Counter enable
        CEN: u1,
        /// Update disable
        UDIS: u1,
        /// Update request source
        URS: u1,
        /// One pulse mode
        OPM: u1,
        reserved7: u3 = 0,
        /// Auto-reload preload enable
        ARPE: u1,
        /// Prescaler factor
        CKD: u2,
        padding: u22 = 0,
    }),
    /// offset: 0x04
    reserved4: [8]u8,
    /// DMA/Interrupt enable register
    /// offset: 0x0c
    DIER: mmio.Mmio(packed struct(u32) {
        /// Update interrupt enable
        UIE: u1,
        padding: u31 = 0,
    }),
    /// status register
    /// offset: 0x10
    SR: mmio.Mmio(packed struct(u32) {
        /// Update interrupt flag
        UIF: u1,
        padding: u31 = 0,
    }),
    /// event generation register
    /// offset: 0x14
    EGR: mmio.Mmio(packed struct(u32) {
        /// Update generation
        UG: u1,
        padding: u31 = 0,
    }),
    /// offset: 0x18
    reserved24: [12]u8,
    /// counter
    /// offset: 0x24
    CNT: mmio.Mmio(packed struct(u32) {
        /// counter value
        CNT: u16,
        padding: u16 = 0,
    }),
    /// prescaler
    /// offset: 0x28
    PSC: mmio.Mmio(packed struct(u32) {
        /// Prescaler value
        PSC: u16,
        padding: u16 = 0,
    }),
    /// auto-reload register
    /// offset: 0x2c
    ARR: mmio.Mmio(packed struct(u32) {
        /// Auto-reload value
        ARR: u16,
        padding: u16 = 0,
    }),
    /// repetition counter register
    /// offset: 0x30
    RCR: mmio.Mmio(packed struct(u32) {
        /// Repetition counter value
        REP: u8,
        padding: u24 = 0,
    }),
};
