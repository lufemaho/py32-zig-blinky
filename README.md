# py32-zig-blinky

Basic blinky project for the PY3F002 using zig.

# Prerequisits
I used a dev board from [aliexpress](https://www.aliexpress.us/item/3256807946354940.html) for this project.
There are other solutions for each of the following tools, but for programming and debugging I used

- [pyOCD](https://pyocd.io/)(it comes with support for the P32F002 built in already),
- arm-none-eabi-gdb from the [arm compiler gnu toolchain](https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads), and
- the Raspberry Pi [debug probe](https://www.raspberrypi.com/documentation/microcontrollers/debug-probe.html)

For debugging you need to know how to use gdb.

# Usage
The following instructions assume zig, pyOCD, and arm-none-eabi-gdb are installed in a directory that is added to the PATH variable of your current environment.
Otherwise you may enter the full path to the executables.
The following steps are necessary to compile and run the program.

1. Connect a LED and with a suitable current limiting resistor to GPIO A0.
2. Connect the SWD interface of your debug probe with that of the PY32F002. 
2. Go the project folder in a terminal, then
3. Compile the program using `zig build` or `zig build --release=small`.
4. Start pyocd: `pyocd gdbserver --port 3333 --target py32f002xx5`
5. Start gdb in a second terminal (from the project as well): `arm-none-eabi-gdb zig-out/bin/py32_zig_blinky.elf`
6. In gdb enter `target remote localhost:3333`, `load`,`monitor reset halt`, and `continue`

You should now see your LED blinking.

To add a breakpoint in main you have to enter `b main.main`. This is due to how I set up the project at the moment. I might change it, so that the usual `b main` can be used.

This project was tested on a PY32F002 only, but should work on other PUYA controllers as well.

# Acknowledgements
I took some inspiration from https://github.com/jaydcarlsons/py32-template and https://github.com/sphaerophoria/pico-zig.

I used microzig's [regz](https://github.com/ZigEmbeddedGroup/microzig/tree/main/tools/regz) tool to generate the peripheral definitions and copied their mmio.zig,
but stripped all code that referenced microzig itself. I also used it to generate a interrupt vector table.
However, in both cases I had to do some manual changes, because the svd file from PUYA seems to have several errors.
This is microzig's license:


Copyright (c) Zig Embedded Group contributors

This software is provided 'as-is', without any express or implied warranty. In
no event will the authors be held liable for any damages arising from the use
of this software.

Permission is granted to anyone to use this software for any purpose, including
commercial applications, and to alter it and redistribute it freely, subject to
the following restrictions:

1. The origin of this software must not be misrepresented; you must not claim
   that you wrote the original software. If you use this software in a product,
   an acknowledgment in the product documentation would be appreciated but is
   not required.

2. Altered source versions must be plainly marked as such, and must not be
   misrepresented as being the original software.

3. This notice may not be removed or altered from any source distribution.
