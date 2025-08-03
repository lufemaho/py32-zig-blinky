const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Serial peripheral interface
pub const SPI1 = extern struct {
    /// control register 1
    /// offset: 0x00
    CR1: mmio.Mmio(packed struct(u32) {
        /// Clock phase
        CPHA: u1,
        /// Clock polarity
        CPOL: u1,
        /// Master selection
        MSTR: u1,
        /// Baud rate control
        BR: u3,
        /// SPI enable
        SPE: u1,
        /// Frame format
        LSBFIRST: u1,
        /// Internal slave selection
        SSI: u1,
        /// Software slave management
        SSM: u1,
        /// Receive only
        RXONLY: u1,
        reserved14: u3 = 0,
        /// Output enable in bidirectional mode
        BIDIOE: u1,
        /// Bidirectional data mode enable
        BIDIMODE: u1,
        padding: u16 = 0,
    }),
    /// control register 2
    /// offset: 0x04
    CR2: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// SS output enable
        SSOE: u1,
        reserved5: u2 = 0,
        /// Error interrupt enable
        ERRIE: u1,
        /// RX buffer not empty interrupt enable
        RXNEIE: u1,
        /// Tx buffer empty interrupt enable
        TXEIE: u1,
        reserved11: u3 = 0,
        /// Data length
        DS: u1,
        /// FIFO reception threshold
        FRXTH: u1,
        reserved15: u2 = 0,
        /// Slave fast mode enable
        SLVFM: u1,
        padding: u16 = 0,
    }),
    /// status register
    /// offset: 0x08
    SR: mmio.Mmio(packed struct(u32) {
        /// Receive buffer not empty
        RXNE: u1,
        /// Transmit buffer empty
        TXE: u1,
        reserved5: u3 = 0,
        /// Mode fault
        MODF: u1,
        /// Overrun flag
        OVR: u1,
        /// Busy flag
        BSY: u1,
        reserved9: u1 = 0,
        /// FIFO reception level
        FRLVL: u2,
        /// FIFO transmission level
        FTLVL: u2,
        padding: u19 = 0,
    }),
    /// data register
    /// offset: 0x0c
    DR: mmio.Mmio(packed struct(u32) {
        /// Data register
        DR: u16,
        padding: u16 = 0,
    }),
};
