//
//  HomeView.swift
//  Six49Life
//
//  Created by Tim Mitra on 2025-01-10.
//

import SwiftUI
import Collections
import SwiftData

struct HomeView: View {

    @Environment(\.modelContext) private var modelContext
    @Query private var categories: [Category]
    @StateObject private var restData: RestData
    @State private var alertService = AlertService(
      "https://it-guy.com/apns/Six49Life/messages.json"
    )
    
    init(modelContext: ModelContext) {
        _restData = StateObject(wrappedValue: RestData(modelContext: modelContext))
    }
    
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
    
    var sortedCategories: [Category] {
        categories.sorted { $0.displayOrder < $1.displayOrder }
    }
        
    var body: some View {
        NavigationStack {
            Group {
                HomeHeaderView()
            }
            Group {
                ScrollView(.horizontal) {
                    LazyHStack(/*alignment: .firstTextBaseline*/) {
                        ForEach(sortedCategories, id: \.id) { category in
                            NavigationLink {
                                PostListView(modelContext: modelContext, categoryId: category.id)
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
            Group {
                HomeCardsView(modelContext: modelContext)            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Post.self, Category.self, configurations: config)
    HomeView(modelContext: container.mainContext)
        .modelContainer(container)
}
