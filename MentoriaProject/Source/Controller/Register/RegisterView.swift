//
//  RegisterView.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 04/09/23.
//

import Foundation
import UIKit
import DSM

class RegisterView: UIView {
    
    var onSecurityKey: (() -> Void)?
    var onRegisterTap: ((_ email: String, _ password: String)-> Void)?
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
        text.setLeftPaddingPoints(8)
        text.textColor = .black
        text.font = .systemFont(ofSize: 18, weight: .regular)
        text.autocapitalizationType = .none
        text.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        text.layer.cornerRadius = 8
        text.clipsToBounds = true
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
               .foregroundColor: UIColor(red: 81/255, green: 87/255, blue: 89/255, alpha: 1.0)]
        let attributedPlaceholder = NSAttributedString(string: DSM.Constants.Keys.textEmailPlaceholder.value, attributes: placeholderAttributes)
           text.attributedPlaceholder = attributedPlaceholder
        return text
    }()
    
    let imageIconEmail: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.image = UIImage(systemName: DSM.Constants.Keys.imageIconEmail.value)
        image.tintColor = UIColor(red: 58/255, green: 62/255, blue: 63/255, alpha: 1.0)
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
        text.setLeftPaddingPoints(8)
        text.textColor = .black
        text.font = .systemFont(ofSize: 18, weight: .regular)
        text.autocapitalizationType = .none
        text.isSecureTextEntry = true
        text.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        text.layer.cornerRadius = 8
        text.clipsToBounds = true
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
               .foregroundColor: UIColor(red: 81/255, green: 87/255, blue: 89/255, alpha: 1.0)]
        let attributedPlaceholder = NSAttributedString(string: DSM.Constants.Keys.textPasswordPlaceholder.value, attributes: placeholderAttributes)
           text.attributedPlaceholder = attributedPlaceholder
        return text
    }()
    
    let imageIconPassword: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: DSM.Constants.Keys.imageIconPasswordClose.value), for: .normal)
        button.tintColor = UIColor(red: 58/255, green: 62/255, blue: 63/255, alpha: 1.0)
        button.addTarget(self, action: #selector(setupIconPassword), for: .touchUpInside)
        return button
    }()
    
    let labelConfirmePassword: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = DSM.Constants.Keys.labelConfirmePassword.value
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        return label
    }()
    
    let textConfirmePassword: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.setLeftPaddingPoints(8)
        text.textColor = .black
        text.font = .systemFont(ofSize: 18, weight: .regular)
        text.autocapitalizationType = .none
        text.isSecureTextEntry = true
        text.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        text.layer.cornerRadius = 8
        text.clipsToBounds = true
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
               .foregroundColor: UIColor(red: 81/255, green: 87/255, blue: 89/255, alpha: 1.0)]
        let attributedPlaceholder = NSAttributedString(string: DSM.Constants.Keys.textConfirmePassword.value, attributes: placeholderAttributes)
           text.attributedPlaceholder = attributedPlaceholder
        return text
    }()
    
    let imageIconConfirmPassword: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: DSM.Constants.Keys.imageIconPasswordClose.value), for: .normal)
        button.tintColor = UIColor(red: 58/255, green: 62/255, blue: 55/255, alpha: 1.0)
        button.addTarget(self, action: #selector(setupIconConfirmPassword), for: .touchUpInside)
        return button
    }()
    
    let buttonRegisterII: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(DSM.Constants.Keys.buttonRegisterII.value, for: .normal)
        button.setTitleColor(
            UIColor(red: 58/255, green: 62/255, blue: 63/255, alpha: 1.0),
            for: .normal
        )
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .semibold)
        button.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(setupRegisterTap), for: .touchUpInside)
        return button
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
            labelConfirmePassword,
            textConfirmePassword,
            imageIconConfirmPassword,
            buttonRegisterII,
            loading
        )
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
            imageIconPassword.heightAnchor.constraint(equalToConstant: 24.64),
            imageIconPassword.widthAnchor.constraint(equalToConstant: 32.03),
            
            labelConfirmePassword.topAnchor.constraint(equalTo: textPassword.bottomAnchor, constant: 24),
            labelConfirmePassword.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelConfirmePassword.widthAnchor.constraint(equalToConstant: 158),
            labelConfirmePassword.heightAnchor.constraint(equalToConstant: 21),
            
            textConfirmePassword.topAnchor.constraint(equalTo: labelConfirmePassword.bottomAnchor, constant: 16),
            textConfirmePassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textConfirmePassword.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textConfirmePassword.heightAnchor.constraint(equalToConstant: 48),
            
            imageIconConfirmPassword.centerYAnchor.constraint(equalTo: textConfirmePassword.centerYAnchor),
            imageIconConfirmPassword.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -26),
            imageIconConfirmPassword.heightAnchor.constraint(equalToConstant: 24.64),
            imageIconConfirmPassword.widthAnchor.constraint(equalToConstant: 32.03),
            
            buttonRegisterII.topAnchor.constraint(equalTo: textConfirmePassword.bottomAnchor, constant: 48),
            buttonRegisterII.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 43),
            buttonRegisterII.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -43),
            buttonRegisterII.heightAnchor.constraint(equalToConstant: 48),
            
            loading.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loading.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            loading.widthAnchor.constraint(equalToConstant: 70),
            loading.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func setupTextField(delegate: UITextFieldDelegate) {
        self.textEmail.delegate = delegate
        self.textPassword.delegate = delegate
        self.textConfirmePassword.delegate = delegate
    }
    
    @objc func setupIconPassword() {
        textPassword.isSecureTextEntry.toggle()
        
        if textPassword.isSecureTextEntry {
            imageIconPassword.setImage(UIImage(systemName: DSM.Constants.Keys.imageIconPasswordClose.value)?.withTintColor(UIColor(red: 58/255, green: 62/255, blue: 55/255, alpha: 1.0), renderingMode: .alwaysOriginal), for: .normal)
        } else {
            imageIconPassword.setImage(UIImage(systemName: DSM.Constants.Keys.imageIconOpen.value)?.withTintColor(UIColor(red: 58/255, green: 62/255, blue: 55/255, alpha: 1.0), renderingMode: .alwaysOriginal), for: .normal)
        }
    }
    
    @objc func setupIconConfirmPassword() {
        textConfirmePassword.isSecureTextEntry.toggle()

        if textConfirmePassword.isSecureTextEntry {
            imageIconConfirmPassword.setImage(UIImage(systemName: DSM.Constants.Keys.imageIconPasswordClose.value)?.withTintColor(UIColor(red: 58/255, green: 62/255, blue: 55/255, alpha: 1.0), renderingMode: .alwaysOriginal), for: .normal)
        } else {
            imageIconConfirmPassword.setImage(UIImage(systemName: DSM.Constants.Keys.imageIconOpen.value)?.withTintColor(UIColor(red: 58/255, green: 62/255, blue: 55/255, alpha: 1.0), renderingMode: .alwaysOriginal), for: .normal)
        }
    }
    
    @objc
    private func setupRegisterTap() {
        let viewModel = RegisterViewModel()
        
        var errorMessages: [String] = []
        
        if let email = textEmail.text,
           let password = textPassword.text,
            let confirmedPassword = textConfirmePassword.text {
            
            if viewModel.isValidEmail(email: email) && viewModel.isValidPassword(password: password) && password == confirmedPassword {
                self.onRegisterTap?(email, password)
            } else {
                if email.isEmpty {
                    errorMessages.append("Email esta vazio")
                }
                
                let regex = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
                if !NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email) {
                    errorMessages.append("o email é invalido, ex: email@email.com")
                }
                
                if password.isEmpty {
                    errorMessages.append("A senha não pode estar em branco.")
                }
                
                if password != confirmedPassword {
                    errorMessages.append("As senhas não conferem")
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
                    self.onRegisterTap?(email, password)
                } else {
                    let errorMessage = errorMessages.joined(separator: "\n")
                    self.onError?("OK", errorMessage)
                }
            }
        }
    }
}
