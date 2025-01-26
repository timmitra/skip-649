//
//  PostListView.swift
//  649Life
//
//  Created by Tim Mitra on 2025-01-25.
//


import SwiftUI

struct PostListView: View {
    @State private var viewModel = PostViewModel()
    
    var body: some View {
        List(viewModel.posts, id: \.id) { post in
            VStack(alignment: .leading, spacing: 8) {
                // Safely decode HTML content
                let decodedTitle = post.title.rendered.decodeHTML()
                let decodedContent = post.content.rendered.decodeHTML()
                
                Text(decodedTitle)
                    .font(.headline)
                Text(decodedContent)
                    .font(.body)
                    .lineLimit(2)
            }
            .padding(.vertical, 8)
        }
        .listStyle(.plain)
        .onAppear {
            viewModel.fetchPosts()
        }
        .refreshable {
            viewModel.fetchPosts()
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
