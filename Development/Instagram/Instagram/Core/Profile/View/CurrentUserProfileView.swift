//
//  ProfileView.swift
//  Instagram
//
//  Created by Aniket Singh on 20/03/24.
//

import SwiftUI
import PhotosUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel: EditProfileViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // Header
                ProfileHeaderView(user: viewModel.user)
                
                // Post Grid View
                PostGridView(user: viewModel.user)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }
                }
            }
            .refreshable {
                do {
                    try await viewModel.fetchUpdatedUserData()
                } catch {
                    print("Unable to load posts")
                }
            }
        }
    }
}



#Preview {
    CurrentUserProfileView(viewModel: EditProfileViewModel(user: User.MOCK_USERS[0]))
}
