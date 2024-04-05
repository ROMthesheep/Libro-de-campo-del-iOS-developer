//
//  AccountListViewModel.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 5/4/24.
//

import Foundation

class AccountListViewModel: ObservableObject {
    
    @Published var accounts: [AccountViewModel] = []
    
    func getAllAccounts() {
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "jwt") else {
            print("ups")
            return
        }
        Webservice().getAllAccounts(token: token) { result in
            print("eyyy")
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.accounts = success.map(AccountViewModel.init)
                    print(success)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}


struct AccountViewModel {
    let id = UUID()
    let account: Account
    var name: String {
        account.name
    }
    var balance: Double {
        account.balance
    }
    
}
