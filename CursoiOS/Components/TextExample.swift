//
//  TextExample.swift
//  CursoiOS
//
//  Created by Jesus Rojas on 29/08/25.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.headline)
            Text("Custom")
                .font(.system(size: 40, weight: .bold, design: .monospaced))
                .italic()
                .underline()
                .foregroundColor(.blue)
                .background(.red)
            Text("aris aris aris aris aris")
                .frame(width: 50)
                .lineLimit(3)
                .lineSpacing(10)
        }
    }
}

struct TextExample_Previews: PreviewProvider {
    static var previews: some View {
        TextExample()
    }
}
