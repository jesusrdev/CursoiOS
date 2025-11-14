//
//  Place.swift
//  CursoiOS
//
//  Created by Yisus on 14/11/25.
//

import Foundation
import MapKit

struct Place: Identifiable {
    let id = UUID()
    var name: String
    var coordinates: CLLocationCoordinate2D
    var fav: Bool
}
