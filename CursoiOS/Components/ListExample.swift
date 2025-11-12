//
//  ListExample.swift
//  CursoiOS
//
//  Created by Yisus on 12/11/25.
//

import SwiftUI

var pokemons = [
    Pokemon(name: "Pikachu"),
    Pokemon(name: "Charmander"),
    Pokemon(name: "Charmilion"),
    Pokemon(name: "Charizard")
]

var digimons = [
    Digimon(id: UUID(), name: "Agumon"),
    Digimon(id: UUID(), name: "Graymon"),
    Digimon(id: UUID(), name: "Supermon"),
    Digimon(id: UUID(), name: "Supermon")
]

struct ListExample: View {
    var body: some View {
//        List {
//            Text("Prueba")
//            Text("Prueba")
//            Text("Prueba")
//        }
        
//        List {
//            ForEach(pokemons, id: \.name) { pokemon in
//                Text(pokemon.name)
//            }
//        }
        
//        List(digimons) {digimon in
//            Text(digimon.name)
//        }
        
        List {
            Section(header: Text("Pokemons")) {
                ForEach(pokemons, id: \.name) { pokemon in
                    Text(pokemon.name)
                }
            }
            
            Section(header: Text("Digimons")) {
                ForEach(digimons) { digimon in
                    Text(digimon.name)
                }
            }
        }
        .listStyle(.automatic)
    }
}

struct Pokemon {
    let name: String
}

struct Digimon: Identifiable {
    var id: UUID
    let name: String
}

#Preview {
    ListExample()
}
