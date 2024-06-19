//
//  ListingView.swift
//  AirBnb
//
//  Created by Aniket Singh on 12/01/24.
//

import SwiftUI

struct ListingItemView: View {
    
    var images=[
        "Image 1",
        "Image 2",
        "Image 3",
    ]
    var body: some View {
        VStack(spacing: 8){
            //images
            TabView{
                ForEach(images, id:\.self){ image in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                }
            }
                .frame(height:320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .tabViewStyle(.page)
            
            //listing details
            HStack(alignment: .top){
                // details
                VStack(alignment: .leading){
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                    Text("12 min")
                        .foregroundStyle(.gray)
                    Text("Nov 3-10")
                        .foregroundStyle(.gray)
                    HStack(spacing: 4){
                        Text("564")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                }
                
                Spacer()
                
                // rating
                
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                    Text("4.86")
                }
            }
            .font(.footnote )
        }
        
    }
}

#Preview {
    ListingItemView()
}
