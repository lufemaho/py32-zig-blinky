const py32 = @import("py32f002axx");
const std = @import("std");

pub fn main() noreturn {
    // init gpio
    rcc.IOPENR.modify(.{ .GPIOAEN = 1 });
    GpioA.MODER.modify(.{ .MODE0 = 1 });

    // blinky loop
    while (true) {
        GpioA.BSRR.modify(.{ .BS0 = 1 });
        wait_approx_half_a_second();
        GpioA.BSRR.modify(.{ .BR0 = 1 });
        wait_approx_half_a_second();
    }
}

fn wait_approx_half_a_second() void {
    // In contrast to the manual the HSI clock seems to run at 16 MHz.
    const cycles_per_half_second = 8_000_000;
    // per loop iteration we do two nops, one increment, and one branch operation
    const cycles_per_iteration = 4;
    // we measured that toggling the output takes 4 cycles.
    const cycles_for_gpio_toggle = 4;
    const loop_iterations_per_half_second = cycles_per_half_second / cycles_per_iteration - cycles_for_gpio_toggle;
    for (0..loop_iterations_per_half_second) |_| {
        asm volatile ("nop");
        asm volatile ("nop");
    }
}

const GpioA = py32.peripherals.GPIOA;
const rcc = py32.peripherals.RCC;
