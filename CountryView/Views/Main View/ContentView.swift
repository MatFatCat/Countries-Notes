//
//  ContentView.swift
//  CountryView
//
//  Created by Matthew Popov on 16.07.2021.
//

import SwiftUI
import SwiftUIX

struct ContentView: View {

    @State private var countries: [Country] = []
    @State private var countryToSearch = ""
    @State private var isLoading = true

    var body: some View {
        
        LoadingView (isShowing: self.$isLoading) {//an example of dynamic UI
            NavigationView {
                List(countries.filter { SearchEngine.search(needle: countryToSearch.lowercased(), haystack: $0.name.lowercased()) }) { country in
                    NavigationLink(destination: CountryDetailView(country: country, countries: self.countries)) {
                        CountryRowView(country: country)
                    }
                } .onAppear() {
                    NetworkManager().getData { (dataFromApi) in
                        self.countries = dataFromApi
                        self.isLoading = false
                    }
                }
                .navigationBarTitle("Countries", displayMode: .large)
                .navigationSearchBar {
                    SearchBar("Find a country ...", text: $countryToSearch, onCommit:  {

                    })
                }
            }
            .accentColor(.green)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//var body: some View {
//
//    NavigationView {
//        List(countries) { country in
//            NavigationLink(destination: CountryWithAPIDetailView(country: country)) {
//                CountryWithAPIRowView(country: country)
//            }
//        } .onAppear() {
//            NetworkManager().getData { (dataFromApi) in
//                self.countries = dataFromApi
//            }
//        }
//        .navigationTitle("Countries")
//        .navigationSearchBar {
//            SearchBar("Find a country ...", text: $countryToSearch, onCommit:  {
//                self.countries = self.countries.filter({
//                    $0.name == self.countryToSearch
//                })
//            })
//            .onCancel {
//                //code here
//            }
//            .searchBarStyle(.default)
//        }
//    }
//}

