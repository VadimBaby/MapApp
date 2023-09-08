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
        ZStack(alignment: .bottomTrailing){
            Map(
                coordinateRegion: $locationsViewModel.mapRegion,
                showsUserLocation: true
            )
                .onAppear{
                    locationsViewModel.checkIfLocationServicesIsEnabled()
                }
                .ignoresSafeArea()
            
            Button(action: locationsViewModel.centerMapOnUserLocation) {
                Circle()
                    .frame(width: 65, height: 65)
                    .overlay{
                        Image(systemName: "location.fill")
                            .font(.title)
                            .foregroundColor(Color.black)
                    }
                    .foregroundColor(Color(uiColor: UIColor.white))
                    .padding()
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
