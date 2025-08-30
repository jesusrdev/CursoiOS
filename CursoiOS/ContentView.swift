//
//  ContentView.swift
//  CursoiOS
//
//  Created by Jesus Rojas on 28/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .foregroundColor(.blue)
                Rectangle()
                    .foregroundColor(.orange)
                Rectangle()
                    .foregroundColor(.yellow)
            }
            
            Rectangle()
                .foregroundColor(.orange)
            
            HStack {
                Circle()
                    .foregroundColor(.green)
                Rectangle()
                    .frame(height: 300)
                Circle()
                    .foregroundColor(.indigo)
            }
            
            Rectangle()
                .foregroundColor(.orange)
            
            HStack {
                Rectangle()
                    .foregroundColor(.blue)
                Rectangle()
                    .foregroundColor(.orange)
                Rectangle()
                    .foregroundColor(.yellow)
            }
        }
        .background(.red)
        .padding(.vertical)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
