//
//  AddEmailView.swift
//  Instagram
//
//  Created by Aniket Singh on 30/03/24.
//

import SwiftUI


struct AddEmailView: View {
    @State private var email=""
    
    var body: some View {
        VStack(spacing: 12){
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("You'll use this email to sign into your account")
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal,24)
            
            
            TextField("Enter your email", text: $email)
                .autocapitalization(.none)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal,24)
            
        }
        
    }
}

#Preview {
    AddEmailView()
}
