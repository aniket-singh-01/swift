//
//  ContentView.swift
//  AniketCard
//
//  Created by Aniket Singh on 23/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color(.systemGreen).edgesIgnoringSafeArea(.all)
            VStack {
                Text("Aniket")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                .foregroundColor(.white)
                Divider()
                ExtractedView(text: "1233455", imageName: "phone.fill")
                ExtractedView(text: "1233fasdfas455", imageName: "phone.fill")
                  
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}

struct ExtractedView: View {
    let text:String
    let imageName:String
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50)
            .overlay(HStack {
                Image(systemName: imageName).foregroundColor(.gray)
                Text(text)
            })
            .padding(.all)
    }
}
