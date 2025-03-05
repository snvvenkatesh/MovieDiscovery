//
//  Untitled.swift
//  MovieDiscovery
//
//  Created by Sathish kumar on 3/4/25.
//

import Foundation
struct ResultData : Codable {
    let page : Int?
    let results : [Results]?
    let total_pages : Int?
    let total_results : Int?
}

struct Results : Codable, Identifiable, Equatable {
    let adult : Bool?
    let backdrop_path : String?
    let genre_ids : [Int]?
    let id : Int
    let original_language : String?
    let original_title : String?
    let overview : String?
    let popularity : Double?
    let poster_path : String?
    let release_date : String
    let title : String?
    let video : Bool?
    let vote_average : Double?
    let vote_count : Int?
    
    var formattedReleaseDate: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    if let date = dateFormatter.date(from: release_date) {
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
    return release_date
    }
    var posterURL: URL? {
        guard let path = poster_path else { return nil }
        return URL(string: "\(APIConfiguration().imageBaseUrl)\(path)")
    }
}
