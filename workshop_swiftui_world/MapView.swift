//
//  MapView.swift
//  workshop_swiftui_world
//
//  Created by Levent Kantaroğlu on 18.01.2023.
//

import MapKit
import SwiftUI

struct MapView: View {
    static var regions: [MKCoordinateRegion] = [
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 41, longitude: 29
            ), span: MKCoordinateSpan(
                latitudeDelta: 4, longitudeDelta: 4
            )
        ),
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 51.50, longitude: -0.11
            ), span: MKCoordinateSpan(
                latitudeDelta: 4, longitudeDelta: 4
            )
        )
    ]

    @State var region: MKCoordinateRegion = regions[0]

    @State var selectedIndex = 0

    var body: some View {
        Map(coordinateRegion: $region).edgesIgnoringSafeArea(.top)
            .overlay(
                VStack(content: {
                    Picker("Picker", selection: $selectedIndex, content: {
                        Text("map_city_istanbul").tag(0)
                        Text("map_city_london").tag(1)

                    })
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    .onChange(of: selectedIndex, perform: { _ in
                        self.region = MapView.regions[selectedIndex]
                    })
                    Spacer()
                })
            )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
