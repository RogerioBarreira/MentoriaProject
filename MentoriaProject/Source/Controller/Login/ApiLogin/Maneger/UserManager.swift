//
//  UserManager.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 09/09/23.
//

import Foundation

protocol UserManagerProtocol {
    func register(email: String, password: String,
                  completionSuccess: @escaping(UserModel) -> Void,
                  completionFailure: @escaping(Error) -> Void)
    
    func login(email: String, password: String,
                completionSuccess: @escaping (UserModel) -> Void,
                completionFailure: @escaping (Error) -> Void)
}

class UserManager: UserManagerProtocol {
    
    let business: UserBusinessProtocol
    
    init(business: UserBusinessProtocol) {
        self.business = business
    }
    
    func register(email: String, password: String, completionSuccess: @escaping (UserModel) -> Void, completionFailure: @escaping (Error) -> Void) {
        business.register(email: email, password: password) { result in
            switch result {
                
            case .success(let userModel):
                completionSuccess(userModel)
            case .failure(let error):
                completionFailure(error)
            }
        }
    }
    
    func login(email: String, password: String, completionSuccess: @escaping (UserModel) -> Void, completionFailure: @escaping (Error) -> Void) {
        business.login(email: email, password: password) { result in
            switch result {
                
            case .success(let userModel):
                completionSuccess(userModel)
            case .failure(let error):
                completionFailure(error)
            }
        }
    }
}
