const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Debug support
pub const DBGMCU = extern struct {
    /// MCU Device ID Code Register
    /// offset: 0x00
    IDCODE: u32,
    /// Debug MCU Configuration Register
    /// offset: 0x04
    CR: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Debug Stop Mode
        DBG_STOP: u1,
        padding: u30 = 0,
    }),
    /// APB Freeze Register1
    /// offset: 0x08
    APB_FZ1: mmio.Mmio(packed struct(u32) {
        reserved12: u12 = 0,
        /// Debug Independent Wachdog stopped when Core is halted
        DBG_IWDG_STOP: u1,
        reserved31: u18 = 0,
        /// Debug LPTIM stopped when Core is halted
        DBG_LPTIM_STOP: u1,
    }),
    /// APB Freeze Register2
    /// offset: 0x0c
    APB_FZ2: mmio.Mmio(packed struct(u32) {
        reserved11: u11 = 0,
        /// Debug Timer 1 stopped when Core is halted
        DBG_TIMER1_STOP: u1,
        reserved17: u5 = 0,
        /// Debug Timer 16 stopped when Core is halted
        DBG_TIMER16_STOP: u1,
        padding: u14 = 0,
    }),
};
