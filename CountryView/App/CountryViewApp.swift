//
//  CountryViewApp.swift
//  CountryView
//
//  Created by Matthew Popov on 16.07.2021.
//

import SwiftUI

@main
struct CountryViewApp: App {

    let persistanceConteiner = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistanceConteiner.conteiner.viewContext)
        }
    }
}
