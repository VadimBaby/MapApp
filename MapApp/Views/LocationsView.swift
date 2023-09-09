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
            mapLayer
            VStack(spacing: 0){
                header
                    .padding()
                Spacer()
                locationsPreviewStack
            }
            .zIndex(1)
            
            VStack{
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
    private var mapLayer: some View {
        Map(
            coordinateRegion: $locationsViewModel.mapRegion,
            showsUserLocation: true,
            annotationItems: locationsViewModel.locations,
            annotationContent: { location in
              //  MapMarker(coordinate: location.coordinates, tint: Color.blue)
                MapAnnotation(coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .scaleEffect(locationsViewModel.currentLocation == location ? 1 : 0.7)
                        .shadow(radius: 10)
                        .onTapGesture {
                            locationsViewModel.showNextLocation(location: location)
                        }
                        .animation(.easeInOut, value: locationsViewModel.currentLocation)
                }
            }
        )
            .onAppear{
                locationsViewModel.checkIfLocationServicesIsEnabled()
            }
            .ignoresSafeArea()
    }
    
    private var header: some View {
        VStack{
            Button(action: locationsViewModel.toggleShowLocationList) {
                Text(locationsViewModel.currentLocation.headerTitle)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 75)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: locationsViewModel.currentLocation)
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
    
    private var locationsPreviewStack: some View {
        ZStack{
            ForEach(locationsViewModel.locations) { location in
                if locationsViewModel.currentLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading))
                        )
                }
            }
        }
    }
}
