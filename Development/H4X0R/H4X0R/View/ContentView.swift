//
//  ContentView.swift
//  H4X0R
//
//  Created by Aniket Singh on 29/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager=NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts){ post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            }
            .navigationBarTitle("H4X0R")
        }
        .onAppear{
            self.networkManager.fetchData()
        }
    }
}

#Preview {
    ContentView()
}



