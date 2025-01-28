//
//  HomeCardsView.swift
//  Six49Life
//
//  Created by Tim Mitra on 2025-01-12.
//
import SwiftUI
import SwiftData

struct HomeCardsView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var posts: [Post]
    @StateObject private var restData: RestData
    @State private var randomPosts: [Post] = []
    
    init(modelContext: ModelContext) {
        _restData = StateObject(wrappedValue: RestData(modelContext: modelContext))
    }

    private let gridLayout = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: gridLayout, spacing: 16) {
                    let height: CGFloat = 170
                    ForEach(randomPosts, id: \.id) { post in
                        NavigationLink {
                            PostDetailView(
                                title: post.renderedTitle,
                                content: post.renderedContent,
                                imageURL: post.featuredImageURL
                            )
                        } label: {
                            Card {
                                var description: String?
                                VStack {
                                    Spacer()
                                    HStack {
                                        Text(post.renderedTitle)
                                            .fontWeight(.bold)
                                            .font(.title3)
                                            .lineLimit(2)
                                            .shadow(color: .gray, radius: 2, x: 0, y: 2)
                                        Spacer()
                                    }
                                }
                                .padding(.all, 6.0)
                                .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0), Color.black.opacity(0), Color.black.opacity(description != nil ? 0.3 : 0)]), startPoint: .top, endPoint: .bottom))
                                .frame(maxWidth: .infinity)
                                .frame(width: height, height: height)
                                .foregroundColor(Color.white)
                                .background(
                                    Group {
                                        if let imageURL = post.featuredImageURL,
                                           let url = URL(string: imageURL) {
                                            AsyncImage(url: url) { image in
                                                image
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                            } placeholder: {
                                                Image("placeholderImage")
                                                    .resizable()
                                                    .renderingMode(.original)
                                            }
                                        } else {
                                            Image("placeholderImage")
                                                .resizable()
                                                .renderingMode(.original)
                                        }
                                    }
                                )
                            }
                            .frame(width: height, height: height)
                        }
                    }
                }
            }
        }
        .onAppear {
            restData.fetchData {
                // After fetching, update random posts
                randomPosts = Array(restData.posts.shuffled().prefix(8))
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Post.self, Category.self, configurations: config)
    HomeCardsView(modelContext: container.mainContext)
        .modelContainer(container)
}
