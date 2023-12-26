//
//  Color.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 24/12/23.
//

import Foundation
import SwiftUI


extension Color {
    
    static let theme = ColorTheme()
}


struct ColorTheme {
    
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let secondaryText = Color("secondoText")
    let searchColor = Color("searchColor")
}
