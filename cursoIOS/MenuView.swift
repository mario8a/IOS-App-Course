//
//  MenuView.swift
//  cursoIOS
//
//  Created by Mario Abraham Ochoa Tovar on 01/09/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack{
            List {
                NavigationLink(destination: IMCView()) {
                    Text("IMC Calculator")
                }
                NavigationLink(destination: SuperherSearcher()) {
                    Text("Superhero finder")
                }
                
                NavigationLink(destination: FavPlaces()) {
                    Text("Fav places")
                }
                Text("App 3")
                Text("App 4")
            }
        }
    }
}

#Preview {
    MenuView()
}
