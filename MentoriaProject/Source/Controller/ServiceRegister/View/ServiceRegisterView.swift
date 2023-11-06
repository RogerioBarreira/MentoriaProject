//
//  ServiceRegisterView.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 26/10/23.
//

import Foundation
import UIKit
import DSM

class ServiceRegisterView: UIView {
    
    let labelTitle = CustomLabel(text: "REGISTRO", font: .systemFont(ofSize: 25, weight: .regular), textAlignment: .center, textColor: .white)
    
    let labelName = CustomLabel(text: "Nome do Serviço", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: .white)
    
    let textName: CustomTextField = {
        let text = CustomTextField(placeholder: "",
                                   textColor: .black,
                                   font: .systemFont(ofSize: 18, weight: .regular),
                                   autocapitalizationType: .none,
                                   isSecureTextEntry: false
        )
        text.setLeftPaddingPoints(8)
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(red: 81/255, green: 87/255, blue: 89/255, alpha: 1.0)]
        let attributedPlaceholder = NSAttributedString(string: "Digite nome do serviço", attributes: placeholderAttributes)
        text.attributedPlaceholder = attributedPlaceholder
        text.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        text.layer.cornerRadius = 8
        return text
    }()
    
    let labelDescription = CustomLabel(text: "Descrição", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: .white)
    
    let textDescription: CustomTextField = {
        let text = CustomTextField(placeholder: "",
                                   textColor: .black,
                                   font: .systemFont(ofSize: 18, weight: .regular),
                                   autocapitalizationType: .none,
                                   isSecureTextEntry: false
        )
        text.setLeftPaddingPoints(8)
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(red: 81/255, green: 87/255, blue: 89/255, alpha: 1.0)]
        let attributedPlaceholder = NSAttributedString(string: "Descrição do serviço", attributes: placeholderAttributes)
        text.attributedPlaceholder = attributedPlaceholder
        text.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        text.layer.cornerRadius = 8
        return text
    }()
    
    let labelDuration = CustomLabel(text: "Duração do serviço", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: .white)
    
    let textDuration: CustomTextField = {
        let text = CustomTextField(placeholder: "",
                                   textColor: .black,
                                   font: .systemFont(ofSize: 18, weight: .regular),
                                   autocapitalizationType: .none,
                                   isSecureTextEntry: false
        )
        text.setLeftPaddingPoints(8)
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(red: 81/255, green: 87/255, blue: 89/255, alpha: 1.0)]
        let attributedPlaceholder = NSAttributedString(string: "Duração do serviço", attributes: placeholderAttributes)
        text.attributedPlaceholder = attributedPlaceholder
        text.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        text.layer.cornerRadius = 8
        return text
    }()
    
    let labelHowMutch = CustomLabel(text: "Valor do serviço", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: .white)
    
    let textHowMutch: CustomTextField = {
        let text = CustomTextField(placeholder: "",
                                   textColor: .black,
                                   font: .systemFont(ofSize: 18, weight: .regular),
                                   autocapitalizationType: .none,
                                   isSecureTextEntry: false
        )
        text.setLeftPaddingPoints(8)
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(red: 81/255, green: 87/255, blue: 89/255, alpha: 1.0)]
        let attributedPlaceholder = NSAttributedString(string: "Valor do serviço", attributes: placeholderAttributes)
        text.attributedPlaceholder = attributedPlaceholder
        text.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        text.layer.cornerRadius = 8
        return text
    }()
    
    let buttonRegister: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Registrar Serviço", for: .normal)
        button.setTitleColor(UIColor(red: 58/255, green: 62/255, blue: 63/255, alpha: 1.0), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        button.backgroundColor = .white
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red: 58/255, green: 62/255, blue: 63/255, alpha: 1.0).cgColor
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }()
    
    let buttonClose: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .clear
        return button
    }()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 58/255, green: 62/255, blue: 63/255, alpha: 1.0)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubViews(
            labelTitle,
            buttonClose,
            labelName,
            textName,
            labelDescription,
            textDescription,
            labelDuration,
            textDuration,
            labelHowMutch,
            textHowMutch,
            buttonRegister
        )
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            labelTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            labelTitle.heightAnchor.constraint(equalToConstant: 40),
            
            buttonClose.centerYAnchor.constraint(equalTo: labelTitle.centerYAnchor),
            buttonClose.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            buttonClose.widthAnchor.constraint(equalToConstant: 50),
            buttonClose.heightAnchor.constraint(equalToConstant: 50),
            
            labelName.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 15),
            labelName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelName.widthAnchor.constraint(equalToConstant: 200),
            labelName.heightAnchor.constraint(equalToConstant: 40),
            
            textName.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 5),
            textName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textName.heightAnchor.constraint(equalToConstant: 40),
            
            labelDescription.topAnchor.constraint(equalTo: textName.bottomAnchor, constant: 20),
            labelDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            labelDescription.heightAnchor.constraint(equalToConstant: 40),
            
            textDescription.topAnchor.constraint(equalTo: labelDescription.bottomAnchor, constant: 5),
            textDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textDescription.heightAnchor.constraint(equalToConstant: 100),
            
            labelDuration.topAnchor.constraint(equalTo: textDescription.bottomAnchor, constant: 20),
            labelDuration.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelDuration.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            labelDuration.heightAnchor.constraint(equalToConstant: 40),
            
            textDuration.topAnchor.constraint(equalTo: labelDuration.bottomAnchor, constant: 5),
            textDuration.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textDuration.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textDuration.heightAnchor.constraint(equalToConstant: 40),
            
            labelHowMutch.topAnchor.constraint(equalTo: textDuration.bottomAnchor, constant: 20),
            labelHowMutch.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelHowMutch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            labelHowMutch.heightAnchor.constraint(equalToConstant: 40),
            
            textHowMutch.topAnchor.constraint(equalTo: labelHowMutch.bottomAnchor, constant: 5),
            textHowMutch.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textHowMutch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textHowMutch.heightAnchor.constraint(equalToConstant: 40),
            
            buttonRegister.topAnchor.constraint(equalTo: textHowMutch.bottomAnchor, constant: 30),
            buttonRegister.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            buttonRegister.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            buttonRegister.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
}
