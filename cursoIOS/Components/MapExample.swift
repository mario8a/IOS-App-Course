//
//  MapExample.swift
//  cursoIOS
//
//  Created by Mario Abraham Ochoa Tovar on 03/09/24.
//

import SwiftUI
import MapKit

struct MapExample: View {
    
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 19.4271238, longitude: -99.1080297),
            span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)
        )
    )
    
    var body: some View {
        ZStack {
            MapReader{ proxy in
            
                Map(position: $position){
//                    Marker("Pollito frito", coordinate: CLLocationCoordinate2D(latitude: 19.4271238, longitude: -99.1080297))
                    Annotation("Pollito frito", coordinate: CLLocationCoordinate2D(latitude: 19.4271238, longitude: -99.1080297)) {
                        Circle().frame(height: 30)
                    }.annotationTitles(.visible)
                }
                .mapStyle(.hybrid(elevation: .realistic, showsTraffic: true))
            //                .onMapCameraChange { context in
            //                    print("Estamos en : \(context.region)")
            //                }
//                .onMapCameraChange(frequency: .continuous) { context in
//                    print("Estamos en : \(context.region)")
//                }
                .onTapGesture { coord in
                    if let coordinates  = proxy.convert(coord, from: .local){
                        withAnimation {
                            position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude),
                                    span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)
                                )
                            )
                        }
                    }
                }
            }
            VStack {
                Spacer()
                HStack{
                    Button("ir al sur") {
                        withAnimation {
                            position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: 19.4271238, longitude: -99.1080297),
                                    span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)
                                )
                            )
                        }
                    }.padding(32).background(.white).padding()
                    Button("ir al norte") {
                        withAnimation {
                            position = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: 20.1051199, longitude: -98.7624543),
                                    span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)
                                )
                            )
                        }
                        
                    }.padding(32).background(.white).padding()
                }
            }
        }
        
    }
}

#Preview {
    MapExample()
}
