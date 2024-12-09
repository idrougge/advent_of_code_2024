//
//  Day08.swift
//  Advent of code 2024
//
//  Created by Iggy Drougge on 2024-12-08.
//

private struct Point: Hashable, CustomStringConvertible {
    var x, y: Int
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
    
    var description: String { "(\(x), \(y))" }

    static func -(lhs: Point, rhs: Point) -> Point {
        Point(
            lhs.x - rhs.x,
            lhs.y - rhs.y
        )
    }
}

public enum Day08: Day {
    private static func readMap(from input: Input) -> ([Character: [Point]], (Range<Int>, Range<Int>)) {
        let height = input.lines.indices
        let width = Array(input.lines.first!).indices
        let map = input
            .lines
            .indexed()
            .flatMap { row, line in
                Array(line).indexed().compactMap { column, character -> (point: Point, character: Character)? in
                    switch character {
                    case ".": nil
                    case _: (Point(column, row), character)
                    }
                }
            }
            .grouped(by: \.character)
            .mapValues { $0.map(\.point) }
        return (map, (width, height))
    }
    
    public static func part1(_ input: Input) -> Int {
        let (map, (width, height)) = readMap(from: input)
        return map.values
            .flatMap { points in
                points.permutations(ofCount: 2).map { pair in
                    pair[1] - (pair[0] - pair[1])
                }
            }
            .uniqued()
            .count { width ~= $0.x && height ~= $0.y }
    }
    
    public static func part2(_ input: Input) -> Int {
        let (map, (width, height)) = readMap(from: input)
        let antinodes = map.values.flatMap { points in
            points.permutations(ofCount: 2).flatMap { pair in
                sequence(first: pair[1]) { [diff = pair[0] - pair[1]] point in
                    let point = point - diff
                    guard width ~= point.x, height ~= point.y
                    else { return nil }
                    return point
                }
            }
        }
        return Array(antinodes.uniqued()).count
    }
}
