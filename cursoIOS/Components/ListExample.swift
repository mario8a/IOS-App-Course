//
//  ListExample.swift
//  cursoIOS
//
//  Created by Mario Abraham Ochoa Tovar on 01/09/24.
//

import SwiftUI

var pokemons = [
    Pokemon(name: "Pikachi"),
    Pokemon(name: "Charmander"),
    Pokemon(name: "Charizadr"),
    Pokemon(name: "Charmilion")
]

var digimons = [
    Digimon(name: "Agumon"),
    Digimon(name: "puchamon"),
    Digimon(name: "alomon"),
    Digimon(name: "supoermon"),
    Digimon(name: "supoermon"),
    Digimon(name: "carlomon")
    
]

struct ListExample: View {
    var body: some View {
        //        List() {
        //            Text("Prueba")
        //            Text("Prueba")
        //        }
        //        List{
        //            ForEach(pokemons, id: \.name) { pokemon in
        //                Text(pokemon.name)
        //            }
        //        }
        //
        //        List(digimons) { digimons in
        //            Text(digimons.name)
        //        }
        //        List{
        //            ForEach(digimons) { digimons in
        //                Text(digimons.name)
        //            }
        //        }
        List{
            Section(header: Text("Pokemons")){
                ForEach(pokemons, id: \.name) { pokemon in
                    Text(pokemon.name)
                }
            }
            Section(header: Text("Digimons")){
                ForEach(digimons) { digimons in
                    Text(digimons.name)
                }
            }
        }.listStyle(.insetGrouped)
    }
}
struct Pokemon {
    let name: String
}

struct Digimon: Identifiable {
    var id = UUID()
    let name: String
}

#Preview {
    ListExample()
}
