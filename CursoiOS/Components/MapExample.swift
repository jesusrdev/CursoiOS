//
//  MapExample.swift
//  CursoiOS
//
//  Created by Yisus on 13/11/25.
//

import SwiftUI
import MapKit

@available(iOS 17.0, *)
struct MapExample: View {
    @State var position = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -8.100060735835397, longitude: -79.01964085912546),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    ))
    
    var body: some View {
        ZStack {
            MapReader{ proxy in
                Map(position: $position){
//                    Marker("Cibertec", coordinate: CLLocationCoordinate2D(latitude: -8.100060735835397, longitude: -79.01964085912546))
                    Annotation("Cibertec", coordinate: CLLocationCoordinate2D(latitude: -8.100060735835397, longitude: -79.01964085912546)) {
                        Circle().frame(height: 30)
                    }
                    .annotationTitles(.visible)
                }
                .mapStyle(.hybrid())
                //                    .hybrid(elevation: .realistic, showsTraffic: true)
                //                .onMapCameraChange {context in
                //                    print("Estamos en \(context.region)")
                //                }
                .onMapCameraChange(frequency: .continuous) {context in
                    print("Estamos en \(context.region)")
                }
                .onTapGesture { coord in
                    if let coordinates = proxy.convert(coord, from: .local) {
                        withAnimation {
                            position = MapCameraPosition.region(MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude),
                                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                            ))
                        }
                    }
                }
            }
            
            VStack{
                Spacer()
                HStack{
                    Button("Ir al sur"){
                        withAnimation {
                            position = MapCameraPosition.region(MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: -8.099111680715176, longitude: -79.0205814992345),
                                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                            ))
                        }
                    }.padding().background(.white).padding()
                    Button("Ir al norte"){
                        withAnimation {
                            position = MapCameraPosition.region(MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: -8.109771740476159, longitude: -79.02986905620111),
                                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                            ))
                        }
                    }.padding().background(.white).padding()
                }
            }
        }
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        MapExample()
    } else {
        Text("Error")
    }
}
