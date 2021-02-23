//
//  Detail.swift
//  TurkcellFinal
//
//  Created by selin eylül bilen on 2/20/21.
//

import SwiftUI


struct Detail: View {
    
    let movieId: Int
    @ObservedObject private var detail = DetailBind()
    
    var body: some View {
        ZStack {
            Loadig(isLoad: self.detail.isLoad, error: self.detail.error) {
                self.detail.loadMovie(id: self.movieId)
            }
            if detail.movie != nil{
                detailList(movie: self.detail.movie!)
               // var name = detail.movie?.title
            }
        }
        .onAppear{
            self.detail.loadMovie(id: self.movieId)
        }
    }
}

struct detailList: View {

    let movie: Movies
    let imageLoader = ImageLoad()

    var body: some View{
        
        List{
            ZStack(alignment: .bottom) {
                detailImage(imageLoad: imageLoader, imageURL: self.movie.backdropURL)
                    .aspectRatio(contentMode: .fit)
                    
                Rectangle()
                    .frame(height: 80)
                    .opacity(0.3)
                    .blur(radius: 10)
                
                    
                HStack{
                    VStack(alignment: .leading, spacing: 8){
                        Text(self.movie.title)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                    }
                    .padding(.leading)
                    .padding(.bottom)
                    
                    Spacer()
                    
                }
            }
            
            .listRowInsets(EdgeInsets())
            VStack{
                Divider()
            HStack{
                if !movie.ratingText.isEmpty{
                    Text(movie.ratingText)
                }
                Text("  📅")
                Text(movie.yearText)
            }
            .padding(.top, 20)
            .padding(.bottom, 20)
                Divider()
                HStack{
                    Text(movie.overview!)
                }
                .padding(.top, 5)
                .padding(.bottom, 5)
                Divider()
            HStack{
                    Text("🎞")
                    Text(movie.genreText)
                    
                    Text("  ⏰")
                    Text(movie.durationText)
            }.padding(.top, 20)
            .padding(.bottom, 20)
            }
        }
    }
}

struct detailImage: View {
    @ObservedObject var imageLoad: ImageLoad
    
    let imageURL: URL
    var body: some View{
        ZStack{
            Rectangle().fill(Color.gray.opacity(0.3))
            if self.imageLoad.image != nil{
                Image(uiImage: self.imageLoad.image!)
                    .resizable()
            }
        }
        .aspectRatio(16/9, contentMode: .fit)
        .onAppear{
            self.imageLoad.loadImage(with: self.imageURL)
        }
    }
    
}


struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Detail(movieId: Movies.stubbedMovie.id)
        }
    }
}

