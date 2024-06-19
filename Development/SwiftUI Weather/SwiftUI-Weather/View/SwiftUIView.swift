//
//  SwiftUIView.swift
//  SwiftUI-Weather
//
//  Created by Aniket Singh on 29/12/23.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var location: CGPoint = .zero


        var tap: some Gesture {
            SpatialTapGesture()
                .onEnded { event in
                    self.location = event.location
                 }
        }


        var body: some View {
            Circle()
                .fill(self.location.y > 50 ? Color.blue : Color.red)
                .frame(width: 100, height: 100, alignment: .center)
                .gesture(tap)
        }
}

#Preview {
    SwiftUIView()
}
