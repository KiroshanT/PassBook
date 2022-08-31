//
//  Extension.swift
//  PassBook
//
//  Created by Kiroshan Thayaparan on 8/31/22.
//
import Foundation

extension QuantumValue {
    var intValue: Int? {
        switch self {
        case .int(let value): return value
        case .string(let value): return Int(value)
        }
    }
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
    
    func getFormattedDate() -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        let showDate = inputFormatter.date(from: String(self.dropLast(6)))
        inputFormatter.dateFormat = "dd MMMM yyyy"
        var resultString = ""
        if showDate != nil {
            resultString = inputFormatter.string(from: showDate!)
        }
        print("dateAndTime ", resultString)
        
        return resultString
    }
    
    func toCurrencyFormat() -> String {
        if let intValue = Int(self){
            let numberFormatter = NumberFormatter()
            numberFormatter.locale = Locale.current
            numberFormatter.numberStyle = NumberFormatter.Style.currency
            return numberFormatter.string(from: NSNumber(value: intValue)) ?? ""
        }
        return ""
    }
}
