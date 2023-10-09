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
    var onTapButtonPerfil: (()-> Void)?
    
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
        button.addTarget(self, action: #selector(tapButtonImage), for: .touchUpInside)
        return button
    }()
    
    let imageIconPhoto: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "camera.viewfinder")
        image.tintColor = UIColor(red: 58/255, green: 62/255, blue: 55/255, alpha: 1.0)
        return image
    }()
    
    let labelName = CustomLabel(text: "", font: .systemFont(ofSize: 24, weight: .medium), textAlignment: .center, textColor: .white)
    
    let labelFuncDescription = CustomLabel(text: "", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .center, textColor: .white)
    
    let labelCPF = CustomLabel(text: "CPF", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: .white)
    
    let viewCpf: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    let labelCPFDescription = CustomLabel(text: "", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: UIColor(red: 81/255, green: 87/255, blue: 89/255, alpha: 1.0))
    
    let labeDateBirth = CustomLabel(text: "Data de nascimento", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: .white)
    
    let viewDateBirth: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    let labelDateBirthDescription = CustomLabel(text: "", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: UIColor(red: 81/255, green: 87/255, blue: 89/255, alpha: 1.0))
    
    let labelPhone = CustomLabel(text: "Telefone", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: .white)
    
    let viewPhone: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    let labelPhoneDescription = CustomLabel(text: "", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: UIColor(red: 81/255, green: 87/255, blue: 89/255, alpha: 1.0))
  
    let labelAddress = CustomLabel(text: "Endereço", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: .white)
    
    let viewAddress: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    let labelAddressDescription = CustomLabel(text: "", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: UIColor(red: 81/255, green: 87/255, blue: 89/255, alpha: 1.0))
    
    let labelAddressNumber = CustomLabel(text: "", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: UIColor(red: 81/255, green: 87/255, blue: 89/255, alpha: 1.0))
    
    let labelAddressDistrict = CustomLabel(text: "", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: UIColor(red: 81/255, green: 87/255, blue: 89/255, alpha: 1.0))
    
    let labelAddressZipCode = CustomLabel(text: "", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: UIColor(red: 81/255, green: 87/255, blue: 89/255, alpha: 1.0))
    
    let labelAddressCity = CustomLabel(text: "", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: UIColor(red: 81/255, green: 87/255, blue: 89/255, alpha: 1.0))
  
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
            viewCpf,
            labelCPFDescription,
            labeDateBirth,
            viewDateBirth,
            labelDateBirthDescription,
            labelPhone,
            viewPhone,
            labelPhoneDescription,
            labelAddress,
            viewAddress,
            labelAddressDescription,
            labelAddressNumber,
            labelAddressDistrict,
            labelAddressZipCode,
            labelAddressCity,
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
            contentView.heightAnchor.constraint(equalToConstant: 1045),
            
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
            labelName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            labelName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            labelName.heightAnchor.constraint(equalToConstant: 28),
            
            labelFuncDescription.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 4),
            labelFuncDescription.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            labelFuncDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            labelFuncDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            labelFuncDescription.heightAnchor.constraint(equalToConstant: 21),
            
            labelCPF.topAnchor.constraint(equalTo: labelFuncDescription.bottomAnchor, constant: 24),
            labelCPF.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelCPF.heightAnchor.constraint(equalToConstant: 21),
            labelCPF.widthAnchor.constraint(equalToConstant: 34),
            
            viewCpf.topAnchor.constraint(equalTo: labelCPF.bottomAnchor, constant: 8),
            viewCpf.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            viewCpf.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            viewCpf.heightAnchor.constraint(equalToConstant: 48),
            
            labelCPFDescription.centerYAnchor.constraint(equalTo: viewCpf.centerYAnchor),
            labelCPFDescription.leadingAnchor.constraint(equalTo: viewCpf.leadingAnchor, constant: 8),
            labelCPFDescription.trailingAnchor.constraint(equalTo: viewCpf.trailingAnchor, constant: -8),
            labelCPFDescription.heightAnchor.constraint(equalToConstant: 21),
            
            labeDateBirth.topAnchor.constraint(equalTo: viewCpf.bottomAnchor, constant: 24),
            labeDateBirth.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labeDateBirth.heightAnchor.constraint(equalToConstant: 21),
            labeDateBirth.widthAnchor.constraint(equalToConstant: 161),
            
            viewDateBirth.topAnchor.constraint(equalTo: labeDateBirth.bottomAnchor, constant: 8),
            viewDateBirth.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            viewDateBirth.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            viewDateBirth.heightAnchor.constraint(equalToConstant: 48),
            
            labelDateBirthDescription.centerYAnchor.constraint(equalTo: viewDateBirth.centerYAnchor),
            labelDateBirthDescription.leadingAnchor.constraint(equalTo: viewDateBirth.leadingAnchor, constant: 8),
            labelDateBirthDescription.trailingAnchor.constraint(equalTo: viewDateBirth.trailingAnchor, constant: -8),
            labelDateBirthDescription.heightAnchor.constraint(equalToConstant: 21),
            
            labelPhone.topAnchor.constraint(equalTo: viewDateBirth.bottomAnchor, constant: 24),
            labelPhone.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelPhone.heightAnchor.constraint(equalToConstant: 21),
            labelPhone.widthAnchor.constraint(equalToConstant: 161),
            
            viewPhone.topAnchor.constraint(equalTo: labelPhone.bottomAnchor, constant: 8),
            viewPhone.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            viewPhone.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewPhone.heightAnchor.constraint(equalToConstant: 48),
            
            labelPhoneDescription.centerYAnchor.constraint(equalTo: viewPhone.centerYAnchor),
            labelPhoneDescription.leadingAnchor.constraint(equalTo: viewPhone.leadingAnchor, constant: 8),
            labelPhoneDescription.trailingAnchor.constraint(equalTo: viewPhone.trailingAnchor, constant: -8),
            labelPhoneDescription.heightAnchor.constraint(equalToConstant: 21),
            
            labelAddress.topAnchor.constraint(equalTo: viewPhone.bottomAnchor, constant: 24),
            labelAddress.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelAddress.heightAnchor.constraint(equalToConstant: 21),
            labelAddress.widthAnchor.constraint(equalToConstant: 161),
            
            viewAddress.topAnchor.constraint(equalTo: labelAddress.bottomAnchor, constant: 8),
            viewAddress.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            viewAddress.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            viewAddress.heightAnchor.constraint(equalToConstant: 149),
            
            labelAddressDescription.topAnchor.constraint(equalTo: viewAddress.topAnchor, constant: 15),
            labelAddressDescription.leadingAnchor.constraint(equalTo: viewAddress.leadingAnchor, constant: 8),
            labelAddressDescription.widthAnchor.constraint(equalToConstant: 250),
            labelAddressDescription.heightAnchor.constraint(equalToConstant: 21),
            
            labelAddressNumber.centerYAnchor.constraint(equalTo: labelAddressDescription.centerYAnchor),
            labelAddressNumber.leadingAnchor.constraint(equalTo: labelAddressDescription.trailingAnchor, constant: 10),
            labelAddressNumber.trailingAnchor.constraint(equalTo: viewAddress.trailingAnchor, constant: -8),
            labelAddressNumber.heightAnchor.constraint(equalToConstant: 21),
            
            labelAddressDistrict.topAnchor.constraint(equalTo: labelAddressDescription.bottomAnchor, constant: 10),
            labelAddressDistrict.leadingAnchor.constraint(equalTo: viewAddress.leadingAnchor, constant: 8),
            labelAddressDistrict.trailingAnchor.constraint(equalTo: viewAddress.trailingAnchor, constant: -8),
            labelAddressDistrict.heightAnchor.constraint(equalToConstant: 21),
            
            labelAddressZipCode.topAnchor.constraint(equalTo: labelAddressDistrict.bottomAnchor, constant: 10),
            labelAddressZipCode.leadingAnchor.constraint(equalTo: viewAddress.leadingAnchor, constant: 8),
            labelAddressZipCode.trailingAnchor.constraint(equalTo: viewAddress.trailingAnchor, constant: -8),
            labelAddressZipCode.heightAnchor.constraint(equalToConstant: 21),
            
            labelAddressCity.topAnchor.constraint(equalTo: labelAddressZipCode.bottomAnchor, constant: 10),
            labelAddressCity.leadingAnchor.constraint(equalTo: viewAddress.leadingAnchor, constant: 8),
            labelAddressCity.trailingAnchor.constraint(equalTo: viewAddress.trailingAnchor, constant: -8),
            labelAddressCity.heightAnchor.constraint(equalToConstant: 21),
            
            buttonEditProfile.topAnchor.constraint(equalTo: viewAddress.bottomAnchor, constant: 92),
            buttonEditProfile.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 43),
            buttonEditProfile.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -43),
            buttonEditProfile.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    @objc
    private func tapEditProfile() {
        onTapEditProfile?()
    }
    
    @objc
    private func tapButtonImage() {
        onTapButtonPerfil?()
    }
}
