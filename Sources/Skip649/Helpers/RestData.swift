//
//  RestData.swift
//  skip-649
//
//  Created by Tim Mitra on 2025-01-24.
//


import Foundation

struct RestData {
    static let shared = RestData()  // Add singleton instance
    
    func fetchPosts(completion: @escaping ([Post]) -> Void) {
        let url = URL(string: "\(Constants.wpURL)wp-json/wp/v2/posts?_embed")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
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
                    completion(decodedPosts)
                }
            } catch {
                print("Decoding error: \(error)")
            }
        }
        task.resume()
    }
    
    func fetchCategories(completion: @escaping ([Category]) -> Void) {
        let url = URL(string: "\(Constants.wpURL)wp-json/wp/v2/categories")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching categories: \(error)")
                return
            }
            
            guard let data = data else {
                print("No category data received")
                return
            }
            
            do {
                let decodedCategories = try JSONDecoder().decode([Category].self, from: data)
                DispatchQueue.main.async {
                    completion(decodedCategories)
                }
            } catch {
                print("Category decoding error: \(error)")
            }
        }
        task.resume()
    }
}
