// day 1 AOC 2023
const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    const calibrationValue = try getCalibrationValue();
    print("calibration value {}\n", .{calibrationValue});
}

fn getCalibrationValue() !u32 {
    const file = try std.fs.cwd().openFile("input.txt", .{});
    defer file.close();

    var buf_reader = std.io.bufferedReader(file.reader());
    var in_stream = buf_reader.reader();

    var buf: [1024]u8 = undefined;
    var sum: u32 = 0;

    var map = std.StringHashMap(*const [1:0]u8).init(std.heap.page_allocator);
    try map.put("one", "1");
    try map.put("two", "2");
    try map.put("three", "3");
    try map.put("four", "4");
    try map.put("five", "5");
    try map.put("six", "6");
    try map.put("seven", "7");
    try map.put("eight", "8");
    try map.put("nine", "9");

    while (try in_stream.readUntilDelimiterOrEof(&buf, '\n')) |line| {
        var digits = std.ArrayList(u8).init(std.heap.page_allocator);
        defer digits.deinit();
        // 9eight3 - example input value

        for (line) |c| {
            if (c >= '0' and c <= '9') {
                digits.append(c) catch |e| {
                    print("{}", .{e});
                };
            }
        }
        const first_digit = digits.items[0] - '0';
        const last_digit = digits.items[digits.items.len - 1] - '0';

        sum += first_digit * 10 + last_digit;
    }
    // 37060
    return sum;
}

fn replace_string(str: []const u8, map: std.StringHashMap(*const [1:0]u8)) void {
    _ = str; // autofix
    // iterate over str
    // save char to buffer
    // check if buffer exists in map keys
    //lh5jzqxeight84
    var iterator = map.keyIterator();
    while (iterator.next()) |key| {
        const val = map.get(key.*).?[0] - '0';
        print("{s} -> {}\n", .{ key.*, val });
    }

    // [][]const u8
    // _ = str; // autofix
}

test {
    var map = std.StringHashMap(*const [1:0]u8).init(std.heap.page_allocator);
    try map.put("one", "1");
    try map.put("two", "2");
    try map.put("three", "3");
    try map.put("four", "4");
    try map.put("five", "5");
    try map.put("six", "6");
    try map.put("seven", "7");
    try map.put("eight", "8");
    try map.put("nine", "9");

    replace_string("9eight3", map);
}
