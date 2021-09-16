//
//  MainContentView.swift
//  CountryView
//
//  Created by Matthew Popov on 21.07.2021.
//

import SwiftUI

struct MainInfoView: View {
    
    let country: Country
    let countries: [Country]
    
    var body: some View {
        
        Image(country.alpha2Code.lowercased())
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(5)
            .shadow(radius: 50)
        
        Form {
            Section(header: "Map") {
                NavigationLink(destination: MapView(lat: self.country.latlng[0], lng: self.country.latlng[1])) {
                    InFormTextView(text: "\(self.country.name) on map")
                }
            }
            
            TextParameters(country: country)
            
            Section(header: "Borders") {
                BordersView(country: country, countries: self.countries)
            }
            
            Section(header: "Languages") {
                LanguagesView(country: country)
            }
            
            Section(header: "Currencies") {
                CurrenciesView(country: country)
            }
            
            Section(header: "Calling Codes") {
                CallingCodesView(country: country)
            }
            
            Section(header: "Timezones") {
                TimezonesView(country: country)
            }
        }
            
        .navigationBarTitle(Text(self.country.name), displayMode: .inline)

    }
}

