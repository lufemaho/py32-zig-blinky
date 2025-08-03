//! Arm 32-bit Cortex-M0+ Microcontroller based device, CPU clock up to 48 MHz.
// const mmio = @import("mmio");
pub const types = @import("types.zig");

// pub const Interrupt = struct {
//     name: [:0]const u8,
//     index: i16,
//     description: ?[:0]const u8,
// };

// pub const properties = struct {
//     pub const @"cpu.endian" = "little";
//     pub const @"cpu.fpuPresent" = "false";
//     pub const @"cpu.mpuPresent" = "false";
//     pub const @"cpu.name" = "CM0+";
//     pub const @"cpu.nvicPrioBits" = "4";
//     pub const @"cpu.revision" = "r0p1";
//     pub const @"cpu.vendorSystickConfig" = "false";
// };

// pub const interrupts: []const Interrupt = &.{
//     .{ .name = "NMI", .index = -14, .description = null },
//     .{ .name = "HardFault", .index = -13, .description = null },
//     .{ .name = "SVCall", .index = -5, .description = null },
//     .{ .name = "PendSV", .index = -2, .description = null },
//     .{ .name = "SysTick", .index = -1, .description = null },
//     .{ .name = "FLASH", .index = 3, .description = "FLASH global Interrupt" },
//     .{ .name = "RCC", .index = 4, .description = "RCC global Interrupt" },
//     .{ .name = "EXTI0_1", .index = 5, .description = "EXTI Line 0 and 1 Interrupt" },
//     .{ .name = "EXTI2_3", .index = 6, .description = "EXTI Line 2 and 3 Interrupt" },
//     .{ .name = "EXTI4_15", .index = 7, .description = "EXTI Line 4 to 15 Interrupt" },
//     .{ .name = "ADC", .index = 12, .description = "ADC Interrupt through EXTI Lines 17 and 18" },
//     .{ .name = "TIM1_BRK_UP_TRG_COM", .index = 13, .description = "TIM1 Break, Update, Trigger and Commutation Interrupt" },
//     .{ .name = "TIM1_CC", .index = 14, .description = "TIM1 Capture Compare Interrupt" },
//     .{ .name = "TIM16", .index = 21, .description = "TIM16 global Interrupt" },
//     .{ .name = "I2C1", .index = 23, .description = "I2C1 global Interrupt" },
//     .{ .name = "SPI1", .index = 25, .description = "SPI1 global Interrupt" },
//     .{ .name = "USART1", .index = 27, .description = "USART1 global Interrupt" },
// };

// pub const VectorTable = extern struct {
//     const Handler = microzig.interrupt.Handler;
//     const unhandled = microzig.interrupt.unhandled;

//     initial_stack_pointer: u32,
//     Reset: Handler,
//     NMI: Handler = unhandled,
//     HardFault: Handler = unhandled,
//     reserved2: [7]u32 = undefined,
//     SVCall: Handler = unhandled,
//     reserved10: [2]u32 = undefined,
//     PendSV: Handler = unhandled,
//     SysTick: Handler = unhandled,
//     reserved14: [3]u32 = undefined,
//     /// FLASH global Interrupt
//     FLASH: Handler = unhandled,
//     /// RCC global Interrupt
//     RCC: Handler = unhandled,
//     /// EXTI Line 0 and 1 Interrupt
//     EXTI0_1: Handler = unhandled,
//     /// EXTI Line 2 and 3 Interrupt
//     EXTI2_3: Handler = unhandled,
//     /// EXTI Line 4 to 15 Interrupt
//     EXTI4_15: Handler = unhandled,
//     reserved22: [4]u32 = undefined,
//     /// ADC Interrupt through EXTI Lines 17 and 18
//     ADC: Handler = unhandled,
//     /// TIM1 Break, Update, Trigger and Commutation Interrupt
//     TIM1_BRK_UP_TRG_COM: Handler = unhandled,
//     /// TIM1 Capture Compare Interrupt
//     TIM1_CC: Handler = unhandled,
//     reserved29: [6]u32 = undefined,
//     /// TIM16 global Interrupt
//     TIM16: Handler = unhandled,
//     reserved36: [1]u32 = undefined,
//     /// I2C1 global Interrupt
//     I2C1: Handler = unhandled,
//     reserved38: [1]u32 = undefined,
//     /// SPI1 global Interrupt
//     SPI1: Handler = unhandled,
//     reserved40: [1]u32 = undefined,
//     /// USART1 global Interrupt
//     USART1: Handler = unhandled,
// };

pub const peripherals = struct {
    /// Independent watchdog
    pub const IWDG: *volatile types.peripherals.IWDG = @ptrFromInt(0x40003000);
    /// Inter integrated circuit
    pub const I2C: *volatile types.peripherals.I2C = @ptrFromInt(0x40005400);
    /// Power control
    pub const PWR: *volatile types.peripherals.PWR = @ptrFromInt(0x40007000);
    /// Low power timer
    pub const LPTIM: *volatile types.peripherals.LPTIM = @ptrFromInt(0x40007c00);
    /// System configuration controller
    pub const SYSCFG: *volatile types.peripherals.SYSCFG = @ptrFromInt(0x40010000);
    
    pub const COMP: *volatile types.peripherals.COMP = @ptrFromInt(0x40010200);
    /// Analog to Digital Converter
    pub const ADC: *volatile types.peripherals.ADC = @ptrFromInt(0x40012400);
    /// Advanced timer
    pub const TIM1: *volatile types.peripherals.TIM1 = @ptrFromInt(0x40012c00);
    /// Serial peripheral interface
    pub const SPI1: *volatile types.peripherals.SPI1 = @ptrFromInt(0x40013000);
    /// Universal synchronous asynchronous receiver transmitter
    pub const USART1: *volatile types.peripherals.USART1 = @ptrFromInt(0x40013800);
    /// General purpose timer
    pub const TIM16: *volatile types.peripherals.TIM16 = @ptrFromInt(0x40014400);
    /// Debug support
    pub const DBGMCU: *volatile types.peripherals.DBGMCU = @ptrFromInt(0x40015800);
    /// Reset and clock control
    pub const RCC: *volatile types.peripherals.RCC = @ptrFromInt(0x40021000);
    /// External interrupt/event controller
    pub const EXTI: *volatile types.peripherals.EXTI = @ptrFromInt(0x40021800);
    /// Flash
    pub const FLASH: *volatile types.peripherals.FLASH = @ptrFromInt(0x40022000);
    /// CRC calculation unit
    pub const CRC: *volatile types.peripherals.CRC = @ptrFromInt(0x40023000);
    /// General-purpose I/Os
    pub const GPIOA: *volatile types.peripherals.GPIOA = @ptrFromInt(0x50000000);
    /// General-purpose I/Os
    pub const GPIOB: *volatile types.peripherals.GPIOB = @ptrFromInt(0x50000400);
    /// General-purpose I/Os
    pub const GPIOF: *volatile types.peripherals.GPIOB = @ptrFromInt(0x50001400);
    /// Implementation Control Block
    pub const ICB: *volatile types.peripherals.ICB = @ptrFromInt(0xe000e008);
    /// System control block
    pub const SCB: *volatile types.peripherals.SCB = @ptrFromInt(0xe000ed00);

};
