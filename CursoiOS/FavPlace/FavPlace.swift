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
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -8.100060735835397, longitude: -79.01964085912546),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )
    
    @State var places: [Place] = []
    
    @State var showPopup: CLLocationCoordinate2D? = nil
    
    @State var name: String = ""
    @State var fav: Bool = false
    
    @State var showSheet: Bool = false
    let height = stride(from: 0.3, through: 0.3, by: 0.1).map{
        PresentationDetent.fraction($0)
    }
    
    var body: some View {
        ZStack{
            MapReader{ proxy in
                Map(position: $position){
                    ForEach(places) { place in
                        Annotation(place.name, coordinate: place.coordinates) {
                            let color = place.fav ? Color.yellow : Color.black
                            
                            Circle()
                                .stroke(color, lineWidth: 3)
                                .fill(.white)
                                .frame(width: 35, height: 35)
                        }
                    }
                }
                .mapStyle(.standard)
                .onTapGesture { coord in
                    if let coordinates = proxy.convert(coord, from: .local) {
                        showPopup = coordinates
                    }
                }
                .overlay {
                    VStack{
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
            
            if showPopup != nil{
                let view = VStack{
                    Text("Añadir localización").font(.title).bold()
                    Spacer()
                    TextField("Nombre", text: $name).padding(.bottom, 8)
                    Toggle("¿Es un lugar favorito?", isOn: $fav)
                    Spacer()
                    Button("Guardar"){
                        savePlace(name: name, coordinates: showPopup!, fav: fav)
                        clearForm()
                    }.disabled(name == "")
                }
                withAnimation{
                    CustomDialog(closeDialog: {
                        showPopup = nil
                    }, onDismissOutside: true, content: view)
                }
            }
        }.sheet(isPresented: $showSheet) {
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(places){ place in
                        let color = place.fav ? Color.yellow : Color.black
                        
                        VStack{
                            Text(place.name).font(.title3).bold()
                        }.frame(width: 150, height: 100).overlay {
                            RoundedRectangle(cornerRadius: 20).stroke(color.opacity(0.5), lineWidth: 1)
                        }.shadow(radius: 5).padding(.horizontal, 8)
                            .onTapGesture {
                                animateCamera(coordinates: place.coordinates)
                                showSheet = false
                            }
                    }
                }
            }
            .presentationDetents(Set(height))
        }
    }
    
    func animateCamera(coordinates: CLLocationCoordinate2D){
        withAnimation{
            position = MapCameraPosition.region(
                MKCoordinateRegion(
                    center: coordinates,
                    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                )
            )
        }
    }
    
    func savePlace(name: String, coordinates: CLLocationCoordinate2D, fav: Bool){
        let place = Place(name: name, coordinates: coordinates, fav: fav)
        places.append(place)
    }
    
    func clearForm(){
        name = ""
        fav = false
        showPopup = nil
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        FavPlace()
    } else {
        Text("Error")
    }
}
