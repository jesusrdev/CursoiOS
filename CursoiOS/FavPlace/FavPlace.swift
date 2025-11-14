//
//  FavPlace.swift
//  CursoiOS
//
//  Created by Yisus on 14/11/25.
//

import SwiftUI
import MapKit

@available(iOS 17.0, *)
struct FavPlace: View {
    
    @State var name: String = ""
    @State var fav: Bool = false
    
    @State var places: [Place] = []
    
    @State var showPopup: CLLocationCoordinate2D? = nil
    
    var body: some View {
        @State var position = MapCameraPosition.region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: -8.100060735835397, longitude: -79.01964085912546),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
        )
        
        ZStack{
            MapReader{ proxy in
                Map(position: $position)
                    .mapStyle(.standard)
                    .onTapGesture { coord in
                        if let coordinates = proxy.convert(coord, from: .local) {
                            showPopup = coordinates
                        }
                    }
            }
            
            if showPopup != nil{
                let view = VStack{
                    Text("Añadir localización").font(.title).bold()
                    Spacer()
                    TextField("Nombre", text: $name).padding(.bottom, 8)
                    Toggle("¿Es un lugar favorito?", isOn: $fav)
                    Spacer()
                    Button("Guardar"){
                        savePlace(name: name, coordinates: showPopup!, fav: fav)
                    }
                }
                withAnimation{
                    CustomDialog(closeDialog: {
                        showPopup = nil
                    }, onDismissOutside: true, content: view)
                }
            }
        }
    }
    
    func savePlace(name: String, coordinates: CLLocationCoordinate2D, fav: Bool){
        let place = Place(name: name, coordinates: coordinates, fav: fav)
        places.append(place)
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        FavPlace()
    } else {
        Text("Error")
    }
}
