//
//  LocationsListView.swift
//  SwiftUI-MapApp
//
//  Created by Prashanna Rajbhandari on 19/02/2023.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject var locationsViewModel: LocationsViewModel
    var body: some View {
        List {
            ForEach(locationsViewModel.locations) { loc in

                Button {
                    locationsViewModel.showNextLocation(location: loc)
                } label: {
                    listRowView(loc: loc)
                        
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsListView {
    private func listRowView(loc: Location) -> some View {
        HStack {
            if let imageName = loc.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading) {
                Text(loc.name)
                    .font(.headline)
                Text(loc.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
