//
//  DetailSectionCard.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 26/12/23.
//

import SwiftUI

struct DetailSectionCard: View {
    
    let section: DetailViewSection
    let namespace: Namespace.ID
    @Binding var selectedSection: DetailViewSection
    
    var body: some View {
        Text(section.rawValue)
            .font(.system(size: 16, weight: .medium))
            .background(
                ZStack {
                    if section == selectedSection {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 1)
                            .offset(y: 20)
                            .matchedGeometryEffect(id: "DetailSectionCard", in: namespace)
                    }
                }
            )
            .padding()
    }
}

#Preview {
    DetailSectionCard(section: .about, namespace: Namespace().wrappedValue, selectedSection: .constant(.about))
}
