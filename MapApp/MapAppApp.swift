//
//  MapAppApp.swift
//  MapApp
//
//  Created by Вадим Мартыненко on 08.09.2023.
//

import SwiftUI

@main
struct MapAppApp: App {
    @StateObject var locationViewModel: LocationsViewModel = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationViewModel)
        }
    }
}
