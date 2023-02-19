//
//  LocationsView.swift
//  SwiftUI-MapApp
//
//  Created by Prashanna Rajbhandari on 18/02/2023.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var locationViewModel : LocationsViewModel
    
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $locationViewModel.mapRegion)
                .ignoresSafeArea()
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}
