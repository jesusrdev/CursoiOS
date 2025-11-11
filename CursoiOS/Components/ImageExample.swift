//
//  ImageExample.swift
//  CursoiOS
//
//  Created by Jesus Rojas on 1/09/25.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        VStack {
            Image("otarui")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 500)
            
            Image(systemName: "figure.walk")
                .resizable()
                .frame(width: 50, height: 50)
        }
    }
}

struct ImageExample_Previews: PreviewProvider {
    static var previews: some View {
        ImageExample()
    }
}
