//
//  GenreCard.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 26/12/23.
//

import SwiftUI

struct GenreCard: View {
    
    let genre: Genre
    let namespace: Namespace.ID
    @Binding var selectedGenre: Genre
    
    var body: some View {
        Text(genre.name)
            .font(.system(size: 18, weight: genre.id == selectedGenre.id ? .bold : .medium))
            .foregroundStyle(Color.theme.accent)
            .background(
                ZStack {
                    if selectedGenre.id == genre.id {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.theme.accent)
                            .frame(height: 1)
                            .offset(y: 20)
                            .matchedGeometryEffect(id: "GenreCard", in: namespace)
                    }
                }
            )
            .padding()
    }
}

#Preview {
    GenreCard(genre: DeveloperPreview.instance.genre,namespace: Namespace().wrappedValue, selectedGenre: .constant(DeveloperPreview.instance.genre))
}
