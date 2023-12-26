//
//  DetailView.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 26/12/23.
//

import SwiftUI

enum DetailViewSection: String {
    case about, review
    
    var rawValue: String {
        switch self {
        case .about:
            return "About Movie"
        case .review:
            return "Reviews"
        }
    }
}

struct DetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel: DetailViewModel
    @Namespace var namespace
    @State var showFullDescription: Bool = false
    
    init(movie: Movie) {
        _viewModel = StateObject(wrappedValue: DetailViewModel(movie: movie))
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                header
                    .ignoresSafeArea()
            
                VStack {
                    HStack {
                        Image(systemName: "calendar")
                        Text("2000")
                        Text(" | ")
                        Image(systemName: "calendar")
                        Text("18282 Minutos")
                        Text(" | ")
                        Image(systemName: "calendar")
                        Text("Action")
                    }
                    .foregroundStyle(Color.theme.secondaryText)
                    .frame(maxWidth: .infinity)
                    
                    HStack {
                        ForEach(viewModel.sections, id: \.self) { section in
                            DetailSectionCard(section: section, namespace: namespace, selectedSection: $viewModel.selectedSection)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        viewModel.selectedSection = section
                                    }
                                }
                        }
                    }
                    
                    switch viewModel.selectedSection {
                    case .about:
                        Text(viewModel.movie.overview)
                            .padding()
                            .lineLimit(showFullDescription ? nil : 2)
                      
                        if viewModel.movie.overview.isNotEmpty {
                            readMoreAndLess
                        }
                        
                    case .review:
                        ScrollView(showsIndicators: false) {
                            ForEach(viewModel.reviews) { review in
                                ReviewCard(review: review)
                                    .lineLimit(showFullDescription ? nil : 2)
                                
                                readMoreAndLess
                                   
                            }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Recomendacoes")
                            .font(.system(size: 16, weight: .bold))
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(viewModel.similarMovies) { movie in
                                    SimilarCard(movie: movie)
                                }
                            }
                          
                        }
                    }
                    .padding()
                    
                    Spacer()
                }
                .foregroundStyle(Color.theme.accent)
                .padding(.top, contentOffset)
                .task {
                    await viewModel.fetchReviews()
                    await viewModel.fetchSimilar()
                }
            }
        }
    }
}
    

#Preview {
    NavigationStack {
        DetailView(movie: DeveloperPreview.instance.movie)
    }
}

private extension DetailView {
    
    var readMoreAndLess: some View {
        Button {
            withAnimation(.easeInOut) {
                showFullDescription.toggle()
            }
        } label: {
            Text(showFullDescription ? "Less" : "Read more...")
                .font(.caption)
                .bold()
                .padding(.vertical, 4)
                .foregroundStyle(Color.blue)
        }
       
    }
    
    
    var header: some View {
        ZStack(alignment: .leading) {
            ZStack(alignment: .top) {
                
                CustomImageView(itemWidth: screenWith, itemHeight: posterImageHeight, movie: viewModel.movie)
                   
                    
                Image(systemName: "chevron.left")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(Color.white)
                    .frame(width: 10)
                    .onTapGesture {
                        dismiss()
                    }
                    .padding(.top, 60)
                    .padding(.trailing, 320)
                
            }
            
            HStack {
                CustomImageView(itemWidth: backdropImageSize, itemHeight: backdropImageSize, movie: viewModel.movie, imageType: .backdrop)
                    .shadow(
                        color: Color.theme.accent.opacity(0.15),
                        radius: 10, x: 0, y: 1
                    )
                
                Text(viewModel.movie.title)
                    .minimumScaleFactor(0.5)
                    .padding(.top, titleOffset)
            }
            .padding()
            .offset(y: backdropImageOffset)
        }
    }
    
    var posterImageHeight: CGFloat {
        screenHeight * 0.5
    }
    
    var backdropImageSize: CGFloat {
        screenHeight * 0.20
    }
    
    var backdropImageOffset: CGFloat {
        screenHeight * 0.25
    }
    
    var titleOffset: CGFloat {
        screenHeight * 0.05
    }
    
    var contentOffset: CGFloat {
        screenHeight * 0.10
    }
}
