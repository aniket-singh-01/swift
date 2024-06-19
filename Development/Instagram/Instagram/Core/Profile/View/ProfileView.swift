//
//  ProfileView.swift
//  Instagram
//
//  Created by Aniket Singh on 20/03/24.
//

import SwiftUI

struct ProfileView: View {
    let user:User
    
   
    
    var body: some View {
        //        NavigationStack {
        ScrollView{
            //header
            ProfileHeaderView(user: user)
            
            //post grid View
            PostGridView(user: user)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        
        //        }
    }
}


#Preview {
    ProfileView(user: User.MOCK_USERS[1])
}
