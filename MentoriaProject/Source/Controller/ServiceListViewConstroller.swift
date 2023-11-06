//
//  ServiceListViewConstroller.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 29/09/23.
//

import Foundation
import UIKit

class ServiceListViewController: UIViewController {
    
    lazy var viewServiceList: ServiceListView = {
        let view = ServiceListView()
        return view
    }()
    
    let viewModel = ServiceListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        viewServiceList.configSearchBar(delegate: self)
        viewServiceList.configTableView(delegate: self, dataSource: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupRequest()
    }
    
    override func loadView() {
        self.view = viewServiceList
    }
    
    private func setupActions() {
        viewServiceList.buttonRegister.addTarget(self, action: #selector(buttonRegisterTap), for: .touchUpInside)
    }
    
    private func setupRequest() {
        viewModel.requestGetServiceList { [weak self] success in
            guard let self = self else { return }
            if success {
                print("Success")
                viewServiceList.myTableView.reloadData()
            } else {
                self.showMessageError(title: "Erro ❌", message: "Erro ao carregar a lista de Serviços")
            }
        }
    }
    
    private func showMessageError(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .destructive)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    @objc
    private func buttonRegisterTap() {
        let serviceRegister = ServiceRegisterViewController()
        serviceRegister.modalPresentationStyle = .fullScreen
        self.present(serviceRegister, animated: true)
    }
}

extension ServiceListViewController: UISearchBarDelegate {
    
}

extension ServiceListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numerOfRowServiceList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ServiceListCell.identifier, for: indexPath) as? ServiceListCell {
            cell.setupCell(objeto: viewModel.cellForRowServiceList(indexPath: indexPath))
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard indexPath.row < viewModel.numerOfRowServiceList else { return }
       
        guard let selectedService = viewModel.cellForRowServiceList(indexPath: indexPath) else { return }
        
        let coordinator = Coordinator(navigationController: navigationController)
        coordinator.startServiceResgister(selectIndex: indexPath)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let actionDeleteCell = UIContextualAction(style: .destructive, title: nil) { actionDelete, view, deleteSuccess in
                let alertDelete = UIAlertController(title: nil, message: "Deseja deletar a célula \(indexPath.row)", preferredStyle: .actionSheet)
                
                let buttonDeleteOk = UIAlertAction(title: "Excluir", style: .destructive) { [weak self] actionDelete in
                    guard let self = self else { return }

                    guard let service = self.viewModel.cellForRowServiceList(indexPath: indexPath) else {
                        return
                    }
                    self.viewModel.requestDeleteServiceViewModel(id: service.id ?? 0) { [weak self] success in
                        guard let self = self else { return }
                        if success {
                            self.showMessageError(title: "Deletado", message: "Registro deletado com Succeso ✅")
                        } else {
                            self.showMessageError(title: "Deletado", message: "Registro deletado com Succeso ✅")
                        }
                    }
                    self.viewModel.deleteCell(at: indexPath)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
                alertDelete.addAction(buttonDeleteOk)
                
                let buttonDeleteCancel = UIAlertAction(title: "Cancelar", style: .cancel)
                alertDelete.addAction(buttonDeleteCancel)
                
                self.present(alertDelete, animated: true)
            }
            actionDeleteCell.image = UIImage(systemName: "trash")
        
        let editAction = UIContextualAction(style: .normal, title: nil) { actionEdit, view, editBool in
            
            let alertEdit = UIAlertController(title: "Editar", message: "Deseja Editar a célula \(indexPath.row)", preferredStyle: .actionSheet)
            let buttonEditOk = UIAlertAction(title: "Editar", style: .default) { [weak self] actionDelete in
                guard let self = self else { return }
                guard let service = self.viewModel.cellForRowServiceList(indexPath: indexPath) else {
                    return
                }
                let vcRegister = ServiceRegisterViewController()
                vcRegister.modalPresentationStyle = .fullScreen
                
                vcRegister.selectedRowIndex = indexPath
                self.present(vcRegister, animated: true)
            }
            alertEdit.addAction(buttonEditOk)
            let buttonCancelEdit = UIAlertAction(title: "Cancelar", style: .cancel)
            alertEdit.addAction(buttonCancelEdit)
            self.present(alertEdit, animated: true)
        }
        editAction.image = UIImage(systemName: "pencil")
        
        return UISwipeActionsConfiguration(actions: [actionDeleteCell, editAction])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 206
    }
}
