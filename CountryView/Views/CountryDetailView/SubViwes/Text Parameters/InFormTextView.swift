//
//  InFormTextView.swift
//  CountryView
//
//  Created by Matthew Popov on 20.07.2021.
//

import SwiftUI

struct InFormTextView: View {
    
    var text: String
    var fontWeight: Font.Weight = .light
    var textSize: CGFloat = 25
    
    var body: some View {
        Text(text)
            .font(.system(size: textSize, weight: fontWeight, design: .default))
            .foregroundColor(.gray)
    }
}
