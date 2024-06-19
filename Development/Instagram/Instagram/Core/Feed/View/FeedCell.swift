//
//  FeedCell.swift
//  Instagram
//
//  Created by Aniket Singh on 20/03/24.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    let post: Post
    var body: some View {
        VStack{
            //image + userNAME
            HStack{
                if let user = post.user{
                    CircularImageProfileView(user: user, size: .xSmall)
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                Spacer()
            }
            .padding(.leading,8)
        }
        //post
        
        KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
        
        
        //action button
     
        VStack {
            HStack{
                Button{
                   print("Like post")
                }label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                Button{
                    print("Comment")
                }label: {
                    Image(systemName: "button.right")
                        .imageScale(.large)
                }
                Button{
                    print("Share post")
                }label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                Spacer()
            
            }
            .padding(.leading,8)
            .padding(.top,4)
            .foregroundStyle(.black)
            
            
            //likes
            
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top,1)
            
            // caption
            HStack{
                Text("\(post.user?.username ?? "")").fontWeight(.semibold) +
                Text(post.caption)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .font(.footnote)
            .padding(.leading,10)
            .padding(.top,1)
            
            Text("6h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top,1)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    FeedCell(post: Post.MOCK_POSTS[0])
}
