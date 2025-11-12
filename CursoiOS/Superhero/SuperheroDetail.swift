//
//  SuperheroDetail.swift
//  CursoiOS
//
//  Created by Yisus on 12/11/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperheroDetail: View {
    let id: String
    
    @State var superhero: ApiNetwork.SuperheroCompleted? = nil
    @State var loading: Bool = true
    
    var body: some View {
        VStack {
            if loading {
                ProgressView().tint(.white)
            } else if let superhero = superhero {
                WebImage(url: URL(string: superhero.image.url))
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    .clipped()
                Text(superhero.name)
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                ForEach(superhero.biography.aliases, id: \.self) { alias in
                    Text(alias)
                        .foregroundColor(.gray).italic()
                }
                
                Spacer()
            }
            
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundApp"))
            .onAppear {
                Task{
                    do{
                        superhero = try await ApiNetwork().getHeroById(id: id)
                    }catch{
                        
                    }
                    loading = false
                }
            }
    }
}

#Preview {
    SuperheroDetail(id: "70")
}
