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
        let url = URL(string: "https://hushrealty.ca/concierge/wp-json/wp/v2/posts")!
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if let error = error {
                print("Error fetching posts: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decodedPosts = try JSONDecoder().decode([Post].self, from: data)
                DispatchQueue.main.async {
                    self?.posts = decodedPosts
                    print("Fetched \(decodedPosts.count) posts")
                }
            } catch {
                print("Decoding error: \(error)")
            }
        }
        task.resume()
    }
}