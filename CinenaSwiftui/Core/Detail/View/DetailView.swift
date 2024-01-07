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
            return "Sobre o filme"
        case .review:
            return "Avaliações"
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
            VStack {
                
                header
                    .ignoresSafeArea()
            
                ScrollView {
                  
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "calendar")
                            Text(viewModel.movie.releaseDate)
                            Text(" | ")
                            Image(systemName: "calendar")
                            Text("\(viewModel.movie.voteCount ?? 0)")
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
                            VStack(alignment: .leading) {
                                Text(viewModel.movie.overview)
                                    .foregroundStyle(Color.theme.textColor)
                                    .lineLimit(showFullDescription ? nil : 2)
                              
                                if viewModel.movie.overview.isNotEmpty {
                                    readMoreAndLess
                                }
                            }
                         
                            
                        case .review:
                            ForEach(viewModel.reviews) { review in
                                ReviewCard(review: review)
                                    .foregroundStyle(Color.theme.textColor)
                            
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Participantes")
                                .font(.system(size: 16, weight: .bold))
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack {
                                    ForEach(viewModel.actorsMovies) { actor in
                                       ActorCard(cast: actor)
                                    }
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
                        .padding(.bottom)
                }
                .padding()
                    
                    Spacer()
                }
                .foregroundStyle(Color.theme.accent)
                .padding(.top, contentOffset)
                .task {
                    await viewModel.fetchReviews()
                    await viewModel.fetchSimilar()
                    await viewModel.fetchActors()
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
            ZStack {
                
                CustomImageView(itemWidth: screenWith, itemHeight: posterImageHeight, movie: viewModel.movie)
                   
                    
          
                VStack {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(Color.blue)
                        .frame(width: 10)
                        .onTapGesture {
                            dismiss()
                        }
                        .padding(10)
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                }
                .padding(.trailing, 320)
                .padding(.bottom, 170)
                        
                
                
            }
            
            HStack {
                CustomImageView(itemWidth: backdropImageSize, itemHeight: backdropImageSize, movie: viewModel.movie, imageType: .backdrop)
                    .shadow(
                        color: Color.theme.accent.opacity(0.5),
                        radius: 10, x: 0, y: 1
                    )
                    .offset(y: 190)
                
                Text(viewModel.movie.title)
                    .minimumScaleFactor(0.5)
                    .offset(y: titleOffset)
                    
            }
            .padding()
            .foregroundStyle(Color.theme.accent)
           
        }
    }
    
    var posterImageHeight: CGFloat {
        screenHeight * 0.4
    }
    
    var backdropImageSize: CGFloat {
        screenHeight * 0.2
    }
    
    var backdropImageOffset: CGFloat {
        screenHeight * 0.25
    }
    
    var titleOffset: CGFloat {
        screenHeight * 0.26
    }
    
    var contentOffset: CGFloat {
        screenHeight * 0.10
    }
}
