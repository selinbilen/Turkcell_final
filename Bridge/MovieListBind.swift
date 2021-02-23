//
//  MovieListBind.swift
//  TurkcellFinal
//
//  Created by selin eylül bilen on 2/20/21.
//

import SwiftUI

class MovieListBind: ObservableObject{
    
    @Published var movies: [Movies]?
    @Published var isLoad = false
    @Published var error: NSError?
    
    private let movieService: MoviesService
    
    init(movieService: MoviesService = MovieStore.shared){
        self.movieService = movieService
    }
    
    func loadMovies(with endpoint: MovieListEndpoint){
        self.movies = nil
        self.isLoad = false
        self.movieService.fetchMovies(from: endpoint){[weak self] (result) in
            guard let self = self else {return}
            self.isLoad = false
            
            switch result{
            case .success(let response):
                self.movies = response.results
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
}
