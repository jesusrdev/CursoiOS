//
//  ButtonExample.swift
//  CursoiOS
//
//  Created by Jesus Rojas on 3/09/25.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        VStack {
                
            Button("Hola") {
                print("Holiwi")
            }
            
            Button {
                print("Holiwi")
            } label: {
                Text("Hola")
                    .frame(width: 100, height: 50)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

        }
    }
}

struct ButtonExample_Previews: PreviewProvider {
    static var previews: some View {
        ButtonExample()
    }
}
