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
    
    var body: some View {
        VStack {
            CustomImageActor(itemWidth: itemWidth, itemHeight: itemHeight, cast: cast)
            
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
