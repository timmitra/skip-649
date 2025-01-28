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
import WebKit

struct PostDetailView: View {
    @Environment(\.colorScheme) private var colorScheme
    let title: String
    let content: String
    let imageURL: String?
    
    var styledHTML: String {
            """
            <html>
            <head>
            <meta name='viewport' content='width=device-width, initial-scale=1'>
            <style>
            body {
                font-family: -apple-system, system-ui;
                font-size: 17px;
                line-height: 1.5;
                margin: 20px;
                color: \(UITraitCollection.current.userInterfaceStyle == .dark ? "#FFFFFF" : "#000000");
                background-color: \(UITraitCollection.current.userInterfaceStyle == .dark ? "#000000" : "#FFFFFF");
            }
            h1 {
                font-size: 28px;
                font-weight: bold;
            }
            h2 {
                font-size: 22px;
                font-weight: semibold;
            }
            </style>
            </head>
            <body>
            \(content)
            </body>
            </html>
            """
        }
    
    var body: some View {
        ScrollView {
            VStack {
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
                
                WebView(htmlString: styledHTML)
                    .frame(maxWidth: .infinity, minHeight: 600)
            }
        }
        .navigationTitle(title)
    }
}

struct WebView: UIViewRepresentable {
    let htmlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.scrollView.backgroundColor = .clear
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
}

#Preview {
    NavigationView {
        let post = Post.postMocks.first!
        PostDetailView(
            title: post.renderedTitle,
            content: post.renderedContent,
            imageURL: post.featuredImageURL)
    }
}

// End of file. No additional code.
