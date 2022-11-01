//
//  cdeApp.swift
//  core-data-example
//
//  Created by Bennett on 01/11/2022.
//

import SwiftUI

@main
struct nyneApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
