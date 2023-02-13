//
//  ViewModel.swift
//  Apple Calculator
//
//  Created by arthithai.aamlid on 8/2/2566 BE.
//
extension Float {
    var removeDecimal: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

import Foundation

class ViewModel {
        
    var latestNumber = ""
    var latestResultNumber: Float?
    var latestOperator: Model.OperatorType?
    var isEqualTapped = false
    var latestOperatorInputedWithoutEquals = true
    
    func calculate(operatorType: Model.OperatorType) -> String {
        switch operatorType {
        case .plusSign:
            if let notNilValue = latestResultNumber {
                if latestOperator != .plusSign && isEqualTapped == false{
                    latestResultNumber = Float(equals())
                } else {
                    latestResultNumber = isEqualTapped ? latestResultNumber : (Float(latestNumber) ?? 0) + notNilValue
                }
            } else {
                latestResultNumber = isEqualTapped ? latestResultNumber : Float(latestNumber)
            }
            latestOperator = .plusSign
            latestNumber = ""
            isEqualTapped = false
            return String((latestResultNumber ?? 0).removeDecimal)
        case .minusSign:
            if let notNilValue = latestResultNumber {
                if latestOperator != .minusSign && isEqualTapped == false {
                    latestResultNumber = Float(equals())
                }
                else {
                    latestResultNumber = isEqualTapped ? latestResultNumber : notNilValue - (Float(latestNumber) ?? 0)
                }
            } else {
                latestResultNumber = isEqualTapped ? latestResultNumber : Float(latestNumber)
            }
            latestOperator = .minusSign
            latestNumber = ""
            isEqualTapped = false
            return String((latestResultNumber ?? 0).removeDecimal)
        case.multiplySign:
            if let notNilValue = latestResultNumber {
                if latestOperator != .multiplySign && isEqualTapped == false {
                    latestResultNumber = Float(equals())
                } else {
                    latestResultNumber = isEqualTapped ? latestResultNumber : notNilValue * (Float(latestNumber) ?? 0)
                }
            } else {
                latestResultNumber = isEqualTapped ? latestResultNumber : Float(latestNumber)
            }
            latestOperator = .multiplySign
            latestNumber = ""
            isEqualTapped = false
            return String((latestResultNumber ?? 0).removeDecimal)
        case.divideSign:
            if let notNilValue = latestResultNumber {
                if latestOperator != .divideSign && isEqualTapped == false {
                    latestResultNumber = Float(equals())
                } else {
                    latestResultNumber = isEqualTapped ? latestResultNumber : notNilValue / (Float(latestNumber) ?? 0)
                }
            } else {
                latestResultNumber = isEqualTapped ? latestResultNumber : Float(latestNumber)
            }
            latestOperator = .divideSign
            latestNumber = ""
            isEqualTapped = false
            return String((latestResultNumber ?? 0).removeDecimal)
        case.percentSign:
            isEqualTapped = true
            if let notNilValue = latestResultNumber {
                latestResultNumber = notNilValue / 100.0
            } else {
                latestResultNumber = (Float(latestNumber) ?? 0) / 100.0
            }
            return String((latestResultNumber ?? 0).removeDecimal)
        case.positiveNegativeSign:
            if let notNilValue = latestResultNumber {
                if latestOperator != nil && isEqualTapped == false {
                    if latestNumber.contains("-") {
                        latestNumber.remove(at: latestNumber.startIndex)
                    } else {
                        latestNumber.insert("-", at: latestNumber.startIndex)
                    }
                    return latestNumber
                } else {
                    var latestResultNumberAsString:String = (String(notNilValue))
                    if (latestResultNumberAsString.contains("-")) {
                        latestResultNumberAsString.remove(at: latestResultNumberAsString.startIndex)
                        latestResultNumber = Float(latestResultNumberAsString)
                    } else {
                        latestResultNumberAsString.insert("-", at: latestResultNumberAsString.startIndex)
                        latestResultNumber = Float(latestResultNumberAsString)
                    }
                    return String((latestResultNumber ?? 0).removeDecimal)
                }
            } else {
                if latestNumber.contains("-") {
                    latestNumber.remove(at: latestNumber.startIndex)
                } else {
                    latestNumber.insert("-", at: latestNumber.startIndex)
                }
                return latestNumber
            }
        }
    }
    
    func inputNumber(value: String) -> String {
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
    
    func reset() -> String {
        latestNumber = ""
        latestResultNumber = nil
        latestOperator = nil
        isEqualTapped = false
        return "0"
    }
    
    func equals() -> String {
        isEqualTapped = true
        if latestOperator == .plusSign {
            latestResultNumber = (Float(latestNumber) ?? 0) + (latestResultNumber ?? 0)
            return String((latestResultNumber ?? 0).removeDecimal)
        } else if latestOperator == .minusSign {
            latestResultNumber = (latestResultNumber ?? 0) - (Float(latestNumber) ?? 0)
            return String((latestResultNumber ?? 0).removeDecimal)
        } else if latestOperator == .multiplySign {
            latestResultNumber = (Float(latestNumber) ?? 0) * (latestResultNumber ?? 0)
            return String((latestResultNumber ?? 0).removeDecimal)
        } else if latestOperator == .divideSign {
            latestResultNumber = (latestResultNumber ?? 0) / (Float(latestNumber) ?? 0)
            return String((latestResultNumber ?? 0).removeDecimal)
        } else {
            return "0"
        }
    }
}

// To do
// DONE: Make the decimal point disapear if it's .0
// DONE: Make it so that if I type another number after pressing equals, it resets and doesn't add another number to the string
// DONE: Make buttons round
// DONE: Fix the problem where I can't continue an equation after entering another function
// DONE: Fix the problem so the positive/negative button changes the number that's currently on the screen
// Make it so that bodmass aplies

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

// Eqaution
//if latestOperator == "+" && isEqualTapped == false && oldNumber == nil {
//                    oldNumber = notNilValue
//                    latestResultNumber = isEqualTapped ? latestResultNumber : Float(latestNumber)
//                } else if oldNumber != nil && latestOperator == "*" {
//                    latestResultNumber = oldNumber! + (latestResultNumber! * (Float(latestNumber) ?? 0))
//                    oldNumber = nil
//                }
//                    else {
//                    latestResultNumber = isEqualTapped ? latestResultNumber : notNilValue * (Float(latestNumber) ?? 0)
//                }

// Old function
//func calculate(value: String) -> String {
//        if value == plusSign {
//            if let notNilValue = latestResultNumber {
//                if latestOperator != "+" && isEqualTapped == false{
//                    latestResultNumber = Float(equals())
//                } else {
//                    latestResultNumber = isEqualTapped ? latestResultNumber : (Float(latestNumber) ?? 0) + notNilValue
//                }
//            } else {
//                latestResultNumber = isEqualTapped ? latestResultNumber : Float(latestNumber)
//            }
//            latestOperator = value
//            latestNumber = ""
//            isEqualTapped = false
//            return String((latestResultNumber ?? 0).removeDecimal)
//        } else if value == "-" {
//            if let notNilValue = latestResultNumber {
//                if latestOperator != "-" && isEqualTapped == false {
//                    latestResultNumber = Float(equals())
//                }
//                else {
//                    latestResultNumber = isEqualTapped ? latestResultNumber : notNilValue - (Float(latestNumber) ?? 0)
//                }
//            } else {
//                latestResultNumber = isEqualTapped ? latestResultNumber : Float(latestNumber)
//            }
//            latestOperator = value
//            latestNumber = ""
//            isEqualTapped = false
//            return String((latestResultNumber ?? 0).removeDecimal)
//        } else if value == "*" {
//            if let notNilValue = latestResultNumber {
//                if latestOperator != "*" && isEqualTapped == false {
//                    latestResultNumber = Float(equals())
//                } else {
//                    latestResultNumber = isEqualTapped ? latestResultNumber : notNilValue * (Float(latestNumber) ?? 0)
//                }
//            } else {
//                latestResultNumber = isEqualTapped ? latestResultNumber : Float(latestNumber)
//            }
//            latestOperator = value
//            latestNumber = ""
//            isEqualTapped = false
//            return String((latestResultNumber ?? 0).removeDecimal)
//        } else if value == "/" {
//            if let notNilValue = latestResultNumber {
//                if latestOperator != "/" && isEqualTapped == false {
//                    latestResultNumber = Float(equals())
//                } else {
//                    latestResultNumber = isEqualTapped ? latestResultNumber : notNilValue / (Float(latestNumber) ?? 0)
//                }
//            } else {
//                latestResultNumber = isEqualTapped ? latestResultNumber : Float(latestNumber)
//            }
//            latestOperator = value
//            latestNumber = ""
//            isEqualTapped = false
//            return String((latestResultNumber ?? 0).removeDecimal)
//        } else if value == "%"{
//            isEqualTapped = true
//            if let notNilValue = latestResultNumber {
//                latestResultNumber = notNilValue / 100.0
//            } else {
//                latestResultNumber = (Float(latestNumber) ?? 0) / 100.0
//            }
//            return String((latestResultNumber ?? 0).removeDecimal)
//        } else if value == "+/-" {
//            if let notNilValue = latestResultNumber {
//                if latestOperator != "" && isEqualTapped == false {
//                    if latestNumber.contains("-") {
//                        latestNumber.remove(at: latestNumber.startIndex)
//                    } else {
//                        latestNumber.insert("-", at: latestNumber.startIndex)
//                    }
//                    return latestNumber
//                } else {
//                    var latestResultNumberAsString:String = (String(notNilValue))
//                    if (latestResultNumberAsString.contains("-")) {
//                        latestResultNumberAsString.remove(at: latestResultNumberAsString.startIndex)
//                        latestResultNumber = Float(latestResultNumberAsString)
//                    } else {
//                        latestResultNumberAsString.insert("-", at: latestResultNumberAsString.startIndex)
//                        latestResultNumber = Float(latestResultNumberAsString)
//                    }
//                    return String((latestResultNumber ?? 0).removeDecimal)
//                }
//            } else {
//                if latestNumber.contains("-") {
//                    latestNumber.remove(at: latestNumber.startIndex)
//                    return latestNumber
//                } else {
//                    latestNumber.insert("-", at: latestNumber.startIndex)
//                    return latestNumber
//                }
//            }
//        } else { // MARK: Only number
//            // latestNumber += value
//            if isEqualTapped == true { // Code so that if if a new number is entered after an equals, then it resets the calculator
//                latestNumber = ""
//                latestResultNumber = nil
//                isEqualTapped = false
//                latestNumber = latestNumber + value
//                return latestNumber
//            } else {
//                latestNumber = latestNumber + value
//                return latestNumber
//            }
//        }
//    }
