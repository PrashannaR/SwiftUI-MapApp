//
//  LocationsViewModel.swift
//  SwiftUI-MapApp
//
//  Created by Prashanna Rajbhandari on 18/02/2023.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    // All loaded locations
    @Published var locations: [Location]

    // current location
    @Published var mapLocation: Location{
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }

    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()

    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)

    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }

    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
    }
}
