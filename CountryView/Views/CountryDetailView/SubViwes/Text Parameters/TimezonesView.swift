//
//  TimezonesView.swift
//  CountryView
//
//  Created by Matthew Popov on 20.07.2021.
//

import SwiftUI

struct TimezonesView: View {
    
    var country: Country
    
    var body: some View {
        VStack(alignment: .leading) {
            List(0..<self.country.timezones.count) { i in
                InFormTextView(text: self.country.timezones[i])
            }
        }

    }
}
