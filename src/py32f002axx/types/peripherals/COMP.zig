const mmio = @import("mmio");
const types = @import("../../types.zig");

pub const COMP = extern struct {
    COMP1_CSR: mmio.Mmio(packed struct(u32) {
        COMP1_EN: u1,
        SCALER_EN: u1,
        _reserved0: u2,
        INMSEL: u4,
        INPSEL: u2,
        _reserved1: u1,
        WINMODE: u1,
        _reserved2: u3,
        POLARITY: u1,
        HYST: u1,
        _reserved3:u1,
        PWRMODE: u2,
        _reserved4: u10,
        COMP_OUT: u1,
        LOCK: u1,
    }),
    COMP1_FR: mmio.Mmio(packed struct(u32) {
        reserved0: u16,
        FLTCNT1: u16,
    }),
    COMP2_CSR: mmio.Mmio(packed struct(u32) {
        COMP2_EN: u1,
        SCALER_EN: u1,
        _reserved0: u2,
        INMSEL: u4,
        INPSEL: u2,
        _reserved1: u1,
        WINMODE: u1,
        _reserved2: u3,
        POLARITY: u1,
        HYST: u1,
        _reserved3:u1,
        PWRMODE: u2,
        _reserved4: u10,
        COMP_OUT: u1,
        LOCK: u1,
    }),

};