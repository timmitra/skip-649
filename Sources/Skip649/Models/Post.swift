//
//  Post.swift
//  649Life
//
//  Created by Tim Mitra on 2025-01-08.
//


struct Post: Codable {
    let id: Int
    var title: Rendered
    var content: Rendered
 
    struct Rendered: Codable {
        var rendered: String
    }
}
