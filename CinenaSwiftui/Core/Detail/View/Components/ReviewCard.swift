//
//  ReviewCard.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 26/12/23.
//

import SwiftUI

struct ReviewCard: View {
    
    let review: Review
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                
                AsyncImage(url: URL(string: review.authorImage)) { image in
                    image
                        .resizable()
                } placeholder: {
                    ZStack {
                        Color.theme.secondaryText
                        
                        if let firstChart = review.authorName.first {
                            Text(String(firstChart))
                        }
                    }
                }
                .scaledToFill()
                .frame(width: 45, height: 45)
                .clipShape(Circle())
                
                Text(review.authorImage)
                    .font(.system(size: 16, weight: .medium))
            }
            
            Text(review.content)
            
            Divider()
        }
        .padding()
    }
}

#Preview {
    ReviewCard(review: DeveloperPreview.instance.mockReview)
}
