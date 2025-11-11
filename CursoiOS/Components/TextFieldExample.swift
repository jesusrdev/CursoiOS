//
//  TextFieldExample.swift
//  CursoiOS
//
//  Created by Jesus Rojas on 3/09/25.
//

import SwiftUI

struct TextFieldExample: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            
            TextField("Escribe tu email", text: $email)
                .keyboardType(.emailAddress)
                .padding()
                .background(.gray.opacity(0.15))
                .cornerRadius(16)
                .padding(.horizontal, 32)
                .onChange(of: email) { newValue in
                    print("El antiguo valor era \(email) y el nuevo es \(newValue)")
                }
            
            SecureField("Escribe tu password", text: $password)
                .keyboardType(.emailAddress)
                .padding()
                .background(.gray.opacity(0.15))
                .cornerRadius(16)
                .padding(.horizontal, 32)
                .onChange(of: email) { newValue in
                    print("El antiguo valor era \(email) y el nuevo es \(newValue)")
                }
        }
    }
}

struct TextFieldExample_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldExample()
    }
}
