//
//  ImageExample.swift
//  cursoIOS
//
//  Created by Mario Abraham Ochoa Tovar on 31/08/24.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image("swiftui")
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
        Image(systemName: "figure.walk")
            .resizable()
    }
}

#Preview {
    ImageExample()
}

// scaledToFill() se estira hasta que cumpla la altura necesario, ocupa todo lo que pueda
// scaledToFit se centra en encajar en el huequito que tiene
