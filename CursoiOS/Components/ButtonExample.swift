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

struct Counter: View {
    @State var suscribersNumber = 0
    
    var body: some View {
        Button {
            suscribersNumber += 1
        } label: {
            Text("Suscriptores: \(suscribersNumber)")
                .bold()
                .font(.title)
                .padding(.horizontal,16)
                .frame(height: 70)
                .background(.red)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

struct ButtonExample_Previews: PreviewProvider {
    static var previews: some View {
        Counter()
    }
}
