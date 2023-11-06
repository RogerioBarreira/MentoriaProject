//
//  ServiceCell.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 26/10/23.
//

import UIKit

class ServiceListCell: UITableViewCell {
    
    let contenBackGroud: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 3, height: 5)
        view.layer.shadowOpacity = 0.9
        view.layer.shadowRadius = 3
        view.clipsToBounds = false
        return view
    }()
    
    let labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .left
        label.textColor = UIColor(red: 58/255, green: 62/255, blue: 63/255, alpha: 1.0)
        return label
    }()
    
    let labelDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.textAlignment = .left
        label.textColor = UIColor(red: 58/255, green: 62/255, blue: 63/255, alpha: 1.0)
        label.contentMode = .topLeft
        return label
    }()
    
    let labelDuration: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.textAlignment = .left
        label.textColor = UIColor(red: 58/255, green: 62/255, blue: 63/255, alpha: 1.0)
        label.contentMode = .topLeft
        return label
    }()
    
    let labelHowMutch: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.textAlignment = .left
        label.textColor = UIColor(red: 58/255, green: 62/255, blue: 63/255, alpha: 1.0)
        label.contentMode = .topLeft
        return label
    }()
    
    static let identifier = String(describing: ServiceListCell.self)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(contenBackGroud)
        contenBackGroud.addSubViews(
            labelName,
            labelDescription,
            labelDuration,
            labelHowMutch
        )
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            contenBackGroud.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            contenBackGroud.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            contenBackGroud.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            contenBackGroud.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            labelName.topAnchor.constraint(equalTo: contenBackGroud.topAnchor, constant: 5),
            labelName.leadingAnchor.constraint(equalTo: contenBackGroud.leadingAnchor, constant: 10),
            labelName.trailingAnchor.constraint(equalTo: contenBackGroud.trailingAnchor, constant: -10),
            labelName.heightAnchor.constraint(equalToConstant: 30),
            
            labelDescription.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 5),
            labelDescription.leadingAnchor.constraint(equalTo: contenBackGroud.leadingAnchor, constant: 10),
            labelDescription.trailingAnchor.constraint(equalTo: contenBackGroud.trailingAnchor, constant: -10),
            labelDescription.heightAnchor.constraint(equalToConstant: 60),
            
            labelDuration.topAnchor.constraint(equalTo: labelDescription.bottomAnchor, constant: 5),
            labelDuration.leadingAnchor.constraint(equalTo: contenBackGroud.leadingAnchor, constant: 10),
            labelDuration.trailingAnchor.constraint(equalTo: contenBackGroud.trailingAnchor, constant: -10),
            labelDuration.heightAnchor.constraint(equalToConstant: 30),
            
            labelHowMutch.topAnchor.constraint(equalTo: labelDuration.bottomAnchor, constant: 5),
            labelHowMutch.leadingAnchor.constraint(equalTo: contenBackGroud.leadingAnchor, constant: 10),
            labelHowMutch.trailingAnchor.constraint(equalTo: contenBackGroud.trailingAnchor, constant: -10),
            labelHowMutch.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func setupCell(objeto: ServiceListElement?) {
        labelName.text = objeto?.name ?? ""
        labelDescription.text = objeto?.description ?? ""
        labelDuration.text = "Duração Serviço: \(Int(objeto?.duration ?? 0)) Minutos"
        labelHowMutch.text = "Valor do Serviço R$ \(Int(objeto?.howMutch ?? 0))"
    }
}
