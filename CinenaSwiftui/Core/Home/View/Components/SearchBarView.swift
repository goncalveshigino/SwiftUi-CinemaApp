//
//  SearchBarView.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 24/12/23.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
          
            
            TextField("Search", text: $searchText)
                .foregroundStyle(Color.theme.accent)
                .disableAutocorrection(true)
                .overlay(
                  Image(systemName: "xmark.circle.fill")
                    .padding()
                    .offset(x: 10)
                    .foregroundStyle(Color.theme.accent)
                    .opacity(searchText.isEmpty ? 0.0 : 1.0)
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                        searchText = ""
                    },
                  alignment: .trailing
                )
            
            Image(systemName: "magnifyingglass")
                .foregroundStyle(
                    searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accent
                )
        }
        .font(.headline)
        .padding()
        .background(
           RoundedRectangle(cornerRadius: 20)
            .fill(Color.theme.secondaryText)
            .shadow(
                color: Color.theme.accent.opacity(0.15),
                radius: 10, x: 0, y: 0)
        )
        .padding()
        
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
