//
//  DetailViewModel.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 26/12/23.
//

import Foundation

@MainActor
final class DetailViewModel: ObservableObject {
    
    let movie: Movie
    let sections: [DetailViewSection] = [.about, .review]
    @Published var selectedSection: DetailViewSection = .about
    @Published var reviews: [Review] = []
    @Published var similarMovies: [Movie] = []
    @Published var errorMsg = ""
    
    private let movieService = MovieService()
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    func fetchReviews() async {
        do {
            let response: ReviewReponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .movieReviews(movie.id)))
            reviews = response.results
        } catch {
            print("Error: \(error.localizedDescription)")
            errorMsg = "Error: \(error.localizedDescription)"
        }
    }
    
    func fetchSimilar() async {
        do {
            let response: MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .movieSimilar(movie.id)))
            similarMovies = response.results
        } catch {
            print("Error: \(error.localizedDescription)")
            errorMsg = "Error: \(error.localizedDescription)"
        }
    }
    
    
}
