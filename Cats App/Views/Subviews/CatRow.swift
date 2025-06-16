//
//  CatRow.swift
//  Cats App
//
//  Created by Sebastian Niestój on 16/06/2025.
//

import SwiftUI

struct CatRow: View {
    
    private enum Constants {
        static let imageSize: CGFloat = 120
    }
    
    let cat: Cat
    let viewModel: CatBreedsViewModel

    var body: some View {
        HStack {
            CachedAsyncImage(url: cat.imageUrl) { image in
                image.resizable()
                    .frame(width: Constants.imageSize,
                           height: Constants.imageSize)
                    .aspectRatio(1, contentMode: .fit)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } placeholder: {
                ProgressView()
                    .frame(width: Constants.imageSize,
                           height: Constants.imageSize)
            }
            
            VStack(alignment: .leading) {
                Text(cat.name ?? "")
                    .font(.title2)
                    .bold()
                
                HStack {
                    Text(viewModel.getFlag(for: cat.countryCode ?? ""))
                    Text(cat.origin ?? "")
                }
                
                HStack {
                    Text("Life span:")
                        .bold()
                    Text(cat.lifeSpan ?? "")
                }
                
                HStack {
                    Text("Weight:")
                        .bold()
                    Text(cat.weight?.metric ?? "")
                }
            }
        }
    }
}

#Preview {
    CatRow(cat: Cat(id: "1", name: "Cat Name", origin: "Poland", description: "Description", countryCode: "PL", lifeSpan: "50-99",
                    weight: CatWeight(imperial: "20-50", metric: "20-50"),
                    imageId: "OXYvRd7oD", imageUrl: URL(string: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg")),
           viewModel: CatBreedsViewModel(catService: CatService()))
}
