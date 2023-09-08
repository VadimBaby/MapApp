//
//  LocationsView.swift
//  MapApp
//
//  Created by Вадим Мартыненко on 08.09.2023.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @EnvironmentObject var locationsViewModel: LocationsViewModel
    
    var body: some View {
        ZStack{
            Map(
                coordinateRegion: $locationsViewModel.mapRegion,
                showsUserLocation: true
            )
                .onAppear{
                    locationsViewModel.checkIfLocationServicesIsEnabled()
                }
        }
        .ignoresSafeArea()
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}
