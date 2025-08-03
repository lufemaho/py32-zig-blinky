const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Analog to Digital Converter
pub const ADC = extern struct {
    /// ADC interrupt and status register
    /// offset: 0x00
    ISR: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// ADC group regular end of sampling flag
        EOSMP: u1,
        /// ADC group regular end of unitary conversion flag
        EOC: u1,
        /// ADC group regular end of sequence conversions flag
        EOSEQ: u1,
        /// ADC group regular overrun flag
        OVR: u1,
        reserved7: u2 = 0,
        /// ADC analog watchdog flag
        AWD: u1,
        padding: u24 = 0,
    }),
    /// ADC interrupt enable register
    /// offset: 0x04
    IER: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// ADC group regular end of sampling interrupt
        EOSMPIE: u1,
        /// ADC group regular end of unitary conversion interrupt
        EOCIE: u1,
        /// ADC group regular end of sequence conversions interrupt
        EOSEQIE: u1,
        /// ADC group regular overrun interrupt
        OVRIE: u1,
        reserved7: u2 = 0,
        /// ADC analog watchdog interrupt
        AWDIE: u1,
        padding: u24 = 0,
    }),
    /// ADC control register
    /// offset: 0x08
    CR: mmio.Mmio(packed struct(u32) {
        /// ADC enable
        ADEN: u1,
        reserved2: u1 = 0,
        /// ADC group regular conversion start
        ADSTART: u1,
        reserved4: u1 = 0,
        /// ADC group regular conversion stop
        ADSTP: u1,
        reserved31: u26 = 0,
        /// ADC group regular conversion calibration
        ADCAL: u1,
    }),
    /// ADC configuration register 1
    /// offset: 0x0c
    CFGR1: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Scan sequence direction
        SCANDIR: u1,
        /// ADC data resolution
        RESSEL: u2,
        /// ADC data alignement
        ALIGN: u1,
        /// ADC group regular external trigger source
        EXTSEL: u3,
        reserved10: u1 = 0,
        /// ADC group regular external trigger polarity
        EXTEN: u2,
        /// ADC group regular overrun configuration
        OVRMOD: u1,
        /// ADC group regular continuous conversion mode
        CONT: u1,
        /// Wait conversion mode
        WAIT: u1,
        reserved16: u1 = 0,
        /// ADC group regular sequencer discontinuous mode
        DISCEN: u1,
        reserved22: u5 = 0,
        /// ADC analog watchdog monitoring a single channel or all channels
        AWDSGL: u1,
        /// ADC analog watchdog enable on scope ADC group regular
        AWDEN: u1,
        reserved26: u2 = 0,
        /// ADC analog watchdog monitored channel selection
        AWDCH: u4,
        padding: u2 = 0,
    }),
    /// ADC configuration register 2
    /// offset: 0x10
    CFGR2: mmio.Mmio(packed struct(u32) {
        reserved28: u28 = 0,
        /// ADC clock mode
        CKMODE: u4,
    }),
    /// ADC sampling time register
    /// offset: 0x14
    SMPR: mmio.Mmio(packed struct(u32) {
        /// Sampling time selection
        SMP: u3,
        padding: u29 = 0,
    }),
    /// offset: 0x18
    reserved24: [8]u8,
    /// ADC analog watchdog 1 threshold register
    /// offset: 0x20
    TR: mmio.Mmio(packed struct(u32) {
        /// ADC analog watchdog threshold low
        LT: u12,
        reserved16: u4 = 0,
        /// ADC analog watchdog threshold high
        HT: u12,
        padding: u4 = 0,
    }),
    /// offset: 0x24
    reserved36: [4]u8,
    /// ADC group regular sequencer register
    /// offset: 0x28
    CHSELR: mmio.Mmio(packed struct(u32) {
        /// Channel-0 selection
        CHSEL0: u1,
        /// Channel-1 selection
        CHSEL1: u1,
        /// Channel-2 selection
        CHSEL2: u1,
        /// Channel-3 selection
        CHSEL3: u1,
        /// Channel-4 selection
        CHSEL4: u1,
        /// Channel-5 selection
        CHSEL5: u1,
        /// Channel-6 selection
        CHSEL6: u1,
        /// Channel-7 selection
        CHSEL7: u1,
        /// Channel-8 selection
        CHSEL8: u1,
        /// Channel-9 selection
        CHSEL9: u1,
        reserved11: u1 = 0,
        /// Channel-11 selection
        CHSEL11: u1,
        /// Channel-12 selection
        CHSEL12: u1,
        padding: u19 = 0,
    }),
    /// offset: 0x2c
    reserved44: [20]u8,
    /// ADC group regular data register
    /// offset: 0x40
    DR: mmio.Mmio(packed struct(u32) {
        /// ADC group regular conversion data
        DATA: u16,
        padding: u16 = 0,
    }),
    /// ADC calibration configuration and status register
    /// offset: 0x44
    CCSR: mmio.Mmio(packed struct(u32) {
        reserved11: u11 = 0,
        /// Calibration contents selection
        CALSEL: u1,
        /// Calibration sample time selection
        CALSMP: u2,
        reserved15: u1 = 0,
        /// Calibration factor selection
        CALSET: u1,
        reserved30: u14 = 0,
        /// Calibration fail flag
        CALFAIL: u1,
        /// Calibration flag
        CALON: u1,
    }),
    /// ADC calibration result register 1
    /// offset: 0x48
    CALRR1: mmio.Mmio(packed struct(u32) {
        /// C4 result
        CALC4OUT: u8,
        /// C5 result
        CALC5OUT: u8,
        /// offset result
        CALBOUT: u7,
        padding: u9 = 0,
    }),
    /// ADC calibration result register 2
    /// offset: 0x4c
    CALRR2: mmio.Mmio(packed struct(u32) {
        /// C0 result
        CALC0OUT: u8,
        /// C1 result
        CALC1OUT: u8,
        /// C2 result
        CALC2OUT: u8,
        /// C3 result
        CALC3OUT: u8,
    }),
    /// ADC calibration factor input register 1
    /// offset: 0x50
    CALFIR1: mmio.Mmio(packed struct(u32) {
        /// Calibration C4 factor input
        CALC4IO: u8,
        /// Calibration C5 factor input
        CALC5IO: u8,
        /// Calibration offset factor input
        CALBIO: u7,
        padding: u9 = 0,
    }),
    /// ADC calibration factor input register 2
    /// offset: 0x54
    CALFIR2: mmio.Mmio(packed struct(u32) {
        /// Calibration C0 factor input
        CALC0IO: u8,
        /// Calibration C1 factor input
        CALC1IO: u8,
        /// Calibration C2 factor input
        CALC2IO: u8,
        /// Calibration C3 factor input
        CALC3IO: u8,
    }),
    /// offset: 0x58
    reserved88: [688]u8,
    /// ADC common configuration register
    /// offset: 0x308
    CCR: mmio.Mmio(packed struct(u32) {
        reserved22: u22 = 0,
        /// VREFINT enable
        VREFEN: u1,
        /// Temperature sensor enable
        TSEN: u1,
        padding: u8 = 0,
    }),
};
