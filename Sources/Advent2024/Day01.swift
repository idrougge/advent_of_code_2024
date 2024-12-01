//
//  Day01.swift
//  Advent of code 2024
//
//  Created by Iggy Drougge on 2024-12-01.
//

import Foundation

public enum Day01: Day {
    public static func part1(_ input: Input) -> Int {
        var output = input
            .lines
            .map {
                let numbers = try! /(\d+)\s+(\d+)/.wholeMatch(in: $0)!.output
                return (numbers.1, numbers.2)
            }
            .map { (Int($0.0)!, Int($0.1)!) }
            .reduce(into: ([Int](), [Int]())) { lists, pair in
                lists.0.append(pair.0)
                lists.1.append(pair.1)
            }
        output.0.sort()
        output.1.sort()
        return zip(output.0, output.1).reduce(0) { result, pair in
            result + abs(pair.0 - pair.1)
        }
    }
    
    public static func part2(_ input: Input) -> Int {
        let (numbers, occurences) = input
            .lines
            .map {
                let numbers = try! /(\d+)\s+(\d+)/.wholeMatch(in: $0)!.output
                return (numbers.1, numbers.2)
            }
            .map { (Int($0.0)!, Int($0.1)!) }
            .reduce(into: ([Int](), [Int: Int]())) { result, pair in
                result.0.append(pair.0)
                result.1[pair.1, default: 0] += 1
            }
        
        return numbers.reduce(0) { sum, nr in
            sum + occurences[nr, default: 0] * nr
        }
    }
}
