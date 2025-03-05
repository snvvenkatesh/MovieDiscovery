//
//  NetworkManager.swift
//  MovieDiscovery
//
//  Created by Sathish kumar on 3/4/25.
//
import Foundation

class NetworkManager {
    
    private var session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func fetch<T: Decodable>(from url: URL) async throws -> T {
        let (data, _) = try await session.data(from: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
