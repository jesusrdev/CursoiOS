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
    
    struct Superhero: Codable, Identifiable {
        let id: String
        let name: String
        let image: Image
    }
    
    struct Image: Codable {
        let url: String
    }
    
    struct SuperheroCompleted: Codable {
        let id: String
        let name: String
        let image: Image
        let powerstats: PowerStats
        let biography: Biography
    }
    
    struct PowerStats: Codable {
        let intelligence: String
        let strength: String
        let speed: String
        let durability: String
        let power: String
        let combat: String
    }
    
    struct Biography:Codable{
        let alignment:String
        let publisher:String
        let aliases:[String]
        let fullName:String
        
        enum CodingKeys:String, CodingKey{
            case fullName = "full-name"
            case alignment = "alignment"
            case publisher = "publisher"
            case aliases = "aliases"
        }
    }
    
    func getHeroesByQuery(query: String) async throws -> Wrapper {
        let url = URL(string: "https://superheroapi.com/api/\(accessToken)/search/\(query)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        return wrapper
    }
    
    func getHeroById(id: String) async throws -> SuperheroCompleted {
        let url = URL(string: "https://superheroapi.com/api/\(accessToken)/\(id)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(SuperheroCompleted.self, from: data)
    }
}
