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
    @State private var error: Error? = nil
    @State private var isLoading = false
    private let restData = RestData.shared
    
    var body: some View {
        Group {
            if isLoading {
                ProgressView()
            } else if let error = error {
                VStack {
                    Text("Error loading data")
                    Text(error.localizedDescription)
                        .font(.caption)
                    Button("Retry") {
                        Task {
                            await loadData()
                        }
                    }
                }
            } else {
                List(viewModel.posts, id: \.id) { post in
                    PostListRowView(post: post, categories: categories)
                }
                .listStyle(.plain)
            }
        }
        .task {
            await loadData()
        }
        .refreshable {
            await loadData()
        }
    }
    
    private func loadData() async {
        isLoading = true
        error = nil
        
        do {
            // Load categories
            categories = try await restData.fetchCategories()
            
            // Load posts
            try await viewModel.fetchPosts()
            error = nil
        } catch let fetchError {
            //error = fetchError
        }
        
        isLoading = false
    }
}


struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
