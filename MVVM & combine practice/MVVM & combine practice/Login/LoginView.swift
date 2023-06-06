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
//        En primer lugar establecemos la conexion de los textfields(view) al LoginViewModel, pero lo vinculamos desde la variable local que tenemos, xq la visa posee al viewmodel. V owns VM
        emailTextField.textPublisher
            .assign(to: \LoginViewModel.email, on: loginViewModel)
            .store(in: &cancellabes)
        passwordTextField.textPublisher
            .assign(to: \LoginViewModel.password, on: loginViewModel)
            .store(in: &cancellabes)
//        Ahora asignamos los comportamientos de la vista a los distintos estados del VM, una vez mas, usamos la variable local del scope de la vista, todo queda dentro de su marco de responsabilidad
        loginViewModel.$isEnabled
            .assign(to: \.isEnabled, on: actionButton)
            .store(in: &cancellabes)
        
        loginViewModel.$showLoading
            .assign(to: \.configuration!.showsActivityIndicator, on: actionButton)
            .store(in: &cancellabes)
        
        loginViewModel.$errorMessage
            .assign(to: \.text!, on: errorLabel)
            .store(in: &cancellabes)
//        En este caso la difencia es que no estamos asignado, sino reaccionando a un cambio donde no nos importa el valor, sino el cambio o actualizacion del objeto observado.
        loginViewModel.$userModel.sink { [weak self] _ in
            let homeView = HomeView()
            self?.present(homeView, animated: true)
        }.store(in: &cancellabes)
    }
}

extension UITextField {
    var textPublisher: AnyPublisher<String, Never> {
//        nos creamos un publisher que va a estar pendiente de los cambios del texto y extrae del notification el objeto textfield y mapea su texto para que nos devuelva un string.
//        Como no puede fallar, definimos el error como Never
//        el eraseToAnyPublisher lo ponemos para exponer esta cadena de eventos a sus subcriptores con el tipo que nos conviene
        return NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .map { notification in return (notification.object as? UITextField)?.text ?? ""}
            .eraseToAnyPublisher()
    }
}
