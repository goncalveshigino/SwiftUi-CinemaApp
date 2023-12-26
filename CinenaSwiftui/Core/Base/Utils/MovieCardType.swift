//
//  MovieCardType.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 25/12/23.
//

import Foundation

enum MovieCardType {
    case poster, grid
}


extension MovieCardType {
    var widthPercent: Double {
        switch self {
        case .poster:
            return 0.50
        case .grid:
           return 0.30
        }
    }
    
    var heightPercent: Double {
        switch self {
        case .poster:
            return 0.32
        case .grid:
           return 0.20
        }
    }

}
