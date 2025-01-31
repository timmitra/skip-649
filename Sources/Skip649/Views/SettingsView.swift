//
//  SettingsView.swift
//  Six49Life
//
//  Created by Tim Mitra on 2025-01-14.
//


import SwiftUI

struct SettingsView: View {
    // State properties for various settings
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    @State private var selectedLanguage = 0
    
    // Language options
    private let languages = ["English", "French", "Spanish"]
    
    var body: some View {
        VStack {
            Form {
                // Notifications section
                Section(header: Text("Notifications")) {
                    Toggle("Enable Notifications", isOn: $notificationsEnabled)
                }
                
                // Appearance section
                Section(header: Text("Appearance")) {
                    Toggle("Dark Mode", isOn: $darkModeEnabled)
                    Picker("Language", selection: $selectedLanguage) {
                        ForEach(0..<3) { index in
                            Text(languages[index])
                        }
                    }
                }
                
                // Account section
                Section(header: Text("Account")) {
                    Button(action: {
                        // Add sign out logic here
                    }) {
                        Text("Sign Out")
                            .foregroundColor(.red)
                    }
                }
                
                // About section
                Section(header: Text("About")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("\(AlertService.appVersion) (\(AlertService.buildVersion))")
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
