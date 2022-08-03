const std = @import("std");

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

    // read input line by line
    while (try reader.readUntilDelimiterOrEofAlloc(allocator, '\n', std.math.maxInt(usize))) |line| {
        defer allocator.free(line);
        try stdout.print("{d}\t{s}\n", .{counter, line});
        counter = counter + 1;
    }
}
