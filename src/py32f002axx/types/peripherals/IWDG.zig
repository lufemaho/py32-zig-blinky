const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Independent watchdog
pub const IWDG = extern struct {
    /// Key register (IWDG_KR)
    /// offset: 0x00
    KR: mmio.Mmio(packed struct(u32) {
        /// Key value
        KEY: u16,
        padding: u16 = 0,
    }),
    /// Prescaler register (IWDG_PR)
    /// offset: 0x04
    PR: mmio.Mmio(packed struct(u32) {
        /// Prescaler divider
        PR: u3,
        padding: u29 = 0,
    }),
    /// Reload register (IWDG_RLR)
    /// offset: 0x08
    RLR: mmio.Mmio(packed struct(u32) {
        /// Watchdog counter reload value
        RL: u12,
        padding: u20 = 0,
    }),
    /// Status register (IWDG_SR)
    /// offset: 0x0c
    SR: mmio.Mmio(packed struct(u32) {
        /// Watchdog prescaler value update
        PVU: u1,
        /// Watchdog counter reload value update
        RVU: u1,
        /// Watchdog counter window value update
        WVU: u1,
        padding: u29 = 0,
    }),
    /// Window register (IWDG_SR)
    /// offset: 0x10
    WINR: mmio.Mmio(packed struct(u32) {
        /// window counter
        WIN: u12,
        padding: u20 = 0,
    }),
};
