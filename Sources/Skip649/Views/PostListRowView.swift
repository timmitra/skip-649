//
//  PostListRowView.swift
//  skip-649
//
//  Created by Tim Mitra on 2025-01-25.
//


//
//  PostListRowView.swift
//  Six49Life
//
//  Created by Tim Mitra on 2025-01-16.
//
import SwiftUI

struct PostListRowView: View {
    var post: Post
    var categories: [Category]
    
    // Add helper functions for asset handling
    private func isAssetURL(_ urlString: String?) -> Bool {
        guard let urlString = urlString else { return false }
        return urlString.hasPrefix("asset://")
    }
    
    private func assetName(from urlString: String?) -> String? {
        guard let urlString = urlString,
              urlString.hasPrefix("asset://") else { return nil }
        return String(urlString.dropFirst(8))
    }
    
    var body: some View {
        HStack(spacing: 16) {
            if let imageURL = post.featuredImageURL {
                if isAssetURL(imageURL) {
                    // Load mock from Assets catalog
                    if let assetName = assetName(from: imageURL) {
                        Image(assetName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                } else if let url = URL(string: imageURL) {
                    // Load from remote URL
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            
            VStack(alignment: .leading) {
                Text(post.title.rendered.decodeHTML())
                if !post.categories.isEmpty {
                    HStack {
                        ForEach(post.categories, id: \.self) { categoryId in
                            if let category = categories.first(where: { $0.id == categoryId }) {
                                Text(category.name)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    do {
        let post = try Post.postMocks.first!
        let category = Category.categoryMocks
        return PostListRowView(post: post,
                           categories: category)
    } catch {
        return Text("Preview failed to load")
    }
}
