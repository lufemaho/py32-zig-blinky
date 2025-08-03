const mmio = @import("mmio");
const types = @import("../../types.zig");

/// CRC calculation unit
pub const CRC = extern struct {
    /// Data register
    /// offset: 0x00
    DR: mmio.Mmio(packed struct(u32) {
        /// Data Register
        DR: u32,
    }),
    /// Independent Data register
    /// offset: 0x04
    IDR: mmio.Mmio(packed struct(u32) {
        /// Independent Data register
        IDR: u8,
        padding: u24 = 0,
    }),
    /// Control register
    /// offset: 0x08
    CR: mmio.Mmio(packed struct(u32) {
        /// Reset bit
        RESET: u1,
        padding: u31 = 0,
    }),
};
