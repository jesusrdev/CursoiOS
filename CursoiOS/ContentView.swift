//
//  ContentView.swift
//  CursoiOS
//
//  Created by Jesus Rojas on 28/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Horizontal
//        HStack {
        VStack {
            // Vertical
//            VStack {
//                Text("Pepe2")
//                Text("Pepe3")
//                    .bold()
//                    .frame(width: 100, height: 200)
//            }
            
            Rectangle()
                .foregroundColor(.red)
                .frame(height: 40)
            Rectangle()
                .foregroundColor(.red)
                .frame(height: 40)
                .padding(.bottom, 60)
            Rectangle()
                .foregroundColor(.red)
                .frame(height: 100)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
