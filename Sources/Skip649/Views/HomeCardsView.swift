//
//  HomeCardsView.swift
//  Six49Life
//
//  Created by Tim Mitra on 2025-01-12.
//
import SwiftUI

struct HomeCardsView: View {
    
    private let restData = RestData.shared
    @State private var viewModel = PostViewModel()
    
    private let gridLayout = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: gridLayout, spacing: 16) {
                    let height: CGFloat = 170
                    // ForEach(randomPosts, id: \.id) { post in
                    ForEach(viewModel.posts, id: \.id) { post in
                        NavigationLink {
                            PostDetailView(
                                title: post.title.rendered.decodeHTML(),
                                content: post.content.rendered.decodeHTML(),
                                imageURL: post.featuredImageURL
                            )
                        } label: {
                            if let imageURL = post.featuredImageURL,
                               let url = URL(string: imageURL) {
                                CardWithBackground(
                                    title: post.title.rendered.decodeHTML(),
                                    height: height,
                                    pictureUrl: url,
                                    description: nil
                                )
                                .frame(width: height, height: height)
                            } else {
                                CardWithBackground(
                                    title: post.title.rendered.decodeHTML(),
                                    height: height,
                                    pictureUrl: URL(fileURLWithPath: ""),  // This will show placeholder
                                    description: nil
                                )
                                .frame(width: height, height: height)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                do {
                    try await viewModel.fetchPosts()
                } catch {
                    print("Error fetching posts: \(error)")
                    // Handle the error appropriately
                }
            }
        }
    }
}


//#Preview {
//    HomeCardsView()
//}
