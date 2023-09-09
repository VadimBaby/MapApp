//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Вадим Мартыненко on 08.09.2023.
//

import Foundation
import MapKit
import CoreLocation
import SwiftUI

enum MapDetails {
    static let startingLocation = LocationsDataService.locations.first!.coordinates
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
}

class LocationsViewModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion(
        center: MapDetails.startingLocation,
        span: MapDetails.defaultSpan
    )
    
    @Published var locations: [Location]
    
    @Published var currentLocation: Location {
        didSet {
            updateMapRegion(coordinate: currentLocation.coordinates)
        }
    }
    
    @Published var showLocationList: Bool = false
    
    var locationManager: CLLocationManager?
    
    override init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.currentLocation = LocationsDataService.locations.first!
    }
    
    private func updateMapRegion(coordinate: CLLocationCoordinate2D) {
        withAnimation(.spring()){
            mapRegion = MKCoordinateRegion(center: coordinate, span: MapDetails.defaultSpan)
        }
    }
    
    func toggleShowLocationList() {
        withAnimation(.easeInOut) {
            showLocationList.toggle()
        }
    }
    
    func showNextLocation(location: Location){
        withAnimation(.easeInOut){
            currentLocation = location
            showLocationList = false
        }
    }
    
    func pressNextButton() {
        guard let currentIndex = locations.firstIndex(where: {$0 == currentLocation}) else { return }
        
        let nextIndex = currentIndex + 1
        
        guard locations.indices.contains(nextIndex) else {
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        
        let nextLocation = locations[nextIndex]
        
        showNextLocation(location: nextLocation)
    }
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        }
    }
    
    func centerMapOnUserLocation() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .authorizedAlways, .authorizedWhenInUse:
            updateMapRegion(coordinate: locationManager.location!.coordinate)
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        default:
            break
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted likely due to parental controls")
        case .denied:
            print("You have denied this app location permission. Go into settings to change it.")
        case .authorizedAlways, .authorizedWhenInUse:
            print("We have permission to find user location")
        default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
