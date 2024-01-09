//
//  ActorCard.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 07/01/24.
//

import SwiftUI

struct ActorCard: View {
    
    let cast: Cast
    var type: MovieCardType = .grid
    var imageType: MovieImageType = .poster
    
    var body: some View {
        VStack {
            DownloadImageView(url: cast.getImageActor(for: imageType), key: "\(cast.id)",itemWidth: itemWidth, itemHeight: itemHeight)
            
            Text(cast.originalName)
            Text(cast.character)
                .bold()
        }
    }
}

extension ActorCard {
    var itemWidth: CGFloat {
        screenWith * type.widthPercent
    }
    
    var itemHeight: CGFloat {
        screenHeight * type.heightPercent
    }
}


#Preview {
    ActorCard(cast: DeveloperPreview.instance.actor)
}

//AsyncImage(url: URL(string: vm.isSearching ? imageString : cast.getImageActor(for: imageType))) { image in
//    image
//        .resizable()
//        .scaledToFill()
//
//} placeholder: {
//    ZStack {
//        ProgressView()
//    }
//}
//.frame(width: itemWidth, height: itemHeight)
//.clipShape(RoundedRectangle(cornerRadius: 20))
//.shadow( color: Color.theme.background.opacity(0.3), radius: 10, x: 0, y: 2)
//}
