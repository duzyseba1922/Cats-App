//
//  CatBreedDetailsView.swift
//  Cats App
//
//  Created by Sebastian Niestój on 16/06/2025.
//

import SwiftUI

// I would show here all details of a cat breed available in the API
struct CatBreedDetailsView: View {
    
    let cat: Cat
    
    var body: some View {
        Text("I would show here all details of a cat breed available in the API")
            .padding()
        Text(cat.description ?? "")
            .padding()
    }
}

#Preview {
    CatBreedDetailsView(cat: Cat(id: "1", name: "Cat Name", origin: "Poland", description: "Description",
                                 countryCode: "PL", lifeSpan: "50-99", weight: CatWeight(imperial: "20-50",
                                                                                         metric: "20-50"),
                                 imageId: "OXYvRd7oD", imageUrl: URL(string: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg")))
}
