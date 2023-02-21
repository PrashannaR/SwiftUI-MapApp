//
//  MapAnnotationView.swift
//  SwiftUI-MapApp
//
//  Created by Prashanna Rajbhandari on 21/02/2023.
//

import SwiftUI

struct MapAnnotationView: View {
    
    let accentColor = Color("AccentColor")
    
    var body: some View {
        VStack(spacing: 0.0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .cornerRadius(36)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y:-3)
                .padding(.bottom,40)
        }

    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        MapAnnotationView()
    }
}
