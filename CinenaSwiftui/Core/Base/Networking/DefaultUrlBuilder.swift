//
//  DefaultUrlBuilder.swift
//  CinenaSwiftui
//
//  Created by Goncalves Higino on 25/12/23.
//

import Foundation

enum DefaultUrlBuilderError: Error {
    case invalidPath, invalidUrl
}

enum DefaultUrlBuilder {
    
    static func build(api: ApiConstructor) throws -> URL {
        guard var urlComponents = URLComponents(string: api.endpoint.fullPath) else { throw DefaultUrlBuilderError.invalidPath}
        urlComponents.queryItems = buildQueryParams(api.params, ["api_key": Constants.apiKey])
        
        guard let url = urlComponents.url else {
            throw DefaultUrlBuilderError.invalidUrl
        }
        
        return url
    }
    
    static func buildQueryParams(_ params: Paramenters...) -> [URLQueryItem] {
        params.flatMap { $0 }.map { URLQueryItem(name: $0.key, value: $0.value)}
    }
    
}
