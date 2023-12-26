//
//  DetailViewModel.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 26/12/23.
//

import Foundation


final class DetailViewModel: ObservableObject {
    
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
