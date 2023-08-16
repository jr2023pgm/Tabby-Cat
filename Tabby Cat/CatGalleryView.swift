//
//  CatGalleryView.swift
//  Tabby Cat
//
//  Created by jr on 12/08/2023.
//

import SwiftUI
import PhotosUI

struct CatGalleryView: View {
    
    @State private var photoPicked: PhotosPickerItem?
    @State private var image: Image?
    
    var body: some View {
        NavigationStack {
            VStack {
                if let image {
                    image
                        .resizable()
                        .scaledToFit()
                } else {
                    Text("Pick an image.")
                }
            }
            .navigationTitle("Cat Gallery")
            .toolbar {
                PhotosPicker(selection: $photoPicked) {
                    Image(systemName: "photo.on.rectangle.angled")
                }
            }
        }
        .onChange(of: photoPicked) { oldValue, newValue in
            Task {
                if let image = try? await photoPicked?.loadTransferable(type: Image.self) {
                    await MainActor.run {
                        self.image = image
                    }
                }
            }
        }
    }
}

#Preview {
    CatGalleryView()
}
