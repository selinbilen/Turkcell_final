//
//  PosterCarousel.swift
//  TurkcellFinal
//
//  Created by selin eylül bilen on 2/20/21.
//

import SwiftUI

struct PosterCarousel: View {
    
    let title: String
    let movies: [Movies]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16){
            Text(title)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.horizontal)
            
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 16){
                    ForEach(self.movies){
                        movie in NavigationLink(
                                destination: Detail(movieId: movie.id)){
                                    MoviePoster(movie: movie)
                                        
                                }.buttonStyle(PlainButtonStyle())
                            .padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
                            .padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
                    }
                }
            }
        }
    }
}

struct PosterCarousel_Previews: PreviewProvider {
    static var previews: some View {
        PosterCarousel(title: "Now Playing", movies: Movies.stubbedMovies)
    }
}
