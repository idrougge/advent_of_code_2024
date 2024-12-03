//
//  Input.swift
//
//
//  Created by Iggy Drougge on 2023-12-01.
//

import Foundation

public struct Input {
    public let lines: [String]
    public let characters: String
}

extension Input: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.lines = value
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .components(separatedBy: .newlines)
        self.characters = value
    }
}
