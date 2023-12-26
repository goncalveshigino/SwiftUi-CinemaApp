//
//  String.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 24/12/23.
//

import Foundation


extension String {
    var capitallizeFirstLetter: String {
        if self.count == 0 { return self }
        return prefix(1).uppercased() + dropFirst()
    }
}
