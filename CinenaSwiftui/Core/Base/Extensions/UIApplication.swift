//
//  UIApplication.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 24/12/23.
//

import SwiftUI


extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
