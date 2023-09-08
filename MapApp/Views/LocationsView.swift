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
        ZStack(){
            Map(
                coordinateRegion: $locationsViewModel.mapRegion,
                showsUserLocation: true
            )
                .onAppear{
                    locationsViewModel.checkIfLocationServicesIsEnabled()
                }
                .ignoresSafeArea()
            
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
                .padding()
        }
    }
}
