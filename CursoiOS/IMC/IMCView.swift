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
    @State var height: Double = 150
    @State var age: Int = 18
    @State var weight: Int = 70
    
    var body: some View {
        VStack {
            HStack{
                ToggleButton(text: "Hombre", imageName: "heart.fill", gender: 0, selectedGender: $gender)
                ToggleButton(text: "Mujer", imageName: "star.fill", gender: 1, selectedGender: $gender)
            }
            HeightCalculator(selectedHeight: $height)
            HStack {
                CounterButton(title: "Edad", value: $age)
                CounterButton(title: "Peso", value: $weight)
            }
            
            IMCCalculateButton(userWeight: Double(weight), userHeight: height)
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

struct TitleText: View {
    let text: String
    
    var body: some View {
        Text(text).font(.title2).foregroundColor(.gray)
    }
}

struct HeightCalculator: View {
    
    @Binding var selectedHeight: Double
    
    var body: some View {
        VStack {
            TitleText(text: "Altura")
            InformationText(text: "\(Int(selectedHeight)) cm")
            Slider(value: $selectedHeight, in: 100...220, step: 1)
                .accentColor(.purple)
                .padding(.horizontal, 16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundComponent"))
    }
}

struct CounterButton: View {
    let title: String
    
    @Binding var value: Int
    
    var body: some View {
        VStack {
            TitleText(text: title)
            InformationText(text: "\(value)")
            
            HStack {
                Button(action: {
                    if(value > 0) {
                        value -= 1
                    }
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.purple)
                        Image(systemName: "minus")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                    }
                }
                .disabled(value <= 0)
                
                Button(action: {
                    if(value < 100) {
                        value += 1
                    }
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(.purple)
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                    }
                }
                .disabled(value >= 100)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundComponent"))
    }
}

struct IMCCalculateButton: View {
    let userWeight: Double
    let userHeight: Double
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: {IMCResult(userWeight: userWeight, userHeight: userHeight)}) {
                Text("Calcular")
                    .font(.title)
                    .bold()
                    .foregroundColor(.purple)
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .background(Color("BackgroundComponent"))
            }
        }
    }
}

struct IMCView_Previews: PreviewProvider {
    static var previews: some View {
        IMCView()
    }
}
