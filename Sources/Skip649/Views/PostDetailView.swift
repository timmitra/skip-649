//
//  PostDetailView.swift
//  Six49Life
//
//  Created by Tim Mitra on 2025-01-08.
//


//
//  PostDetailView.swift
//  Six49Life
//

import SwiftUI
//import WebKit
import UIKit

struct PostDetailView: View {
    @Environment(\.colorScheme) private var colorScheme
    let title: String
    let content: String
    let imageURL: String?
    
    
    var body: some View {
        ScrollView {
            VStack {
                Text(title)
                    .font(.title)
                if let imageURL = imageURL,
                   let url = URL(string: imageURL) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Image("placeholderImage")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .clipped()
                } else {
                    // Local asset image
                    Image(imageURL ?? "")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .clipped()
                }
                Text(content)
                
            }
            //.navigationTitle(title)
        }
    }
}

#Preview {
    // NavigationView {
    let post = Post.postMocks.first!
    PostDetailView(
        title: post.title.rendered.decodeHTML(),
        content: post.content.rendered.decodeHTML(),
        imageURL: post.featuredImageURL)
    //}
}

// End of file. No additional code.
