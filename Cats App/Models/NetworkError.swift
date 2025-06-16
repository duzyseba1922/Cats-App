//
//  NetworkError.swift
//  Cats App
//
//  Created by Sebastian Niestój on 16/06/2025.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case sessionError
    case badResponse
    case badStatus
    case failedToDecodeResponse
}
