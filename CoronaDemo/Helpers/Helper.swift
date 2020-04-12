//
//  Helper.swift
//  CoronaDemo
//
//  Created by Rajesh Rajesh on 12/04/20.
//  Copyright © 2020 Rajesh Rajesh. All rights reserved.
//

import Foundation
import SwiftUI
class Helper {
    
    var alertMessage = ""
    static let shared =  Helper()
    private init(){}
    func showAlert()->Alert{
        
        return  Alert(title: Text("Alert:"),
                      message: Text(alertMessage),
                      dismissButton: Alert.Button.default(
                        Text("Dismiss"), action: { print("Hello world!") }
            )
        )
    }
    
}

