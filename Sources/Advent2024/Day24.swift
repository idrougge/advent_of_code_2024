//
//  Day24.swift
//  Advent of code 2024
//
//  Created by Iggy Drougge on 2024-12-26.
//

private enum Function: String {
    case and = "AND"
    case or  = "OR"
    case xor = "XOR"
}

private struct Gate: Hashable {
    let function: Function
    let inputs: (String, String)
    let output: String
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.function == rhs.function &&
        lhs.inputs.0 == rhs.inputs.0 &&
        lhs.inputs.1 == rhs.inputs.1 &&
        lhs.output == rhs.output
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(function)
        hasher.combine(inputs.0)
        hasher.combine(inputs.1)
        hasher.combine(output)
    }
}

extension Gate: CustomStringConvertible {
    var description: String { "\(inputs.0) \(function.rawValue) \(inputs.1) -> \(output)" }
}

public enum Day24: Day {
    public static func part1(_ input: Input) -> Int {
        let input = input
            .lines
            .split(separator: "")
        let inputs: [(String, Bool)] = input[0]
            .map { try! /(.+): ([01])/.wholeMatch(in: $0)!.output }
            .map { (String($0.1), $0.2 == "1") }
        let connections: [Gate] = input[1]
            .map { (line: String) -> Gate in
                let match = try! /(.+) (XOR|OR|AND) (.+) -> (.+)/.wholeMatch(in: line)!.output
                return Gate(function: Function(rawValue: String(match.2))!, inputs: (String(match.1), String(match.3)), output: String(match.4))
            }
        var outputs = [String: Bool](uniqueKeysWithValues: inputs)
        var gates: Set<Gate> = Set(connections)
        while !gates.isEmpty {
            for gate in gates {
                if run(gate: gate, outputs: &outputs) {
                    gates.remove(gate)
                }
            }
        }
        let number = outputs
            .filter { $0.key.starts(with: "z") }
            .keys
            .sorted()
            .reversed()
            .reduce(0) { acc, key in
                acc << 1 + (outputs[key]! ? 1 : 0)
            }
        return number
    }
    
    private static func run(gate: Gate, outputs: inout [String: Bool]) -> Bool {
        guard
            let in1 = outputs[gate.inputs.0],
            let in2 = outputs[gate.inputs.1]
        else { return false }
        let value = switch gate.function {
        case .and: in1 && in2
        case .or: in1 || in2
        case .xor: in1 != in2
        }
        outputs[gate.output] = value
        return true
    }
    
    public static func part2(_ input: Input) -> Int {
        return -1
    }
}
