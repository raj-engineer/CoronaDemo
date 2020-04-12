//
//  ContentView.swift
//  CoronaDemo
//
//  Created by Rajesh Rajesh on 12/04/20.
//  Copyright © 2020 Rajesh Rajesh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var countryVM = CountryViewModel()
    
    init() {
        UINavigationBar.appearance().tintColor = .white
    }
    var body: some View {
        NavigationView {
            List(self.countryVM.countryNames, id:\.self) { names in
                
                NavigationLink(destination: DetailView(title: names)) {
                    
                    Text(names)
                }
            }.navigationBarTitle("countries").onAppear(perform: self.call)
                .alert(isPresented: self.$countryVM.isEnabled, content: {Helper.shared.showAlert()})
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    func call() {
        self.countryVM.createRequest(urlString : UrlEnum.countryUrl)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
