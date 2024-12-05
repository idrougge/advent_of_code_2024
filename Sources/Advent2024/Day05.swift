//
//  Day05.swift
//  Advent of code 2024
//
//  Created by Iggy Drougge on 2024-12-05.
//

private typealias Page = Int

public enum Day05: Day {
    public static func part1(_ input: Input) -> Int {
        let input = input
            .lines
            .split(separator: "")
        let ordering = input[0]
            .map { $0.wholeMatch(of: /(\d+)\|(\d+)/)!.output }
            .map { (Page($0.1)!, Page($0.2)!) }
            .grouped(by: \.0)
            .mapValues { Set($0.map(\.1)) }
        let production = input[1].map { $0.components(separatedBy: ",").map { Page($0)! } }
        return production.filter { product in
            product
                .indexed()
                .allSatisfy { index, page in
                    ordering[page]?.intersection(product[...index]).isEmpty ?? true
                }
        }.reduce(into: 0) { sum, product in
            precondition(!product.count.isMultiple(of: 2))
            sum += product[product.count >> 1]
        }
    }
    
    public static func part2(_ input: Input) -> Int {
        let input = input
            .lines
            .split(separator: "")
        let ordering = try! input[0]
            .map(/(\d+)\|(\d+)/.wholeMatch)
            .map { (Page($0!.1)!, Page($0!.2)!) }
            .grouped(by: \.1)
            .mapValues { Set($0.map(\.0)) }
        let production = input[1].map { $0.components(separatedBy: ",").map { Page($0)! } }
        return production.reduce(into: 0) { sum, product in
            let sorted = product.sorted { next, previous in
                ordering[previous]?.contains(next) ?? false
            }
            if sorted != product {
                precondition(!sorted.count.isMultiple(of: 2))
                sum += sorted[sorted.count >> 1]
            }
        }
    }
}
