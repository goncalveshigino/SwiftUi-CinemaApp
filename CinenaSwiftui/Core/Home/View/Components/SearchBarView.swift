//
//  SearchBarView.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 24/12/23.
//

import SwiftUI
import Combine

final class searchViewModel: ObservableObject {
    
    @Published private(set) var filteredMovies: [Movie] = []
    @Published var searchText = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    var isSearching: Bool {
        !searchText.isEmpty
    }
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        $searchText
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .sink { [weak self] searchText in
                self?.filterMovies(searchText: searchText)
            }
            .store(in: &cancellables)
    }
    
    private func filterMovies(searchText: String) {
        guard searchText.isNotEmpty else {
            filteredMovies = []
            return
        }
        
        //let search = searchText.lowercased()
        
    }
}

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
            .fill(Color.theme.searchColor)
            .shadow(
                color: Color.theme.accent.opacity(0.15),
                radius: 10, x: 0, y: 0)
        )
        .padding(.horizontal, 5)
    }
}

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
