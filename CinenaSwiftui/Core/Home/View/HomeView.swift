//
//  HomeView.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 24/12/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var searchText: String = ""
    @StateObject private var viewModel = HomeViewModel()
    @Namespace var namespace
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("O que voce quer assistir?")
                        .foregroundStyle(Color.theme.accent)
                        .font(.system(size: 20, weight: .bold))
                        .padding(.leading)
                    
                    Spacer()
                    
                    Image(systemName: "moon.fill") //moon.fill
                        .foregroundStyle(Color.theme.accent)
                        .font(.system(size: 20, weight: .bold))
                }
                
                SearchBarView(searchText: $searchText)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.trendingMovies) { movie in
                            MovieCard(movie: movie)
                                .onTapGesture {
                                    viewModel.selectedMovie = movie
                                }
                        }
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.genre) { genre in
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
                    ForEach(viewModel.moviesForSelectedGenre) { movie in
                        MovieCard(movie: movie, type: .grid)
                    }
                }
            }
        }
        //.preferredColorScheme(.dark)
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
    HomeView()
}
