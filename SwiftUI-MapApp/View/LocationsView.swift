//
//  LocationsView.swift
//  SwiftUI-MapApp
//
//  Created by Prashanna Rajbhandari on 18/02/2023.
//

import SwiftUI

struct LocationsView: View {
    
    @EnvironmentObject private var locationViewModel : LocationsViewModel
    
    var body: some View {
        List{
            ForEach(locationViewModel.locations) { location in
                Text(location.name)
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
