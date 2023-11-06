//
//  ServiceList.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 26/10/23.
//

import Foundation

// MARK: - ServiceListElement
struct ServiceListElement: Codable {
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

typealias ServiceList = [ServiceListElement]
