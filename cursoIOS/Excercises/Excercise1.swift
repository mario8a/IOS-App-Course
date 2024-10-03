//
//  ContentView.swift
//  cursoIOS
//
//  Created by Mario Abraham Ochoa Tovar on 31/08/24.
//

import SwiftUI

struct Excercise1: View {
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .foregroundColor(.blue)
                Rectangle()
                    .foregroundColor(.orange)
                Rectangle()
                    .foregroundColor(.yellow)
            }.frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            Rectangle()
                .foregroundColor(.orange)
                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            HStack {
                Circle().foregroundColor(.green)
                Rectangle()
                Circle().foregroundColor(.indigo)
            }.frame(height: 250)
            Rectangle()
                .foregroundColor(.orange)
                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            HStack {
                Rectangle()
                    .foregroundColor(.blue)
                Rectangle()
                    .foregroundColor(.orange)
                Rectangle()
                    .foregroundColor(.yellow)
            }.frame(height: 100)
            
        }
        .background(.red)
        .padding()
    }
}

#Preview {
    Excercise1()
}
