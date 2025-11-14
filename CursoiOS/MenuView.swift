//
//  MenuView.swift
//  CursoiOS
//
//  Created by Jesus Rojas on 17/09/25.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: IMCView()) {
                    Text("IMC Calculator")
                }
                NavigationLink(destination: SuperheroSearcher()) {
                    Text("Superhero Searcher")
                }
                if #available(iOS 17.0, *) {
                    NavigationLink(destination: FavPlace()) {
                        Text("Fav Place")
                    }
                } else {
                    // Fallback on earlier versions
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
