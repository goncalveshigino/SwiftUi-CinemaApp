//
//  PreviewProvider.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 25/12/23.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        DeveloperPreview.instance
    }
}


class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() { }
    
    let movie = Movie(
        adult: false,
        backdropPath: "",
        genreIDS: [1],
        id: 769,
        originalLanguage: "",
        originalTitle: "",
        overview: "",
        popularity: 10.0,
        posterPath: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
        releaseDate: "",
        title: "The Godfather",
        video: false,
        voteAverage: 10.0,
        voteCount: 1
    )
    
    let genre = Genre(id: 28, name: "Action")
}