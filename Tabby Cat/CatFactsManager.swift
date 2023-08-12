//
//  CatFactsManager.swift
//  Tabby Cat
//
//  Created by jr on 12/08/2023.
//

import Foundation

class CatFactsManager: ObservableObject {
    
    let apiURL = URL(string: "https://catfact.ninja/fact")!
    @Published var catFact: CatFact?
    
    func getCatFact() {
        catFact = nil
        Task {
            
            let (data, _) = try await URLSession.shared.data(from: apiURL)
//            print("We got the data!")
//            print(String(data: data, encoding: .utf8)!)
            
            try await MainActor.run {
                
                catFact = try JSONDecoder().decode(CatFact.self, from: data)
                
            }
            
        }
        
    }
    
}
