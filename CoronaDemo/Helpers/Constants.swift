//
//  Constants.swift
//  CoronaDemo
//
//  Created by Rajesh Rajesh on 12/04/20.
//  Copyright © 2020 Rajesh Rajesh. All rights reserved.
//

import Foundation

enum UrlEnum {
    static let countryUrl = "https://covid-193.p.rapidapi.com/countries"
    static let detailUrl = "https://covid-193.p.rapidapi.com/statistics?country="
}

enum keys {
    static let rapidHeaders = [
        "x-rapidapi-host": "covid-193.p.rapidapi.com",
        "x-rapidapi-key": "yUDMsYUkOtmshDZad5laozt4Hx3Wp11A5GHjsnJHCJTFMWmnGn"
    ]
}

enum Errors: String {
    case NOInternetConnection = "NO Internet Connection , Try Again"
}
