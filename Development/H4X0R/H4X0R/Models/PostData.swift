//
//  PostData.swift
//  H4X0R
//
//  Created by Aniket Singh on 28/11/23.
//

import Foundation

struct Results: Decodable{
    let hits : [Post]
    
}

struct Post: Decodable,Identifiable{
    var id: String{
        return objectID
    }
    let objectID: String
    let points: Int
    let url: String?
    let title: String
}
