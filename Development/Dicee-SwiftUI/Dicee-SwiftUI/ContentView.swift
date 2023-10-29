//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Aniket Singh on 24/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNumber=1
    @State var rightDiceNumber=1

    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(n: leftDiceNumber)
                    DiceView(n: rightDiceNumber)
                }
                .padding(.horizontal)
                Spacer()
                Button("ROLL") {
                    self.leftDiceNumber=Int.random(in: 1...6)
                    self.rightDiceNumber=Int.random(in: 1...6)
                }.font(.system(size:50))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .padding(.vertical)
            }
        }
    }
}


struct DiceView: View {
    let n: Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}


#Preview {
    ContentView()
}

