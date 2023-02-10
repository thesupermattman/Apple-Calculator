//
//  ViewModel.swift
//  Apple Calculator
//
//  Created by arthithai.aamlid on 8/2/2566 BE.
//

import Foundation

class ViewModel {
        
    var latestNumber = ""
    var latestResultNumber: Float? = nil
    var latestOperator = ""
    var isEqualTapped = false
    let plusSign = "+"
    
    func calculate(value: String) -> String {
        if value == plusSign {
            latestOperator = value
            latestResultNumber = isEqualTapped ? latestResultNumber : (Float(latestNumber) ?? 0) + (latestResultNumber ?? 0)
            latestNumber = ""
            isEqualTapped = false
            return String((latestResultNumber ?? 0))
        } else if value == "-" {
            latestOperator = value
            if let notNilValue = latestResultNumber {
                latestResultNumber = isEqualTapped ? latestResultNumber : notNilValue - (Float(latestNumber) ?? 0)
            } else {
                latestResultNumber = isEqualTapped ? latestResultNumber : Float(latestNumber)
            }
            latestNumber = ""
            isEqualTapped = false
            return String((latestResultNumber ?? 0))
        } else if value == "*" {
            latestOperator = value
            if let notNilValue = latestResultNumber {
                latestResultNumber = isEqualTapped ? latestResultNumber : notNilValue * (Float(latestNumber) ?? 0)
            } else {
                latestResultNumber = isEqualTapped ? latestResultNumber : Float(latestNumber)
            }
            latestNumber = ""
            return String((latestResultNumber ?? 0))
        } else if value == "/" {
            latestOperator = value
            if let notNilValue = latestResultNumber {
                latestResultNumber = isEqualTapped ? latestResultNumber : notNilValue / (Float(latestNumber) ?? 0)
            } else {
                latestResultNumber = isEqualTapped ? latestResultNumber : Float(latestNumber)
            }
            latestNumber = ""
            isEqualTapped = false
            return String(latestResultNumber ?? 0)
        } else if value == "%"{
            if let notNilValue = latestResultNumber {
                latestResultNumber = notNilValue / 100.0
            } else {
                latestResultNumber = (Float(latestNumber) ?? 0) / 100.0
            }
            return String(latestResultNumber ?? 0)
        } else if value == "+/-" {
            return "0"
        } else { // MARK: Only number
            // latestNumber += value
            latestNumber = latestNumber + value
            return latestNumber
        }
    }
    
    func reset() -> String {
        latestNumber = ""
        latestResultNumber = nil
        latestOperator = ""
        isEqualTapped = false
        return "0.0"
    }
    
    func equals() -> String {
        isEqualTapped = true
        if latestOperator == "+" {
            latestResultNumber = (Float(latestNumber) ?? 0) + (latestResultNumber ?? 0)
            return String((latestResultNumber ?? 0))
        } else if latestOperator == "-" {
            latestResultNumber = (latestResultNumber ?? 0) - (Float(latestNumber) ?? 0)
            return String((latestResultNumber ?? 0))
        } else if latestOperator == "*" {
            latestResultNumber = (Float(latestNumber) ?? 0) * (latestResultNumber ?? 0)
            return String((latestResultNumber ?? 0))
        } else if latestOperator == "/" {
            latestResultNumber = (latestResultNumber ?? 0) / (Float(latestNumber) ?? 0)
            return String((latestResultNumber ?? 0))
        } else {
            return "0"
        }
    }
}

// To do
// Fix percent button
// Fix positive negative
// Make buttons round
// If the above is done, then try to do the model. Also see what I could make an enum.

//            if isEqualTapped {
//                latestOperator = value
//                //latestResultNumber = (Float(latestNumber) ?? 0) + (latestResultNumber ?? 0)
//                latestNumber = ""
//                isEqualTapped = false
//                return String((latestResultNumber ?? 0))
//            } else {
//                latestOperator = value
//                latestResultNumber = (Float(latestNumber) ?? 0) + (latestResultNumber ?? 0)
//                latestNumber = ""
//                isEqualTapped = false
//                return String((latestResultNumber ?? 0))
//            }
