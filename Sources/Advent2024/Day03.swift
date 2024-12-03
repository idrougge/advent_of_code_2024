//
//  Day03.swift
//  Advent of code 2024
//
//  Created by Iggy Drougge on 2024-12-03.
//

import Foundation

public enum Day03: Day {
    public static func part1(_ input: Input) -> Int {
        input
            .characters
            .matches(of: /mul\((\d+),(\d+)\)/)
            .map { (Int($0.output.1)!, Int($0.output.2)!) }
            .map(*)
            .reduce(0, +)
    }
    
    public static func part2(_ input: Input) -> Int {
        var isEnabled = true
        return input
            .characters
            .matches(of: /(?<enabled>don't|do)|mul\((\d+),(\d+)\)/)
            .reduce(into: 0) { result, match in
                if match.output.enabled == "do" { isEnabled = true }
                if match.output.enabled == "don't" { isEnabled = false }
                if isEnabled, let lhs = match.output.2, let rhs = match.output.3 {
                    result += Int(lhs)! * Int(rhs)!
                }
            }
    }
}
