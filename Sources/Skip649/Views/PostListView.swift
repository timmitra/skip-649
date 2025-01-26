//
//  PostListView.swift
//  649Life
//
//  Created by Tim Mitra on 2025-01-25.
//


import SwiftUI

struct PostListView: View {
    @State private var viewModel = PostViewModel()
    @State private var categories: [Category] = []
    
    var body: some View {
        List(viewModel.posts, id: \.id) { post in
            PostListRowView(post: post, categories: categories)
        }
        .listStyle(.plain)
        .onAppear {
            viewModel.fetchPosts()
            fetchCategories()
        }
        .refreshable {
            viewModel.fetchPosts()
            fetchCategories()
        }
    }
    
    private func fetchCategories() {
        let url = URL(string: "\(Constants.wpURL)/wp-json/wp/v2/categories")!
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
                    self.categories = decodedCategories
                }
            } catch {
                print("Category decoding error: \(error)")
            }
        }
        task.resume()
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
