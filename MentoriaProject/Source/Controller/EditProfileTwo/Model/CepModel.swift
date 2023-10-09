//
//  CepModel.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 09/10/23.
//

import Foundation

// MARK: - CepModel
struct CepModel: Codable {
    let cep, logradouro, complemento, bairro: String?
    let localidade, uf, ibge, gia: String?
    let ddd, siafi: String?
}

