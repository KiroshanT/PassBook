//
//  Account.swift
//  PassBook
//
//  Created by Kiroshan Thayaparan on 8/31/22.
//

struct Account: Codable {
    let accounts: [Accounts]?
}

struct Accounts: Codable {
    let accountNumber: String
    let accountBsb: String
    let accountLabel: String
    let currentBalance: String
    let availableBalance: String
    let transactions: String
}
