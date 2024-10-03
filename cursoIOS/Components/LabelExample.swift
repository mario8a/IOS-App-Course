//
//  LabelExample.swift
//  cursoIOS
//
//  Created by Mario Abraham Ochoa Tovar on 01/09/24.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        Label("HOLA SOY MA", image: "swiftui")
        Label("SUScrib", systemImage: "figure.wave")
        Label(
            title: { /*@START_MENU_TOKEN@*/Text("Label")/*@END_MENU_TOKEN@*/ },
            icon: { Image("swiftui")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30) }

        )
    }
}

#Preview {
    LabelExample()
}
