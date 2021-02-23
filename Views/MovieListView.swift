//
//  MovieListView.swift
//  TurkcellFinal
//
//  Created by selin eylül bilen on 2/20/21.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject private var popularMovies = MovieListBind()
    @ObservedObject private var topRatedMovies = MovieListBind()
    @ObservedObject private var upcomingMovies = MovieListBind()
    
    var body: some View {
        NavigationView{
            List{   
                Group{
                    if upcomingMovies.movies != nil{
                        PosterCarousel(title: "Now Playing Movies", movies: upcomingMovies.movies!)
                    }
                    else{
                        
                        Loadig(isLoad: upcomingMovies.isLoad, error: upcomingMovies.error) {
                            self.upcomingMovies.loadMovies(with: .upcoming)
                        }
                    }
                }
                
                .listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0) )
                Group{
                    if popularMovies.movies != nil{
                        PosterCarousel(title: "Popular Movies", movies: popularMovies.movies!)
                    }
                    else{
                        
                        Loadig(isLoad: popularMovies.isLoad, error: popularMovies.error) {
                            self.popularMovies.loadMovies(with: .popular)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                Group{
                    
                    if topRatedMovies.movies != nil{
                        PosterCarousel(title: "Top Rated Movies", movies: topRatedMovies.movies!)
                    }
                    else{
                        Loadig(isLoad: topRatedMovies.isLoad, error: topRatedMovies.error) {
                            self.topRatedMovies.loadMovies(with: .topRated)
                        }
                    }
                }
                
                .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            }
            
            .navigationTitle("TMDB")
            /*
            .navigationBarItems(trailing:
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
                    .padding(UIScreen.main.bounds.size.width)
                                
            )*/
        }
        
        .onAppear{
            self.popularMovies.loadMovies(with: .popular)
            self.topRatedMovies.loadMovies(with: .topRated)
            self.upcomingMovies.loadMovies(with: .upcoming)
            
        }
    }
}


struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
            MovieListView()  
    }
}

