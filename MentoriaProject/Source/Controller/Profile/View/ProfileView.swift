//
//  ProfileView.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 29/09/23.
//

import Foundation
import UIKit
import DSM

class ProfileView: UIView {
    
    var onTapEditProfile: (()-> Void)?
    
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
    
    let labelTitle = CustomLabel(text: "Perfil", font: .systemFont(ofSize: 24, weight: .medium), textAlignment: .center, textColor: .white)
    
    let backgroundImagePhoto: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        image.layer.cornerRadius = 54.5
        image.clipsToBounds = true
        return image
    }()
    
    let buttonImagePhoto: CustomButton = {
        let button = CustomButton(title: "")
        button.tintColor = .gray
        return button
    }()
    
    let imageIconPhoto: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "camera.viewfinder")
        image.tintColor = UIColor(red: 58/255, green: 62/255, blue: 55/255, alpha: 1.0)
        return image
    }()
    
    let labelName = CustomLabel(text: "Marcelo", font: .systemFont(ofSize: 24, weight: .medium), textAlignment: .center, textColor: .white)
    
    let labelFuncDescription = CustomLabel(text: "Eletricista", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .center, textColor: .white)
    
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
        let attributedPlaceholder = NSAttributedString(string: "000.000.00-00", attributes: placeholderAttributes)
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
        let attributedPlaceholder = NSAttributedString(string: "25/100/1999", attributes: placeholderAttributes)
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
        let attributedPlaceholder = NSAttributedString(string: "(11) 99999-9999", attributes: placeholderAttributes)
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
        let attributedPlaceholder = NSAttributedString(string: "Eletricista", attributes: placeholderAttributes)
        text.attributedPlaceholder = attributedPlaceholder
        text.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        text.layer.cornerRadius = 8
        return text
    }()
    
    let labelAddress = CustomLabel(text: "Endereço", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: .white)
    
    let textAddress: CustomTextField = {
        let text = CustomTextField(placeholder: "",
                                   textColor: .black,
                                   font: .systemFont(ofSize: 18, weight: .regular),
                                   autocapitalizationType: .none,
                                   isSecureTextEntry: false
        )
        text.setLeftPaddingPoints(8)
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(red: 81/255, green: 87/255, blue: 89/255, alpha: 1.0)]
        let attributedPlaceholder = NSAttributedString(string: "Eletricista", attributes: placeholderAttributes)
        text.attributedPlaceholder = attributedPlaceholder
        text.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        text.layer.cornerRadius = 8
        return text
    }()
    
    let buttonEditProfile: CustomButton = {
        let button = CustomButton(
            title: "Editar Perfil",
            fontType: .semiBold(size: 25),
            titleColor: UIColor(red: 58/255, green: 62/255, blue: 63/255, alpha: 1.0),
            backgroundColor: UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0),
            cornerRadius: 16,
            clipsToBounds: true
        )
        button.addTarget(self, action: #selector(tapEditProfile), for: .touchUpInside)
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
            labelTitle,
            backgroundImagePhoto,
            buttonImagePhoto,
            imageIconPhoto,
            labelName,
            labelFuncDescription,
            labelCPF,
            textCPF,
            labeDateBirth,
            textDateBirth,
            labelTelephone,
            textTelephone,
            labelTypeOfActivity,
            textTypeOfActivity,
            labelAddress,
            textAddress,
            buttonEditProfile
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
            contentView.heightAnchor.constraint(equalToConstant: 1100),
            
            labelTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 68),
            labelTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            labelTitle.heightAnchor.constraint(equalToConstant: 44),
            labelTitle.widthAnchor.constraint(equalToConstant: 71),
            
            backgroundImagePhoto.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 24),
            backgroundImagePhoto.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backgroundImagePhoto.widthAnchor.constraint(equalToConstant: 109),
            backgroundImagePhoto.heightAnchor.constraint(equalToConstant: 109),
            
            buttonImagePhoto.centerXAnchor.constraint(equalTo: backgroundImagePhoto.centerXAnchor),
            buttonImagePhoto.centerYAnchor.constraint(equalTo: backgroundImagePhoto.centerYAnchor),
            buttonImagePhoto.widthAnchor.constraint(equalToConstant: 80),
            buttonImagePhoto.heightAnchor.constraint(equalToConstant: 80),
            
            imageIconPhoto.centerXAnchor.constraint(equalTo: buttonImagePhoto.centerXAnchor),
            imageIconPhoto.centerYAnchor.constraint(equalTo: buttonImagePhoto.centerYAnchor),
            imageIconPhoto.widthAnchor.constraint(equalToConstant: 53),
            imageIconPhoto.heightAnchor.constraint(equalToConstant: 53),
            
            labelName.topAnchor.constraint(equalTo: backgroundImagePhoto.bottomAnchor, constant: 8),
            labelName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            labelName.heightAnchor.constraint(equalToConstant: 28),
            labelName.widthAnchor.constraint(equalToConstant: 172),
            
            labelFuncDescription.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 4),
            labelFuncDescription.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            labelFuncDescription.heightAnchor.constraint(equalToConstant: 21),
            labelFuncDescription.widthAnchor.constraint(equalToConstant: 80),
            
            labelCPF.topAnchor.constraint(equalTo: labelFuncDescription.bottomAnchor, constant: 24),
            labelCPF.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelCPF.heightAnchor.constraint(equalToConstant: 21),
            labelCPF.widthAnchor.constraint(equalToConstant: 34),
            
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
            
            labelAddress.topAnchor.constraint(equalTo: textTypeOfActivity.bottomAnchor, constant: 24),
            labelAddress.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelAddress.heightAnchor.constraint(equalToConstant: 21),
            labelAddress.widthAnchor.constraint(equalToConstant: 161),
            
            textAddress.topAnchor.constraint(equalTo: labelAddress.bottomAnchor, constant: 8),
            textAddress.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textAddress.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textAddress.heightAnchor.constraint(equalToConstant: 149),
            
            buttonEditProfile.topAnchor.constraint(equalTo: textAddress.bottomAnchor, constant: 92),
            buttonEditProfile.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 43),
            buttonEditProfile.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -43),
            buttonEditProfile.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    @objc
    private func tapEditProfile() {
        onTapEditProfile?()
    }
    
//    @objc
//    private func tapButtonImage() {
//        onTapButtonImage?()
//    }
}
