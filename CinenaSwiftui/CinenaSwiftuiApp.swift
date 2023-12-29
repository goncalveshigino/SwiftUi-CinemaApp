//
//  CinenaSwiftuiApp.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 24/10/23.
//

import SwiftUI

@main
struct CinenaSwiftuiApp: App {
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                //.preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
