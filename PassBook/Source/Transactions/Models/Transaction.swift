//
//  Transaction.swift
//  PassBook
//
//  Created by Kiroshan Thayaparan on 8/31/22.
//

import CoreFoundation
import Alamofire

struct Transaction: Codable {
    let accountNumber: String
    let transactions: [Transactions]?
}

struct Transactions: Codable {
    let transactionId: String?
    let date: String?
    let cbTransactionTypeCode: String?
    let description: String?
    let amount: QuantumValue
}

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

extension QuantumValue {
    var intValue: Int? {
        switch self {
        case .int(let value): return value
        case .string(let value): return Int(value)
        }
    }
}
