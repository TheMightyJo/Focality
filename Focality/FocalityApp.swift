//
//  FocalityApp.swift
//  Focality
//
//  Created by Apprenant 154 on 17/07/2024.
//

import SwiftUI
import SwiftData

@main
struct FocalityApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            AuthView()
        }
        .modelContainer(sharedModelContainer)
    }
}
