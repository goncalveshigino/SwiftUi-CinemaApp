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
    let secondaryText = Color("SecondoText")
    let searchColor = Color("SearchColor")
    let textColor = Color("TextColor")
    let iconColor = Color("IconColor")
}
