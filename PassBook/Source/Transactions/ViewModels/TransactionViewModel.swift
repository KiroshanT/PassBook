//
//  TransactionViewModel.swift
//  PassBook
//
//  Created by Kiroshan Thayaparan on 8/31/22.
//

import Alamofire

class TransactionModel {
    
    var transaction: Transaction?
    
    func getTransaction(url: String, completion: @escaping (Transaction?, String?)-> Void)   {
        
        AF.request(url).response { response in
            debugPrint(response)
            
            switch response.result {
            case .success(let value):
                let transaction = try? JSONDecoder().decode(Transaction.self, from: value!)
                self.transaction = transaction
                completion(transaction, nil)
                
            case .failure(let error):
                print(error)
                completion(nil, error.errorDescription)
            }
        }
    }
}
