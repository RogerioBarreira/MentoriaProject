//
//  EditProfileStepOneView.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 06/10/23.
//

import Foundation
import UIKit
import DSM

class EditProfileStepOneView: UIView {
    
    var onTapContinues: (()-> Void)?
    var onError: ((_ title: String, _ message: String) -> Void)?
    
    let myScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let labelName = CustomLabel(text: "Nome Completo", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: .white)
    
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
        let attributedPlaceholder = NSAttributedString(string: "", attributes: placeholderAttributes)
        text.attributedPlaceholder = attributedPlaceholder
        text.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        text.layer.cornerRadius = 8
        return text
    }()
    
    let labelCPF = CustomLabel(text: "CPF", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: .white)
    
    let textCPF: CustomTextField = {
        let text = CustomTextField(placeholder: "",
                                   textColor: .black,
                                   font: .systemFont(ofSize: 18, weight: .regular),
                                   autocapitalizationType: .none,
                                   isSecureTextEntry: false
        )
        text.setLeftPaddingPoints(8)
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(red: 81/255, green: 87/255, blue: 89/255, alpha: 1.0)]
        let attributedPlaceholder = NSAttributedString(string: "", attributes: placeholderAttributes)
        text.attributedPlaceholder = attributedPlaceholder
        text.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        text.layer.cornerRadius = 8
        return text
    }()
    
    let labeDateBirth = CustomLabel(text: "Data de nascimento", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: .white)
    
    let textDateBirth: CustomTextField = {
        let text = CustomTextField(placeholder: "",
                                   textColor: .black,
                                   font: .systemFont(ofSize: 18, weight: .regular),
                                   autocapitalizationType: .none,
                                   isSecureTextEntry: false
        )
        text.setLeftPaddingPoints(8)
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(red: 81/255, green: 87/255, blue: 89/255, alpha: 1.0)]
        let attributedPlaceholder = NSAttributedString(string: "", attributes: placeholderAttributes)
        text.attributedPlaceholder = attributedPlaceholder
        text.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        text.layer.cornerRadius = 8
        return text
    }()
    
    let labelTelephone = CustomLabel(text: "Telefone", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: .white)
    
    let textTelephone: CustomTextField = {
        let text = CustomTextField(placeholder: "",
                                   textColor: .black,
                                   font: .systemFont(ofSize: 18, weight: .regular),
                                   autocapitalizationType: .none,
                                   isSecureTextEntry: false
        )
        text.setLeftPaddingPoints(8)
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(red: 81/255, green: 87/255, blue: 89/255, alpha: 1.0)]
        let attributedPlaceholder = NSAttributedString(string: "", attributes: placeholderAttributes)
        text.attributedPlaceholder = attributedPlaceholder
        text.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        text.layer.cornerRadius = 8
        return text
    }()
    
    let labelTypeOfActivity = CustomLabel(text: "Ramo de Atuação", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: .white)
    
    let textTypeOfActivity: CustomTextField = {
        let text = CustomTextField(placeholder: "",
                                   textColor: .black,
                                   font: .systemFont(ofSize: 18, weight: .regular),
                                   autocapitalizationType: .none,
                                   isSecureTextEntry: false
        )
        text.setLeftPaddingPoints(8)
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(red: 81/255, green: 87/255, blue: 89/255, alpha: 1.0)]
        let attributedPlaceholder = NSAttributedString(string: "", attributes: placeholderAttributes)
        text.attributedPlaceholder = attributedPlaceholder
        text.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        text.layer.cornerRadius = 8
        return text
    }()
    
    let buttonContinues: CustomButton = {
        let button = CustomButton(
            title: "Continuar",
            fontType: .semiBold(size: 25),
            titleColor: UIColor(red: 58/255, green: 62/255, blue: 63/255, alpha: 1.0),
            backgroundColor: UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0),
            cornerRadius: 16,
            clipsToBounds: true
        )
        button.addTarget(self, action: #selector(tapButtonContinues), for: .touchUpInside)
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
        addSubview(myScrollView)
        myScrollView.addSubview(contentView)
        contentView.addSubViews(
            labelName,
            textName,
            labelCPF,
            textCPF,
            labeDateBirth,
            textDateBirth,
            labelTelephone,
            textTelephone,
            labelTypeOfActivity,
            textTypeOfActivity,
            buttonContinues
        )
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            myScrollView.topAnchor.constraint(equalTo: self.topAnchor),
            myScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            myScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            myScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: myScrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: myScrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: myScrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: myScrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 720),
            
            labelName.topAnchor.constraint(equalTo: self.topAnchor, constant: 106),
            labelName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelName.heightAnchor.constraint(equalToConstant: 21),
            labelName.widthAnchor.constraint(equalToConstant: 139),
            
            textName.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 8),
            textName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textName.heightAnchor.constraint(equalToConstant: 48),
            
            labelCPF.topAnchor.constraint(equalTo: textName.bottomAnchor, constant: 24),
            labelCPF.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelCPF.heightAnchor.constraint(equalToConstant: 21),
            labelCPF.widthAnchor.constraint(equalToConstant: 129),
            
            textCPF.topAnchor.constraint(equalTo: labelCPF.bottomAnchor, constant: 8),
            textCPF.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textCPF.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textCPF.heightAnchor.constraint(equalToConstant: 48),
            
            labeDateBirth.topAnchor.constraint(equalTo: textCPF.bottomAnchor, constant: 24),
            labeDateBirth.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labeDateBirth.heightAnchor.constraint(equalToConstant: 21),
            labeDateBirth.widthAnchor.constraint(equalToConstant: 161),
            
            textDateBirth.topAnchor.constraint(equalTo: labeDateBirth.bottomAnchor, constant: 8),
            textDateBirth.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textDateBirth.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textDateBirth.heightAnchor.constraint(equalToConstant: 48),
            
            labelTelephone.topAnchor.constraint(equalTo: textDateBirth.bottomAnchor, constant: 24),
            labelTelephone.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelTelephone.heightAnchor.constraint(equalToConstant: 21),
            labelTelephone.widthAnchor.constraint(equalToConstant: 161),
            
            textTelephone.topAnchor.constraint(equalTo: labelTelephone.bottomAnchor, constant: 8),
            textTelephone.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textTelephone.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textTelephone.heightAnchor.constraint(equalToConstant: 48),
            
            labelTypeOfActivity.topAnchor.constraint(equalTo: textTelephone.bottomAnchor, constant: 24),
            labelTypeOfActivity.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelTypeOfActivity.heightAnchor.constraint(equalToConstant: 21),
            labelTypeOfActivity.widthAnchor.constraint(equalToConstant: 161),
            
            textTypeOfActivity.topAnchor.constraint(equalTo: labelTypeOfActivity.bottomAnchor, constant: 8),
            textTypeOfActivity.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textTypeOfActivity.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textTypeOfActivity.heightAnchor.constraint(equalToConstant: 48),
            
            buttonContinues.topAnchor.constraint(equalTo: textTypeOfActivity.bottomAnchor, constant: 90),
            buttonContinues.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 43),
            buttonContinues.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -43),
            buttonContinues.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    @objc
    private func tapButtonContinues() {
        var errorMessages: [String] = []
        if let name = textName.text {
            if name.isEmpty {
                errorMessages.append("Campo Nome Obrigatorio")
            }
            if let cpf = textCPF.text {
                if name.isEmpty {
                    errorMessages.append("Campo CPF Obrigatorio")
                }
            }
            if let dateBirth = textDateBirth.text {
                if dateBirth.isEmpty {
                    errorMessages.append("Campo Data de Nascimento Obrigatorio")
                }
            }
            if let phone = textTelephone.text {
                if phone.isEmpty {
                    errorMessages.append("Campo Telefone Obrigatorio")
                }
            }
            if let activity = textTypeOfActivity.text {
                if activity.isEmpty {
                    errorMessages.append("Campo Ramo de Atuacao Obrigatorio")
                }
            }
            if errorMessages.isEmpty {
                onTapContinues?()
            } else {
                let errorMessage = errorMessages.joined(separator: "\n")
                self.onError?("Error", errorMessage)
            }
        }
    }
}
