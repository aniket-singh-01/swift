//
//  FeedCell.swift
//  Instagram
//
//  Created by Aniket Singh on 20/03/24.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack{
            //image + userNAME
            HStack{
                Image("black-panther2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                Text("aniket")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding(.leading,8)
        }
        //post
        
            Image("black-panther")
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
            
            Text("0 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top,1)
            
            // caption
            HStack{
                Text("King").fontWeight(.semibold) +
                Text("king is great")
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
    FeedCell()
}
