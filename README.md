# zig-red-black-tree
A Red-black tree data structure library for Zig.

## Features
- A [Red-black tree](https://en.wikipedia.org/wiki/Red-black_tree) data structure with minimal abstractions.
- An alternative [binary search tree](https://en.wikipedia.org/wiki/Binary_search_tree) to [`std.Treap`](https://ziglang.org/documentation/master/std/#A;std:Treap).
- To maintain consistency, the API calls mirror those of `std.Treap`.


## Installation


To add `red_black_tree` to your `build.zig.zon`:

```
.{
    .name = "<YOUR PROGRAM>",
    .version = "0.0.0",
    .dependencies = .{
        .red_black_tree = .{
            .url = "https://github.com/rueyxian/zig-red-black-tree/archive/refs/tags/v0.0.1.tar.gz",
            .hash = "<CORRECT HASH WILL BE SUGGESTED>",
        },
    },
}
```

To add `red_black_tree` to your `build.zig`:

```zig
const dep_red_black_tree = b.dependency("red_black_tree", .{
    .target = target,
    .optimize = optimize,
});
exe.addModule("red_black_tree", dep_red_black_tree("red_black_tree"));
```

## Examples


To run an example:

```
$ zig build <EXAMPLE>
```
where `<EXAMPLE>` is one of:

- `run_basic`
- `run_memory_pool`


### Basic

```zig
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

```

Output:

```
21 24 25 29 30 31 34 39 42 46 47 49 50 54 55 60 76 82 83 94
```



