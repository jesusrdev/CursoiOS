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
    
    var body: some View {
        VStack {
            Text("pepe")
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

struct IMCView_Previews: PreviewProvider {
    static var previews: some View {
        IMCView()
    }
}
