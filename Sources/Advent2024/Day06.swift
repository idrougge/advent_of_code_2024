//
//  Day06.swift
//  Advent of code 2024
//
//  Created by Iggy Drougge on 2024-12-06.
//

private typealias Map = [[Bool]]

private struct Point: Hashable, CustomStringConvertible {
    var x, y: Int
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
    
    var description: String { "(\(x), \(y))" }
}

private enum CardinalDirection: String, CustomStringConvertible {
    case up = "↑"
    case down = "↓"
    case left = "←"
    case right = "→"
    
    var description: String {
        rawValue
    }
    
    var rotatedClockwise: Self {
        switch self {
        case .up: .right
        case .right: .down
        case .down: .left
        case .left: .up
        }
    }
}

private extension Map {
    subscript(point: Point) -> Bool {
        get { self[point.y][point.x] }
        set { self[point.y][point.x] = newValue }
    }
    
    func index(relativeTo index: Point, by direction: CardinalDirection) -> Point {
        switch direction {
        case .up:    Point(index.x, index.y - 1)
        case .down:  Point(index.x, index.y + 1)
        case .left:  Point(index.x - 1, index.y)
        case .right: Point(index.x + 1, index.y)
        }
    }
    
    subscript(index: Point, direction: CardinalDirection) -> Bool? {
        let index: Point = switch direction {
        case .up:    Point(index.x, index.y - 1)
        case .down:  Point(index.x, index.y + 1)
        case .left:  Point(index.x - 1, index.y)
        case .right: Point(index.x + 1, index.y)
        }
        guard indices ~= index.y, self[index.y].indices ~= index.x
        else { return nil }
        return self[index]
    }
    
}

public enum Day06: Day {
    private static func readMap(from input: Input) -> (Map, Point) {
        var startingPos: Point?
        let map: Map = input
            .lines
            .indexed()
            .map { row, line in
                Array(line).indexed().map { column, character in
                    // Obs: Side effect inside `map`!
                    if character == "^" { startingPos = Point(column, row) }
                    return switch character {
                    case "#": true
                    case _: false
                    }
                }
            }
        return (map, startingPos!)
    }

    private static func traceMovements(in map: Map, from position: Point) -> some Collection<Point> {
        var position = position
        var direction: CardinalDirection = .up
        var visited: Set<Point> = [position]
        while let ahead = map[position, direction] {
            defer { visited.insert(position) }
            if ahead { direction = direction.rotatedClockwise }
            position = map.index(relativeTo: position, by: direction)
        }
        return visited
    }

    public static func part1(_ input: Input) -> Int {
        let (map, pos) = readMap(from: input)
        return traceMovements(in: map, from: pos).count
    }
    
    private struct ObstacleEncounter: Hashable {
        let point: Point
        let direction: CardinalDirection
        init(_ point: Point, _ direction: CardinalDirection) {
            self.point = point
            self.direction = direction
        }
    }
    
    public static func part2(_ input: Input) -> Int {
        let (map, startingPos) = readMap(from: input)
        var direction: CardinalDirection = .up
        let visited = traceMovements(in: map, from: startingPos)
        var obstaclesEncountered = 0
        for possibleObstacleIndex in visited {
            var position = startingPos
            direction = .up
            var visitedObstacles: Set<ObstacleEncounter> = []
            while let ahead = map[position, direction] {
                let indexAhead = map.index(relativeTo: position, by: direction)
                if ahead || indexAhead == possibleObstacleIndex {
                    if !visitedObstacles.insert(.init(indexAhead, direction)).inserted {
                        obstaclesEncountered += 1
                        break
                    }
                    direction = direction.rotatedClockwise
                } else {
                    position = indexAhead
                }
            }
        }
        return obstaclesEncountered
    }
}
