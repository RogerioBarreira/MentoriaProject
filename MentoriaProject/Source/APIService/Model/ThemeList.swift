//
//  ThemeList.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 11/09/23.
//

import Foundation

// MARK: - ThemeListElement
struct ThemeListElement: Codable {
    let name: String?
    let id: Int?
    let isInativo: Bool?
    let creationDate, changeDate, uid, uidFirebase: String?
    let isChanged: Bool?

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case id = "Id"
        case isInativo = "IsInativo"
        case creationDate = "CreationDate"
        case changeDate = "ChangeDate"
        case uid = "Uid"
        case uidFirebase = "UidFirebase"
        case isChanged = "IsChanged"
    }
}

typealias ThemeList = [ThemeListElement]
