//
//  MapView.swift
//  CountryView
//
//  Created by Matthew Popov on 20.07.2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region: MKCoordinateRegion
    
    init(lat: Double, lng: Double) {
        self.region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: lat, longitude: lng),
            span: MKCoordinateSpan(latitudeDelta: 3, longitudeDelta: 3))
    }
    
    var body: some View {
        Map(coordinateRegion: $region)
            .ignoresSafeArea(.all)
    }
}
