//
//  Day04.swift
//  Advent of code 2024
//
//  Created by Iggy Drougge on 2024-12-04.
//

private typealias Point = (y: Int, x: Int)
private typealias Vector = (y: Int, x: Int)
private extension [[Character]] {
    subscript(point: Point) -> Character {
        get { self[point.y][point.x] }
    }
}

public enum Day04: Day {
    public static func part1(_ input: Input) -> Int {
        let map = input
            .lines
            .map(Array.init)
        let height = map.indices
        let width = map.first!.indices
        func projection(from point: Point, by offsets: Vector) -> [Point] {
            (0...3).map { nr in
                (point.y + (nr * offsets.y), point.x + (nr * offsets.x))
            }.filter { (y, x) in
                height ~= y && width ~= x
            }
        }
        func string(from point: Point, vector: Vector) -> String {
            String(projection(from: point, by: vector).map { map[$0] })
        }
        let xPoints = map.indexed().flatMap { row, line in
            line.indices
                .filter { line[$0] == "X" }
                .map { (y: row, x: $0) }
        }
        let vectors: [Vector] = [
            (y:  0, x: +1),
            (y:  0, x: -1),
            (y: +1, x:  0),
            (y: -1, x:  0),
            (y: +1, x: +1),
            (y: +1, x: -1),
            (y: -1, x: -1),
            (y: -1, x: +1),
        ]
        return xPoints.reduce(0) { count, point in
            vectors.count { vector in
                string(from: point, vector: vector) == "XMAS"
            } + count
        }
    }
    
    public static func part2(_ input: Input) -> Int {
        let map = input
            .lines
            .map(Array.init)
        let height = map.count
        let width = map.first!.count
        let points: [Point] = map.indexed().flatMap { row, line in
            line.indices
                .filter { line[$0] == "A" }
                .map { (y: row, x: $0) }
        }.filter { y, x in 1...(height - 2) ~= y && 1...(width - 2) ~= x }
        var found = 0
        for point in points {
            let corneringPoints: [Point] = [
                (point.y - 1, point.x - 1),
                (point.y - 1, point.x + 1),
                (point.y + 1, point.x - 1),
                (point.y + 1, point.x + 1),
            ]
            let corners = corneringPoints.map { map[$0] }
            if
                corners == ["M", "M",
                            "S", "S"] ||
                corners == ["S", "S",
                            "M", "M"] ||
                corners == ["M", "S",
                            "M", "S"] ||
                corners == ["S", "M",
                            "S", "M"]
            {
                found += 1
            }
        }
        return found
    }
}
