//
//  MovieCard.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 25/12/23.
//

import SwiftUI

struct MovieCard: View {
    
    let movie: Movie
    var type: MovieCardType = .poster
    
    var body: some View {
        CustomImageView(itemWidth: itemWidth, itemHeight: itemHeight, movie: movie)
    }
}

extension MovieCard {
    var itemWidth: CGFloat {
        screenWith * type.widthPercent
    }
    
    var itemHeight: CGFloat {
        screenHeight * type.heightPercent
    }
}

#Preview {
    MovieCard(movie: DeveloperPreview.instance.movie)
}
