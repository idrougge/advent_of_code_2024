//
//  Day03Tests.swift
//  Advent of code 2024
//
//  Created by Iggy Drougge on 2024-12-03.
//

import Testing
import Advent2024

struct Day03Tests {
    @Test func testPart1WithTestInput() throws {
        #expect(
            Day03.part1(
                        """
                        xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))
                        """
            ) == 161
        )
    }
    
    @Test func testPart1() throws {
        #expect(
            Day03.part1(try Input(named: "Day03")) == 187833789
        )
    }
    
    @Test func testPart2WithTestInput() throws {
        #expect(
            Day03.part2(
                        """
                        xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))
                        """
            ) == 48
        )
    }
    
    @Test func testPart2() throws {
        #expect(
            Day03.part2(try Input(named: "Day03")) == 94455185
            // 97728793 är för högt
        )
    }
}
