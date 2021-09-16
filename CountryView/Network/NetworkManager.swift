//
//  APIClient.swift
//  CountryView
//
//  Created by Matthew Popov on 16.07.2021.
//

import SwiftUI
import Combine

class NetworkManager {
    func getData(completion: @escaping ([Country]) -> ()) {
        guard let url = URL(string: "https://restcountries.eu/rest/v2/all?fields=name;capital;borders;alpha3Code;flag;alpha2Code;population;subregion;nativeName;timezones;numericCode;currencies;languages;callingCodes;latlng;area") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let resoult = try! JSONDecoder().decode([Country].self, from: data)
            
            DispatchQueue.main.async {
                completion(resoult)
            }
        }
        .resume()
    }
}


