//
//  Category.swift
//  Six49Life
//
//  Created by Tim Mitra on 2025-01-08.
//

import Foundation

struct Category: Codable {
    var id: Int
    var name: String
    var slug: String
    var count: Int
    var description: String
    var link: String
    var taxonomy: String
    var parent: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, slug, count, description, link, taxonomy, parent
    }
    
    var displayOrder: Int {
        switch id {
        case 8: return 1  // Hotel
        case 9: return 2  // Villas
        case 5: return 3  // Restaurants
        case 10: return 4  // Shopping
        case 11: return 5  // Car Service
        case 7: return 6  // Water Activities
        case 12: return 7  // Land Activities
        case 6: return 8  // Spas
        case 13: return 9  // Chefs
        case 14: return 10 // Concierge
        case 15: return 11 // Entertainment
        case 16: return 12 // Provisions
        case 17: return 13 // Services
        default: return 999 // Any other categories go to the end
        }
    }
}

extension Category {
    static let categoryMocks: [Category] = [
        .init(
            id: 11,
            name: "Car Service",
            slug: "car-service",
            count: 4,
            description: "",
            link: "https://hushrealty.ca/concierge/category/car-service/",
            taxonomy: "category",
            parent: 0
        ),
        .init(
            id: 11,
            name: "Car Service",
            slug: "car-service",
            count: 4,
            description: "",
            link: "https://hushrealty.ca/concierge/category/car-service/",
            taxonomy: "category",
            parent: 0
        ),
        .init(
            id: 11,
            name: "Car Service",
            slug: "car-service",
            count: 4,
            description: "",
            link: "https://hushrealty.ca/concierge/category/car-service/",
            taxonomy: "category",
            parent: 0
        )

    ]
}
