//
//  NoteDetailView.swift
//  CountryView
//
//  Created by Matthew Popov on 25.07.2021.
//

import SwiftUI

struct NoteDetailView: View {
    
    let note: Note
    @State private var bodyText: String = ""
    
    var body: some View {
        VStack {
            TextEditor(text: self.$bodyText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.gray)
        }
        .onAppear() {
            self.bodyText = self.note.bodyNote!
        }
        .onDisappear() {
            self.note.bodyNote = self.bodyText
        }
        .navigationBarTitle(self.note.title!, displayMode: .automatic)
        
        Spacer()
    }
}
