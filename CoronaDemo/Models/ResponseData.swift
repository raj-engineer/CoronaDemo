//
//  ResponseData.swift
//  CoronaDemo
//
//  Created by Rajesh Rajesh on 12/04/20.
//  Copyright © 2020 Rajesh Rajesh. All rights reserved.
//

import Foundation
import SwiftUI

struct Countries: Codable {
    var get : String?
    var response : [String]?
    let results : Int?
}

struct Detail: Codable , Identifiable{
    
    let id =  UUID()
    var get : String?
    let response : [Response]?
    let results : Int?
    
}
struct Response: Codable {
    let country :  String
    var cases : Cases?
    var deaths : Deaths?
}

struct Cases : Codable {
      let total : Int?
      let recovered : Int?
      let new : String?
      let active : Int?
  }
struct Deaths : Codable {
    let new : String?
    let total : Int?
}
