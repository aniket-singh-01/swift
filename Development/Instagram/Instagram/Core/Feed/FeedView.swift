//
//  FeedView.swift
//  Instagram
//
//  Created by Aniket Singh on 20/03/24.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack(spacing: 32){
                    ForEach(0...10, id: \.self){ post in
                        FeedCell()
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
    }
}

#Preview {
    FeedView()
}
