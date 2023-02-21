//
//  LocationPreviewView.swift
//  SwiftUI-MapApp
//
//  Created by Prashanna Rajbhandari on 21/02/2023.
//

import SwiftUI

// MARK: body

struct LocationPreviewView: View {
    let location: Location
    @EnvironmentObject var locationsViewModel : LocationsViewModel
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16.0) {
                ImageSection
                textSection
            }

            VStack(spacing: 8.0) {
                learnMoreBtn
                nextBtn
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y:65)
        )
        .cornerRadius(10)
        
    }
}

// MARK: preview

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            LocationPreviewView(location: LocationsDataService.locations.first!)
                .padding()
        }
        .environmentObject(LocationsViewModel())
    }
}

extension LocationPreviewView {
    // MARK: Image

    private var ImageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(.white)
        .cornerRadius(10)
    }

    // MARK: Text
    private var textSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .bold()
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }

    // MARK: Buttons

    private var learnMoreBtn: some View {
        Button {
            locationsViewModel.sheetLocation = location
        } label: {
            Text("Learn More")
                .font(.headline)
                .frame(width: 125, height: 35)
        }.buttonStyle(.borderedProminent)
    }

    private var nextBtn: some View {
        Button {
            locationsViewModel.nextButtonPress()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
        }.buttonStyle(.bordered)
    }
}
