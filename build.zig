const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();
    const exe = b.addExecutable("zig-wasm-workers", "src/main.zig");
    exe.setTarget(target);
    exe.setBuildMode(mode);
    exe.install();
}
