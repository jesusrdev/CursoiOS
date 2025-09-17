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
            VStack {
//                NavigationLink {
//
//                } label: {
//                    Text("IMC Calculator")
//                }
//
                NavigationLink(destination: MenuView()) {
                    Text("IMC Calculator")
                }
                
                Text("App 2")
                Text("App 3")
                Text("App 4")
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
