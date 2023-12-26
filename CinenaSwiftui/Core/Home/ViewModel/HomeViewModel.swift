//
//  HomeViewModel.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 25/12/23.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    
    @Published var topRatedMovies: [Movie] = []
    @Published var trendingMovies: [Movie] = []
    @Published var moviesForSelectedGenre: [Movie] = []
    @Published var genre: [Genre] = []
    @Published var errorMsg = ""
    @Published var selectedGenre = DeveloperPreview.instance.genre
    @Published var selectedMovie: Movie? = nil
    
    private let movieService = MovieService()
    
    func fetchTrendingMovies() async {
        do {
            let movieResponse: MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .trending))
            trendingMovies = movieResponse.results
        } catch {
            errorMsg = "Erro: \(error.localizedDescription)"
        }
    }
    
    func fetchTopRatedMovies() async {
        do {
            let movieResponse: MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .topRated))
            topRatedMovies = movieResponse.results
        } catch {
            errorMsg = "Erro: \(error.localizedDescription)"
        }
    }
    
    func fetchGenre() async {
        do {
            let response: GenreResponse = try await movieService.fetchData(api: .init(endpoint: .genre))
            genre = response.genres
            if let genre = genre.first {
                selectedGenre = genre
//                await fetchMoviesForSelectedGenre()
            }
        } catch {
            errorMsg = "Error: \(error.localizedDescription)"
        }
    }
    
    func fetchMoviesForSelectedGenre() async {
        do {
            let api = ApiConstructor(endpoint: .discoverMovies, params: ["with_genres" : "\(selectedGenre.id)"])
            let response: MovieResponse = try await movieService.fetchData(api: api)
            moviesForSelectedGenre = response.results
        } catch  {
            errorMsg = "Error: \(error)"
        }
    }
}
