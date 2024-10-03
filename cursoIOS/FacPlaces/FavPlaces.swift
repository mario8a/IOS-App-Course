//
//  FavPlaces.swift
//  cursoIOS
//
//  Created by Mario Abraham Ochoa Tovar on 03/09/24.
//

import SwiftUI
import MapKit

struct FavPlaces: View {
    
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.432008, longitude: -3.693750), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
    
    @State var places:[Place] = []
    @State var showPopUp:CLLocationCoordinate2D? = nil
    @State var name: String = ""
    @State var fav: Bool = false
    @State var showSheet = false
    
    let height = stride(from: 0.3, through: 0.3, by: 0.1).map{ PresentationDetent.fraction($0)}
    
    var body: some View {
        ZStack{
            MapReader{ proxy in
                Map(position: $position){
                    ForEach(places) { place in
                        Annotation(place.name, coordinate: place.coordinates) {
                            let color =  if place.fav {
                                Color.yellow
                            } else {
                                Color.black
                            }
                            Circle().stroke(color, lineWidth: 3).fill(.white).frame(width: 35, height: 35)
                        }
                    }
                }
                .onTapGesture { coord in
                    if let coordinates = proxy.convert(coord, from: .local) {
                        showPopUp = coordinates
                    }
                }
                .overlay{
                    VStack {
                        Button("Show list") {
                            showSheet = true
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(.white)
                        .cornerRadius(16)
                        .padding(16)
                        
                        Spacer()
                    }
                    
                }
            }
            
            if showPopUp != nil {
                
                let view = VStack {
                    Text("Añadir localizacion").font(.title2).bold()
                    Spacer()
                    TextField("Nombre", text: $name).padding(.bottom, 8)
                    Toggle("¿Es un lugar fav?", isOn: $fav)
                    Spacer()
                    Button("Guardar"){
                        savePlace(name: name, fav: fav, coordinates: showPopUp!)
                        clearForm()
                    }
                }
                withAnimation{
                    CustomDiolog(closeDialog: {
                        showPopUp = nil
                    }, onDismissOutside: true, content: view)
                }
                
            }
            
        }.sheet(isPresented: $showSheet, content: {
            ScrollView(.horizontal){
                LazyHStack {
                    ForEach(places) { place in
                        let color = if place.fav {Color.yellow.opacity(0.5)} else { Color.black.opacity(0.5) }
                        VStack{
                            Text(place.name).font(.title3).bold()
                        }.frame(width: 150, height: 100).overlay {
                            RoundedRectangle(cornerRadius: 20).stroke(color, lineWidth: 1)
                        }.shadow(radius: 5).padding(.horizontal, 8)
                            .onTapGesture {
                                animateCamera(coordinates: place.coordinates)
                                showSheet = false
                            }
                    }
                }
            }.presentationDetents(Set(height))
            
        })
    }
    
    func animateCamera(coordinates: CLLocationCoordinate2D) {
        withAnimation{
            position = MapCameraPosition.region(
                MKCoordinateRegion(
                    center: coordinates,
                    span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
        }
    }
    
    func savePlace(name: String, fav: Bool, coordinates: CLLocationCoordinate2D) {
        let place = Place(name: name, coordinates: coordinates, fav: fav)
        places.append(place)
    }
    
    func clearForm() {
        name = ""
        fav = false
        showPopUp = nil
    }
}

#Preview {
    FavPlaces()
}
