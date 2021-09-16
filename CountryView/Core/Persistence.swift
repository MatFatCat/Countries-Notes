//
//  Persistence.swift
//  CountryView
//
//  Created by Matthew Popov on 24.07.2021.
//

import CoreData


struct PersistenceController {
    static let shared = PersistenceController()
    let conteiner: NSPersistentContainer
    
    init() {
        conteiner = NSPersistentContainer(name: "Note")
        
        conteiner.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Some error \(error)")
            }
        }
    }
}
