//
//  LoginView.swift
//  MVVM & combine practice
//
//  Created by Luca Lago on 5/6/23.
//

import UIKit
import Combine

class LoginView: UIViewController {
    private let loginViewModel = LoginViewModel(apiClient: APIClient())
    
    var cancellabes = Set<AnyCancellable>()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Add Email"
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Add Password"
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    private lazy var actionButton: UIButton = {
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.title = "Login"
        buttonConfig.subtitle = "Di amigo y entra"
        buttonConfig.image = UIImage(systemName: "play.circle.fill")
        buttonConfig.imagePadding = 8
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { [weak self] action in
            self?.startLogin()
        }))
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = buttonConfig
        
        return button
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.text = String()
        label.textColor = .red
        label.font = .systemFont(ofSize: 15, weight: .bold, width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createBinding()
        
        [emailTextField,
         passwordTextField,
         actionButton,
         errorLabel]
            .forEach(view.addSubview)
        
        NSLayoutConstraint.activate([
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -20),
            
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            passwordTextField.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -20),
            
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorLabel.topAnchor.constraint(equalTo: actionButton.bottomAnchor, constant: 40)
        ])
    }
    
    private func startLogin() {
        loginViewModel.userlogin(withEmail: emailTextField.text?.lowercased() ?? "", password: passwordTextField.text?.lowercased() ?? "")
    }
    
    func createBinding() {
        emailTextField.textPublisher
            .assign(to: \LoginViewModel.email, on: loginViewModel)
            .store(in: &cancellabes)
        passwordTextField.textPublisher
            .assign(to: \LoginViewModel.password, on: loginViewModel)
            .store(in: &cancellabes)
        
        loginViewModel.$isEnabled
            .assign(to: \.isEnabled, on: actionButton)
            .store(in: &cancellabes)
        
        loginViewModel.$showLoading
            .assign(to: \.configuration!.showsActivityIndicator, on: actionButton)
            .store(in: &cancellabes)
        
        loginViewModel.$errorMessage
            .assign(to: \.text!, on: errorLabel)
            .store(in: &cancellabes)
        
        loginViewModel.$userModel.sink { [weak self] _ in
            let homeView = HomeView()
            self?.present(homeView, animated: true)
        }.store(in: &cancellabes)
    }
}

extension UITextField {
    var textPublisher: AnyPublisher<String, Never> {
        return NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .map { notification in return (notification.object as? UITextField)?.text ?? ""}
            .eraseToAnyPublisher()
    }
}
