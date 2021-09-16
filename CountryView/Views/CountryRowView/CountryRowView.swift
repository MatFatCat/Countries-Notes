//
//  CountryWithAPIView.swift
//  CountryView
//
//  Created by Matthew Popov on 16.07.2021.
//

import SwiftUI

struct CountryRowView: View {
    
    var country: Country

    var body: some View {
        
        HStack {
            Image(country.alpha2Code.lowercased())
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            Text(country.name)
                .foregroundColor(.gray)
                .fontWeight(.bold)
                .font(.system(size: 20, weight: .bold, design: .default))
        }
    }
}
