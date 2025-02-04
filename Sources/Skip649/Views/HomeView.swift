//
//  HomeView.swift
//  Six49Life
//
//  Created by Tim Mitra on 2025-01-10.
//

import SwiftUI

struct HomeView: View {

    private let restData = RestData.shared
    @State var categories: [Category] = []
    
    var sortedCategories: [Category] {
        categories.sorted { $0.displayOrder < $1.displayOrder }
    }
        
    var body: some View {

        NavigationStack {
            VStack {
                HomeHeaderView()
                
                HomeMenuView(sortedCategories: sortedCategories)
                
                HomeCardsView()
            }
        }
        .onAppear {
            restData.fetchCategories { fetchedCategories in
                self.categories = fetchedCategories
            }
        }
        .padding()
    }
}

#Preview {
    HomeView()
        .onAppear {
            var homeView = HomeView()
            homeView.categories = Category.categoryMocks
           // homeView.posts = Post.postMocks
        }
}
