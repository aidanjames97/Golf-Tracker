//
//  MapView.swift
//  golf
//
//  Created by Aidan James on 2024-05-15.
//

import SwiftUI

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    var zoom: Double
    
    var body: some View {
        Map(position: .constant(.region(region)))
        }

        private var region: MKCoordinateRegion {
            MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: zoom, longitudeDelta: zoom)
            )
        }
    }
#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868), zoom: 0.025)
}
