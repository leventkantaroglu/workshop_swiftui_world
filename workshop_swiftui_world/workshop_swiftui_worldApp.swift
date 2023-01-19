//
//  workshop_swiftui_worldApp.swift
//  workshop_swiftui_world
//
//  Created by Levent Kantaroğlu on 17.01.2023.
//

import SwiftUI

@main
struct workshop_swiftui_worldApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label(title: {
                            Text("tab_conversion")
                        }, icon: {
                            Image(systemName: "thermometer.sun")
                        })
                        // Text("Conversion")
                    }
                MapView()
                    .tabItem {
                        Label(title: {
                            Text("tab_map")
                        }, icon: {
                            Image(systemName: "map")
                        })
                    }
            }
            .accentColor(.brown)
        }
    }
}
