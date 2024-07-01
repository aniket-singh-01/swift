//
//  FeedView.swift
//  Instagram
//
//  Created by Aniket Singh on 20/03/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct FeedView: View {
    
    @StateObject var viewModel = FeedViewModel()
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack(spacing: 32){
                    ForEach(viewModel.posts){ post in
                        FeedCell(post: post)
                    }
                }
                .padding(.top,8)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Image("Instagram_logo")
                        .resizable()
                        .frame(width: 100,height: 45 )
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            }
        }
        .refreshable {
            do {
                try await viewModel.fetchPosts()
            } catch {
                print("Unable to load posts")
            }
        }
    }
}

#Preview {
    FeedView()
}
