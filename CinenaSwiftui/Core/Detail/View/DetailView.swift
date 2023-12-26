//
//  DetailView.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 26/12/23.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel: DetailViewModel
    
    init(movie: Movie) {
        _viewModel = StateObject(wrappedValue: DetailViewModel(movie: movie))
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DetailView(movie: DeveloperPreview.instance.movie)
}
