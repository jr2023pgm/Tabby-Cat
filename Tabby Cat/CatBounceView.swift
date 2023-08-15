//
//  CatBounceView.swift
//  Tabby Cat
//
//  Created by jr on 12/08/2023.
//

import SwiftUI

struct CatBounceView: UIViewControllerRepresentable {
     
    func makeUIViewController(context: Context) -> CatBounceViewController {
        let storyboard = UIStoryboard(name: "CatBounceScreen", bundle: .main)
        
        if let viewController = storyboard.instantiateViewController(withIdentifier: "CatBounce") as? CatBounceViewController {
            return viewController
        } else {
            fatalError("Could not instantiate.")
        }
        
    }
    
    func updateUIViewController(_ uiViewController: CatBounceViewController, context: Context) {
        //empty
    }
    
}

#Preview {
    CatBounceView()
}
