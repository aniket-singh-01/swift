//
//  Post.swift
//  Instagram
//
//  Created by Aniket Singh on 28/04/24.
//

import Foundation
import Firebase
struct Post: Identifiable, Hashable, Codable{
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timeStamp: Timestamp
    var user: User?
}

extension Post{
    static var MOCK_POSTS: [Post]=[
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is test caption",
            likes: 123,
            imageUrl: "black-panther3",
            timeStamp: Timestamp(),
            user: User.MOCK_USERS[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is caption",
            likes: 13,
            imageUrl: "black-panther1",
            timeStamp: Timestamp(),
            user: User.MOCK_USERS[4]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is test caption  4",
            likes: 12323,
            imageUrl: "black-panther2",
            timeStamp: Timestamp(),
            user: User.MOCK_USERS[1]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is test caption",
            likes: 123,
            imageUrl: "black-panther2",
            timeStamp: Timestamp(),
            user: User.MOCK_USERS[2]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This ss is test caption",
            likes: 1243,
            imageUrl: "black-panther3",
            timeStamp: Timestamp(),
            user: User.MOCK_USERS[0]
        ),
        
    ]
}
