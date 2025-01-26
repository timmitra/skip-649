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
    func decodeHTML() -> String {
        var result = self
        result = result.replacingOccurrences(of: "&quot;", with: "\"")
        result = result.replacingOccurrences(of: "&amp;", with: "&")
        result = result.replacingOccurrences(of: "&lt;", with: "<")
        result = result.replacingOccurrences(of: "&gt;", with: ">")
        result = result.replacingOccurrences(of: "&#039;", with: "'")
        result = result.replacingOccurrences(of: "&#8217;", with: "'")
        result = result.replacingOccurrences(of: "&#8211;", with: "–")
        result = result.replacingOccurrences(of: "&rsquo;", with: "'")
        result = result.replacingOccurrences(of: "&lsquo;", with: "'")
        result = result.replacingOccurrences(of: "&nbsp;", with: " ")
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
