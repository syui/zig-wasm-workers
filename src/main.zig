const std = @import("std");
const RndGen = std.rand.DefaultPrng;

pub fn main() anyerror!void {
    // setup allocator
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer std.debug.assert(!gpa.deinit());
    const allocator = gpa.allocator();

    // setup streams
    const stdout = std.io.getStdOut().writer();
    const in = std.io.getStdIn();
    var reader = std.io.bufferedReader(in.reader()).reader();
    var counter: u32 = 1;

    // random
    var rnd = RndGen.init(0);
    var some_random_num = rnd.random().int(i32);

    // read input line by line
    while (try reader.readUntilDelimiterOrEofAlloc(allocator, '\n', std.math.maxInt(usize))) |line| {
        defer allocator.free(line);
        try stdout.print("{d}\t{d}\t{s}\n", .{ counter, some_random_num, line });
        counter = counter + 1;
    }
}
