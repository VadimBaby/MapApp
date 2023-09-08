//
//  LocationsView.swift
//  MapApp
//
//  Created by Вадим Мартыненко on 08.09.2023.
//

import SwiftUI

struct LocationsView: View {
    @EnvironmentObject var locationsViewModel: LocationsViewModel
    
    var body: some View {
        ZStack{
            
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}
