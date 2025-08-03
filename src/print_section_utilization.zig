const std = @import("std");

pub fn main() !void {
    var backing_alloc = std.heap.DebugAllocator(.{}){};
    var arena = std.heap.ArenaAllocator.init(backing_alloc.allocator());
    defer arena.deinit();
    const alloc = arena.allocator();
    const args = try std.process.argsAlloc(alloc);
    defer std.process.argsFree(alloc, args);

    for (args[1..]) |path| {
        const file = if (path[0] == '/' or path[0] == '\\')
            std.fs.openFileAbsolute(path, .{ .mode = .read_only }) catch {
                std.debug.print("Could not open absolute path: {s}\n", .{path});
                continue;
            }
        else
            std.fs.cwd().openFile(path, .{ .mode = .read_only }) catch {
                std.debug.print("Could not open relative path: {s}\n", .{path});
                continue;
            };

        std.debug.print("Reading {s}\n", .{path});
        parse_elf(file, alloc) catch |e| {
            std.debug.print("Failed: {any}", .{e});
        };
    }
}

fn parse_elf(file: std.fs.File, alloc: std.mem.Allocator) !void {
    _ = alloc;
    const header = try std.elf.Header.read(file);
    var sec_iterator = std.elf.SectionHeaderIterator(std.fs.File){ .elf_header = header, .parse_source = file };
    var ram_total_size: u64 = 0;
    var flash_total_size: u64 = 0;

    while (try sec_iterator.next()) |section| {
        std.debug.print("Section at 0x{x} with size {} \n", .{ section.sh_addr, section.sh_size });
        if (section.sh_addr >= 0x08000000) {
            flash_total_size += section.sh_size;
        } else {
            flash_total_size += section.sh_size;
            ram_total_size += section.sh_size;
        }
    }
    std.debug.print("RAM utilization:   {} \n", .{ram_total_size});
    std.debug.print("FLASH utilization: {} \n", .{flash_total_size});
}
