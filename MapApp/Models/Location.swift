//
//  Location.swift
//  MapApp
//
//  Created by Вадим Мартыненко on 08.09.2023.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let id = UUID().uuidString
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var headerTitle: String {
        return name + ", " + cityName
    }
}
