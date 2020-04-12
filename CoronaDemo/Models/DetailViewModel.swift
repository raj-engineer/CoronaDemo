//
//  DetailViewModel.swift
//  CoronaDemo
//
//  Created by Rajesh Rajesh on 12/04/20.
//  Copyright © 2020 Rajesh Rajesh. All rights reserved.
//

import Foundation
import  SwiftUI
class DetailViewModel : ObservableObject {
    @Published var detailObject: Response? = nil
    @Published var isEnabled = false
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
                                  Helper.shared.alertMessage = error.localizedDescription+"1"
                                  
                              }
                break
            }
        }
    }
    
    func parse(jsonData: Data) {
        //TODO: Implement JSON decoding and parsing
        do {
            //Decode retrived data with JSONDecoder and assing type of Article object
            let detailData = try JSONDecoder().decode(Detail.self, from: jsonData)
              print("detailData is  ", detailData)
           DispatchQueue.main.async {
               self.detailObject = detailData.response?[0]
           }
            
            
        } catch let jsonError {
            print(jsonError)
        }
        
    }
    
}
