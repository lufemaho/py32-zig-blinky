const mmio = @import("mmio");
const types = @import("../../types.zig");

/// External interrupt/event controller
pub const EXTI = extern struct {
    /// EXTI rising trigger selection register
    /// offset: 0x00
    RTSR: mmio.Mmio(packed struct(u32) {
        /// Rising trigger event configuration bit of Configurable Event input
        RT0: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        RT1: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        RT2: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        RT3: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        RT4: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        RT5: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        RT6: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        RT7: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        RT8: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        RT9: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        RT10: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        RT11: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        RT12: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        RT13: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        RT14: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        RT15: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        RT16: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        RT17: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        RT18: u1,
        padding: u13 = 0,
    }),
    /// EXTI falling trigger selection register
    /// offset: 0x04
    FTSR: mmio.Mmio(packed struct(u32) {
        /// Falling trigger event configuration bit of Configurable Event input
        FT0: u1,
        /// Falling trigger event configuration bit of Configurable Event input
        FT1: u1,
        /// Falling trigger event configuration bit of Configurable Event input
        FT2: u1,
        /// Falling trigger event configuration bit of Configurable Event input
        FT3: u1,
        /// Falling trigger event configuration bit of Configurable Event input
        FT4: u1,
        /// Falling trigger event configuration bit of Configurable Event input
        FT5: u1,
        /// Falling trigger event configuration bit of Configurable Event input
        FT6: u1,
        /// Falling trigger event configuration bit of Configurable Event input
        FT7: u1,
        /// Falling trigger event configuration bit of Configurable Event input
        FT8: u1,
        /// Falling trigger event configuration bit of Configurable Event input
        FT9: u1,
        /// Falling trigger event configuration bit of Configurable Event input
        FT10: u1,
        /// Falling trigger event configuration bit of Configurable Event input
        FT11: u1,
        /// Falling trigger event configuration bit of Configurable Event input
        FT12: u1,
        /// Falling trigger event configuration bit of Configurable Event input
        FT13: u1,
        /// Falling trigger event configuration bit of Configurable Event input
        FT14: u1,
        /// Falling trigger event configuration bit of Configurable Event input
        FT15: u1,
        /// Falling trigger event configuration bit of Configurable Event input
        FT16: u1,
        /// Falling trigger event configuration bit of Configurable Event input
        FT17: u1,
        /// Falling trigger event configuration bit of Configurable Event input
        FT18: u1,
        padding: u13 = 0,
    }),
    /// EXTI software interrupt event register
    /// offset: 0x08
    SWIER: mmio.Mmio(packed struct(u32) {
        /// Rising trigger event configuration bit of Configurable Event input
        SWI0: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        SWI1: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        SWI2: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        SWI3: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        SWI4: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        SWI5: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        SWI6: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        SWI7: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        SWI8: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        SWI9: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        SWI10: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        SWI11: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        SWI12: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        SWI13: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        SWI14: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        SWI15: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        SWI16: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        SWI17: u1,
        /// Rising trigger event configuration bit of Configurable Event input
        SWI18: u1,
        padding: u13 = 0,
    }),
    /// EXTI pending register
    /// offset: 0x0c
    PR: mmio.Mmio(packed struct(u32) {
        /// configurable event inputs x rising edge Pending bit.
        PR0: u1,
        /// configurable event inputs x rising edge Pending bit.
        PR1: u1,
        /// configurable event inputs x rising edge Pending bit.
        PR2: u1,
        /// configurable event inputs x rising edge Pending bit.
        PR3: u1,
        /// configurable event inputs x rising edge Pending bit.
        PR4: u1,
        /// configurable event inputs x rising edge Pending bit.
        PR5: u1,
        /// configurable event inputs x rising edge Pending bit.
        PR6: u1,
        /// configurable event inputs x rising edge Pending bit.
        PR7: u1,
        /// configurable event inputs x rising edge Pending bit.
        PR8: u1,
        /// configurable event inputs x rising edge Pending bit.
        PR9: u1,
        /// configurable event inputs x rising edge Pending bit.
        PR10: u1,
        /// configurable event inputs x rising edge Pending bit.
        PR11: u1,
        /// configurable event inputs x rising edge Pending bit.
        PR12: u1,
        /// configurable event inputs x rising edge Pending bit
        PR13: u1,
        /// configurable event inputs x rising edge Pending bit.
        PR14: u1,
        /// configurable event inputs x rising edge Pending bit.
        PR15: u1,
        /// configurable event inputs x rising edge Pending bit.
        PR16: u1,
        /// configurable event inputs x rising edge Pending bit.
        PR17: u1,
        /// configurable event inputs x rising edge Pending bit.
        PR18: u1,
        padding: u13 = 0,
    }),
    /// offset: 0x10
    reserved16: [80]u8,
    /// EXTI external interrupt selection register
    /// offset: 0x60
    EXTICR1: mmio.Mmio(packed struct(u32) {
        /// GPIO port selection
        EXTI0: u2,
        reserved8: u6 = 0,
        /// GPIO port selection
        EXTI1: u2,
        reserved16: u6 = 0,
        /// GPIO port selection
        EXTI2: u2,
        reserved24: u6 = 0,
        /// GPIO port selection
        EXTI3: u2,
        padding: u6 = 0,
    }),
    /// EXTI external interrupt selection register
    /// offset: 0x64
    EXTICR2: mmio.Mmio(packed struct(u32) {
        /// GPIO port selection
        EXTI4: u2,
        reserved8: u6 = 0,
        /// GPIO port selection
        EXTI5: u1,
        reserved16: u7 = 0,
        /// GPIO port selection
        EXTI6: u1,
        reserved24: u7 = 0,
        /// GPIO port selection
        EXTI7: u1,
        padding: u7 = 0,
    }),
    /// EXTI external interrupt selection register
    /// offset: 0x68
    EXTICR3: mmio.Mmio(packed struct(u32) {
        /// GPIO port selection
        EXTI8: u1,
        padding: u31 = 0,
    }),
    /// offset: 0x6c
    reserved108: [20]u8,
    /// EXTI CPU wakeup with interrupt mask register
    /// offset: 0x80
    IMR: mmio.Mmio(packed struct(u32) {
        /// CPU wakeup with interrupt mask on event input
        IM0: u1,
        /// CPU wakeup with interrupt mask on event input
        IM1: u1,
        /// CPU wakeup with interrupt mask on event input
        IM2: u1,
        /// CPU wakeup with interrupt mask on event input
        IM3: u1,
        /// CPU wakeup with interrupt mask on event input
        IM4: u1,
        /// CPU wakeup with interrupt mask on event input
        IM5: u1,
        /// CPU wakeup with interrupt mask on event input
        IM6: u1,
        /// CPU wakeup with interrupt mask on event input
        IM7: u1,
        /// CPU wakeup with interrupt mask on event input
        IM8: u1,
        /// CPU wakeup with interrupt mask on event input
        IM9: u1,
        /// CPU wakeup with interrupt mask on event input
        IM10: u1,
        /// CPU wakeup with interrupt mask on event input
        IM11: u1,
        /// CPU wakeup with interrupt mask on event input
        IM12: u1,
        /// CPU wakeup with interrupt mask on event input
        IM13: u1,
        /// CPU wakeup with interrupt mask on event input
        IM14: u1,
        /// CPU wakeup with interrupt mask on event input
        IM15: u1,
        /// CPU wakeup with interrupt mask on event input
        IM16: u1,
        /// CPU wakeup with interrupt mask on event input
        IM17: u1,
        /// CPU wakeup with interrupt mask on event input
        IM18: u1,
        /// CPU wakeup with interrupt mask on event input
        IM19: u1,
        reserved29: u9 = 0,
        /// CPU wakeup with interrupt mask on event input
        IM29: u1,
        padding: u2 = 0,
    }),
    /// EXTI CPU wakeup with event mask register
    /// offset: 0x84
    EMR: mmio.Mmio(packed struct(u32) {
        /// CPU wakeup with event mask on event input
        EM0: u1,
        /// CPU wakeup with event mask on event input
        EM1: u1,
        /// CPU wakeup with event mask on event input
        EM2: u1,
        /// CPU wakeup with event mask on event input
        EM3: u1,
        /// CPU wakeup with event mask on event input
        EM4: u1,
        /// CPU wakeup with event mask on event input
        EM5: u1,
        /// CPU wakeup with event mask on event input
        EM6: u1,
        /// CPU wakeup with event mask on event input
        EM7: u1,
        /// CPU wakeup with event mask on event input
        EM8: u1,
        /// CPU wakeup with event mask on event input
        EM9: u1,
        /// CPU wakeup with event mask on event input
        EM10: u1,
        /// CPU wakeup with event mask on event input
        EM11: u1,
        /// CPU wakeup with event mask on event input
        EM12: u1,
        /// CPU wakeup with event mask on event input
        EM13: u1,
        /// CPU wakeup with event mask on event input
        EM14: u1,
        /// CPU wakeup with event mask on event input
        EM15: u1,
        /// CPU wakeup with event mask on event input
        EM16: u1,
        /// CPU wakeup with event mask on event input
        EM17: u1,
        /// CPU wakeup with event mask on event input
        EM18: u1,
        /// CPU wakeup with event mask on event input
        EM19: u1,
        reserved29: u9 = 0,
        /// CPU wakeup with event mask on event input
        EM29: u1,
        padding: u2 = 0,
    }),
};
