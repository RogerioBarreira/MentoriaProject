//
//  LoginViewController.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 04/09/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var viewLogin: LoginView = {
        let view = LoginView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Entrar"
    }
    
    override func loadView() {
        self.view = viewLogin
    }
}

