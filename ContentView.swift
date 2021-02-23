//
//  ContentView.swift
//  TurkcellFinal
//
//  Created by selin eylül bilen on 2/20/21.
//

import SwiftUI

struct DetailView: View {
    var body: some View{
        MovieListView()
    }
}

struct ContentView: View {
    var body: some View {
        DetailView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ContentView()
        }
    }
}
