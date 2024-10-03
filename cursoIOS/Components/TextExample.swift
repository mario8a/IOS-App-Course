//
//  TextExample.swift
//  cursoIOS
//
//  Created by Mario Abraham Ochoa Tovar on 31/08/24.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).font(.headline)
            Text("Custom").font(.system(
                size: 40, weight: .light, design: .monospaced))
            .italic()
            .bold()
            .underline()
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .background(.red)
            
            Text("mario mario mario mario")
                .frame(width: 50)
                .lineLimit(3)
                .lineSpacing(12)
        }
        
    }
}

#Preview {
    TextExample()
}
