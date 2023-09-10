//
//  LocationDetailView.swift
//  MapApp
//
//  Created by Вадим Мартыненко on 09.09.2023.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    @EnvironmentObject var locationViewModel: LocationsViewModel
    
    let location: Location
    
    var body: some View {
        ScrollView{
            VStack{
                imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .overlay(alignment: .topLeading, content: {backButton})
        .background(.ultraThinMaterial)
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationsViewModel())
    }
}

extension LocationDetailView {
    private var imageSection: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) { imageName in
                GeometryReader { geometry in
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil : geometry.size.width)
                        .clipped()
                }
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            if let url = URL(string: location.link) {
                Link("Read More", destination: url)
                    .font(.headline)
                    .tint(Color.blue)
            }
        }
    }
    
    private var mapLayer: some View {
        Map(
            coordinateRegion: .constant(MKCoordinateRegion(
                center: location.coordinates,
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            )),
            annotationItems: [location],
            annotationContent: { location in
                MapAnnotation(coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .shadow(radius: 10)
                }
            }
        )
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(30)
    }
    
    private var backButton: some View {
        Button(action: {
            locationViewModel.sheetLocation = nil
        }) {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }
    }
}


