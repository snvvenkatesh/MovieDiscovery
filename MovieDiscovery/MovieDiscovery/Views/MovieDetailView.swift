//
//  MovieDetailView.swift
//  MovieDiscovery
//
//  Created by Sathish kumar on 3/5/25.
//
import SwiftUI

struct MovieDetailView: View {
    let movie: Results

    var body: some View {
        ScrollView {
            VStack(spacing: 5) {
                AsyncImage(url: movie.posterURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width - 32)
                        .cornerRadius(10)
                } placeholder: {
                    Color.gray.opacity(0.3)
                        .frame(height: 300)
                }
                Spacer()
                HStack() {
                    Text("Rating: ⭐ \(String(format: "%.1f", movie.vote_average ?? 0.0)) / 10")
                    Spacer()
                    Text("Votes: \(movie.vote_count ?? 0)")
                }
                .padding(5)
                .font(.subheadline)
                .foregroundColor(.secondary)
               
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Release Date: \(movie.release_date)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    
                    Text(movie.title ?? "Unknown Title")
                        .font(.title)
                        .bold()

                    Text(movie.overview ?? "No overview available.")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 4)

                    
                }
                .padding(5)
            }
            .padding()
        }
        .navigationTitle(movie.title ?? "Movie Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}


