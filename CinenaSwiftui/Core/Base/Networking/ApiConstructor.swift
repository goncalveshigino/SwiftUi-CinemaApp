//
//  ApiConstructor.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 25/12/23.
//

import Foundation

typealias Paramenters = [String:String]


struct ApiConstructor {
    let endpoint: Endpoint
    var params: Paramenters = [:]
}
