//
//  HomeHeaderView.swift
//  Six49Life
//
//  Created by Tim Mitra on 2025-01-12.
//

import SwiftUI

struct HomeHeaderView: View {
    
    var body: some View {
        HStack {
            Image("649Life-logo")
                .resizable()
                .frame(width: 150, height: 150)
            Spacer()
            NavigationLink {
                SettingsView()
            } label: {
                Image(systemName: "gear")
            }
            Image(systemName: "bell.fill")
            NavigationLink {
                ProfileView()
            } label: {
                Image(systemName: "person.circle")
            }
            
        }
        .font(.largeTitle)
    }
}

#Preview {
    HomeHeaderView()
}
