//
//  Day06Tests.swift
//  Advent of code 2024
//
//  Created by Iggy Drougge on 2024-12-06.
//

import Testing
import Advent2024

struct Day06Tests {
    @Test func testPart1WithTestInput() throws {
        #expect(
            Day06.part1(
                        """
                        ....#.....
                        .........#
                        ..........
                        ..#.......
                        .......#..
                        ..........
                        .#..^.....
                        ........#.
                        #.........
                        ......#...
                        """
            ) == 41
        )
    }
    
    @Test func testPart1() throws {
        #expect(
            Day06.part1(try Input(named: "Day06")) == 4988
        )
    }
    
    @Test func testPart2WithTestInput() throws {
        #expect(
            Day06.part2(
                        """
                        ....#.....
                        .........#
                        ..........
                        ..#.......
                        .......#..
                        ..........
                        .#..^.....
                        ........#.
                        #.........
                        ......#...
                        """
            ) == 6
        )
    }
    
    @Test func testPart2() throws {
        #expect(
            Day06.part2(try Input(named: "Day06")) != 1768
            // 1768 är för högt
        )
    }
}
