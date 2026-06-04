//
//  Post.swift
//  HakcerNewsApp
//
//  Created by Arjun Saseendran on 04/06/26.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String { return objectID }
    let objectID: String
    let title: String
    let points: Int
    let url: String
}
