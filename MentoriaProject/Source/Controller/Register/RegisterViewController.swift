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
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cadastrar"
        viewRegister.setupTextField(delegate: self)
    }
    
    override func loadView() {
        self.view = viewRegister
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
