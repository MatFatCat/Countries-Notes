//
//  BordersView.swift
//  CountryView
//
//  Created by Matthew Popov on 20.07.2021.
//

import SwiftUI

struct BordersView: View {
    
    var country: Country
    let countries: [Country]
    
    var body: some View {
        if self.country.borders.count != 0 {
            VStack(alignment: .leading) {
                List(0..<self.country.borders.count) { i in
                    InFormTextView(text: findCountryNameWithAlpha3Code(borderName: self.country.borders[i]))
                }
            }
        }
        else {
            InFormTextView(text: "Ocean")
        }
    }
    
    private func findCountryNameWithAlpha3Code(borderName: String) -> String {
        
        for countryToFind in self.countries {
            if countryToFind.alpha3Code == borderName {
                return countryToFind.name
            }
        }
        
        return ""
    }
}
