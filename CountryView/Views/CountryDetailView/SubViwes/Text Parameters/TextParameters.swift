//
//  TextParameters.swift
//  CountryView
//
//  Created by Matthew Popov on 20.07.2021.
//

import SwiftUI

struct TextParameters: View {
    
    var country: Country
    
    var body: some View {
        Section(header: "Capiial") {
            InFormTextView(text: "\(self.country.capital)")
        }
        
        Section(header: "Population") {
            InFormTextView(text: "\(self.country.population)")
        }
        
        Section(header: "Area(km2)") {
            InFormTextView(text: "\(self.country.area ?? 0)")
        }

        Section(header: "Region") {
            InFormTextView(text: self.country.subregion)
        }

        Section(header: "Native Name") {
            InFormTextView(text: self.country.nativeName!)
        }
        
        Section(header: "Domain") {
            InFormTextView(text: self.country.alpha2Code.uppercased())
        }

    }
}
