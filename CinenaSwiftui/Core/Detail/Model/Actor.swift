//
//  Actor.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 07/01/24.
//

import Foundation

struct ActorResponse:Identifiable, Codable {
    let id: Int
    let cast: [Cast]
}


struct Cast:Identifiable, Codable {
    let adult: Bool
    let gender, id: Int
    let knownForDepartment, name, originalName: String
    let popularity: Double
    let profilePath: String
    let castID: Int
    let character, creditID: String
    let order: Int

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case castID = "cast_id"
        case character
        case creditID = "credit_id"
        case order
    }
}


extension Cast {
    var imageUrlString: String {
        Constants.imageBaseUrl + profilePath
    }
    
    func getImageActor(for type: MovieImageType) -> String {
        return Constants.imageBaseUrl + profilePath
    }
}
