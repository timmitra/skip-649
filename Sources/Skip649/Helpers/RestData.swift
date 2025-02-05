//
//  RestData.swift
//  skip-649
//
//  Created by Tim Mitra on 2025-01-24.
//


import Foundation

struct RestData {
    static let shared = RestData()  // Add singleton instance
    
    func fetchPosts() async throws -> [Post] {
        let url = URL(string: "\(Constants.wpURL)wp-json/wp/v2/posts?_embed")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedPosts = try JSONDecoder().decode([Post].self, from: data)
        return decodedPosts
    }
    
    func fetchPostsByCategory(categoryId: Int) async throws -> [Post] {
        let url = URL(string: "\(Constants.wpURL)wp-json/wp/v2/posts?categories=\(categoryId)&_embed")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedPosts = try JSONDecoder().decode([Post].self, from: data)
        return decodedPosts
    }
    
    func fetchCategories() async throws -> [Category] {
        let url = URL(string: "\(Constants.wpURL)wp-json/wp/v2/categories?per_page=20&exclude=1")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedCategories = try JSONDecoder().decode([Category].self, from: data)
        return decodedCategories
    }
}
