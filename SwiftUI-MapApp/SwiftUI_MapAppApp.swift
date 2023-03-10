//
//  SwiftUI_MapAppApp.swift
//  SwiftUI-MapApp
//
//  Created by Prashanna Rajbhandari on 18/02/2023.
//

import SwiftUI

@main
struct SwiftUI_MapAppApp: App {
    
    @StateObject private var locationVM = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(locationVM)
        }
    }
}
