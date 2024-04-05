//
//  LoginViewModel.swift
//  SwiftUI Pills
//
//  Created by RomTheSheep on 4/4/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    var userName: String = ""
    var password: String = ""
    @Published var loggedUsername = ""
    
    func login() {
        let defaults = UserDefaults.standard
        Webservice().login(body: LoginRequestBody(username: userName, password: password)) { result in
            switch result {
            case .success(let success):
                defaults.setValue(success, forKey: "jwt")
                DispatchQueue.main.async {
                    self.loggedUsername = self.userName
                }
                print(success)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
