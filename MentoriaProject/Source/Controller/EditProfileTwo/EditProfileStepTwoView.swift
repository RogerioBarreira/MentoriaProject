//
//  EditProfileTwoView.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 06/10/23.
//

import Foundation
import UIKit
import DSM

class EditProfileStepTwoView: UIView {
    
    var onTapButtonConfirm: (()-> Void)?
    
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
    
    let labelCep = CustomLabel(text: "CEP", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: .white)
    
    let textCep: CustomTextField = {
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
    
    let labelRoad = CustomLabel(text: "Rua", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: .white)
    
    let textRoad: CustomTextField = {
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
    
    let labelNumber = CustomLabel(text: "Número", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: .white)
    
    let textNumber: CustomTextField = {
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
    
    let labelNeighborhood = CustomLabel(text: "Bairro", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: .white)
    
    let textNeighborhood: CustomTextField = {
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
    
    let labelCity = CustomLabel(text: "Cidade", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: .white)
    
    let textCity: CustomTextField = {
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
    
    let labelState = CustomLabel(text: "Estado", font: .systemFont(ofSize: 18, weight: .regular), textAlignment: .left, textColor: .white)
    
    let textState: CustomTextField = {
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
    
    let buttonConfirm: CustomButton = {
        let button = CustomButton(
            title: "Confirmar",
            fontType: .semiBold(size: 25),
            titleColor: UIColor(red: 58/255, green: 62/255, blue: 63/255, alpha: 1.0),
            backgroundColor: UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0),
            cornerRadius: 16,
            clipsToBounds: true
        )
        button.addTarget(self, action: #selector(tapButtonConfirm), for: .touchUpInside)
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
            labelCep,
            textCep,
            labelRoad,
            textRoad,
            labelNumber,
            textNumber,
            labelNeighborhood,
            textNeighborhood,
            labelCity,
            textCity,
            labelState,
            textState,
            buttonConfirm
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
            
            labelCep.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 86),
            labelCep.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelCep.heightAnchor.constraint(equalToConstant: 21),
            labelCep.widthAnchor.constraint(equalToConstant: 139),
            
            textCep.topAnchor.constraint(equalTo: labelCep.bottomAnchor, constant: 8),
            textCep.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textCep.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textCep.heightAnchor.constraint(equalToConstant: 48),
            
            labelRoad.topAnchor.constraint(equalTo: textCep.bottomAnchor, constant: 24),
            labelRoad.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelRoad.heightAnchor.constraint(equalToConstant: 21),
            labelRoad.widthAnchor.constraint(equalToConstant: 129),
            
            textRoad.topAnchor.constraint(equalTo: labelRoad.bottomAnchor, constant: 8),
            textRoad.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textRoad.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textRoad.heightAnchor.constraint(equalToConstant: 48),
            
            labelNumber.topAnchor.constraint(equalTo: textRoad.bottomAnchor, constant: 24),
            labelNumber.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelNumber.heightAnchor.constraint(equalToConstant: 21),
            labelNumber.widthAnchor.constraint(equalToConstant: 161),
            
            textNumber.topAnchor.constraint(equalTo: labelNumber.bottomAnchor, constant: 8),
            textNumber.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textNumber.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textNumber.heightAnchor.constraint(equalToConstant: 48),
            
            labelNeighborhood.topAnchor.constraint(equalTo: textNumber.bottomAnchor, constant: 24),
            labelNeighborhood.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelNeighborhood.heightAnchor.constraint(equalToConstant: 21),
            labelNeighborhood.widthAnchor.constraint(equalToConstant: 161),
            
            textNeighborhood.topAnchor.constraint(equalTo: labelNeighborhood.bottomAnchor, constant: 8),
            textNeighborhood.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textNeighborhood.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textNeighborhood.heightAnchor.constraint(equalToConstant: 48),
            
            labelCity.topAnchor.constraint(equalTo: textNeighborhood.bottomAnchor, constant: 24),
            labelCity.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelCity.heightAnchor.constraint(equalToConstant: 21),
            labelCity.widthAnchor.constraint(equalToConstant: 161),
            
            textCity.topAnchor.constraint(equalTo: labelCity.bottomAnchor, constant: 8),
            textCity.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textCity.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textCity.heightAnchor.constraint(equalToConstant: 48),
            
            labelState.topAnchor.constraint(equalTo: textNeighborhood.bottomAnchor, constant: 24),
            labelState.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            labelState.heightAnchor.constraint(equalToConstant: 21),
            labelState.widthAnchor.constraint(equalToConstant: 161),
            
            textState.topAnchor.constraint(equalTo: labelState.bottomAnchor, constant: 8),
            textState.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textState.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textState.heightAnchor.constraint(equalToConstant: 48),
            
            buttonConfirm.topAnchor.constraint(equalTo: textState.bottomAnchor, constant: 92),
            buttonConfirm.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 43),
            buttonConfirm.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -43),
            buttonConfirm.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    @objc
    private func tapButtonConfirm() {
        onTapButtonConfirm?()
    }
}
