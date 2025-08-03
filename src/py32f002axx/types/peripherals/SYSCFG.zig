const mmio = @import("mmio");
const types = @import("../../types.zig");

/// System configuration controller
pub const SYSCFG = extern struct {
    /// SYSCFG configuration register 1
    /// offset: 0x00
    CFGR1: mmio.Mmio(packed struct(u32) {
        /// Memory mapping selection bits
        MEM_MODE: u2,
        reserved18: u16 = 0,
        /// Analog filter enable control driving capability activation bits PA2
        I2C_PA2_ANF: u1,
        /// Analog filter enable control driving capability activation bits PA3
        I2C_PA3_ANF: u1,
        /// Analog filter enable control driving capability activation bits PA7
        I2C_PA7_ANF: u1,
        /// Analog filter enable control driving capability activation bits PA8
        I2C_PA8_ANF: u1,
        /// Analog filter enable control driving capability activation bits PA9
        I2C_PA9_ANF: u1,
        /// Analog filter enable control driving capability activation bits PA10
        I2C_PA10_ANF: u1,
        /// Analog filter enable control driving capability activation bits PA11
        I2C_PA11_ANF: u1,
        /// Analog filter enable control driving capability activation bits PA12
        I2C_PA12_ANF: u1,
        /// Analog filter enable control driving capability activation bits PB6
        I2C_PB6_ANF: u1,
        /// Analog filter enable control driving capability activation bits PB7
        I2C_PB7_ANF: u1,
        /// Analog filter enable control driving capability activation bits PB8
        I2C_PB8_ANF: u1,
        /// Analog filter enable control driving capability activation bits PF0
        I2C_PF0_ANF: u1,
        /// Analog filter enable control driving capability activation bits PF1
        I2C_PF1_ANF: u1,
        padding: u1 = 0,
    }),
    /// offset: 0x04
    reserved4: [20]u8,
    /// SYSCFG configuration register 2
    /// offset: 0x18
    CFGR2: mmio.Mmio(packed struct(u32) {
        /// Cortex-M0+ LOCKUP bit enable bit
        LOCKUP_LOCK: u1,
        reserved9: u8 = 0,
        /// TIM1 ETR source selection
        ETR_SRC_TIM1: u2,
        padding: u21 = 0,
    }),
};
