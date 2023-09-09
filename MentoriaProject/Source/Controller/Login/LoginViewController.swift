//
//  LoginViewController.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 04/09/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var viewLogin: LoginView = {
        let view = LoginView()
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

