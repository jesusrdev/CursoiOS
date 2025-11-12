//
//  ApiNetwork.swift
//  CursoiOS
//
//  Created by Yisus on 12/11/25.
//

import Foundation

let accessToken = "05029e9049a41dfa20aff6b5764be273" // Use your acces token

class ApiNetwork {
    
    struct Wrapper: Codable {
        let response: String
        let results: [Superhero]
    }
    
    struct Superhero: Codable {
        let id: String
        let name: String
    }
    
    func getHeroesByQuery(query: String) async throws -> Wrapper {
        let url = URL(string: "https://superheroapi.com/api/\(accessToken)/search/\(query)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        return wrapper
    }
}
