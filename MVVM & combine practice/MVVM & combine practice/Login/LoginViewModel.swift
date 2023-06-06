//
//  LoginViewModel.swift
//  MVVM & combine practice
//
//  Created by Luca Lago on 5/6/23.
//

import Foundation
import Combine

class LoginViewModel {
//    Creadas las distintas variables que la vista va a observar para efectuar sus cambios
    @Published var email = String()
    @Published var password = String()
    @Published var isEnabled = false
    @Published var showLoading = false
    @Published var errorMessage = String()
    @Published var userModel: User?
//    creamos una coleccion de tipo set (unicos y sin ordenacion) para almacenar las cancelaciones de los eventos. Es parte del lifecycle de los publishers en combine
//    Para informacion mas detallada sobre esto visitar: https://www.donnywals.com/what-exactly-is-a-combine-anycancellable/
    var cancellabes = Set<AnyCancellable>()
    
    let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
        formValidation()
    }
    
    func formValidation() {
//        Aqui evaluamos de forma simultanea nuestros publishers, imponemos una condicion ya que el sink solo se efectuará si el array de eventos que le llega no esta vacio. Fijamos el hilo de recepcion en el principal ya que es un cambio visual y queremos que el sistema priorice la tarea.
        Publishers.CombineLatest($email, $password)
            .filter { email, password in
                return email.count > 5 && password.count > 5}
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                self?.isEnabled = true
            }.store(in: &cancellabes)
    }
    
//    el wrapper de MainActor se usa para que todo el bloque funcional que lo acampaña se gestione en el hilo principal
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
