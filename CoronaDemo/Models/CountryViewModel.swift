//
//  CountryViewModel.swift
//  CoronaDemo
//
//  Created by Rajesh Rajesh on 12/04/20.
//  Copyright © 2020 Rajesh Rajesh. All rights reserved.
//

import Foundation
import  SwiftUI

class CountryViewModel : ObservableObject {
     @Published  var countryNames = [String]()
    @Published var isEnabled = false
    var message =  ""
  var alert: Alert {
              Alert(title: Text("iOScreator"), message: Text("Hello SwiftUI"), dismissButton: .default(Text("Dismiss")))
          }
  
    func createRequest(urlString : String){
        ApiHelper.shared.fetchData(urlString: urlString) { (result) in
            switch result {
            case .success(let data, let urlResponse):
                // Handle Sucess response
                self.parse(jsonData: data)
            case .failure(let error):
                // Handle error
                print(error.localizedDescription)
                DispatchQueue.main.async {
                     self.isEnabled = true
                    Helper.shared.alertMessage = error.localizedDescription
                    
                }
               
                break
            }
        }
    }
    func parse(jsonData: Data) {
        //TODO: Implement JSON decoding and parsing
        do {
            //Decode retrived data with JSONDecoder and assing type of Article object
            let countriesData = try JSONDecoder().decode(Countries.self, from: jsonData)
             print("Data is  ", countriesData)
            DispatchQueue.main.async {
                if let arr = countriesData.response{
                     self.countryNames = arr
                }
                
            }
             
            
        } catch let jsonError {
            print(jsonError)
        }
    }
    
    
    
    
    
}
