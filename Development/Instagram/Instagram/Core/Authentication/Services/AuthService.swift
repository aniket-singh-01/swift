//
//  AuthService.swift
//  Instagram
//
//  Created by Aniket Singh on 30/04/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseFirestore

class AuthService{
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthService()
    
    init() {
        Task{ try await loadUserData() }
        
    }
    
    @MainActor
    func login(withEmail email : String, password: String) async throws{
        do{
            let result=try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession=result.user
            try await loadUserData()
        }
        catch{
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(email : String, password: String, username: String) async throws{
        do{
            let result=try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession=result.user
           
            await uploadUserData(uid: result.user.uid, username: username, email: email)
            print("Did upload user data")
        }
        catch{
            print("DEBUG: Failed to register user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func loadUserData() async throws{
        self.userSession = Auth.auth().currentUser
        guard let currentUid=userSession?.uid else {return}
        self.currentUser = try await UserService.fetchUsers(withUid: currentUid)
 
    }
    
    func signOut(){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.userSession=nil
            print("User signed out successfully.")
        } catch let signOutError as NSError {
            print("Error signing out: \(signOutError.localizedDescription)")
        }
        self.userSession=nil
        self.currentUser=nil

    }
    private func uploadUserData(uid:String ,username: String, email: String) async{
        let user=User(id: uid, username: username, email: email)
        self.currentUser=user
        guard let encodedUser=try? Firestore.Encoder().encode(user) else {return}
        
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
    
}
