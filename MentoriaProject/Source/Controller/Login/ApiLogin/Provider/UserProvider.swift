//
//  UserProvider.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 09/09/23.
//

import Foundation
import FirebaseAuth

protocol UserProviderProtocol {
    func login(parameters: [AnyHashable: Any], completion: @escaping (Result<UserModel, Error>) -> Void)
    func register(parameters: [AnyHashable: Any], completion: @escaping (Result<UserModel, Error>) -> Void)
    
}

class UserProvider: UserProviderProtocol {
    
    lazy var auth = Auth.auth()
    
    func login(parameters: [AnyHashable : Any], completion: @escaping (Result<UserModel, Error>) -> Void) {
        let body: NSDictionary = parameters[Constants.ParametersKeys.body] as! NSDictionary
        let userModel = body[Constants.ParametersKeys.userModel] as! UserModel
        
        auth.signIn(withEmail: userModel.email, password: userModel.password) { result, error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(userModel))
            }
        }
    }
    
    func register(parameters: [AnyHashable : Any], completion: @escaping (Result<UserModel, Error>) -> Void) {
        let body: NSDictionary = parameters["body"] as! NSDictionary
        let userModel = body["userModel"] as! UserModel
        
        auth.createUser(withEmail: userModel.email, password: userModel.password) { result, error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(userModel))
            }
        }
    }
}
