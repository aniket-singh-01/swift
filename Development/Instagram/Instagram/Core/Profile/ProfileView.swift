//
//  ProfileView.swift
//  Instagram
//
//  Created by Aniket Singh on 20/03/24.
//

import SwiftUI


private let gridItems: [GridItem]=[
    .init(.flexible(),spacing: 1),
    .init(.flexible(),spacing: 1),
    .init(.flexible(),spacing: 1)
]

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            ScrollView{
                //header
                VStack(spacing: 10){
                    
                    //pic and stats
                    HStack {
                        Image("black-panther")
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
                        Text("Aniket Singh")
                            .font(.footnote)
                            .fontWeight(.bold)
                        Text("Coder")
                            .font(.footnote)
                        
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.horizontal)
                    
                    
                    //action Button
                    Button{
                        
                    }label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 360,height: 32)
                            .foregroundStyle(.black)
                            .overlay(
                                alignment: .center,
                                content: {
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(Color.gray, lineWidth: 1)
                                }
                            )
                    }
                    Divider()
                }
                
                //post grid View
                LazyVGrid(columns: gridItems,spacing: 1){
                    ForEach(0 ... 15,id: \.self){ index in
                        Image("black-panther")
                            .resizable()
                            .scaledToFill()
                    }
                    
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
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
    ProfileView()
}
