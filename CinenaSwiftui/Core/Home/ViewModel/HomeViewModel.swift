//
//  HomeViewModel.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 25/12/23.
//

import Foundation
import Combine
import UserNotifications

struct UserDefaultStorage {
    static let userDefaults = UserDefaults.standard
}


@MainActor
final class HomeViewModel: ObservableObject {
    

    @Published private(set) var filteredMovies: [Movie] = []
    @Published var topRatedMovies: [Movie] = []
    @Published var trendingMovies: [Movie] = []
    @Published var moviesForSelectedGenre: [Movie] = []
    @Published var genre: [Genre] = []
    @Published var errorMsg = ""
    @Published var searchText = ""
    @Published var selectedGenre = DeveloperPreview.instance.genre
    @Published var selectedMovie: Movie? = nil
    
//    @Published private(set) var allMovies: [Movie] = []
 
   
    
    private var cancellables = Set<AnyCancellable>()
    
    private let movieService = MovieService()
    
    var isSearching: Bool {
        !searchText.isEmpty
    }
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        $searchText
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .sink { [weak self] (searchText) in
             var searchResult =  self?.filteredMovies(searchText: searchText)
            }
            .store(in: &cancellables)
    }
    
 
    
 
    private func filteredMovies(searchText: String) -> [Movie] {
        
        guard searchText.isNotEmpty else {
            filteredMovies = []
            return []
        }
        
        let movieInScope = moviesForSelectedGenre
        let search = searchText.lowercased()
        
        filteredMovies = movieInScope.filter({ movie in
            return movie.originalTitle.lowercased().contains(search)
        })
        return movieInScope
    }
    
  
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
                await fetchMoviesForSelectedGenre()
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
