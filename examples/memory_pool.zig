const std = @import("std");
const debug = std.debug;
const RedBlackTree = @import("red_black_tree").RedBlackTree;

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    const Rbt = RedBlackTree(usize, std.math.order);
    const Node = Rbt.Node;
    var rbt = Rbt{};
    var pool = std.heap.MemoryPool(Node).init(allocator);
    defer pool.deinit();

    const n: usize = 20;
    for (0..n) |_| {
        var e = while (true) {
            const e = rbt.getEntryFor(rand());
            if (e.node == null) break e;
        };
        e.set(try pool.create());
    }

    var it = rbt.inorderIterator();
    while (it.next()) |e| {
        debug.print("{} ", .{e.key});
    }
    debug.print("\n", .{});
}

fn rand() usize {
    const Xorshift = struct {
        var val: usize = 0;
    };
    if (Xorshift.val == 0) {
        var buf: [@sizeOf(usize)]u8 = undefined;
        std.os.getrandom(&buf) catch unreachable;
        Xorshift.val = std.mem.bytesToValue(usize, &buf);
    }
    const shifts = switch (@bitSizeOf(usize)) {
        64 => .{ 13, 7, 17 },
        32 => .{ 13, 17, 5 },
        16 => .{ 7, 9, 8 },
        else => @compileError("platform not supported"),
    };
    Xorshift.val ^= Xorshift.val >> shifts[0];
    Xorshift.val ^= Xorshift.val << shifts[1];
    Xorshift.val ^= Xorshift.val >> shifts[2];
    return Xorshift.val % (100 - 10) + 10;
}
