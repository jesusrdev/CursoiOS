//
//  LabelExample.swift
//  CursoiOS
//
//  Created by Jesus Rojas on 3/09/25.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        VStack {
    //        Label("WELCOME", image: "otarui")
            Label("WELCOME", systemImage: "figure.badminton")
            Label(
                title: { Text("Label") },
                icon: { Image("otarui")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 200)
                }
            )
        }
    }
}

struct LabelExample_Previews: PreviewProvider {
    static var previews: some View {
        LabelExample()
    }
}
