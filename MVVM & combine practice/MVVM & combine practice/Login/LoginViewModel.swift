//
//  LoginViewModel.swift
//  MVVM & combine practice
//
//  Created by Luca Lago on 5/6/23.
//

import Foundation
import Combine

class LoginViewModel {
    @Published var email = String()
    @Published var password = String()
    @Published var isEnabled = false
    @Published var showLoading = false
    @Published var errorMessage = String()
    @Published var userModel: User?
    
    var cancellabes = Set<AnyCancellable>()
    
    let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
        formValidation()
    }
    
    func formValidation() {
        Publishers.CombineLatest($email, $password)
            .filter { email, password in
                return email.count > 5 && password.count > 5}
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                self?.isEnabled = true
            }.store(in: &cancellabes)
    }
    
    @MainActor
    func userlogin(withEmail email: String, password: String) {
        showLoading = true
        errorMessage = String()
        Task {
            do {
                userModel = try await apiClient.login(withEmail: email, password: password)
            } catch let err as NetworkError {
                print(err.localizedDescription)
                errorMessage = err.rawValue
            }
            showLoading = false
        }
    }
}
