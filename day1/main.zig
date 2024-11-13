// day 1 AOC 2023
const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    try readFile();
}
fn readFile() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    const data = std.ArrayList(u8).init(allocator);
    const file = try std.fs.cwd().openFile("input.txt", .{});

    defer file.close();
    defer data.deinit();

    var buf_reader = std.io.bufferedReader(file.reader());
    var in_stream = buf_reader.reader();

    var buf: [1024]u8 = undefined;
    while (try in_stream.readUntilDelimiterOrEof(&buf, '\n')) |line| {
        print("{s}\n", .{line});
    }
}
