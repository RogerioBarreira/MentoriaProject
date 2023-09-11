//
//  ThemeComponentList.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 11/09/23.
//

import Foundation

// MARK: - ThemeComponentListElement
struct ThemeComponentListElement: Codable {
    let themeID: Int?
    let theme: Theme?
    let name, foregroundColor, backgroundColor, fontName: String?
    let fontSize: Int?
    let style: String?
    let id: Int?
    let isInativo: Bool?
    let creationDate, changeDate, uid, uidFirebase: String?
    let isChanged: Bool?

    enum CodingKeys: String, CodingKey {
        case themeID = "ThemeId"
        case theme = "Theme"
        case name = "Name"
        case foregroundColor = "ForegroundColor"
        case backgroundColor = "BackgroundColor"
        case fontName = "FontName"
        case fontSize = "FontSize"
        case style = "Style"
        case id = "Id"
        case isInativo = "IsInativo"
        case creationDate = "CreationDate"
        case changeDate = "ChangeDate"
        case uid = "Uid"
        case uidFirebase = "UidFirebase"
        case isChanged = "IsChanged"
    }
}

// MARK: - Theme
struct Theme: Codable {
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

typealias ThemeComponentList = [ThemeComponentListElement]

