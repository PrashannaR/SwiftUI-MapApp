//
//  LocationDetailView.swift
//  SwiftUI-MapApp
//
//  Created by Prashanna Rajbhandari on 22/02/2023.
//

import MapKit
import SwiftUI

// MARK: Body

struct LocationDetailView: View {
    @EnvironmentObject var locationViewModel: LocationsViewModel
    let location: Location

    var body: some View {
        ScrollView {
            VStack {
                imageSection

                VStack(alignment: .leading, spacing: 16) {
                    titleSection

                    Divider()

                    descSection

                    Divider()

                    map
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(alignment: .topLeading) {
            backButton
        }
    }
}

// MARK: Preview

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationsViewModel())
    }
}

extension LocationDetailView {
    // MARK: Image

    private var imageSection: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width) // frame = the phone's width
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }

    // MARK: Title

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

    // MARK: Description

    private var descSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)

            if let url = URL(string: location.link) {
                Link("Read more on WikiPedia", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
        }
    }

    //MARK: Map
    private var map: some View {
        Map(
            coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates, span: locationViewModel.mapSpan)),
            annotationItems: [location]) { location in
                MapAnnotation(coordinate: location.coordinates) {
                    MapAnnotationView()
                        .shadow(radius: 10)
                }
            }
            .allowsHitTesting(false)
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(30)
    }
    
    //MARK: Button
    
    private var backButton: some View{
        Button {
            locationViewModel.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .padding()
        }

    }
    
}
