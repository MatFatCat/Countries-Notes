//
//  CurrenciesView.swift
//  CountryView
//
//  Created by Matthew Popov on 20.07.2021.
//

import SwiftUI

struct CurrenciesView: View {
    
    var country: Country
    
    var body: some View {
        
        VStack(alignment: .leading) {
            List(0..<self.country.currencies.count) { i in
                if self.country.currencies[i].name != nil {
                    InFormTextView(text: self.country.currencies[i].name!)
                }
            }
        }
    }
}

