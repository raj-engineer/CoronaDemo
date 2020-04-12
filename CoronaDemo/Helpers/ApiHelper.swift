//
//  ApiHelper.swift
//  CoronaDemo
//
//  Created by Rajesh Rajesh on 12/04/20.
//  Copyright © 2020 Rajesh Rajesh. All rights reserved.
//


import Foundation
import SwiftUI


class ApiHelper {
    
    
    static let shared =  ApiHelper()
    private init(){}
    
    func fetchData(urlString : String , completion: @escaping (Result<(Data,HTTPURLResponse), Error>) -> Void){
        
        guard let url  =  URL(string: urlString)else {return}
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = keys.rapidHeaders
        
        URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            
            if let error = error {
                completion(.failure(error))
            }
            
            guard let httpResponse = urlResponse as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    print("Error with the response, unexpected status code: \(String(describing: urlResponse))")
                    return
            }
            
            if let data = data, let urlResponse = urlResponse as? HTTPURLResponse  {
                completion(.success((data, urlResponse)))
            }
            
            
        }.resume()
    }
    
}
