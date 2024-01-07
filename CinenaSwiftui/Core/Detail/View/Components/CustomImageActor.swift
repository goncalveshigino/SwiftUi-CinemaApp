//
//  CustomImageActor.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 07/01/24.
//

import SwiftUI



struct CustomImageActor: View {
    
    let itemWidth: CGFloat
    let itemHeight: CGFloat
    let cast: Cast
    var imageType: MovieImageType = .poster
    var imageString: String = ""
    
    @StateObject var vm = HomeViewModel()
    
    var body: some View {
        AsyncImage(url: URL(string: vm.isSearching ? imageString : cast.getImageActor(for: imageType))) { image in
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

//#Preview {
//  
//}

