//
//  CountryWithAPIDetailView.swift
//  CountryView
//
//  Created by Matthew Popov on 16.07.2021.
//

import SwiftUI

struct CountryDetailView: View {
    
    let country: Country
    let countries: [Country]
    @State private var addNote = false
    let persistanceConteiner = PersistenceController.shared
    
    var body: some View {
        
        VStack(alignment: .leading) {
            MainInfoView(country: self.country, countries: self.countries)
            
        }
        .toolbar {
            NavigationLink(destination: NoteView(country: self.country).environment(\.managedObjectContext, persistanceConteiner.conteiner.viewContext)) {
                Button {
                    self.addNote.toggle()
                } label: {
                    Label("View note", systemImage: "rectangle.and.pencil.and.ellipsis")
                }
            }
        }
    }
}

