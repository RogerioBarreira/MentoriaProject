//
//  LoginViewController.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 04/09/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    var onSuccess: (() -> Void)?
    var onRegisterTap: (() -> Void)?
    
    lazy var viewLogin: LoginView = {
        let view = LoginView()
        view.onLogin = { [weak self] email, password in
            self?.setupRequest(email, password)
        }
        view.onRegister = { [weak self] in
            self?.nextRegister()
        }
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Entrar"
        self.viewLogin.setupTextField(delegate: self)
    }
    
    override func loadView() {
        self.view = viewLogin
    }
    
    func setupRequest(_ email: String, _ password: String) {
        let viewModel = LoginViewModel()
        viewModel.getUserFromApi(user: email, password: password) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(_):
                self.nextHome()
            case .failure(let error):
                self.showMessageError(title: "Error", message: error.localizedDescription)
            }
        }
    }
    
    private func showMessageError(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .destructive)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    private func nextHome() {
        let coordinator = Coordinator(navigationController: navigationController)
        coordinator.startHome()
    }
    
    private func nextRegister() {
        let coordinator = Coordinator(navigationController: navigationController)
        coordinator.startRegister()
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == viewLogin.textEmail {
            let maxLength = 25
            let currentText = viewLogin.textEmail.text ?? ""
            let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
            return newText.count <= maxLength
        } else if textField == viewLogin.textPassword {
            let maxLength = 25
            let currentText = viewLogin.textPassword.text ?? ""
            let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
            return newText.count <= maxLength
        }
        return true
    }
}

