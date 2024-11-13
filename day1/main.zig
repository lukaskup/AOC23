// day 1 AOC 2023
const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    try sumCalibrationValues();
}
fn sumCalibrationValues() !void {
    const file = try std.fs.cwd().openFile("input.txt", .{});
    defer file.close();

    var buf_reader = std.io.bufferedReader(file.reader());
    var in_stream = buf_reader.reader();

    var buf: [1024]u8 = undefined;
    while (try in_stream.readUntilDelimiterOrEof(&buf, '\n')) |line| {
        for (line) |v| {
            //TODO get only numbers
            print("{c}\n", .{v});
        }
    }
}
