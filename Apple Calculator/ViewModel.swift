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
    var negativeInputed = false
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
            isEqualTapped = false
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
            isEqualTapped = true
            if let notNilValue = latestResultNumber {
                latestResultNumber = notNilValue / 100.0
            } else {
                latestResultNumber = (Float(latestNumber) ?? 0) / 100.0
            }
            return String(latestResultNumber ?? 0)
        } else if value == "+/-" {
            if let notNilValue = latestResultNumber {
                var latestResultNumberAsString:String = (String(notNilValue))
                if (latestResultNumberAsString.contains("-")) {
                    latestResultNumberAsString.remove(at: latestResultNumberAsString.startIndex)
                    latestResultNumber = Float(latestResultNumberAsString)
                    return String((latestResultNumber ?? 0))
                } else {
                    latestResultNumberAsString.insert("-", at: latestResultNumberAsString.startIndex)
                    latestResultNumber = Float(latestResultNumberAsString)
                    return String((latestResultNumber ?? 0))
                }
            } else {
                if latestNumber.contains("-") {
                    latestNumber.remove(at: latestNumber.startIndex)
                    return latestNumber
                } else {
                    latestNumber.insert("-", at: latestNumber.startIndex)
                    return latestNumber
                }
            }
        } else { // MARK: Only number
            // latestNumber += value
            if isEqualTapped == true { // Code so that if if a new number is entered after an equals, then it resets the calculator
                latestNumber = ""
                latestResultNumber = nil
                isEqualTapped = false
                latestNumber = latestNumber + value
                return latestNumber
            } else {
                latestNumber = latestNumber + value
                return latestNumber
            }
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
// Make the decimal point disapear if it's .0
// DONE: Make it so that if I type another number after pressing equals, it resets and does'nt add another number to the string
// Make buttons round
// If the above is done, then try to do the model. Also see what I could make an enum
// BONUS: Make the numbers smaller if there's more numbers on screen so it fits

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

//            isEqualTapped = true
//            if let notNilValue = latestResultNumber {
//                latestResultNumber = notNilValue * -1
//                latestNumber = ""
//            } else if latestNumber == "0.0" {
//                negativeInputed = true
//            } else {
//                latestResultNumber = (Float(latestNumber) ?? 0) * -1
//                latestNumber = ""
//            }
            //latestNumber = ""
