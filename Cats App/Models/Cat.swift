//
//  Cat.swift
//  Cats App
//
//  Created by Sebastian Niestój on 16/06/2025.
//

import Foundation

struct Cat: Codable, Identifiable {
    let id: String?
    let name: String?
    let origin: String?
    let description: String?
    let countryCode: String?
    let lifeSpan: String?
    let weight: CatWeight?
    let imageId: String?
    
    var imageUrl: URL?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case origin
        case description
        case countryCode = "country_code"
        case lifeSpan = "life_span"
        case weight
        case imageId = "reference_image_id"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.origin = try container.decodeIfPresent(String.self, forKey: .origin)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.countryCode = try container.decodeIfPresent(String.self, forKey: .countryCode)
        self.lifeSpan = try container.decodeIfPresent(String.self, forKey: .lifeSpan)
        self.weight = try container.decodeIfPresent(CatWeight.self, forKey: .weight)
        self.imageId = try container.decodeIfPresent(String.self, forKey: .imageId)
    }
    
    init(id: String?, name: String?, origin: String?, description: String?, countryCode: String?, lifeSpan: String?, weight: CatWeight?, imageId: String?, imageUrl: URL?) {
        self.id = id
        self.name = name
        self.origin = origin
        self.description = description
        self.countryCode = countryCode
        self.lifeSpan = lifeSpan
        self.weight = weight
        self.imageId = imageId
        self.imageUrl = imageUrl
    }
}
