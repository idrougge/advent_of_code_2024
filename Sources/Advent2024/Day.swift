//
//  Day.swift
//
//
//  Created by Iggy Drougge on 2023-11-30.
//

public protocol Day {
    associatedtype Input
    associatedtype Output
    static func part1(_ input: Input) -> Output
    static func part2(_ input: Input) -> Output
}

public extension Day {
    static func part1(_ input: Input) -> Output {
        fatalError("Not implemented.")
    }
    
    static func part2(_ input: Input) -> Output {
        fatalError("Not implemented.")
    }
}
