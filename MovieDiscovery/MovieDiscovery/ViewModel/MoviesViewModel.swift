//
//  MoviesViewModel.swift
//  MovieDiscovery
//
//  Created by Sathish kumar on 3/5/25.
//

import Foundation
@MainActor
class MoviesViewModel: ObservableObject {
    @Published var movies: [Results] = []
    @Published var isLoading = false
    private(set) var errorMessage: String?
    @Published var showAlert: Bool = false
    @Published var searchString = ""
    @Published var favorites: Set<Int> = []
    
    private var totalPages: Int? = nil
    private var page = 1
    private var resultData: ResultData = ResultData(page: nil, results: [], total_pages: nil, total_results: nil)
    
    
    private let networkManager: NetworkManager

    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
        loadFavorites()
    }
    
    
    func fetchMovies(isForce: Bool = false) async {
            
        if isForce == true {
            page = 1
            totalPages = nil
            movies = []
        }
        guard !isLoading, (page < totalPages ?? 0 || totalPages == nil) else {
            return
            
        }
            isLoading = true
            errorMessage = nil
        
            
            do {

                    
                    let endpoint = searchString.isEmpty ? "/discover/movie?" : "/search/movie?query=\(searchString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&"
                    let urlString = "\(APIConfiguration().baseUrl)\(endpoint)api_key=\(APIConfiguration().apiKey)&page=\(page)"
                    guard let url = URL(string: urlString) else  {
                        errorMessage = "Invalid URL"
                        return
                    }
                    if searchString.isEmpty {
                        if totalPages ?? 0 > page {
                            isLoading = false
                        }
                    } else {
                        page = 1
                        movies = []
                    }
                    resultData = try await networkManager.fetch(from: url)
                    let newMovies = resultData.results ?? []
                    let uniqueMovies = newMovies.filter { newMovie in
                        !movies.contains(where: { $0.id == newMovie.id })
                    }
                    movies.append(contentsOf: uniqueMovies)
                    totalPages = resultData.total_pages ?? 1
                    page += 1
                   
                errorMessage = nil
                showAlert = false
            } catch {
                errorMessage = "Failed to fetch movies"
                showAlert = true
            }
            
            isLoading = false
        }
    
    func toggleFavorite(movie: Results) {
            if favorites.contains(movie.id) {
                favorites.remove(movie.id)
            } else {
                favorites.insert(movie.id)
            }
            saveFavorites()
        }

        func saveFavorites() {
            let ids = Array(favorites)
            UserDefaults.standard.set(ids, forKey: "favoriteMovies")
        }

        func loadFavorites() {
            if let savedFavorites = UserDefaults.standard.array(forKey: "favoriteMovies") as? [Int] {
                favorites = Set(savedFavorites)
            }
        }
    
}
