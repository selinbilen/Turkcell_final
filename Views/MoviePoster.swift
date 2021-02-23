//
//  MoviePoster.swift
//  TurkcellFinal
//
//  Created by selin eylül bilen on 2/20/21.
//

import SwiftUI

struct MoviePoster: View {
    
    let movie: Movies
    @ObservedObject var imageLoad = ImageLoad()
    
    var body: some View {
        ZStack{
            if self.imageLoad.image != nil{ //checks image nil or not
                Image(uiImage: self.imageLoad.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .shadow(radius: 8)
            }
            else{
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    .shadow(radius: 8)
                    
                Text(movie.title)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(width: 204, height: 306)
        .onAppear(){
            self.imageLoad.loadImage(with: self.movie.posterURL)
        }
    }
}

struct MoviePoster_Previews: PreviewProvider {
    static var previews: some View {
        MoviePoster(movie: Movies.stubbedMovie)
    }
}
