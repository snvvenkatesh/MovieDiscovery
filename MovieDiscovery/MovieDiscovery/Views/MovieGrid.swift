//
//  MovieGrid.swift
//  MovieDiscovery
//
//  Created by Sathish kumar on 3/5/25.
//
import SwiftUI

struct MovieGridItem: View {
    let movie: Results
    @StateObject var viewModel = MoviesViewModel()

    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                AsyncImage(url: movie.posterURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                .frame(width: 150, height: 225)
                .cornerRadius(10)
                
                Button(action: {
                        viewModel.toggleFavorite(movie: movie)
                    }) {
                        Image(systemName: viewModel.favorites.contains(movie.id) ? "heart.fill" : "heart")
                            .foregroundColor(viewModel.favorites.contains(movie.id) ? .red : .white)
                            .padding(10)
                            .background(Color.black.opacity(0.7))  
                            .clipShape(Circle())
                    }
                    .padding(8)
            }

            VStack {
                Text(movie.title ?? "Unknown")
                    .font(.headline)
                    .lineLimit(1)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)

                Text(movie.release_date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: 150)
        }
    }
}
