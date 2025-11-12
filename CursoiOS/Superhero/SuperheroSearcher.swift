//
//  SuperheroSearcher.swift
//  CursoiOS
//
//  Created by Yisus on 12/11/25.
//

import SwiftUI

struct SuperheroSearcher: View {
    @State var superheroName: String = ""
    
    var body: some View {
        VStack {
            TextField("", text: $superheroName, prompt: Text("Search...").font(.title2).bold().foregroundColor(.gray))
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(16)
                .border(.purple, width: 1.5)
                .padding(8)
                .autocorrectionDisabled()
                .onSubmit {
                    print(superheroName)
                    
                    Task{
                        do{
                            let response = try await ApiNetwork().getHeroesByQuery(query: superheroName)
                            print(response)
                        }catch{
                            print("Error")
                        }
                    }
                }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundApp"))
    }
}

#Preview {
    SuperheroSearcher()
}
