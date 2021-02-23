//
//  MoviesService.swift
//  TurkcellFinal
//
//  Created by selin eylül bilen on 2/20/21.
//

import Foundation

protocol MoviesService {
    //fetching the movie list
    func fetchMovies(from endpoint: MovieListEndpoint, completion: @escaping (Result<MoviesResponse, MovieError>) -> ())
    //fetching a single movie
    func fetchMovie(id: Int, completion: @escaping (Result<Movies, MovieError>) -> ())
}

//this enum represents the endpoint for the movie list api
//it has four cases but I used only three
enum MovieListEndpoint: String, CaseIterable, Identifiable{
    
    var id: String { rawValue }
    
    case nowPlaying = "now_playing"
    case upcoming
    case popular
    case topRated = "top_rated"
     
    //declare the description for each case
    //so I can show in the movie list
    var description: String{
        switch self {
            case .nowPlaying:
                return "Now Playing"
            case .upcoming:
                return "Upcoming"
            case .topRated:
                return "Top Rated"
            case .popular:
                return "Popular"
        }
    }
}

enum MovieError: Error, CustomNSError{
    case apiError //generic error
    case invalidEndpoint //error when constructing the endpoint
    case invalidResponse //error when HTTP response status code is not 200-300
    case noData
    case serializationError //json decoding error
    
    // I declare 5 errors for the simplicity
    var localizedDescription: String{
        switch self {
            case .apiError:
                return "Failed to fetch data"
        case .invalidEndpoint:
            return "Invalid Endpoint"
        case .invalidResponse:
            return "Invalid response"
        case .noData:
            return "No data"
        case .serializationError:
            return "Failed to decode data"
        }
    }
    
    var errorUserInfo: [String : Any]{
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}
