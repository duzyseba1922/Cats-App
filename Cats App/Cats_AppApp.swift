//
//  Cats_AppApp.swift
//  Cats App
//
//  Created by Sebastian Niestój on 16/06/2025.
//

import SwiftUI

@main
struct Cats_AppApp: App {
    var body: some Scene {
        WindowGroup {
            initializeTheApp()
        }
    }
    
    // I would improve it by creating a class called - for example - 'ContentProvider', that would have all objects like services and view models stored and initialized there
    private func initializeTheApp() -> some View {
        let catService = CatService()
        let viewModel = CatBreedsViewModel(catService: catService)
        
        return CatsBreedsView(viewModel: viewModel)
    }
}
