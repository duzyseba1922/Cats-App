//
//  DataFetcher.swift
//  Cats App
//
//  Created by Sebastian Niestój on 16/06/2025.
//

import Foundation

// Created for further app extensions, like adding TheDogAPI
protocol DataFetcher: AnyObject {
    var page: Int { get set }
    func fetchBreeds() async
    func fetchNextPage() async
    func getImage(for breedImageId: String) async -> URL?
    func hasReachEnd(of breedId: String) -> Bool
    func getFlag(for countryCode: String) -> String
}
