//
//  ServiceListView.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 26/10/23.
//

import Foundation
import UIKit

class ServiceListView: UIView {
    
    let mySearchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.searchBarStyle = .minimal
        return search
    }()
    
    let labelCreateService: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cadastrar Serviços"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let buttonRegister: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let myTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.register(ServiceListCell.self, forCellReuseIdentifier: ServiceListCell.identifier)
        return tableView
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
            mySearchBar,
            labelCreateService,
            myTableView,
            buttonRegister
        )
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            mySearchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            mySearchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mySearchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            labelCreateService.topAnchor.constraint(equalTo: mySearchBar.bottomAnchor),
            labelCreateService.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelCreateService.widthAnchor.constraint(equalToConstant: 260),
            labelCreateService.heightAnchor.constraint(equalToConstant: 40),
            
            buttonRegister.centerYAnchor.constraint(equalTo: labelCreateService.centerYAnchor),
            buttonRegister.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            buttonRegister.widthAnchor.constraint(equalToConstant: 60),
            buttonRegister.heightAnchor.constraint(equalToConstant: 60),
            
            myTableView.topAnchor.constraint(equalTo: labelCreateService.bottomAnchor, constant: 5),
            myTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            myTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configSearchBar(delegate: UISearchBarDelegate) {
        mySearchBar.delegate = delegate
    }
    
    func configTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        myTableView.delegate = delegate
        myTableView.dataSource = dataSource
    }
}
