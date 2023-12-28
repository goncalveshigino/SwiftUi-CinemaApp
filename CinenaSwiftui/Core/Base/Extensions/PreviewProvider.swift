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
        backdropPath: "/tmU7GeKVybMWFButWEGl2M4GeiP.jpg",
        genreIDS: [1],
        id: 769,
        originalLanguage: "",
        originalTitle: "gsdgdsghdsghgdshgdshgsdg",
        overview: "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
        popularity: 10.0,
        posterPath: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
        releaseDate: "",
        title: "The Godfather gsdgdsghdsghgdshgdshgsdg dsgdsgdsghsdghs",
        video: false,
        voteAverage: 10.0,
        voteCount: 1
    )
    
    let genre = Genre(id: 28, name: "Action")
    
    let mockReview = Review(
        author: "John Doe", 
        authorDetails: nil,
        content: "This is a great movie!",
        createdAt: "2023-01-01T12:00:00Z",
        id: "12345",
        updatedAt: "2023-01-02T10:30:00Z",
        url: "https://example.com/review/12345"
    )
}
