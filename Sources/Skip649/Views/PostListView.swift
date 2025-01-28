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
    private let restData = RestData.shared
    
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
        restData.fetchCategories { fetchedCategories in
            self.categories = fetchedCategories
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
