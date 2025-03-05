
# MovieDiscovery

## Overview

The MovieDiscovery App is a SwiftUI-based application that allows users to discover movies, search for their favorite titles, view movie details, and mark movies as favorites. It utilizes The Movie Database (TMDB) API to fetch movie data and UserDefaults to persist favorite movies.

## Features
### 1. Movie List Screen:
* Fetches and displays movies from TMDB API.
* Shows movie poster, title, and release year in a grid layout.
* Supports infinite scrolling to load more movies dynamically.
* Search functionality with real-time API calls.
* Users can mark/unmark movies as favorites.
* Favorites are stored persistently using UserDefaults.

### 2. Movie Detail Screen:
* Displays full movie details: title, overview, release date, rating, votes and poster.

## Tech Stack
* Swift & SwiftUI for UI development.
* Async/await for networking.
* MVVM Architecture for separation of concerns.
* UserDefaults for persistent storage of favorite movies.
* URLSession for API communication.

## Setup Instructions
1. Clone the repository:
```
git clone https://github.com/snvvenkatesh/MovieDiscovery.git
cd MovieDiscovery
```
2. Open the project in Xcode (MovieDiscovery.xcodeproj).
3. Obtain an API key from [The Movie Database (TMDB)](https://www.themoviedb.org/settings/api) and replace YOUR_API_KEY in APIConfiguration.swift:
``` 
private let apiKey = "YOUR_API_KEY"
```
4. Run the project on a simulator or a physical device.


## API Endpoints
* Fetch Movies:
``` 
https://api.themoviedb.org/3/discover/movie?api_key=YOUR_API_KEY
``` 
* Search Movies:
```
https://api.themoviedb.org/3/search/movie?query={search_term}&api_key=YOUR_API_KEY
```

## Project Structure
```
├── MovieDiscovery
│   ├── Model
│   │   └── MovieList.swift
│   ├── MovieDiscoveryApp.swift
│   ├── Preview Content
│   │   └── Preview Assets.xcassets
│   ├── Stubs
│   │   ├── APIConfiguration.swift
│   │   ├── MockNetworkService.swift
│   │   ├── NetworkManager.swift
│   │   └── NetworkService.swift
│   ├── ViewModel
│   │   └── MoviesViewModel.swift
│   └── Views
│       ├── ContentView.swift
│       ├── MovieDetailView.swift
│       └── MovieGrid.swift
├── MovieDiscovery.xcodeproj
│   ├── project.pbxproj
│   ├── project.xcworkspace
│   │       └── xcschememanagement.plist
└── MovieDiscoveryTests
    └── MovieDiscoveryTests.swift
```
## Screenshots
![Movie List](https://github.com/snvvenkatesh/MovieDiscovery/blob/main/ScreenShots/MovieList.png?raw=true "MovieList")
![Movie Search](https://github.com/snvvenkatesh/MovieDiscovery/blob/main/ScreenShots/Movie_Search.png?raw=true "MovieSearch")
![Movie Detail](https://github.com/snvvenkatesh/MovieDiscovery/blob/main/ScreenShots/MovieDetail.png?raw=true "MovieDetail")

## Unit Testing

- Includes tests for `MoviesViewModel` to ensure correct API response handling.
- Uses **XCTest** framework for writing unit tests.






