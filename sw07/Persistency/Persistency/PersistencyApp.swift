//
//  PersistencyApp.swift
//  Persistency
//
//  Created by HSLU-N0004890 on 01.11.22.
//

import SwiftUI

@main
struct PersistencyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
