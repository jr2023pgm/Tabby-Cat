//
//  CatImagesView.swift
//  Tabby Cat
//
//  Created by jr on 12/08/2023.
//

import SwiftUI
import Subsonic

struct CatImagesView: View {
    
    @State var catURL = "https://cataas.com/cat?"
    
    var body: some View {
        VStack {
            
            Spacer()
            
            AsyncImage(url: URL(string: catURL)!) { image in
                image
                    .resizable()
                    .scaledToFit()
                    //.onAppear {
                        //play(sound: "meow.m4a")
                    //}
            } placeholder: {
                ProgressView()
            }
            
            Spacer()
            
            Button("Give me a new cat!") {
                catURL+="1"
            }
            .buttonStyle(.borderedProminent)
            
        }
    }
}

#Preview {
    CatImagesView()
}
