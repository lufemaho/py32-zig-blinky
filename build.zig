//! Use `zig init --strip` next time to generate a project without comments.
const std = @import("std");
const Target = std.Target;
const Feature = std.Target.Cpu.Feature;


pub fn build(b: *std.Build) void {
    const target = b.resolveTargetQuery(.{
        .cpu_arch = .thumb,
        .cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_m0plus },
        .os_tag = .freestanding,
        .abi = .eabi,
        .glibc_version = null,
    });
    const optimize = b.standardOptimizeOption(.{});
    const mmio_mod = b.createModule(.{
        .root_source_file = b.path("src/py32f002axx/mmio.zig"),
    });
    const py32f002axx_mod = b.createModule(.{
        .root_source_file = b.path("src/py32f002axx/PY32F0xx_DFP.zig"),
        .imports = &.{.{ .name = "mmio", .module = mmio_mod }},
    });
    const main_mod = b.createModule(.{
        .root_source_file = b.path("src/main.zig"),
        .imports = &.{.{ .name = "py32f002axx", .module = py32f002axx_mod }},
    });
    const firmware_module = b.createModule(.{
        .root_source_file = b.path("src/interrupt.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = false,
        .link_libcpp = false,
        .strip = false,
        .single_threaded = true,
        .imports = &.{
            .{ .name = "main", .module = main_mod },
            .{ .name = "mmio", .module = mmio_mod },
            .{ .name = "py32f002axx", .module = py32f002axx_mod },
        },
    });
    const elf = b.addExecutable(.{
        .name = "first_try.elf",
        .root_module = firmware_module,
    });
    elf.bundle_ubsan_rt = false;
    elf.link_gc_sections = true;
    elf.link_data_sections = true;
    elf.link_function_sections = true;
    // elf.bundle_compiler_rt = false;
    elf.entry = .{ .symbol_name = "Reset_Handler" };
    elf.setLinkerScript(b.path("PY32F002A.ld"));
    // elf.setVerboseLink(true);
    b.installArtifact(elf);

    const obj = b.addObject(.{
        .name = "first_try",
        .root_module = firmware_module,
    });
    const install_obj = b.addInstallArtifact(
        obj,
        .{ .dest_dir = .{ .override = .prefix } },
    );
    b.getInstallStep().dependOn(&install_obj.step);
}
