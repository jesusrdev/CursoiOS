//
//  IMCView.swift
//  CursoiOS
//
//  Created by Jesus Rojas on 17/09/25.
//

import SwiftUI

struct IMCView: View {
    // Form 1 to create to change the color of a toolbar
//    init() {
//        UINavigationBar.appearance()
//            .titleTextAttributes = [.foregroundColor:UIColor.white]
//    }
    
    @State var gender: Int = 0
    
    var body: some View {
        VStack {
            HStack{
                ToggleButton(text: "Hombre", imageName: "heart.fill", gender: 0, selectedGender: $gender)
                ToggleButton(text: "Hombre", imageName: "star.fill", gender: 1, selectedGender: $gender)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundApp"))
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("IMC Calculator").bold().foregroundColor(.white)
                }
            }
//            .navigationBarBackButtonHidden()
//            .navigationTitle("IMC Calculator")
    }
}

struct ToggleButton: View {
    let text: String
    let imageName: String
    let gender: Int
    
    @Binding var selectedGender: Int
    
    
    var body: some View {
        let color = gender == selectedGender ? Color("BackgroundComponentSelected") : Color("BackgroundComponent")
        
        Button(action: {
            selectedGender = gender
        }) {
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundColor(.white)
                InformationText(text: text)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(color)
        }
    }
}

struct InformationText: View {
    let text: String
    
    var body: some View {
        Text(text).font(.largeTitle).bold().foregroundColor(.white)
    }
}

struct IMCView_Previews: PreviewProvider {
    static var previews: some View {
        IMCView()
    }
}
