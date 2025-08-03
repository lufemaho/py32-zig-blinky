const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Universal synchronous asynchronous receiver transmitter
pub const USART1 = extern struct {
    /// Status register
    /// offset: 0x00
    SR: mmio.Mmio(packed struct(u32) {
        /// Parity error
        PE: u1,
        /// Framing error
        FE: u1,
        /// Noise error flag
        NE: u1,
        /// Overrun error
        ORE: u1,
        /// IDLE line detected
        IDLE: u1,
        /// Read data register not empty
        RXNE: u1,
        /// Transmission complete
        TC: u1,
        /// Transmit data register empty
        TXE: u1,
        reserved9: u1 = 0,
        /// CTS flag
        CTS: u1,
        /// Automate baudrate detection flag
        ABRF: u1,
        /// Automate baudrate detection error flag
        ABRE: u1,
        /// Automate baudrate detection requeset
        ABRRQ: u1,
        padding: u19 = 0,
    }),
    /// Data register
    /// offset: 0x04
    DR: mmio.Mmio(packed struct(u32) {
        /// Data value
        DR: u9,
        padding: u23 = 0,
    }),
    /// Baud rate register
    /// offset: 0x08
    BRR: mmio.Mmio(packed struct(u32) {
        /// fraction of USARTDIV
        DIV_Fraction: u4,
        /// mantissa of USARTDIV
        DIV_Mantissa: u12,
        padding: u16 = 0,
    }),
    /// Control register 1
    /// offset: 0x0c
    CR1: mmio.Mmio(packed struct(u32) {
        /// Send break
        SBK: u1,
        /// Receiver wakeup
        RWU: u1,
        /// Receiver enable
        RE: u1,
        /// Transmitter enable
        TE: u1,
        /// IDLE interrupt enable
        IDLEIE: u1,
        /// RXNE interrupt enable
        RXNEIE: u1,
        /// Transmission complete interrupt enable
        TCIE: u1,
        /// TXE interrupt enable
        TXEIE: u1,
        /// PE interrupt enable
        PEIE: u1,
        /// Parity selection
        PS: u1,
        /// Parity control enable
        PCE: u1,
        /// Wakeup method
        WAKE: u1,
        /// Word length
        M: u1,
        /// USART enable
        UE: u1,
        padding: u18 = 0,
    }),
    /// Control register 2
    /// offset: 0x10
    CR2: mmio.Mmio(packed struct(u32) {
        /// Address of the USART node
        ADD: u4,
        reserved8: u4 = 0,
        /// Last bit clock pulse
        LBCL: u1,
        /// Clock phase
        CPHA: u1,
        /// Clock polarity
        CPOL: u1,
        /// Clock enable
        CLKEN: u1,
        /// STOP bits
        STOP: u2,
        padding: u18 = 0,
    }),
    /// Control register 3
    /// offset: 0x14
    CR3: mmio.Mmio(packed struct(u32) {
        /// Error interrupt enable
        EIE: u1,
        /// IrDA mode enable
        IREN: u1,
        /// IrDA low-power
        IRLP: u1,
        /// Half-duplex selection
        HDSEL: u1,
        reserved8: u4 = 0,
        /// RTS enable
        RTSE: u1,
        /// CTS enable
        CTSE: u1,
        /// CTS interrupt enable
        CTSIE: u1,
        /// Oversampling mode
        OVER8: u1,
        /// Auto baudrate enable
        ABREN: u1,
        /// Auto baudrate mode
        ABRMOD: u2,
        padding: u17 = 0,
    }),
};
