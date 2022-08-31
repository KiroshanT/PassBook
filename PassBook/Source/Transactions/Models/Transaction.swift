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
