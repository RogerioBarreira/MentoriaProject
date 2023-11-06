//
//  ServiceDelete.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 28/10/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let serviceDelete = try? JSONDecoder().decode(ServiceDelete.self, from: jsonData)

import Foundation

// MARK: - ServiceDelete
struct ServiceDelete: Codable {
    let result: [ResultDelete]?

    enum CodingKeys: String, CodingKey {
        case result = "Result"
    }
}

// MARK: - ResultDelete
struct ResultDelete: Codable {
    let name, description: String?
    let duration, howMutch, id: Int?
    let isInativo: Bool?
    let creationDate, changeDate, uid, uidFirebase: String?
    let isChanged: Bool?

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case description = "Description"
        case duration = "Duration"
        case howMutch = "HowMutch"
        case id = "Id"
        case isInativo = "IsInativo"
        case creationDate = "CreationDate"
        case changeDate = "ChangeDate"
        case uid = "Uid"
        case uidFirebase = "UidFirebase"
        case isChanged = "IsChanged"
    }
}
