//
//  RegisterViewController.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 04/09/23.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    lazy var viewRegister: RegisterView = {
        let view = RegisterView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cadastrar"
    }
    
    override func loadView() {
        self.view = viewRegister
    }

}
