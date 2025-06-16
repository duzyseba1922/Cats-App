//
//  CatService.swift
//  Cats App
//
//  Created by Sebastian Niestój on 16/06/2025.
//

import Foundation

final class CatService: Codable {
    
    private enum Constants {
        // I would normally put these in separate config file and would NOT push it to remote repository.
        static let baseEndpoint = "https://api.thecatapi.com/v1/"
        static let apiKey: String = "7bf85dc2-5569-4893-8bfc-40d11b9dddec"
    }

    func downloadData<T: Codable>(for urlString: String) async -> T? {
        do {
            let urlString = Constants.baseEndpoint + urlString
            
            guard let url = URL(string: urlString) else { throw NetworkError.badUrl }
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue(Constants.apiKey, forHTTPHeaderField: "x-api-key")
            
            guard let (data, response) = try? await URLSession.shared.data(for: request) else { throw NetworkError.sessionError }
            
            guard let response = response as? HTTPURLResponse else { throw NetworkError.badResponse }
            guard response.statusCode >= 200 && response.statusCode < 300 else { throw NetworkError.badStatus }
            
            guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else { throw NetworkError.failedToDecodeResponse }
            
            return decodedResponse
            
        } catch NetworkError.sessionError {
            print("There was an error creating the URLSession")
        } catch NetworkError.badUrl {
            print("There was an error creating the URL")
        } catch NetworkError.badResponse {
            print("Did not get a valid response")
        } catch NetworkError.badStatus {
            print("Did not get a 2xx status code from the response")
        } catch NetworkError.failedToDecodeResponse {
            print("Failed to decode response into the given type")
        } catch {
            print("An error occured downloading the data")
        }

        return nil
    }
}
