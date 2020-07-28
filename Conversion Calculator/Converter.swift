//
//  Converter.swift
//  Conversion Calculator
//
//  Created by Payton Marlin on 7/13/20.
//  Copyright © 2020 Payton Marlin. All rights reserved.
//

import Foundation

//Create a stuct to use for the four different converters
struct Converter {
    var label: String {
        get {
            return input + " to " + output
        }
    }
    
    let input: String
    let output: String
}
