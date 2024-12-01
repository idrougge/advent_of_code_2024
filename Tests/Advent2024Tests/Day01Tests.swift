//
//  Day01Tests.swift
//  Advent of code 2024
//
//  Created by Iggy Drougge on 2024-12-01.
//

import Testing
import Advent2024

struct Day01Tests {
    @Test func testPart1WithTestInput() throws {
        #expect(
            Day01.part1(
                        """
                        3   4
                        4   3
                        2   5
                        1   3
                        3   9
                        3   3
                        """
            ) == 11
        )
    }
    
    @Test func testPart1() throws {
        #expect(
            Day01.part1(try Input(named: "Day01")) == 3574690
        )
    }
    
    @Test func testPart2WithTestInput() throws {
        #expect(
            Day01.part2(
                        """
                        3   4
                        4   3
                        2   5
                        1   3
                        3   9
                        3   3
                        """
            ) == 31
        )
    }
    
    @Test func testPart2() throws {
        #expect(
            Day01.part2(try Input(named: "Day01")) == 22565391
        )
    }
}
