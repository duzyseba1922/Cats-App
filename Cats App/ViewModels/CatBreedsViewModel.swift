//
//  CatBreedsViewModel.swift
//  Cats App
//
//  Created by Sebastian Niestój on 16/06/2025.
//

import Foundation

@MainActor
class CatBreedsViewModel: ObservableObject, @preconcurrency DataFetcher {
    private enum Constants {
        static let resultLimit: Int = 20
    }
    
    let catService: CatService
    
    @Published var cats: [Cat] = []
    
    var page: Int = 0
    
    init(catService: CatService) {
        self.catService = catService
    }
    
    func fetchBreeds() async {
        let endpoint = "breeds?limit=\(Constants.resultLimit)&page=\(page)"
        
        guard let catsBreeds: [Cat] = await catService.downloadData(for: endpoint) else { return }
        
        var catsWithImages: [Cat] = []

        for breed in catsBreeds {
            let imageId = breed.imageId ?? ""
            let imageUrl = await getImage(for: imageId)
            
            catsWithImages.append(Cat(id: breed.id, name: breed.name, origin: breed.origin, description: breed.description, countryCode: breed.countryCode,
                                      lifeSpan: breed.lifeSpan, weight: breed.weight, imageId: breed.imageId, imageUrl: imageUrl))
        }
        
        self.cats += catsWithImages
    }

    func fetchNextPage() async {
        page += 1
        await fetchBreeds()
    }
    
    func getImage(for breedImageId: String) async -> URL? {
        let endpoint = "images/\(breedImageId)"
        
        guard let image: CatImage = await catService.downloadData(for: endpoint), let imageUrl = image.url else { return nil }
        
        return URL(string: imageUrl)
    }

    func hasReachEnd(of breedId: String) -> Bool {
        guard let lastCat = cats.last?.id else { return false }
        return lastCat == breedId
    }

    func getFlag(for countryCode: String) -> String {
        let base : UInt32 = 127397
        var emoji = ""
        for v in countryCode.unicodeScalars {
            guard let unicodeScalar = UnicodeScalar(base + v.value) else { return "" }
            emoji.unicodeScalars.append(unicodeScalar)
        }
        return String(emoji)
    }
}
