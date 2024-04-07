//
//  SwiftUIView.swift
//  Instagram
//
//  Created by Aniket Singh on 22/03/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText=""
    
    var body: some View {
        
        
        NavigationStack {
            ScrollView{
                    LazyVStack(spacing:12){
                        ForEach(0...15, id:\.self){ user in
                            HStack {
                                Image("black-panther2")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading) {
                                    Text("aniket")
                                        .fontWeight(.semibold)
                                    Text("aniket")
                                }
                                .font(.footnote)
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                       
                    }
                    .padding(.top,8)
                    .searchable(text: $searchText, prompt: "Search ...")
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    SearchView()
}
