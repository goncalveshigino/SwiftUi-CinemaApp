//
//  searchCard.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 27/12/23.
//

import SwiftUI

struct SearchCard: View {
    
    let movie: Movie
    var type: MovieCardType = .search
    
    var body: some View {
        HStack(spacing: 20) {
            CustomImageView(itemWidth: itemWidth, itemHeight: itemHeight, movie: movie)
                .shadow(
                    color: Color.theme.accent.opacity(0.5),
                    radius: 10, x: 0, y: 1
                )
            
            VStack {
                Text(movie.originalTitle)
                    .bold()
                    .foregroundStyle(Color.theme.textColor)
                
                Divider()
                
                Text(movie.title)
                    .font(.caption)
                    .foregroundStyle(Color.theme.secondaryText)
            
               Spacer()

            }
            .frame(width: 150, height: 170)
        }
    }
}

extension SearchCard {
    var itemWidth: CGFloat {
        screenWith * type.widthPercent
    }
    
    var itemHeight: CGFloat {
        screenHeight * type.heightPercent
    }
}

#Preview {
    SearchCard(movie: DeveloperPreview.instance.movie)
}




