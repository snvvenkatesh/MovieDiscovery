//
//  NetworkService.swift
//  MovieDiscovery
//
//  Created by Sathish kumar on 3/5/25.
//
import Foundation
protocol NetworkService {
    func fetchMovies() async throws -> ResultData
}
