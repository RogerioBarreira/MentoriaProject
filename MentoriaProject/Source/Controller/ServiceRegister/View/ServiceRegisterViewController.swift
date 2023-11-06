//
//  ServiceRegisterViewController.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 26/10/23.
//

import Foundation
import UIKit

class ServiceRegisterViewController: UIViewController {
    
    lazy var viewServiceRegister = {
        let view = ServiceRegisterView ()
        return view
    }()
    
    var selectedRowIndex: IndexPath?
    
    let viewModel = ServiceRegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
    }
    
    override func loadView() {
        self.view = viewServiceRegister
    }
    
    private func setupActions() {
        viewServiceRegister.buttonRegister.addTarget(self, action: #selector(buttonRegisterTap), for: .touchUpInside)
        viewServiceRegister.buttonClose.addTarget(self, action: #selector(buttonCloseTap), for: .touchUpInside)
    }
    
    @objc
    private func buttonRegisterTap() {
        setupRequest()
    }
    
    @objc
    private func buttonCloseTap() {
        self.dismiss(animated: true)
    }
    
    private func setupRequest() {
        var name =  viewServiceRegister.textName.text ?? ""
        var description = viewServiceRegister.textDescription.text ?? ""
        var duration = Int(String(viewServiceRegister.textDuration.text ?? "")) ?? 0
        var howMutch = Int(String(viewServiceRegister.textHowMutch.text ?? "")) ?? 0
        var id = selectedRowIndex?.row ?? 0
        var isInativo = false
        var creationDate = "26/10/2023"
        var changeDate = "26/10/2023"
        var uid = "2023-10-02617893b7-2bb3-48cb-a0f0-f623d6d8a557"
        var uidFirebase = "CodandoComMoa"
        var isChanged = true
        
        viewModel.requestProfile(name: name, description: description, duration: duration, howMutch: howMutch, id: id, isInativo: isInativo, creationDate: creationDate, changeDate: changeDate, uid: uid, uidFirebase: uidFirebase, isChanged: isChanged) { [weak self] success in
            guard let self = self else { return }
            if success {
                DispatchQueue.main.async {
                    self.showMessageError(title: "Successo", message: "Successo ao Cadastrar Rgistro ✅")
                }
            } else {
                DispatchQueue.main.async {
                    self.showMessageError(title: "Erro", message: "Falha ao Cadastrar Rgistro ❌")
                }
            }
        }
    }
    
    private func showMessageError(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let buttonAction = UIAlertAction(title: "Ok", style: .destructive)
        alert.addAction(buttonAction)
        self.present(alert, animated: true)
    }
    
}
