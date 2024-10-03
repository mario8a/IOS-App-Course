//
//  ButtonExample.swift
//  cursoIOS
//
//  Created by Mario Abraham Ochoa Tovar on 01/09/24.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Button("Hola") {
            print("Jolaaaa")
        }
        Button(action: {print("Jolaaaa")}, label: {
            Text("Holaa")
                .frame(width: 100, height: 50)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
        })
    }
}

struct Counter: View {
    @State var suscribersNumber = 0
    var body: some View {
        Button(action: {
            suscribersNumber += 1
        }, label: {
            Text("Suscribete: \(suscribersNumber)")
                .bold()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .frame(height: 50)
                .foregroundColor(.white)
                .background(.red)
                .cornerRadius(10)
        })
    }
}

#Preview {
    Counter()
}
