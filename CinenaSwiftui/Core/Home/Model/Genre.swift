//
//  Genre.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 26/12/23.
//

import Foundation


struct Genre: Identifiable, Codable, Hashable {
    let id: Int
    let name: String
}

struct GenreResponse: Codable, Hashable {
    let genres: [Genre]
}
