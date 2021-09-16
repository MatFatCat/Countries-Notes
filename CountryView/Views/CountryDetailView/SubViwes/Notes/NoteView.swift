//
//  NoteView.swift
//  CountryView
//
//  Created by Matthew Popov on 22.07.2021.
//

import SwiftUI
import CoreData

struct NoteView: View {
    
    let country: Country
    let persistanceConteiner = PersistenceController.shared
    @State private var showNoteSheet = false
    @FetchRequest(sortDescriptors: [])
    private var notes: FetchedResults<Note>
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        List {
            ForEach (self.notes) { note in
                if note.countryName == self.country.name {
                    NavigationLink(destination: NoteDetailView(note: note)) {
                        VStack(alignment: .leading) {
                            InFormTextView(text: note.title ?? "Untitled", fontWeight: .bold, textSize: 35)
                            InFormTextView(text: note.stringDate ?? "", fontWeight: .light, textSize: 14)
                        }
                    }
                }
            }.onDelete(perform: deleteTask)
        }
        .sheet(isPresented: self.$showNoteSheet, content: {
            MakeNote(country: self.country).environment(\.managedObjectContext, persistanceConteiner.conteiner.viewContext)
        })
        .navigationBarTitle("Your Notes About \(self.country.name)", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.showNoteSheet = true
        }, label: {
            Image(systemName: "plus.circle")
                .imageScale(.large)
        }))
    }
    
    private func deleteTask(offstes: IndexSet) {
        withAnimation {
            offstes.map { notes[$0] }.forEach(viewContext.delete)
            do {
                try self.viewContext.save()
            } catch {
                let error = error as NSError
                fatalError("Some Error \(error)")
            }
        }
    }
}
