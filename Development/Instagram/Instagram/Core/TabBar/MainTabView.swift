//
//  SwiftUIView.swift
//  Instagram
//
//  Created by Aniket Singh on 20/03/24.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase

struct MainTabView: View {
    let user: User
    @State private var selectedIndex=0
    var body: some View {
        let viewModel = EditProfileViewModel(user: user)
        
        TabView(selection: $selectedIndex) {
            FeedView()
                .onAppear(){
                    selectedIndex=0
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            
            SearchView()
                .onAppear(){
                    selectedIndex=1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
     
         
            UploadPostView(tabIndex: $selectedIndex)
                .onAppear(){
                    selectedIndex=2
                }
                .tabItem {
                    Image(systemName: "plus.square")
                }.tag(2)
            
            Text("Notification")
                .onAppear(){
                    selectedIndex=3
                }
                .tabItem {
                    Image(systemName: "play.rectangle")
                }.tag(3)
            
            CurrentUserProfileView(viewModel: viewModel)
                .onAppear(){
                    selectedIndex=4
                }
                .tabItem {
                    Image(systemName: "person")
                }.tag(4)
            
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView(user: User.MOCK_USERS[0])
}
