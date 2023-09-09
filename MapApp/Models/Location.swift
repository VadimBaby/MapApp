//
//  Location.swift
//  MapApp
//
//  Created by Вадим Мартыненко on 08.09.2023.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
    let id = UUID().uuidString
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let linkString: String
    var encodePartOfLinkString: String? = nil
    
    var headerTitle: String {
        return name + ", " + cityName
    }
    
    var link: String {
        var encodePart: String = ""
        
        if let encodingString = encodePartOfLinkString {
            encodePart = encodingString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? ""
        }
        
        return linkString + encodePart
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
