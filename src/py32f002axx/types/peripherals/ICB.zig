const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Implementation Control Block
pub const ICB = extern struct {
    /// Provides IMPLEMENTATION DEFINED configuration and control options
    /// offset: 0x00
    @"Auxiliary Control Register": u32,
};
