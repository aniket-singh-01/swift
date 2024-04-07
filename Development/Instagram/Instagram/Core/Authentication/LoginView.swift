//
//  LoginView.swift
//  Instagram
//
//  Created by Aniket Singh on 22/03/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email=""
    @State private var password=""
    var body: some View {
        NavigationStack {
            VStack{
                Spacer()
                //logo
                Image("Instagram_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220,height: 100)
                
                // text field
                VStack{
                    TextField("Enter your email", text: $email)
                        .autocapitalization(.none)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal,24)
                    
                   SecureField("Enter your password", text: $password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal,24)
                }
                
                Button {
                    print("Show Forgot Password")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing,28)
                }
                .frame(maxWidth: .infinity,alignment: .trailing)
                
                Button {
                    print("Login")
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 360,height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(8)
                }
                .padding(.vertical)
                HStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width/2)-40,height: 0.5)
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width/2)-40,height: 0.5)
                }
                .foregroundStyle(.gray)
                
                HStack{
                    Image("Facebook_logo")
                        .resizable()
                        .frame(width:20,height: 20)
                    Text("Continue with facebook")
                        .foregroundStyle(Color(.systemBlue))
                }
                .padding(.top,8)
                Spacer()
                Divider()
     
                NavigationLink{
                  Text("Sign up")
                } label:{
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                    .padding(.vertical, 16)
            }
        }
    }
}

#Preview {
    LoginView()
}
