//
//  ContentView.swift
//  Tabby Cat
//
//  Created by jr on 12/08/2023.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        TabView {
            CatFactsView()
                .tabItem {
                    Label("Cat Facts", systemImage: "lightbulb")
                }
            CatImagesView()
                .tabItem {
                    Label("Cat Images", systemImage: "photo")
                }
            CatBounceView()
                .tabItem {
                    Label("Cat Bounce", systemImage: "arrowshape.bounce.right")
                }
            CatGalleryView()
                .tabItem {
                    Label("Cat Gallery", systemImage: "photo.stack")
                }
            CatDetectionView()
                .tabItem {
                    Label("CatML", systemImage: "viewfinder")
                }
        }
    }
}

#Preview {
    ContentView()
}
