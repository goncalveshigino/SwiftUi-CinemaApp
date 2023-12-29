//
//  Constants.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 24/12/23.
//

import Foundation


enum Constants {
    static var apiKey = "d7f7882e55b04009360890e4fbb179ee"
    static var language = "py-Pt"
    static let page = 10
    static var imageBaseUrl = "https://image.tmdb.org/t/p/original"
    static var apiBaseUrl = "https://api.themoviedb.org"
}


struct CinemaKeyStorage {
    static var APP_THEME = "appTheme"
}

struct CinemaTheme {
    static var DARK = "Escuro"
    static var LIGHT = "Claro"
    static var AUTO = "Auto"
}
