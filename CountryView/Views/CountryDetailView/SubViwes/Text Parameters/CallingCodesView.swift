//
//  CallingCodesView.swift
//  CountryView
//
//  Created by Matthew Popov on 20.07.2021.
//

import SwiftUI

struct CallingCodesView: View {
    
    var country: Country
    
    var body: some View {
        VStack(alignment: .leading) {
            List(0..<self.country.callingCodes!.count) { i in
                HStack {
                    InFormTextView(text: "+" + self.country.callingCodes![i])
                }
            }
        }
    }
}
