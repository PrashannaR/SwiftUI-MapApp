//
//  LocationsView.swift
//  SwiftUI-MapApp
//
//  Created by Prashanna Rajbhandari on 18/02/2023.
//

import MapKit
import SwiftUI

struct LocationsView: View {
    @EnvironmentObject private var locationViewModel: LocationsViewModel

    var body: some View {
        ZStack {
            Map(coordinateRegion: $locationViewModel.mapRegion)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                header
                    .padding()

                Spacer()
                
                ZStack{
                    ForEach(locationViewModel.locations) { location in
                        
                        if locationViewModel.mapLocation == location{
                            LocationPreviewView(location: location)
                                .shadow(color: Color.black.opacity(0.3), radius: 20)
                                .padding()
                                .transition(.asymmetric(
                                    insertion: .move(edge: .trailing),
                                    removal: .move(edge: .leading)))
                        }
                        

                    }
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

// MARK: Header

extension LocationsView {
    private var header: some View {
        VStack {
            Button {
                locationViewModel.toggleDropDown()
            } label: {
                Text(locationViewModel.mapLocation.name + ", " + locationViewModel.mapLocation.cityName)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: locationViewModel.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: locationViewModel.showDropDown ? 180 : 0))

                    }
            }

            if locationViewModel.showDropDown{
                LocationsListView()
            }
            
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
}
