//
//  CustomImageView.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 25/12/23.
//

import SwiftUI

struct CustomImageView: View {
    
    let itemWidth: CGFloat
    let itemHeight: CGFloat
    let movie: Movie
    var imageType: MovieImageType = .poster
    var imageString: String = ""
    
    @StateObject var vm = HomeViewModel()
    
    var body: some View {
        AsyncImage(url: URL(string: vm.isSearching ? imageString : movie.getImage(for: imageType))) { image in
            image
                .resizable()
                .scaledToFill()
              
        } placeholder: {
            ZStack {
                ProgressView()
            }
        }
        .frame(width: itemWidth, height: itemHeight)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow( color: Color.theme.background.opacity(0.3), radius: 10, x: 0, y: 2)
    }
}

#Preview {
    CustomImageView(itemWidth: 150, itemHeight: 170, movie: DeveloperPreview.instance.movie)
}
