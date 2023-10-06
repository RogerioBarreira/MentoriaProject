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
    var onSWTap: ((_ sender: Bool) -> Void)?
    var onThouch: (()-> Void)?
    
    let viewModel = LoginViewModel()
    
    let loading = CustomLoading(color: .black,
                                backgroundColor: .lightGray,cornerRadius: 10,
                                borderWidth: 1,
                                borderColor: UIColor.white.cgColor,
                                clipsToBounds: true)
    
    let labelEmail = CustomLabel(text: DSM.Constants.Keys.labelEmail.value,
                                 font: .systemFont(ofSize: 18),
                                 textColor: UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0))
    
    let textEmail: CustomTextField = {
        let text = CustomTextField(placeholder: "",
                                   textColor: .black,
                                   font: .systemFont(ofSize: 18, weight: .regular),
                                   autocapitalizationType: .none,
                                   isSecureTextEntry: false
        )
        text.setLeftPaddingPoints(8)
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(red: 81/255, green: 87/255, blue: 89/255, alpha: 1.0)]
        let attributedPlaceholder = NSAttributedString(string: DSM.Constants.Keys.textEmailPlaceholder.value, attributes: placeholderAttributes)
        text.attributedPlaceholder = attributedPlaceholder
        text.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        return text
    }()
    
    
    let imageIconEmail: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.image = UIImage(systemName: DSM.Constants.Keys.imageIconEmail.value)
        image.tintColor = UIColor(red: 58/255, green: 62/255, blue: 55/255, alpha: 1.0)
        return image
    }()
    
    let labelPassword = CustomLabel(text: DSM.Constants.Keys.labelPassword.value,
                                    font: .systemFont(ofSize: 18),
                                    textColor: UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0))
    
    let textPassword: CustomTextField = {
        let text = CustomTextField(placeholder: "",
                                   textColor: .black,
                                   font: .systemFont(ofSize: 18, weight: .regular),
                                   autocapitalizationType: .none,
                                   isSecureTextEntry: true
        )
        text.setLeftPaddingPoints(8)
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(red: 81/255, green: 87/255, blue: 89/255, alpha: 1.0)]
        let attributedPlaceholder = NSAttributedString(string: DSM.Constants.Keys.textPasswordPlaceholder.value, attributes: placeholderAttributes)
        text.attributedPlaceholder = attributedPlaceholder
        text.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        return text
    }()
    
    let imageIconPassword: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: DSM.Constants.Keys.imageIconPasswordClose.value), for: .normal)
        button.tintColor = UIColor(red: 58/255, green: 62/255, blue: 55/255, alpha: 1.0)
        button.addTarget(self, action: #selector(setupPasswordTap), for: .touchUpInside)
        return button
    }()
    
    var swPassword: UISwitch = {
        let sw = UISwitch()
        sw.translatesAutoresizingMaskIntoConstraints = false
        sw.thumbTintColor = UIColor(red: 58/255, green: 62/255, blue: 55/255, alpha: 1.0)
        sw.onTintColor = .green
        sw.tintAdjustmentMode = .normal
        sw.layer.borderColor = CGColor(red: 58/255, green: 62/255, blue: 55/255, alpha: 1.0)
        sw.layer.borderWidth = 1
        sw.layer.backgroundColor = UIColor.white.cgColor
        sw.layer.cornerRadius = 16
        sw.clipsToBounds = true
        sw.addTarget(self, action: #selector(swTap(_:)), for: .valueChanged)
        return sw
    }()
    
    let swPasswordDescription = CustomLabel(text: DSM.Constants.Keys.swPasswordDescription.value,
                                            font: .systemFont(ofSize: 18),
                                            textColor: UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0))
    
    let buttonEnter: CustomButton = {
        let button = CustomButton(
            title: DSM.Constants.Keys.buttonEnter.value,
            fontType: .semiBold(size: 25),
            titleColor: UIColor(red: 58/255, green: 62/255, blue: 63/255, alpha: 1.0),
            backgroundColor: UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0),
            cornerRadius: 16, clipsToBounds: true
        )
        button.addTarget(self, action: #selector(onLoginTap), for: .touchUpInside)
        return button
    }()
    
    let buttonRegister: CustomButton = {
        let button = CustomButton(
            title: DSM.Constants.Keys.buttonRegister.value,
            fontType: .semiBold(size: 25),
            titleColor: UIColor(red: 58/255, green: 62/255, blue: 63/255, alpha: 1.0),
            backgroundColor: UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0),
            cornerRadius: 16,
            clipsToBounds: true
        )
        button.addTarget(self, action: #selector(onRegisterTap), for: .touchUpInside)
        return button
    }()
    
    let buttonThouchId: CustomButton = {
        let button = CustomButton(
            title: "",
            fontType: .semiBold(size: 25),
            titleColor: UIColor(red: 58/255, green: 62/255, blue: 63/255, alpha: 1.0),
            backgroundColor: UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0),
            cornerRadius: 35,
            clipsToBounds: true
        )
        button.addTarget(self, action: #selector(onThouchIdTap), for: .touchUpInside)
        button.tintColor = .gray
        return button
    }()
    
    let imageIconTouchId: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "touchid")
        image.tintColor = UIColor(red: 58/255, green: 62/255, blue: 55/255, alpha: 1.0)
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 58/255, green: 62/255, blue: 63/255, alpha: 1.0)
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
            buttonThouchId,
            loading
        )
        buttonThouchId.addSubview(imageIconTouchId)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            labelEmail.topAnchor.constraint(equalTo: self.topAnchor, constant: 144),
            labelEmail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelEmail.widthAnchor.constraint(equalToConstant: 70),
            labelEmail.heightAnchor.constraint(equalToConstant: 21),
            
            textEmail.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 16),
            textEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textEmail.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textEmail.heightAnchor.constraint(equalToConstant: 48),
            
            imageIconEmail.centerYAnchor.constraint(equalTo: textEmail.centerYAnchor),
            imageIconEmail.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -26),
            imageIconEmail.heightAnchor.constraint(equalToConstant: 20.47),
            imageIconEmail.widthAnchor.constraint(equalToConstant: 21.71),
            
            labelPassword.topAnchor.constraint(equalTo: textEmail.bottomAnchor, constant: 24),
            labelPassword.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelPassword.widthAnchor.constraint(equalToConstant: 70),
            labelPassword.heightAnchor.constraint(equalToConstant: 21),
            
            textPassword.topAnchor.constraint(equalTo: labelPassword.bottomAnchor, constant: 16),
            textPassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textPassword.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textPassword.heightAnchor.constraint(equalToConstant: 48),
            
            imageIconPassword.centerYAnchor.constraint(equalTo: textPassword.centerYAnchor),
            imageIconPassword.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -26),
            imageIconPassword.heightAnchor.constraint(equalToConstant: 24.67),
            imageIconPassword.widthAnchor.constraint(equalToConstant: 32.03),
            
            swPassword.topAnchor.constraint(equalTo: textPassword.bottomAnchor, constant: 16),
            swPassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            swPassword.widthAnchor.constraint(equalToConstant: 51),
            swPassword.heightAnchor.constraint(equalToConstant: 31),
            
            swPasswordDescription.centerYAnchor.constraint(equalTo: swPassword.centerYAnchor),
            swPasswordDescription.leadingAnchor.constraint(equalTo: swPassword.trailingAnchor, constant: 10),
            swPasswordDescription.widthAnchor.constraint(equalToConstant: 150),
            swPasswordDescription.heightAnchor.constraint(equalToConstant: 21),
            
            buttonEnter.topAnchor.constraint(equalTo: swPasswordDescription.bottomAnchor, constant: 48),
            buttonEnter.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 43),
            buttonEnter.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -43),
            buttonEnter.heightAnchor.constraint(equalToConstant: 48),
            
            buttonRegister.topAnchor.constraint(equalTo: buttonEnter.bottomAnchor, constant: 16),
            buttonRegister.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 43),
            buttonRegister.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -43),
            buttonRegister.heightAnchor.constraint(equalToConstant: 48),
            
            buttonThouchId.topAnchor.constraint(equalTo: buttonRegister.bottomAnchor, constant: 16),
            buttonThouchId.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonThouchId.widthAnchor.constraint(equalToConstant: 70),
            buttonThouchId.heightAnchor.constraint(equalToConstant: 70),
            
            
            imageIconTouchId.centerXAnchor.constraint(equalTo: buttonThouchId.centerXAnchor),
            imageIconTouchId.centerYAnchor.constraint(equalTo: buttonThouchId.centerYAnchor),
            imageIconTouchId.heightAnchor.constraint(equalToConstant: 60),
            imageIconTouchId.widthAnchor.constraint(equalToConstant: 60),
            
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
            imageIconPassword.setImage(UIImage(systemName: DSM.Constants.Keys.imageIconPasswordClose.value)?.withTintColor(UIColor(red: 58/255, green: 62/255, blue: 55/255, alpha: 1.0), renderingMode: .alwaysOriginal), for: .normal)
        } else {
            imageIconPassword.setImage(UIImage(systemName: DSM.Constants.Keys.imageIconOpen.value)?.withTintColor(UIColor(red: 58/255, green: 62/255, blue: 55/255, alpha: 1.0), renderingMode: .alwaysOriginal), for: .normal)
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
                    errorMessages.append("o email esta fora do padrão, ex: email@email.com")
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
                
                let lowercaseRegex = ".*[a-z]+.*"
                if !NSPredicate(format: "SELF MATCHES %@", lowercaseRegex).evaluate(with: password) {
                    errorMessages.append("A senha deve conter pelo menos uma letra minúscula.")
                }
                
                let digitRegex = ".*[0-9]+.*"
                if !NSPredicate(format: "SELF MATCHES %@", digitRegex).evaluate(with: password) {
                    errorMessages.append("A senha deve conter pelo menos um número.")
                }
                
                let specialCharRegex = ".*[\\W]+.*"
                if !NSPredicate(format: "SELF MATCHES %@", specialCharRegex).evaluate(with: password) {
                    errorMessages.append("A senha deve conter pelo menos um caractere especial.")
                }
                
                if errorMessages.isEmpty {
                    self.onLogin?(email, password)
                } else {
                    let errorMessage = errorMessages.joined(separator: "\n")
                    self.onError?("OK", errorMessage)
                }
            }
        }
    }
    
    @objc
    private func onThouchIdTap() {
        onThouch?()
    }
    
    
    @objc
    private func onRegisterTap() {
        onRegister?()
    }
    
    @objc
    func swTap(_ sender: Bool) {
        onSWTap?(sender)
    }
}
