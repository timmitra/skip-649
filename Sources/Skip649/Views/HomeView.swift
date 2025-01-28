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
   // @State var posts: [Post] = []
        
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
    
    func droidIcon(for id: Int) -> String {
        switch id {
        case 8: return "Icons.Outlined.Home"  // Hotel
        case 9: return "house"  // Villas
        case 5: return "restaurant"  // Restaurants
        case 10: return "Icons.Outlined.ShoppingCart"  // Shopping
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

    
    var sortedCategories: [Category] {
        categories.sorted { $0.displayOrder < $1.displayOrder }
    }
        
    var body: some View {
       // Text("HomeView")
        NavigationStack {
//            Group {
//             //   HomeHeaderView()
//            }
            Group {
                ScrollView(.horizontal) {
                  LazyHStack() {
                       ForEach(sortedCategories, id: \.id) { category in
                           NavigationLink {
                                PostListView()
                            } label: {
                                VStack {
//#if !SKIP
                                    Image(systemName: categoryIcon(for: category.id))
                                    
//                                    #else
//                                        Image(systemName: droidIcon(for: category.id))
//                                          
//#endif
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
//            Group {
//           //     HomeCardsView()
//            }
//            Spacer()
        }
        .onAppear {
            restData.fetchCategories { fetchedCategories in
                self.categories = fetchedCategories
            }
        }
        .padding()
    }
}

//#Preview {
//    HomeView()
//        .onAppear {
//            var homeView = HomeView()
//            homeView.categories = Category.categoryMocks
//           // homeView.posts = Post.postMocks
//        }
//}
