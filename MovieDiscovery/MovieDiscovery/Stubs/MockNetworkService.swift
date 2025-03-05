//
//  MockNetworkService.swift
//  MovieDiscovery
//
//  Created by Sathish kumar on 3/5/25.
//

import Foundation

class MockNetworkService: NetworkManager {
    
    override func fetch<T: Decodable>(from url: URL) async throws -> T {
        if T.self == ResultData.self {
            let mockData = ResultData(
                page: 1,
                results:
                    [Results(adult: false, backdrop_path: "/vfkzNcVzTRCq3C2jYIZtIjSdwf7.jpg", genre_ids: [27,53,28], id: 1247019, original_language: "th", original_title: "ธี่หยด 2", overview: "Three years after his sister's death, Yak relentlessly searches for the dark spirit that killed her in hopes of seeking revenge.", popularity: 530.143, poster_path: "/uDW5eeFUYp1vaU2ymEdVBG6g7iq.jpg", release_date: "2024-10-10", title: "Death Whisperer 2", video: false, vote_average: 7.038, vote_count: 78)],
                total_pages: 1,
                total_results: 1
            )
            return mockData as! T
        }
        throw URLError(.badServerResponse)
    }
}

