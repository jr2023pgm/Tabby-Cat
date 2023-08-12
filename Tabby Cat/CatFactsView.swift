//
//  CatFactsView.swift
//  Tabby Cat
//
//  Created by jr on 12/08/2023.
//

import SwiftUI

struct CatFactsView: View {
    
    @StateObject var catFactsManager = CatFactsManager()
    
    var body: some View {
        VStack {
            
            Spacer()
            
            if let catFact = catFactsManager.catFact {
                Text(catFact.fact)
                    .padding()
            } else {
                ProgressView()
                    .progressViewStyle(.circular)
            }
            
            
            Button {
                catFactsManager.getCatFact()
            } label: {
                Text("Get new fact!")
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
            Spacer()
            
        }
        .onAppear {
            catFactsManager.getCatFact()
        }
    }
}

#Preview {
    CatFactsView()
}
