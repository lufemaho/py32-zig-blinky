const main = @import("main");

// this is the interrupt vector table
export const vector_table linksection(".isr_vector") = VectorTable{
    .Reset = Reset_Handler,
    .NMI = BusyDummy_Handler,
    .HardFault = BusyDummy_Handler,
    .SVCall = BusyDummy_Handler,
    .PendSV = BusyDummy_Handler,
    .SysTick = Dummy_Handler,
    .FLASH = Dummy_Handler,
    .RCC = Dummy_Handler,
    .EXTI0_1 = Dummy_Handler,
    .EXTI2_3 = Dummy_Handler,
    .EXTI4_15 = Dummy_Handler,
    .ADC = Dummy_Handler,
    .TIM1_BRK_UP_TRG_COM = Dummy_Handler,
    .TIM1_CC = Dummy_Handler,
    .LPTIM1 = Dummy_Handler,
    .TIM16 = Dummy_Handler,
    .I2C1 = Dummy_Handler,
    .SPI1 = Dummy_Handler,
    .USART1 = Dummy_Handler,
};

export fn Reset_Handler() void {
    _init_memory();
    main.main();
}

export fn BusyDummy_Handler() void {
    while (true) {}
}

export fn Dummy_Handler() void {}

const Isr = *const fn () callconv(.c) void;
const VectorTable = extern struct {
    Reset: Isr,
    NMI: Isr,
    HardFault: Isr,
    reserved2: [7]Isr = undefined,
    SVCall: Isr,
    reserved10: [2]Isr = undefined,
    PendSV: Isr,
    SysTick: Isr,
    reserved14: [3]Isr = undefined,
    /// FLASH global Interrupt
    FLASH: Isr,
    /// RCC global Interrupt
    RCC: Isr,
    /// EXTI Line 0 and 1 Interrupt
    EXTI0_1: Isr,
    /// EXTI Line 2 and 3 Interrupt
    EXTI2_3: Isr,
    /// EXTI Line 4 to 15 Interrupt
    EXTI4_15: Isr,
    reserved22: [4]Isr = undefined,
    /// ADC Interrupt through EXTI Lines 17 and 18
    ADC: Isr,
    /// TIM1 Break, Update, Trigger and Commutation Interrupt
    TIM1_BRK_UP_TRG_COM: Isr,
    /// TIM1 Capture Compare Interrupt
    TIM1_CC: Isr,
    reserved290: [2]Isr = undefined,
    LPTIM1: Isr,
    reserved291: [3]Isr = undefined,
    /// TIM16 global Interrupt
    TIM16: Isr,
    reserved36: [1]Isr = undefined,
    /// I2C1 global Interrupt
    I2C1: Isr,
    reserved38: [1]Isr = undefined,
    /// SPI1 global Interrupt
    SPI1: Isr,
    reserved40: [1]Isr = undefined,
    /// USART1 global Interrupt
    USART1: Isr,
    reserved50: [4]Isr = undefined,
};

fn _init_memory() void {
    const data_size = @intFromPtr(&__data_size);
    const data: [*]u8 = @ptrCast(&__data_start);
    const text_end: [*]u8 = @ptrCast(&__text_end);
    @memcpy(data[0..data_size], text_end[0..data_size]);
    const bss_size = @intFromPtr(&__bss_size);
    const bss: [*]u8 = @ptrCast(&__bss_start);
    @memset(bss[0..bss_size], 0);
}

// provided by linker
extern var __text_end: u32;
extern var __data_start: u32;
extern var __data_size: u32;
extern var __bss_start: u32;
extern var __bss_size: u32;
extern var __stack_top: u32;
