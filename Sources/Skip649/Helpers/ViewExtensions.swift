//
//  ViewExtensions.swift
//  649Life
//
//  Created by Tim Mitra on 2025-01-25.
//


import SwiftUI

extension View {
    
    func eraseToAnyView() -> AnyView {
            AnyView(self)
    }
}

extension String {
    
    static let htmlReplacements: [String: String] = [
            "&quot;": "\"",
            "&amp;": "&",
            "&lt;": "<",
            "&gt;": ">",
            "&#039;": "'",
            "&#8217;": "'",
            "&#8211;": "–",
            "&rsquo;": "'",
            "&lsquo;": "'",
            "&nbsp;": " "
        ]
    
    func decodeHTML() -> String {
        var result = self
        for (entity, replacement) in String.htmlReplacements {
            result = result.replacingOccurrences(of: entity, with: replacement)
        }
        // Remove HTML tags
        let parts = result.components(separatedBy: "<")
        result = parts.map { part in
            if let endIndex = part.firstIndex(of: ">") {
                let index = part.index(after: endIndex)
                return String(part[index...])
            }
            return part
        }.joined()
        
        return result
    }
}
