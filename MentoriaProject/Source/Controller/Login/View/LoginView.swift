//
//  LoginView.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 04/09/23.
//

import Foundation
import UIKit
import DSM

class LoginView: UIView {
    
    var onLogin: ((_ email: String, _ password: String)-> Void)?
    var onRegister: (() -> Void)?
    var onSecurityKey: (()-> Void)?
    var onError: ((_ title: String, _ message: String) -> Void)?
    
    let loading: UIActivityIndicatorView = {
        let load = UIActivityIndicatorView()
        load.translatesAutoresizingMaskIntoConstraints = false
        load.frame.size = CGSize(width: 50, height: 50)
        let scale = CGAffineTransform(scaleX: 2, y: 2)
        load.transform = scale
        load.color = .black
        load.backgroundColor = .lightGray
        load.layer.cornerRadius = 10
        load.layer.borderWidth = 1
        load.layer.borderColor = UIColor.white.cgColor
        return load
    }()
    
    let labelEmail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = DSM.Constants.Keys.labelEmail.value
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        return label
    }()
    
    let textEmail: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = DSM.Constants.Keys.textEmailPlaceholder.value
        text.textColor = .black
        text.setLeftPaddingPoints(15)
        text.font = .systemFont(ofSize: 18, weight: .regular)
        text.autocapitalizationType = .none
        text.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        text.layer.cornerRadius = 7
        text.clipsToBounds = true
        return text
    }()
    
    let imageIconEmail: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.image = UIImage(named: DSM.Constants.Keys.imageIconEmail.value)
        return image
    }()
    
    let labelPassword: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = DSM.Constants.Keys.labelPassword.value
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        return label
    }()
    
    let textPassword: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = DSM.Constants.Keys.textPasswordPlaceholder.value
        text.isSecureTextEntry = true
        text.textColor = .black
        text.setLeftPaddingPoints(15)
        text.font = .systemFont(ofSize: 18, weight: .regular)
        text.autocapitalizationType = .none
        text.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        text.layer.cornerRadius = 7
        text.clipsToBounds = true
        return text
    }()
    
    let imageIconPassword: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: DSM.Constants.Keys.imageIconPasswordClose.value), for: .normal)
        button.tintColor = .systemGray
        button.addTarget(self, action: #selector(setupPasswordTap), for: .touchUpInside)
        return button
    }()
    
    let swPassword: UISwitch = {
        let sw = UISwitch()
        sw.translatesAutoresizingMaskIntoConstraints = false
        sw.thumbTintColor = .systemGray
        sw.onTintColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        return sw
    }()
    
    let swPasswordDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = DSM.Constants.Keys.swPasswordDescription.value
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        return label
    }()
    
    let buttonEnter: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(DSM.Constants.Keys.buttonEnter.value, for: .normal)
        button.setTitleColor(
            UIColor(red: 58/255, green: 62/255, blue: 63/255, alpha: 1.0),
            for: .normal
        )
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        button.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(onLoginTap), for: .touchUpInside)
        return button
    }()
    
    let buttonRegister: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(DSM.Constants.Keys.buttonRegister.value, for: .normal)
        button.setTitleColor(
            UIColor(red: 58/255, green: 62/255, blue: 63/255, alpha: 1.0),
            for: .normal
        )
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        button.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(onRegisterTap), for: .touchUpInside)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .darkGray
        addElementsVisual()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElementsVisual() {
        
        addSubViews(
            labelEmail,
            textEmail,
            imageIconEmail,
            labelPassword,
            textPassword,
            imageIconPassword,
            swPassword,
            swPasswordDescription,
            buttonEnter,
            buttonRegister,
            loading
        )
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            labelEmail.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 122),
            labelEmail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelEmail.widthAnchor.constraint(equalToConstant: 70),
            labelEmail.heightAnchor.constraint(equalToConstant: 21),
            
            textEmail.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 7),
            textEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textEmail.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textEmail.heightAnchor.constraint(equalToConstant: 40),
            
            imageIconEmail.centerYAnchor.constraint(equalTo: textEmail.centerYAnchor),
            imageIconEmail.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -26),
            imageIconEmail.heightAnchor.constraint(equalToConstant: 20),
            imageIconEmail.widthAnchor.constraint(equalToConstant: 20),
            
            labelPassword.topAnchor.constraint(equalTo: textEmail.bottomAnchor, constant: 20),
            labelPassword.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelPassword.widthAnchor.constraint(equalToConstant: 70),
            labelPassword.heightAnchor.constraint(equalToConstant: 21),
            
            textPassword.topAnchor.constraint(equalTo: labelPassword.bottomAnchor, constant: 7),
            textPassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textPassword.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textPassword.heightAnchor.constraint(equalToConstant: 40),
            
            imageIconPassword.centerYAnchor.constraint(equalTo: textPassword.centerYAnchor),
            imageIconPassword.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -26),
            imageIconPassword.heightAnchor.constraint(equalToConstant: 20),
            imageIconPassword.widthAnchor.constraint(equalToConstant: 25),
            
            swPassword.topAnchor.constraint(equalTo: textPassword.bottomAnchor, constant: 30),
            swPassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            swPassword.heightAnchor.constraint(equalToConstant: 30),
            
            swPasswordDescription.centerYAnchor.constraint(equalTo: swPassword.centerYAnchor),
            swPasswordDescription.leadingAnchor.constraint(equalTo: swPassword.trailingAnchor, constant: 10),
            swPasswordDescription.widthAnchor.constraint(equalToConstant: 150),
            swPasswordDescription.heightAnchor.constraint(equalToConstant: 21),
            
            buttonEnter.topAnchor.constraint(equalTo: swPasswordDescription.bottomAnchor, constant: 40),
            buttonEnter.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            buttonEnter.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            buttonEnter.heightAnchor.constraint(equalToConstant: 48),
            
            buttonRegister.topAnchor.constraint(equalTo: buttonEnter.bottomAnchor, constant: 10),
            buttonRegister.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonRegister.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            buttonRegister.heightAnchor.constraint(equalToConstant: 48),
            
            loading.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loading.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            loading.widthAnchor.constraint(equalToConstant: 70),
            loading.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func setupTextField(delegate: UITextFieldDelegate) {
        self.textEmail.delegate = delegate
        self.textPassword.delegate = delegate
    }
    
    @objc func setupPasswordTap() {
        textPassword.isSecureTextEntry.toggle()
        
        if textPassword.isSecureTextEntry {
            imageIconPassword.setImage(UIImage(systemName: DSM.Constants.Keys.imageIconPasswordClose.value)?.withTintColor(.systemGray, renderingMode: .alwaysOriginal), for: .normal)
        } else {
            imageIconPassword.setImage(UIImage(named: DSM.Constants.Keys.imageIconOpen.value)?.withTintColor(.systemGray, renderingMode: .alwaysOriginal), for: .normal)
        }
        self.onSecurityKey?()
    }
    
    @objc
    private func onLoginTap() {
        let viewModel = LoginViewModel()
        var errorMessages: [String] = []
        
        if let email = textEmail.text,
           let password = textPassword.text {
            if viewModel.isValidEmail(email: email) && viewModel.isValidPassword(password: password) {
                self.onLogin?(email, password)
            } else {
                if email.isEmpty {
                    errorMessages.append("Digite seu email")
                }
                
                let regex = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
                if !NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email) {
                    errorMessages.append("o email é invalido, ex: email@email.com")
                }
                
                if password.isEmpty {
                    errorMessages.append("A senha não pode estar em branco.")
                }
                
                if password.count < 6 {
                    errorMessages.append("A senha deve ter pelo menos 6 caracteres.")
                }
                
                let uppercaseRegex = ".*[A-Z]+.*"
                if !NSPredicate(format: "SELF MATCHES %@", uppercaseRegex).evaluate(with: password) {
                    errorMessages.append("A senha deve conter pelo menos uma letra maiúscula.")
                }
                
                let numberOrSpecialCharRegex = ".*[0-9\\W]+.*"
                if !NSPredicate(format: "SELF MATCHES %@", numberOrSpecialCharRegex).evaluate(with: password) {
                    errorMessages.append("A senha deve conter pelo menos um número ou caractere especial.")
                }
            }
            
            if errorMessages.isEmpty {
                self.onLogin?(email, password)
            } else {
                let errorMessage = errorMessages.joined(separator: "\n")
                self.onError?("OK", errorMessage)
            }
        }
    }
    
    @objc
    private func onRegisterTap() {
        onRegister?()
    }
}
