//
//  ContentView.swift
//  MovieDiscovery
//
//  Created by Sathish kumar on 3/4/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MoviesViewModel()

    private let columns = [
            GridItem(.flexible(), spacing: 10),
            GridItem(.flexible(), spacing: 10)
        ]

        var body: some View {
            NavigationView {

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(viewModel.movies) { movie in
                            NavigationLink(destination: MovieDetailView(movie: movie)) {
                                                        MovieGridItem(movie: movie)
                                                    }
                                .onAppear {
                                    if movie == viewModel.movies.last {
                                        Task {
                                           
                                            await viewModel.fetchMovies()
                                        }
                                    }
                                }
                        }
                    }
                    .padding()
                    
                    if viewModel.isLoading {
                        ProgressView()
                            .padding()
                    }
                    
                }
                .alert("Error", isPresented: $viewModel.showAlert, actions: {
                                Button("OK", role: .cancel) {}
                            }, message: {
                                Text(viewModel.errorMessage ?? "Something went wrong.")
                            })
                .navigationTitle("Movies")
                .searchable(text: $viewModel.searchString, prompt: "Search movies...")
                            .onChange(of: viewModel.searchString) { oldValue, newValue in
                                    Task {
                                        await viewModel.fetchMovies(isForce: true)
                                    }
                            }
                            
                .task {
                    await viewModel.fetchMovies()
                }
            }
        }
    }

#Preview {
    ContentView()
}


