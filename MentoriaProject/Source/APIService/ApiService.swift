//
//  ApiService.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 11/09/23.
//

import Foundation

public struct ApiService {
    
    static let baseUrl = "http://mentoria.codandocommoa.com.br/"
    static let param = "uIdFirebase=CodandoComMoa"
    
    public enum EndPoint: String {
        case themeList = "Api/Theme/GetListaTheme?"
        case themeById = "Api/Theme/GetThemeById?"
        case themeComponentList = "Api/ThemeComponent/GetListaThemeComponent?"
        case themeComponentById = "Api/ThemeComponent/GetThemeComponentById?"
        case getProfileId = "Api/Profile/GetProfileById?"
    }
}
