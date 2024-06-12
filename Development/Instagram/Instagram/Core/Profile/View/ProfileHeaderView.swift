//
//  ProfileHeaderView.swift
//  Instagram
//
//  Created by Aniket Singh on 28/04/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    @State private var showEditProfile=false
    
    
    var body: some View {
        VStack(spacing: 10){
            //pic and stats
            HStack {
                Image(user.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80,height: 80)
                    .clipShape(Circle())
                
                Spacer()
                
                HStack(spacing:8) {
                    UserStatView(value: 3, title: "Posts")
                    
                    UserStatView(value: 12, title: "Followers")
                    
                    UserStatView(value: 22, title: "Following")
                }
            }
            .padding(.horizontal)
            
            //name and bio
            VStack(alignment: .leading) {
                if let fullname = user.fullname{
                    Text(fullname)
                        .font(.footnote)
                        .fontWeight(.bold)
                    if let bio = user.bio{
                        Text(bio)
                            .font(.footnote)
                    }
                    
                    
                }
               
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal)
            
            
            //action Button
            Button{
                if user.isCurrentUser{
                    showEditProfile.toggle()
                }
                else{
                    print("Follow User...a")
                }
            }label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360,height: 32)
                    .background(user.isCurrentUser ? .white: Color(.systemBlue))
                    .foregroundStyle(user.isCurrentUser ? .black: .white)
                    .cornerRadius(6)
                    .overlay(
                        alignment: .center,
                        content: {
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(user.isCurrentUser ? .black: .white, lineWidth: 1)
                        }
                    )
            }
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile, content: {
           EditProfileView(user: user)
        })
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[0])
}
