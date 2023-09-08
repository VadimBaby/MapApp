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
                .ignoresSafeArea()
            
            VStack(spacing: 0){
                header
                    .padding()

                Spacer()
            }
            .zIndex(1)
            
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    buttonCenterToUserLocation
                }
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsView {
    private var header: some View {
        VStack{
            Button(action: locationsViewModel.toggleShowLocationList) {
                Text(locationsViewModel.currentLocation.headerTitle)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: locationsViewModel.showLocationList ? 180 : 0))
                    }
            }
            
            if locationsViewModel.showLocationList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var buttonCenterToUserLocation: some View {
        Button(action: locationsViewModel.centerMapOnUserLocation) {
            Circle()
                .fill(.thinMaterial)
                .frame(width: 65, height: 65)
                .overlay{
                    Image(systemName: "location.fill")
                        .font(.title)
                        .foregroundColor(Color.black)
                }
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
                .padding()
        }
    }
}
