//
//  PostService.swift
//  Instagram
//
//  Created by Aniket Singh on 19/06/24.
//

import Foundation
import Firebase

struct PostService{

    static func fetchFeedPost() async throws -> [Post]{
        let snapshot=try await Firestore.firestore().collection("posts").getDocuments()
        var posts = snapshot.documents.compactMap({try? $0.data(as: Post.self) })

        for i in 0 ..< posts.count {
            let post=posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUsers(withUid: ownerUid) 
            posts[i].user=postUser
        }
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post]{
        let snapshot = try await Firestore.firestore().collection("posts").whereField("ownerUid", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({try? $0.data(as: Post.self) })
    }
}
