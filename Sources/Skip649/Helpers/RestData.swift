//
//  RestData.swift
//  skip-649
//
//  Created by Tim Mitra on 2025-01-24.
//


import Foundation

struct RestData {
    
    func fetchPosts() {
        let url = URL(string: "https://hushrealty.ca/concierge/wp-json/wp/v2/pages")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let posts = try JSONDecoder().decode([Post].self, from: data)
                for post in posts {
                    print(post.title.rendered)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}