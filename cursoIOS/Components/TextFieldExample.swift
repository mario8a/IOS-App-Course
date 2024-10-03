//
//  TextFieldExample.swift
//  cursoIOS
//
//  Created by Mario Abraham Ochoa Tovar on 01/09/24.
//

import SwiftUI

struct TextFieldExample: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        
        VStack {
            TextField("Escribe tu email", text: $email)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal, 32)
                .onChange(of: email) { oldValue, newValue in
                    print("El anterior valor es \(oldValue)")
                    print("El nuevo valor es \(newValue)")
            }
            SecureField("Escribe tu password", text: $password)
                .keyboardType(.default)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal, 32)
                .onChange(of: password) { oldValue, newValue in
                    print("El anterior valor es \(oldValue)")
                    print("El nuevo valor es \(newValue)")
            }
        }
    }
}

#Preview {
    TextFieldExample()
}

// Teclado en emulador: CMD + shift + K
