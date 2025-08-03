const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Reset and clock control
pub const RCC = extern struct {
    /// Clock control register
    /// offset: 0x00
    CR: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// HSI16 clock enable
        HSION: u1,
        /// HSI16 always enable for peripheral kernels
        HSIKERON: u1,
        /// HSI16 clock ready flag
        HSIRDY: u1,
        /// HSI16 clock division factor
        HSIDIV: u3,
        reserved16: u2 = 0,
        /// HSE clock enable
        HSEON: u1,
        /// HSE clock ready flag
        HSERDY: u1,
        /// HSE crystal oscillator bypass
        HSEBYP: u1,
        /// Clock security system enable
        CSSON: u1,
        padding: u12 = 0,
    }),
    /// Internal clock sources calibration register
    /// offset: 0x04
    ICSCR: mmio.Mmio(packed struct(u32) {
        /// HSI clock trimming
        HSI_TRIM: u13,
        /// HSI frequency selection
        HSI_FS: u3,
        /// LSI clock trimming
        LSI_TRIM: u9,
        reserved26: u1 = 0,
        /// LSI startup time
        LSI_STARTUP: u2,
        padding: u4 = 0,
    }),
    /// Clock configuration register
    /// offset: 0x08
    CFGR: mmio.Mmio(packed struct(u32) {
        /// System clock switch
        SW: u3,
        /// System clock switch status
        SWS: u3,
        reserved8: u2 = 0,
        /// AHB prescaler
        HPRE: u4,
        /// APB prescaler
        PPRE: u3,
        reserved24: u9 = 0,
        /// Microcontroller clock output
        MCOSEL: u3,
        reserved28: u1 = 0,
        /// Microcontroller clock output prescaler
        MCOPRE: u3,
        padding: u1 = 0,
    }),
    /// offset: 0x0c
    reserved12: [4]u8,
    /// External clock source control register
    /// offset: 0x10
    ECSCR: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// HSE clock freqency selection
        HSE_FREQ: u2,
        padding: u28 = 0,
    }),
    /// offset: 0x14
    reserved20: [4]u8,
    /// Clock interrupt enable register
    /// offset: 0x18
    CIER: mmio.Mmio(packed struct(u32) {
        /// LSI ready interrupt enable
        LSIRDYIE: u1,
        reserved3: u2 = 0,
        /// HSI ready interrupt enable
        HSIRDYIE: u1,
        /// HSE ready interrupt enable
        HSERDYIE: u1,
        padding: u27 = 0,
    }),
    /// Clock interrupt flag register
    /// offset: 0x1c
    CIFR: mmio.Mmio(packed struct(u32) {
        /// LSI ready interrupt flag
        LSIRDYF: u1,
        reserved3: u2 = 0,
        /// HSI ready interrupt flag
        HSIRDYF: u1,
        /// HSE ready interrupt flag
        HSERDYF: u1,
        reserved8: u3 = 0,
        /// HSE clock secure system interrupt flag
        CSSF: u1,
        padding: u23 = 0,
    }),
    /// Clock interrupt clear register
    /// offset: 0x20
    CICR: mmio.Mmio(packed struct(u32) {
        /// LSI ready interrupt clear
        LSIRDYC: u1,
        reserved3: u2 = 0,
        /// HSI ready interrupt clear
        HSIRDYC: u1,
        /// HSE ready interrupt clear
        HSERDYC: u1,
        reserved8: u3 = 0,
        /// clock secure system interrupt flag clear
        CSSC: u1,
        padding: u23 = 0,
    }),
    /// GPIO reset register
    /// offset: 0x24
    IOPRSTR: mmio.Mmio(packed struct(u32) {
        /// I/O port A reset
        GPIOARST: u1,
        /// I/O port B reset
        GPIOBRST: u1,
        reserved5: u3 = 0,
        /// I/O port F reset
        GPIOFRST: u1,
        padding: u26 = 0,
    }),
    /// AHB peripheral reset register
    /// offset: 0x28
    AHBRSTR: mmio.Mmio(packed struct(u32) {
        reserved12: u12 = 0,
        /// CRC reset
        CRCRST: u1,
        padding: u19 = 0,
    }),
    /// APB peripheral reset register 1
    /// offset: 0x2c
    APBRSTR1: mmio.Mmio(packed struct(u32) {
        reserved21: u21 = 0,
        /// I2C reset
        I2CRST: u1,
        reserved27: u5 = 0,
        /// Debug support reset
        DBGRST: u1,
        /// Power interface reset
        PWRRST: u1,
        reserved31: u2 = 0,
        /// Low Power Timer reset
        LPTIMRST: u1,
    }),
    /// APB peripheral reset register 2
    /// offset: 0x30
    APBRSTR2: mmio.Mmio(packed struct(u32) {
        /// SYSCFG and COMP reset
        SYSCFGRST: u1,
        reserved11: u10 = 0,
        /// TIM1 timer reset
        TIM1RST: u1,
        /// SPI1 reset
        SPI1RST: u1,
        reserved14: u1 = 0,
        /// USART1 reset
        USART1RST: u1,
        reserved17: u2 = 0,
        /// TIM16 timer reset
        TIM16RST: u1,
        reserved20: u2 = 0,
        /// ADC reset
        ADCRST: u1,
        padding: u11 = 0,
    }),
    /// GPIO clock enable register
    /// offset: 0x34
    IOPENR: mmio.Mmio(packed struct(u32) {
        /// I/O port A clock enable
        GPIOAEN: u1,
        /// I/O port B clock enable
        GPIOBEN: u1,
        reserved5: u3 = 0,
        /// I/O port F clock enable
        GPIOFEN: u1,
        padding: u26 = 0,
    }),
    /// AHB peripheral clock enable register
    /// offset: 0x38
    AHBENR: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// Flash memory interface clock enable
        FLASHEN: u1,
        /// SRAM memory interface clock enable
        SRAMEN: u1,
        reserved12: u2 = 0,
        /// CRC clock enable
        CRCEN: u1,
        padding: u19 = 0,
    }),
    /// APB peripheral clock enable register 1
    /// offset: 0x3c
    APBENR1: mmio.Mmio(packed struct(u32) {
        reserved21: u21 = 0,
        /// I2C clock enable
        I2CEN: u1,
        reserved27: u5 = 0,
        /// Debug support clock enable
        DBGEN: u1,
        /// Power interface clock enable
        PWREN: u1,
        reserved31: u2 = 0,
        /// LPTIM clock enable
        LPTIMEN: u1,
    }),
    /// APB peripheral clock enable register 2
    /// offset: 0x40
    APBENR2: mmio.Mmio(packed struct(u32) {
        /// SYSCFG, COMP and VREFBUF clock enable
        SYSCFGEN: u1,
        reserved11: u10 = 0,
        /// TIM1 timer clock enable
        TIM1EN: u1,
        /// SPI1 clock enable
        SPI1EN: u1,
        reserved14: u1 = 0,
        /// USART1 clock enable
        USART1EN: u1,
        reserved17: u2 = 0,
        /// TIM16 timer clock enable
        TIM16EN: u1,
        reserved20: u2 = 0,
        /// ADC clock enable
        ADCEN: u1,
        padding: u11 = 0,
    }),
    /// offset: 0x44
    reserved68: [16]u8,
    /// Peripherals independent clock configuration register
    /// offset: 0x54
    CCIPR: mmio.Mmio(packed struct(u32) {
        reserved18: u18 = 0,
        /// LPTIM1 clock source selection
        LPTIM1SEL: u2,
        padding: u12 = 0,
    }),
    /// offset: 0x58
    reserved88: [8]u8,
    /// Control/status register
    /// offset: 0x60
    CSR: mmio.Mmio(packed struct(u32) {
        /// LSI oscillator enable
        LSION: u1,
        /// LSI oscillator ready
        LSIRDY: u1,
        reserved23: u21 = 0,
        /// Remove reset flags
        RMVF: u1,
        reserved25: u1 = 0,
        /// Option byte loader reset flag
        OBLRSTF: u1,
        /// Pin reset flag
        PINRSTF: u1,
        /// BOR or POR/PDR flag
        PWRRSTF: u1,
        /// Software reset flag
        SFTRSTF: u1,
        /// Independent window watchdog reset flag
        IWDGRSTF: u1,
        padding: u2 = 0,
    }),
};
