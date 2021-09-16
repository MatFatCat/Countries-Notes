//
//  CountryWithAPI.swift
//  CountryView
//
//  Created by Matthew Popov on 16.07.2021.
//

import SwiftUI


struct Country: Codable, Identifiable {//https://restcountries.eu/rest/v2/all?fields=name
    let id = UUID()
    var name: String
    var capital: String
    var borders: [String]
    var alpha3Code: String
    var flag: String
    var alpha2Code: String
    var population: Int
    var subregion: String
    var nativeName: String?
    var timezones: [String]
    var numericCode: String?
    var currencies: [Currency]
    var languages: [Language]
}

struct Currency: Codable, Identifiable {
    let id = UUID()
    var code: String?
    var name: String?
    var symbol: String?
}

struct Language: Codable, Identifiable {
    let id = UUID()
    var iso639_1: String?
    var iso639_2: String?
    var name: String?
    var nativeName: String?
}
