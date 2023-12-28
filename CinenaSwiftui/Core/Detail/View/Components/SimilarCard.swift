//
//  SimilarCard.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 26/12/23.
//

import SwiftUI

struct SimilarCard: View {
    
    let movie: Movie
    var type: MovieCardType = .grid
    
    var body: some View {
        CustomImageView(itemWidth: itemWidth, itemHeight: itemHeight, movie: movie)
    }
}

extension SimilarCard {
    var itemWidth: CGFloat {
        screenWith * type.widthPercent
    }
    
    var itemHeight: CGFloat {
        screenHeight * type.heightPercent
    }
}

#Preview {
    SimilarCard(movie: DeveloperPreview.instance.movie)
}
