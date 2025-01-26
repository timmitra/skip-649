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
    private let restData = RestData()
    
    func fetchPosts() {
        let url = URL(string: "\(Constants.wpURL)/wp-json/wp/v2/posts?_embed")!
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if let error = error {
                print("Error fetching posts: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            // Debug: Print raw JSON
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw JSON: \(jsonString)")
            }
            
            do {
                let decodedPosts = try JSONDecoder().decode([Post].self, from: data)
                DispatchQueue.main.async {
                    self?.posts = decodedPosts
                    print("Fetched \(decodedPosts.count) posts")
                    // Debug featured images
                    for post in decodedPosts {
                        print("Post \(post.id) embedded: \(String(describing: post.embedded))")
                        if let imageURL = post.featuredImageURL {
                            print("Post \(post.id) has image: \(imageURL)")
                        }
                    }
                }
            } catch {
                print("Decoding error: \(error)")
            }
        }
        task.resume()
    }
}
