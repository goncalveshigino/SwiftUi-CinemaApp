//
//  MovieCardType.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 25/12/23.
//

import Foundation

enum MovieCardType {
    case poster, grid, search
}


extension MovieCardType {
    var widthPercent: Double {
        switch self {
        case .poster:
            return 0.50
        case .grid:
           return 0.30
        case .search:
            return 0.3
        }
    }
    
    var heightPercent: Double {
        switch self {
        case .poster:
            return 0.32
        case .grid:
           return 0.20
        case .search:
            return 0.2
        }
    }

}
