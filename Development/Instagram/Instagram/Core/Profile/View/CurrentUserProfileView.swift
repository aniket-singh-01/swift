//
//  ProfileView.swift
//  Instagram
//
//  Created by Aniket Singh on 20/03/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user : User
    var posts:[Post]{
        return Post.MOCK_POSTS.filter({$0.user?.username==user.username})
    }
    
    var body: some View {
        NavigationStack {
            ScrollView{
                //header
                ProfileHeaderView(user: user)
                
                //post grid View
                PostGridView(user: user)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }
                    
                }
            }
        }
    }
}


#Preview {
    CurrentUserProfileView(user: User.MOCK_USERS[0])
}
