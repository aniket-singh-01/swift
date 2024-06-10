//
//  User.swift
//  Instagram
//
//  Created by Aniket Singh on 19/04/24.
//

import Foundation
import Firebase

struct User: Identifiable,Codable,Hashable{
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname : String?
    var bio: String?
    let email: String

    var isCurrentUser: Bool{
        guard let currentUid=Auth.auth().currentUser?.uid else{ return false}
        return currentUid==id
    }
}

extension User{
    static var MOCK_USERS: [User]=[
    .init(id: NSUUID().uuidString, username: "ak", profileImageUrl: "black-panther", fullname: "black", bio: "coder", email: "bat@gmail.com"),
    .init(id: NSUUID().uuidString, username: "aks", profileImageUrl: "black-panther1", fullname: "black", bio: "coder", email: "bat@gmail.com"),
    .init(id: NSUUID().uuidString, username: "ak2", profileImageUrl: "black-panther2", fullname: "black", bio: "coder", email: "bat@gmail.com"),
    .init(id: NSUUID().uuidString, username: "ak", profileImageUrl: "black-panther1", fullname: "black", bio: "coder", email: "bat@gmail.com"),
    .init(id: NSUUID().uuidString, username: "ak4", profileImageUrl: "black-panther", fullname: "black", bio: "coder", email: "bat@gmail.com"),
    ]
}
