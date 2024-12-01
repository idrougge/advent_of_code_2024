//
//  Input+extension.swift
//  Advent2024
//
//  Created by Iggy Drougge on 2024-12-01.
//

import struct Advent2024.Input
import class Foundation.Bundle

extension Input {
    init(named filename: String) throws {
        let url = Bundle.module.url(forResource: filename, withExtension: "txt", subdirectory: "Inputs")!
        let contents = try String(contentsOf: url)
        self.init(stringLiteral: contents)
    }
}
