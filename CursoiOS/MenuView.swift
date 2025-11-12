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
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
