//
//  CatDetectionView.swift
//  Tabby Cat
//
//  Created by jr on 16/08/2023.
//

import SwiftUI
import PhotosUI

struct CatDetectionView: View {
    
    @State private var image: Image?
    @State private var photoPicked: PhotosPickerItem?
    @State private var catDetectionManager = CatDetectionManager()
    
    var body: some View {
        VStack {
            if let image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 300)
                    .overlay {
                        VStack {
                            Spacer()
                            switch catDetectionManager.catDetectionResult {
                            case .isCat:
                                Text("Is a cat!")
                                    .padding()
                                    .background(.green)
                            case .notCat:
                                Text("Not a cat!")
                                    .padding()
                                    .background(.red)
                            case .error:
                                Text("Error.")
                                    .padding()
                                    .background(.gray)
                            case .processing:
                                ProgressView().progressViewStyle(.linear)
                            }
                        }
                    }
            }
            PhotosPicker(selection: $photoPicked) {
                Label("Pick a photo", systemImage: "photo")
            }
            .buttonStyle(.borderedProminent)
            .onChange(of: photoPicked) { oldValue, newValue in
                Task {
                    if let data = try? await photoPicked?.loadTransferable(type: Data.self), let uiImage = UIImage(data: data) {
                        await MainActor.run {
                            self.image = Image(uiImage: uiImage)
                            catDetectionManager.detect(with: uiImage)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CatDetectionView()
}
