//
//  Post.swift
//  649Life
//
//  Created by Tim Mitra on 2025-01-08.
//

import Foundation

struct Post: Codable {
    let id: Int
    var title: Rendered
    var content: Rendered
    var date: String  // Changed from timestamp to date
    var categories: [Int]
    private var _embedded: Embedded?  // Add this for featured media
    
    struct Rendered: Codable {
        var rendered: String
    }
    
    struct Embedded: Codable {
        var wpFeaturedmedia: [Media]?
        
        enum CodingKeys: String, CodingKey {
            case wpFeaturedmedia = "wp:featuredmedia"
        }
    }
    
    struct Media: Codable {
        var sourceUrl: String?
        
        enum CodingKeys: String, CodingKey {
            case sourceUrl = "source_url"
        }
    }
    
    var featuredImageURL: String? {
        _embedded?.wpFeaturedmedia?.first?.sourceUrl
    }
}

extension Post {
    static let postMocks: [Post] = [
        .init(
            id: 98,
            title: Rendered(rendered: "La Maison French Bistro"),
            content: Rendered(rendered: "<p>Classic French cuisine in an intimate bistro setting. Enjoy traditional recipes with a modern twist, fresh-baked pastries, and an extensive French wine selection. Perfect for romantic dinners.</p>\n"),
            date: "2024-11-26T19:17:07",
            categories: [5],
            _embedded: Embedded(wpFeaturedmedia: [Media(sourceUrl: "https://hushrealty.ca/concierge/wp-content/uploads/2025/01/pexels-eugenia-remark-5767088-14558326-scaled.jpg")])
        )
    ]
}
