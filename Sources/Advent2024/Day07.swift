//
//  Day07.swift
//  Advent of code 2024
//
//  Created by Iggy Drougge on 2024-12-07.
//

private extension Int {
    static func ||(lhs: Self, rhs: Self) -> Self {
        Int(String(lhs) + String(rhs))!
    }
}

public enum Day07: Day {
    public static func part1(_ input: Input) -> Int {
        input
            .lines
            .map {
                let testValue = try! /(\d+):/.firstMatch(in: $0)!.output.1
                let numbers = $0.matches(of: /\s(\d+)/).map { Int($0.output.1)! }
                return (Int(testValue)!, numbers)
            }
            .filter { testValue, numbers in
                calculate(numbers.first!, numbers.dropFirst(), testValue: testValue)
            }
            .map(\.0)
            .reduce(0, +)
    }
    
    private static func calculate(_ number: Int, _ numbers: ArraySlice<Int>, testValue: Int, concatenating: Bool = false) -> Bool {
        guard let next = numbers.first else { return number == testValue }
        func calcul(_ operation: (Int, Int) -> Int) -> Bool {
            calculate(operation(number, next), numbers.dropFirst(), testValue: testValue, concatenating: concatenating)
        }
        return switch true {
        case calcul(+): true
        case calcul(*): true
        case _ where !concatenating: false
        case calcul(||): true
        case _: false
        }
    }
    
    public static func part2(_ input: Input) -> Int {
        input
            .lines
            .map {
                let testValue = try! /(\d+):/.firstMatch(in: $0)!.output.1
                let numbers = $0.matches(of: /\s(\d+)/).map { Int($0.output.1)! }
                return (Int(testValue)!, numbers)
            }
            .filter { testValue, numbers in
                calculate(numbers.first!, numbers.dropFirst(), testValue: testValue, concatenating: true)
            }
            .map(\.0)
            .reduce(0, +)
    }
}
