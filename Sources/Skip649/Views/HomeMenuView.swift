//
//  HomeMenuView.swift
//  skip-649
//
//  Created by Tim Mitra on 2025-01-31.
//

import SwiftUI

struct HomeMenuView: View {
    
    let sortedCategories: [Category]
    @State private var viewModel = PostViewModel()
    
    func categoryIcon(for id: Int) -> String {
        switch id {
        case 8: return "house.lodge"  // Hotel
        case 9: return "house"  // Villas
        case 5: return "fork.knife"  // Restaurants
        case 10: return "bag"  // Shopping
        case 11: return "car"  // Car Service
        case 7: return "sailboat"  // Water Activities
        case 12: return "beach.umbrella"  // Land Activities
        case 6: return "apple.meditate"  // Spas
        case 13: return "frying.pan"  // Chefs
        case 14: return "bell" // Concierge
        case 15: return "guitars" // Entertainment
        case 16: return "backpack" // Provisions
        case 17: return "wrench" // Services
        default: return "star" // Any other categories go to the end
        }
    }
    
    var body: some View {
        
        
        ScrollView(.horizontal) {
            LazyHStack() {
                ForEach(sortedCategories, id: \.id) { category in
                    NavigationLink {
                        PostListView(categoryId: category.id)
                    } label: {
                        VStack {
                            Image(systemName: categoryIcon(for: category.id))
                            Text(category.name)
                                .font(.caption)
                        }
                        .font(.largeTitle)
                    }
                }
            }
            .frame(height: 80)
        }
    }
}

