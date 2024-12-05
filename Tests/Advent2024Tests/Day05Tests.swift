//
//  Day05Tests.swift
//  Advent of code 2024
//
//  Created by Iggy Drougge on 2024-12-05.
//

import Testing
import Advent2024

struct Day05Tests {
    @Test func testPart1WithTestInput() throws {
        #expect(
            Day05.part1(
                        """
                        47|53
                        97|13
                        97|61
                        97|47
                        75|29
                        61|13
                        75|53
                        29|13
                        97|29
                        53|29
                        61|53
                        97|53
                        61|29
                        47|13
                        75|47
                        97|75
                        47|61
                        75|61
                        47|29
                        75|13
                        53|13

                        75,47,61,53,29
                        97,61,53,29,13
                        75,29,13
                        75,97,47,61,53
                        61,13,29
                        97,13,75,29,47
                        """
            ) == 143
        )
    }
    
    @Test func testPart1() throws {
        #expect(
            Day05.part1(try Input(named: "Day05")) == 4957
        )
    }
    
    @Test func testPart2WithTestInput() throws {
        #expect(
            Day05.part2(
                        """
                        47|53
                        97|13
                        97|61
                        97|47
                        75|29
                        61|13
                        75|53
                        29|13
                        97|29
                        53|29
                        61|53
                        97|53
                        61|29
                        47|13
                        75|47
                        97|75
                        47|61
                        75|61
                        47|29
                        75|13
                        53|13

                        75,47,61,53,29
                        97,61,53,29,13
                        75,29,13
                        75,97,47,61,53
                        61,13,29
                        97,13,75,29,47
                        """
            ) == 123
        )
    }
    
    @Test func testPart2() throws {
        #expect(
            Day05.part2(try Input(named: "Day05")) == 6938
        )
    }
}
