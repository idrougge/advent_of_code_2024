//
//  Day02Tests.swift
//  Advent of code 2024
//
//  Created by Iggy Drougge on 2024-12-02.
//

import Testing
import Advent2024

struct Day02Tests {
    @Test func testPart1WithTestInput() throws {
        #expect(
            Day02.part1(
                        """
                        7 6 4 2 1
                        1 2 7 8 9
                        9 7 6 2 1
                        1 3 2 4 5
                        8 6 4 4 1
                        1 3 6 7 9
                        """
            ) == 2
        )
    }
    
    @Test func testPart1() throws {
        #expect(
            Day02.part1(try Input(named: "Day02")) == 279
        )
    }
    
    @Test func testPart2WithTestInput() throws {
        #expect(
            Day02.part2(
                        """
                        7 6 4 2 1
                        1 2 7 8 9
                        9 7 6 2 1
                        1 3 2 4 5
                        8 6 4 4 1
                        1 3 6 7 9
                        """
            ) == 4
        )
    }
    
    @Test func testPart2WithTrickyLine() throws {
        #expect(
            Day02.part2("8 6 4 4 1") == 1
        )
    }
    
    @Test func testPart2WithTrickyLine1() throws {
        #expect(
            Day02.part2("71 73 74 76 78 80 77") == 1
        )
    }
    
    @Test func testPart2WithTrickyLine2() throws {
        #expect(
            Day02.part2("55 52 53 54 56 57") == 1
        )
    }
    
    @Test func testPart2WithTrickyLine3() throws {
        #expect(
            Day02.part2("37 40 43 46 50") == 1
        )
    }
    
    @Test func testPart2WithTrickyLine4() throws {
        #expect(
            Day02.part2("4 5 2 4 5 6") == 0
        )
    }
    
    @Test func testPart2WithTrickyLine5() throws {
        #expect(
            Day02.part2("32 30 28 25 22 19 12") == 1
        )
    }
    
    @Test func testPart2WithTrickyLine6() throws {
        #expect(
            Day02.part2("53 54 56 58 59 56 54") == 0
        )
    }
    
    @Test func testPart2WithTrickyLine7() throws {
        #expect(
            Day02.part2("78 75 74 75 73") == 1
        )
    }
    
    @Test func testPart2WithTrickyLine8() throws {
        #expect(
            Day02.part2("26 24 22 21 19 21 18 17") == 1
        )
    }
    
    @Test func testPart2() throws {
        #expect(
            Day02.part2(try Input(named: "Day02")) == 343
            // 300 för lågt
            // 383 för högt
            // 354 för högt
            // 311 stämmer inte heller
            // 327 stämmer inte heller
            // 332 stämmer inte heller
            // 337 stämmer inte heller
            // 345 stämmer inte heller
            // 350 stämmer inte heller
        )
    }
}
