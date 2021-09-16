//
//  MakeNote.swift
//  CountryView
//
//  Created by Matthew Popov on 23.07.2021.
//

import SwiftUI
import CoreData

struct MakeNote: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    @State var title: String = ""
    @State var bodyNote: String = ""
    let country: Country
    
    var body: some View {
        VStack {
            Section(header: "Title"){
                TextField("Add a title", text: self.$title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Section(header: "Note"){
                TextEditor(text: self.$bodyNote)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.gray)
            }
            Spacer()
            
            Button {
                addNote()
            } label: {
                Text("Add Your Note About \(self.country.name)")
                    .frame(width: 280, height: 50)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(30)
            }
        }
    }
    
    private func saveContext() {
        do {
            try self.viewContext.save()
            self.presentationMode.wrappedValue.dismiss()
        } catch {
            let error = error as NSError
            fatalError("Some Error \(error)")
        }
    }
    
    private func getStringFromDate(date: Date) -> String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        
        return formatter.string(from: date)
    }
    
    private func addNote() {
        let newNote = Note(context: self.viewContext)
        newNote.title = self.title
        newNote.bodyNote = self.bodyNote
        newNote.date = Date()
        newNote.countryName = self.country.name
        newNote.stringDate = getStringFromDate(date: newNote.date!)
        
        saveContext()
    }
}
