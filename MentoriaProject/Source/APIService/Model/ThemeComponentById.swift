//
//  ThemeComponentById.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 11/09/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let themeComponentByID = try? JSONDecoder().decode(ThemeComponentByID.self, from: jsonData)

import Foundation

// MARK: - ThemeComponentByID
struct ThemeComponentByID: Codable {
    let result: ResultThemeComponentByID?
    let resultJSON: String?
    let isSucess: Bool?
    let message: String?
    let exception: ExceptionThemeComponentByID?
    let stackTrace: String?

    enum CodingKeys: String, CodingKey {
        case result = "Result"
        case resultJSON = "ResultJson"
        case isSucess = "IsSucess"
        case message = "Message"
        case exception = "Exception"
        case stackTrace = "StackTrace"
    }
}

// MARK: - ExceptionThemeComponentByID
struct ExceptionThemeComponentByID: Codable {
}

// MARK: - ResultThemeComponentByID
struct ResultThemeComponentByID: Codable {
    let themeID: Int?
    let theme: ThemeResultThemeComponentByID?
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
struct ThemeResultThemeComponentByID: Codable {
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

