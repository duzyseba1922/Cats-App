//
//  ContentView.swift
//  Cats App
//
//  Created by Sebastian Niestój on 16/06/2025.
//

import SwiftUI

struct CatsBreedsView: View {

    @ObservedObject var viewModel: CatBreedsViewModel

    var body: some View {
        NavigationView {
            ZStack {
                ProgressView()

                List(viewModel.cats) { cat in
                    NavigationLink {
                        CatBreedDetailsView(cat: cat)
                    } label: {
                        CatRow(cat: cat, viewModel: viewModel)
                            .task {
                                if let catId = cat.id, viewModel.hasReachEnd(of: catId) {
                                    await viewModel.fetchNextPage()
                                }
                            }
                    }
                }
            }
            .navigationBarTitle("Cats")
        }
        .task {
            await viewModel.fetchBreeds()
        }
    }
}

#Preview {
    CatsBreedsView(viewModel: CatBreedsViewModel(catService: CatService()))
}
