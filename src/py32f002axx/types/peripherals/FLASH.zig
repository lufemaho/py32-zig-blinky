const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Flash
pub const FLASH = extern struct {
    /// Access control register
    /// offset: 0x00
    ACR: mmio.Mmio(packed struct(u32) {
        /// Latency
        LATENCY: u1,
        padding: u31 = 0,
    }),
    /// offset: 0x04
    reserved4: [4]u8,
    /// Flash key register
    /// offset: 0x08
    KEYR: mmio.Mmio(packed struct(u32) {
        /// Flash key
        KEY: u32,
    }),
    /// Option byte key register
    /// offset: 0x0c
    OPTKEYR: mmio.Mmio(packed struct(u32) {
        /// Option byte key
        OPTKEY: u32,
    }),
    /// Status register
    /// offset: 0x10
    SR: mmio.Mmio(packed struct(u32) {
        /// End of operation
        EOP: u1,
        reserved4: u3 = 0,
        /// Write protected error
        WRPERR: u1,
        reserved15: u10 = 0,
        /// Option and Engineering bits loading validity error
        OPTVERR: u1,
        /// Busy
        BSY: u1,
        padding: u15 = 0,
    }),
    /// Flash control register
    /// offset: 0x14
    CR: mmio.Mmio(packed struct(u32) {
        /// Programming
        PG: u1,
        /// Page erase
        PER: u1,
        /// Mass erase
        MER: u1,
        reserved11: u8 = 0,
        /// Sector erase
        SER: u1,
        reserved17: u5 = 0,
        /// Option byte program start
        OPTSTRT: u1,
        reserved19: u1 = 0,
        /// Flash main memory program start
        PGTSTRT: u1,
        reserved24: u4 = 0,
        /// End of operation interrupt enable
        EOPIE: u1,
        /// Error interrupt enable
        ERRIE: u1,
        reserved27: u1 = 0,
        /// Force the option byte loading
        OBL_LAUNCH: u1,
        reserved30: u2 = 0,
        /// Options Lock
        OPTLOCK: u1,
        /// FLASH_CR Lock
        LOCK: u1,
    }),
    /// offset: 0x18
    reserved24: [8]u8,
    /// Flash option register
    /// offset: 0x20
    OPTR: mmio.Mmio(packed struct(u32) {
        /// Read Protection
        RDP: u8,
        /// BOR reset Level
        BOREN: u1,
        /// These bits contain the VDD supply level threshold that activates the reset
        BORF_LEV: u3,
        /// Independent watchdog selection
        IDWG_SW: u1,
        reserved14: u1 = 0,
        /// NRST_MODE
        NRST_MODE: u1,
        /// Boot configuration
        nBOOT1: u1,
        padding: u16 = 0,
    }),
    /// Flash SDK address register
    /// offset: 0x24
    SDKR: mmio.Mmio(packed struct(u32) {
        /// SDK area start address
        SDK_STRT: u5,
        reserved8: u3 = 0,
        /// SDK area end address
        SDK_END: u5,
        padding: u19 = 0,
    }),
    /// offset: 0x28
    reserved40: [4]u8,
    /// Flash WRP address register
    /// offset: 0x2c
    WRPR: mmio.Mmio(packed struct(u32) {
        /// WRP address
        WRP: u16,
        padding: u16 = 0,
    }),
    /// offset: 0x30
    reserved48: [96]u8,
    /// Flash sleep time config register
    /// offset: 0x90
    STCR: mmio.Mmio(packed struct(u32) {
        /// FLash sleep enable
        SLEEP_EN: u1,
        reserved8: u7 = 0,
        /// FLash sleep time configuration(counter based on HSI_10M)
        SLEEP_TIME: u8,
        padding: u16 = 0,
    }),
    /// offset: 0x94
    reserved148: [108]u8,
    /// Flash TS0 register
    /// offset: 0x100
    TS0: mmio.Mmio(packed struct(u32) {
        /// FLash TS0 register
        TS0: u8,
        padding: u24 = 0,
    }),
    /// Flash TS1 register
    /// offset: 0x104
    TS1: mmio.Mmio(packed struct(u32) {
        /// FLash TS1 register
        TS1: u9,
        padding: u23 = 0,
    }),
    /// Flash TS2P register
    /// offset: 0x108
    TS2P: mmio.Mmio(packed struct(u32) {
        /// FLash TS2P register
        TS2P: u8,
        padding: u24 = 0,
    }),
    /// Flash TPS3 register
    /// offset: 0x10c
    TPS3: mmio.Mmio(packed struct(u32) {
        /// FLash TPS3 register
        TPS3: u11,
        padding: u21 = 0,
    }),
    /// Flash TS3 register
    /// offset: 0x110
    TS3: mmio.Mmio(packed struct(u32) {
        /// FLash TS3 register
        TS3: u8,
        padding: u24 = 0,
    }),
    /// Flash PERTPE register
    /// offset: 0x114
    PERTPE: mmio.Mmio(packed struct(u32) {
        /// FLash PERTPE register
        PERTPE: u17,
        padding: u15 = 0,
    }),
    /// Flash SMERTPE register
    /// offset: 0x118
    SMERTPE: mmio.Mmio(packed struct(u32) {
        /// FLash SMERTPE register
        SMERTPE: u17,
        padding: u15 = 0,
    }),
    /// Flash PRGTPE register
    /// offset: 0x11c
    PRGTPE: mmio.Mmio(packed struct(u32) {
        /// FLash PRGTPE register
        PRGTPE: u16,
        padding: u16 = 0,
    }),
    /// Flash PRETPE register
    /// offset: 0x120
    PRETPE: mmio.Mmio(packed struct(u32) {
        /// FLash PRETPE register
        PRETPE: u13,
        padding: u19 = 0,
    }),
};
