//
//  SwiftUIView.swift
//  Instagram
//
//  Created by Aniket Singh on 20/03/24.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        TabView {
            Text("Feed")
                .tabItem {
                    Image(systemName: "house")
                }
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            Text("Upload Post")
                .tabItem {
                    Image(systemName: "plus.square")
                }
            Text("Notification")
                .tabItem {
                    Image(systemName: "heart")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .tint(.black)
    }
}

#Preview {
    SwiftUIView()
}
