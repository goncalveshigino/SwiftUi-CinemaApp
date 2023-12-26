//
//  Optionl.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 24/12/23.
//

import Foundation

extension Optional where Wrapped == String {
    var stringValue: String {
        guard let self = self else { return ""}
        return self
    }
}
