//
//  UserStatView.swift
//  Instagram
//
//  Created by Aniket Singh on 20/03/24.
//

import SwiftUI

struct UserStatView: View {
    let value:Int
    let title:String
    var body: some View {
        VStack{
            Text("\(value)")
                .font(.footnote)
                .fontWeight(.semibold)
            Text("Posts")
                .font(.footnote)
        }
        .frame(width: 76)
    }
}

#Preview {
    UserStatView(value: 13, title: "Posts")
}
