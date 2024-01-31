const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    _ = b.addModule("red_black_tree", .{ .source_file = .{ .path = "src/red_black_tree.zig" } });

    const step_tests = b.step("test", "Run unit tests");

    const compile_tests = b.addTest(.{
        .root_source_file = .{ .path = "src/red_black_tree.zig" },
        .target = target,
        .optimize = optimize,
    });

    const run_tests = b.addRunArtifact(compile_tests);
    step_tests.dependOn(&run_tests.step);
}
