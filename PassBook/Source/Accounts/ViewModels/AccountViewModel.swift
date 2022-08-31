//
//  AccountViewModel.swift
//  PassBook
//
//  Created by Kiroshan Thayaparan on 8/31/22.
//

import Alamofire

class AccountModel {
    
    var accounts: Account?
    
    func getAccounts(completion: @escaping (Account?, String?)-> Void)   {
        
        let URL = "\(Constants.ServerURLS.baseURL)/5abb1042350000580073a7ea"
        
        AF.request(URL).response { response in
            debugPrint(response)
            
            switch response.result {
            case .success(let value):
                let account = try? JSONDecoder().decode(Account.self, from: value!)
                self.accounts = account
                completion(account, nil)
                
            case .failure(let error):
                print(error)
                completion(nil, error.errorDescription)
            }
        }
    }
}
