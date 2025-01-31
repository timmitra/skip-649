//
//  ProfileView.swift
//  Six49Life
//
//  Created by Tim Mitra on 2025-01-13.
//

import SwiftUI

struct ProfileView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var notificationsEnabled: Bool = false

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Profile Picture")) {
                    Image("profile_picture_placeholder") // Placeholder image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .padding()
                }

                Section(header: Text("User Information")) {
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                }

                Section(header: Text("Preferences")) {
                    Toggle("Enable Notifications", isOn: $notificationsEnabled)
                }

                Section {
                    Button(action: saveProfile) {
                        Text("Save Changes")
                    }
                }
            }
            .navigationTitle("User Profile")
        }
    }

    private func saveProfile() {
        // Logic to save user profile
        print("Profile saved: \(name), \(email), Notifications: \(notificationsEnabled)")
    }
}

#Preview {
    ProfileView()
}
