//
//  Genre.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 26/12/23.
//

import Foundation


struct Genre: Identifiable, Codable {
    let id: Int
    let name: String
}

struct GenreResponse: Codable {
    let genres: [Genre]
}
