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
        result = result.replacingOccurrences(of: "&rsquo;", with: "'")
        result = result.replacingOccurrences(of: "&lsquo;", with: "'")
        result = result.replacingOccurrences(of: "&nbsp;", with: " ")
        result = result.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
        
        return result
    }
}
