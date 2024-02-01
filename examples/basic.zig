const std = @import("std");
const debug = std.debug;
const RedBlackTree = @import("red_black_tree").RedBlackTree;

pub fn main() !void {
    const Rbt = RedBlackTree(u16, std.math.order);
    const Node = Rbt.Node;
    var rbt = Rbt{};
    var nodes = [_]Node{undefined} ** 20;

    @constCast(&rbt.getEntryFor(24)).set(&nodes[0]);
    @constCast(&rbt.getEntryFor(60)).set(&nodes[1]);
    @constCast(&rbt.getEntryFor(76)).set(&nodes[2]);
    @constCast(&rbt.getEntryFor(31)).set(&nodes[3]);
    @constCast(&rbt.getEntryFor(21)).set(&nodes[4]);
    @constCast(&rbt.getEntryFor(39)).set(&nodes[5]);
    @constCast(&rbt.getEntryFor(42)).set(&nodes[6]);
    @constCast(&rbt.getEntryFor(83)).set(&nodes[7]);
    @constCast(&rbt.getEntryFor(50)).set(&nodes[8]);
    @constCast(&rbt.getEntryFor(25)).set(&nodes[9]);
    @constCast(&rbt.getEntryFor(47)).set(&nodes[10]);
    @constCast(&rbt.getEntryFor(34)).set(&nodes[11]);
    @constCast(&rbt.getEntryFor(94)).set(&nodes[12]);
    @constCast(&rbt.getEntryFor(49)).set(&nodes[13]);
    @constCast(&rbt.getEntryFor(54)).set(&nodes[14]);
    @constCast(&rbt.getEntryFor(30)).set(&nodes[15]);
    @constCast(&rbt.getEntryFor(82)).set(&nodes[16]);
    @constCast(&rbt.getEntryFor(29)).set(&nodes[17]);
    @constCast(&rbt.getEntryFor(55)).set(&nodes[18]);
    @constCast(&rbt.getEntryFor(46)).set(&nodes[19]);

    var it = rbt.inorderIterator();
    while (it.next()) |e| {
        debug.print("{} ", .{e.key});
    }
    debug.print("\n", .{});
}
