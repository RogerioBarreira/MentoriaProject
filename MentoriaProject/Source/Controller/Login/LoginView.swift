//
//  LoginView.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 04/09/23.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    var onSecurityKey: (()-> Void)?
    
    let labelEmail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "E-mail"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        return label
    }()
    
    let textEmail: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Digite seu email"
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
        image.image = UIImage(named: "iconEmail")
        return image
    }()
    
    let labelPassword: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        return label
    }()
    
    let textPassword: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Digite sua senha"
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
        button.setImage(UIImage(named: "iconEye"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(setupPasswordTap), for: .touchUpInside)
        return button
    }()

    let swPassword: UISwitch = {
        let sw = UISwitch()
        sw.translatesAutoresizingMaskIntoConstraints = false
        sw.thumbTintColor = .systemGray2
        sw.onTintColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        return sw
    }()
    
    let swPasswordDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lembrar senha"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        return label
    }()
    
    let buttonEnter: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(
            UIColor(red: 58/255, green: 62/255, blue: 63/255, alpha: 1.0),
            for: .normal
        )
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        button.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        return button
    }()
    
    let buttonRegister: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Casdastrar-se", for: .normal)
        button.setTitleColor(
            UIColor(red: 58/255, green: 62/255, blue: 63/255, alpha: 1.0),
            for: .normal
        )
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        button.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
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
            buttonRegister
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
            imageIconPassword.widthAnchor.constraint(equalToConstant: 20),
            
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
        ])
    }
    
    func setupTextField(delegate: UITextFieldDelegate) {
        self.textEmail.delegate = delegate
        self.textPassword.delegate = delegate
    }
    
    @objc func setupPasswordTap() {
        textPassword.isSecureTextEntry.toggle()
        
        if textPassword.isSecureTextEntry {
            imageIconPassword.setImage(UIImage(systemName: "eye.slash")?.withTintColor(.red, renderingMode: .alwaysOriginal), for: .normal)
        } else {
            imageIconPassword.setImage(UIImage(named: "iconEye")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal), for: .normal)
        }
        self.onSecurityKey?()
    }
}
