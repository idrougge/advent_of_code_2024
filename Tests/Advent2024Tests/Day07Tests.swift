//
//  Day07Tests.swift
//  Advent of code 2024
//
//  Created by Iggy Drougge on 2024-12-07.
//

import Testing
import Advent2024

struct Day07Tests {
    @Test func testPart1WithTestInput() throws {
        #expect(
            Day07.part1(
                        """
                        190: 10 19
                        3267: 81 40 27
                        83: 17 5
                        156: 15 6
                        7290: 6 8 6 15
                        161011: 16 10 13
                        192: 17 8 14
                        21037: 9 7 18 13
                        292: 11 6 16 20
                        """
            ) == 3749
        )
    }
    
    @Test func testPart1() throws {
        #expect(
            Day07.part1(try Input(named: "Day07")) == 20665830408335
        )
    }
    
    @Test func testPart2WithTestInput() throws {
        #expect(
            Day07.part2(
                        """
                        190: 10 19
                        3267: 81 40 27
                        83: 17 5
                        156: 15 6
                        7290: 6 8 6 15
                        161011: 16 10 13
                        192: 17 8 14
                        21037: 9 7 18 13
                        292: 11 6 16 20
                        """
            ) == 11387
        )
    }
    
    @Test func testPart2() throws {
        #expect(
            Day07.part2(try Input(named: "Day07")) == 354060705047464
        )
    }
}
