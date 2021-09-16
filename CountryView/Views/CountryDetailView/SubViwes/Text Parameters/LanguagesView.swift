//
//  LanguagesView.swift
//  CountryView
//
//  Created by Matthew Popov on 20.07.2021.
//

import SwiftUI

struct LanguagesView: View {
    
    var country: Country
    
    var body: some View {
        VStack(alignment: .leading) {
            List(0..<self.country.languages.count) { i in
                HStack {
                    InFormTextView(text: self.country.languages[i].name ?? "No Data")
                }
            }
        }
    }
}
