//
//  Quantum.swift
//  PassBook
//
//  Created by Kiroshan Thayaparan on 8/31/22.
//

enum QuantumValue: Codable {
    case int(Int), string(String)
    init(from decoder: Decoder) throws {
        if let int = try? decoder.singleValueContainer().decode(Int.self) {
            self = .int(int)
            return
        }
        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        }
        throw AnyError.missingValue
    }
    enum AnyError:Error {
        case missingValue
    }
}
