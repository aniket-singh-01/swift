//
//  MessageBox.swift
//  Instagram
//
//  Created by Aniket Singh on 06/07/24.
//

import SwiftUI

struct MessageBox: View {
    @State private var searchText=""
    
    var body: some View {
        NavigationStack{
            ScrollView{
                //            LazyVStack(spacing: 32){
                //
                //            }
                //            .padding(.top,8)
            }
            
            .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
//                        ToolbarItem(placement: .topBarLeading) {
//                            Image("edit")
//                                .resizable()
//                                .frame(width: 100,height: 45 )
//                        }
    
                        ToolbarItem(placement: .topBarTrailing) {
                            Image(systemName: "square.and.pencil")
                                .imageScale(.large)
                        }
                    }
                    .searchable(text: $searchText, prompt: "Search ...")
        }
    }
}

#Preview {
    MessageBox()
}
