//
//  HomeView.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 24/12/23.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    
    @StateObject private var viewModel = HomeViewModel()
    @Namespace var namespace
   
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("O que deseja assistir?")
                        .foregroundStyle(Color.theme.accent)
                        .font(.system(size: 20, weight: .bold))
                        .padding(.leading)
                    
                    Spacer()
                    
                    Image(systemName: isDarkMode ? "sun.max.fill" : "moon.fill")
                        .foregroundStyle(Color.theme.iconColor)
                        .font(.system(size: 20, weight: .bold))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 1)) {
                                self.isDarkMode.toggle()
                            }
                        }
                }
                
                SearchBarView(searchText: $viewModel.searchText)
                
                Text(viewModel.isSearching ? "" : "Filmes da semana")
                    .font(.system(size: 18, weight: .medium ))
                    .foregroundStyle(Color.theme.accent)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.isSearching ? [] : viewModel.trendingMovies) { movie in
                            MovieCard(movie: movie)
                                .onTapGesture {
                                    viewModel.selectedMovie = movie
                                }
                        }
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.isSearching ? [] : viewModel.genre) { genre in
                            GenreCard(genre: genre, namespace: namespace, selectedGenre: $viewModel.selectedGenre)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        viewModel.selectedGenre = genre
                                        Task {
                                            await viewModel.fetchMoviesForSelectedGenre()
                                        }
                                    }
                                }
                        }
                    }
                }
                
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach( viewModel.isSearching ? [] : viewModel.moviesForSelectedGenre) { movie in
                        MovieCard(movie: movie, type: .grid)
                            .onTapGesture {
                                viewModel.selectedMovie = movie
                            }
                    }
                }
                
                
                VStack(spacing: 20) {
                    ForEach( viewModel.isSearching ? viewModel.filteredMovies : [] ) { movie in
                        SearchCard(movie: movie, type: .search)
                            .onTapGesture {
                                viewModel.selectedMovie = movie
                            }
                    }
                }
                .padding(.leading)
                
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .padding()
        .background(Color.theme.background)
        .fullScreenCover(item: $viewModel.selectedMovie) { movie in
            DetailView(movie: movie)
        }
        .task {
            await viewModel.fetchTrendingMovies()
            await viewModel.fetchTopRatedMovies()
            await viewModel.fetchGenre()
            await viewModel.fetchMoviesForSelectedGenre()
        }
    }
}



#Preview {
    NavigationStack {
        HomeView()
    }
}
