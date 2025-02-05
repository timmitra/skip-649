//
//  PostListView.swift
//  649Life
//
//  Created by Tim Mitra on 2025-01-25.
//


import SwiftUI

struct PostListView: View {
    @State private var categories: [Category] = []
    @State private var error: Error? = nil
    @State private var isLoading = false
    private let restData = RestData.shared
    
    let categoryId: Int
    @State private var viewModel = PostViewModel()

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
                    NavigationLink {
                        PostDetailView(
                            title: post.title.rendered.decodeHTML(),
                            content: post.content.rendered.decodeHTML(),
                            imageURL: post.featuredImageURL
                        )
                    } label: {
                        PostListRowView(post: post, categories: categories)
                    }
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
            // Load categories and posts concurrently
            async let categoriesResult = restData.fetchCategories()
            async let postsResult = viewModel.fetchPostsByCategory(categoryId)
            
            // Wait for both to complete
            categories = try await categoriesResult
            try await postsResult
        } catch let fetchError {
            //error = fetchError
        }
        
        isLoading = false
    }
}



//struct PostListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostListView()
//    }
//}
