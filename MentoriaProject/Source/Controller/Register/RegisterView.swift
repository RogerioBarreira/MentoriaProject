//
//  RegisterView.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 04/09/23.
//

import Foundation
import UIKit

class RegisterView: UIView {
    
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
        text.setLeftPaddingPoints(15)
        text.textColor = .black
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
        text.setLeftPaddingPoints(15)
        text.textColor = .black
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
        return button
    }()
    
    let labelConfirmePassword: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Repita sua senha"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        return label
    }()
    
    let textConfirmePassword: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Digite sua senha"
        text.setLeftPaddingPoints(15)
        text.textColor = .black
        text.font = .systemFont(ofSize: 18, weight: .regular)
        text.autocapitalizationType = .none
        text.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        text.layer.cornerRadius = 7
        text.clipsToBounds = true
        return text
    }()
    
    let imageIconConfirmPassword: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "iconEye"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    let buttonRegister: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Casdastrar", for: .normal)
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
        self.backgroundColor = .systemGray4
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
            
            labelPassword.topAnchor.constraint(equalTo: textEmail.bottomAnchor, constant: 30),
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
            
            labelConfirmePassword.topAnchor.constraint(equalTo: textPassword.bottomAnchor, constant: 30),
            labelConfirmePassword.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelConfirmePassword.widthAnchor.constraint(equalToConstant: 70),
            labelConfirmePassword.heightAnchor.constraint(equalToConstant: 21),
            
            textConfirmePassword.topAnchor.constraint(equalTo: labelConfirmePassword.bottomAnchor, constant: 7),
            textConfirmePassword.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textConfirmePassword.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textConfirmePassword.heightAnchor.constraint(equalToConstant: 40),
            
            imageIconConfirmPassword.centerYAnchor.constraint(equalTo: textConfirmePassword.centerYAnchor),
            imageIconConfirmPassword.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -26),
            imageIconConfirmPassword.heightAnchor.constraint(equalToConstant: 20),
            imageIconConfirmPassword.widthAnchor.constraint(equalToConstant: 20),
            
            buttonRegister.topAnchor.constraint(equalTo: textConfirmePassword.bottomAnchor, constant: 50),
            buttonRegister.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonRegister.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            buttonRegister.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
}
