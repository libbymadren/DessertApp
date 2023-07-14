//
//  APIService.swift
//  DessertApp
//
//  Created by Libby Madren on 7/11/23.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case decodingError
    
    var description: String {
        switch self {
            case .badRequest:
                return "Sorry, something went wrong with this request. Please try again later."
            case .decodingError:
                return "Sorry, an error has occurred. Please try again later."
        }
    }
       
}

class APIService {
    func get<T: Decodable>(url: URL, parse: (Data) -> T?) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        if (response as? HTTPURLResponse)?.statusCode != 200 {
            throw NetworkError.badRequest
        }
        
        guard let result = parse(data) else {
            throw NetworkError.decodingError
        }
        
        return result
    }
}
