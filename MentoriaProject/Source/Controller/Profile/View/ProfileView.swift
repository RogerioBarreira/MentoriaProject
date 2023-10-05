//
//  ProfileView.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 29/09/23.
//

import Foundation
import UIKit

class ProfileView: UIView {
    
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
    
    let labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Perfil"
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    let backgroundImagePhoto: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        image.layer.cornerRadius = 54.5
        image.clipsToBounds = true
        return image
    }()
    
    let imagePhoto: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "camera.viewfinder")
        image.tintColor = UIColor(red: 58/255, green: 62/255, blue: 63/255, alpha: 1.0)
        image.contentMode = .scaleToFill
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
        addSubview(myScrollView)
        myScrollView.addSubview(contentView)
        contentView.addSubViews(labelTitle, backgroundImagePhoto)
        backgroundImagePhoto.addSubview(imagePhoto)
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
            contentView.heightAnchor.constraint(equalToConstant: 1150),
            
            
            labelTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 88),
            labelTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            labelTitle.heightAnchor.constraint(equalToConstant: 44),
            labelTitle.widthAnchor.constraint(equalToConstant: 71),
            
            backgroundImagePhoto.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 30),
            backgroundImagePhoto.centerXAnchor.constraint(equalTo: labelTitle.centerXAnchor),
            backgroundImagePhoto.widthAnchor.constraint(equalToConstant: 109),
            backgroundImagePhoto.heightAnchor.constraint(equalToConstant: 109),
            
            imagePhoto.centerXAnchor.constraint(equalTo: backgroundImagePhoto.centerXAnchor),
            imagePhoto.centerYAnchor.constraint(equalTo: backgroundImagePhoto.centerYAnchor),
            imagePhoto.widthAnchor.constraint(equalToConstant: 53),
            imagePhoto.heightAnchor.constraint(equalToConstant: 53),
            
        ])
    }
}
