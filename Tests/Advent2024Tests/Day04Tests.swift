//
//  Day04Tests.swift
//  Advent of code 2024
//
//  Created by Iggy Drougge on 2024-12-04.
//

import Testing
import Advent2024

struct Day04Tests {
    @Test func testPart1WithTestInput() throws {
        #expect(
            Day04.part1(
                        """
                        MMMSXXMASM
                        MSAMXMSMSA
                        AMXSXMAAMM
                        MSAMASMSMX
                        XMASAMXAMM
                        XXAMMXXAMA
                        SMSMSASXSS
                        SAXAMASAAA
                        MAMMMXMMMM
                        MXMXAXMASX
                        """
            ) == 18
        )
    }
    
    @Test func testPart1WithCleanerTestInput() throws {
        #expect(
            Day04.part1(
                        """
                        ....XXMAS.
                        .SAMXMS...
                        ...S..A...
                        ..A.A.MS.X
                        XMASAMX.MM
                        X.....XA.A
                        S.S.S.S.SS
                        .A.A.A.A.A
                        ..M.M.M.MM
                        .X.X.XMASX
                        """
            ) == 18
        )
    }
    
    @Test func testPart1WithSingleDiagonal() throws {
        #expect(
            Day04.part1(
                        """
                        X.........
                        .M........
                        ..A.......
                        ...S......
                        ..........
                        ..........
                        ..........
                        """
            ) == 1
        )
    }
    
    @Test func testPart1WithMultipleDiagonals() throws {
        #expect(
            Day04.part1(
                        """
                        X..X......
                        .M..M.....
                        ..A..A....
                        ...S..S...
                        ..........
                        ..........
                        ..........
                        """
            ) == 2
        )
    }
    
    @Test func testPart1WithWrappingDiagonal() throws {
        #expect(
            Day04.part1(
                        """
                        ........X.
                        .........M
                        A.........
                        .S........
                        ..........
                        """
            ) == 0
        )
    }
        
    @Test func testPart1() throws {
        #expect(
            Day04.part1(try Input(named: "Day04")) == 2583
        )
    }
    
    @Test func testPart2WithTestInput() throws {
        #expect(
            Day04.part2(
                        """
                        MMMSXXMASM
                        MSAMXMSMSA
                        AMXSXMAAMM
                        MSAMASMSMX
                        XMASAMXAMM
                        XXAMMXXAMA
                        SMSMSASXSS
                        SAXAMASAAA
                        MAMMMXMMMM
                        MXMXAXMASX
                        """
            ) == 9
        )
    }
    
    @Test func testPart2WithCleanerTestInput() throws {
        #expect(
            Day04.part2(
                        """
                        .M.S......
                        ..A..MSMS.
                        .M.S.MAA..
                        ..A.ASMSM.
                        .M.S.M....
                        ..........
                        S.S.S.S.S.
                        .A.A.A.A..
                        M.M.M.M.M.
                        ..........
                        """
            ) == 9
        )
    }
    
    @Test func testPart2() throws {
        #expect(
            Day04.part2(try Input(named: "Day04")) == 1978
            // 2024
        )
    }
}
