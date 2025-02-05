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
    
    func fetchPosts()  async throws {
        posts = try await restData.fetchPosts()
        print("Fetched \(posts.count) posts")
    }
    
//    func fetchPostsByCategory(_ category: Int) {
//        restData.fetchPosts(byCategory: category) { fetchedPosts in
//            self.posts = fetchedPosts
//            print("Fetched \(fetchedPosts.count) posts")
//        }
//    }
}
