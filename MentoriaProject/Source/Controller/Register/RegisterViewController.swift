//
//  RegisterViewController.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 04/09/23.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    lazy var viewRegister: RegisterView = {
        let view = RegisterView()
        view.onRegisterTap = { [weak self] email, password in
            self?.setupRequest(email, password)
        }
        view.onError = { [weak self]  title, error in
            self?.showMessageError(title: title, message: error)
        }
        return view
    }()
    
    let viewModel = RegisterViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cadastro"
        viewRegister.setupTextField(delegate: self)
    }
    
    override func loadView() {
        self.view = viewRegister
    }
    
    func setupRequest(_ email: String, _ password: String) {
        viewRegister.loading.startAnimating()
        viewModel.getUserFromApi(user: email, password: password) { [weak self] result in
            guard let self = self else { return }
            self.viewRegister.loading.stopAnimating()
            switch result {
            case .success(_):
                self.showMessageError(title: "Success", message: "Cadastro Realizado com Sucesso! ✅\n Volte ao Login")
            case .failure(let error):
                self.showMessageError(title: "Error", message: error.localizedDescription)
            }
        }
    }
    
    private func errorPasswordIncorret() {
        self.showMessageError(title: "Error", message: "Senha não confere")
    }
    
    private func showMessageError(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .destructive)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == viewRegister.textEmail {
            let maxLength = 25
            let currentText = viewRegister.textEmail.text ?? ""
            let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
            return newText.count <= maxLength
        } else if textField == viewRegister.textPassword {
            let maxLength = 25
            let currentText = viewRegister.textPassword.text ?? ""
            let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
            return newText.count <= maxLength
        } else if textField == viewRegister.textConfirmePassword {
            let maxLength = 25
            let currentText = viewRegister.textConfirmePassword.text ?? ""
            let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
            return newText.count <= maxLength
        }
        return true
    }
}
