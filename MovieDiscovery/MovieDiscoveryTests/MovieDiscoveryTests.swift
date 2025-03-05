//
//  MovieDiscoveryTests.swift
//  MovieDiscoveryTests
//
//  Created by Sathish kumar on 3/4/25.
//

import XCTest
@testable import MovieDiscovery
@MainActor
final class MovieDiscoveryTests: XCTestCase {
    
    func testFetchMovies_Success() async {
            let mockService = MockNetworkService()
            let viewModel = MoviesViewModel(networkManager: mockService)

            await viewModel.fetchMovies()

            XCTAssertEqual(viewModel.movies.count, 1)
            XCTAssertEqual(viewModel.movies.first?.title, "Death Whisperer 2")
        }

    func testFetchMovies_Failure() async {
            class FailingMockService: NetworkManager {
                override func fetch<T: Decodable>(from url: URL) async throws -> T {
                    throw URLError(.badServerResponse)
                }
            }

            let mockService = FailingMockService()
            let viewModel = MoviesViewModel(networkManager: mockService)

            await viewModel.fetchMovies()

            XCTAssertTrue(viewModel.showAlert)
            XCTAssertNotNil(viewModel.errorMessage)
        }
    

}
