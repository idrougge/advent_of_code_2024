//
//  Day02.swift
//  Advent of code 2024
//
//  Created by Iggy Drougge on 2024-12-02.
//

import Foundation
import Algorithms

public enum Day02: Day {
    public static func part1(_ input: Input) -> Int {
        input
            .lines
            .map {
                $0.components(separatedBy: .whitespaces)
                    .map { Int($0)! }
            }
            .filter { line in
                let signum = (line[1] - line[0]).signum()
                for pair in line.adjacentPairs() {
                    let diff = pair.1 - pair.0
                    if diff.signum() != signum {
                        return false
                    }
                    if !(1...3 ~= abs(diff)) { return false }
                }
                return true
            }
            .count
    }
    
    public static func part2(_ input: Input) -> Int {
        input
            .lines
            .map {
                $0.components(separatedBy: .whitespaces)
                    .map { Int($0)! }
            }
            .filter { line in
                let signum = line
                    .adjacentPairs()
                    .map { pair in (pair.1 - pair.0).signum() }
                    .reduce(0, +)
                    .signum()
                
                guard signum != 0 else {
                    return false
                }
                
                let diffs = line.adjacentPairs().map { pair in
                    pair.1 - pair.0
                }
                if diffs.allSatisfy({ $0.signum() == signum && 1...3 ~= abs($0) }) {
                    return true
                }
                
                for i in line.indices {
                    let numbers = line[..<i] + line[(i + 1)...]
                    if numbers.adjacentPairs().allSatisfy({ checkPair($0, signum) }) {
                        return true
                    }
                }
                return false
            }
            .count
    }
    
    static func checkPair(_ pair: (Int, Int), _ signum: Int) -> Bool {
        let diff = pair.1 - pair.0
        if diff.signum() != signum {
            return false
        }
        return 1...3 ~= abs(diff)
    }
}
