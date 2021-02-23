//
//  DetailBind.swift
//  TurkcellFinal
//
//  Created by selin eylül bilen on 2/20/21.
//

import SwiftUI

class DetailBind: ObservableObject{
    
    private let movieService: MoviesService
    @Published var movie: Movies?
    @Published var isLoad = false
    @Published var error: NSError?
    
    init(movieService: MoviesService = MovieStore.shared){
        self.movieService = movieService
    }
    
    func loadMovie(id: Int){
        self.movie = nil
        self.isLoad = false
        self.movieService.fetchMovie(id: id) { [weak self] (result) in
            guard let self = self else {return}
            
            self.isLoad = false
            switch result{
            case.success(let movie):
                self.movie = movie
            case.failure(let error):
            self.error = error as NSError
            }
        }
    }
}
