//
//  PostViewModel.swift
//  649Life
//
//  Created by Tim Mitra on 2025-01-25.
//


import SwiftUI

@Observable
class PostViewModel {
    var posts: [Post] = []
    private let restData = RestData.shared
    
    func fetchPosts() {
        restData.fetchPosts { fetchedPosts in
            self.posts = fetchedPosts
            print("Fetched \(fetchedPosts.count) posts")
        }
    }
}
