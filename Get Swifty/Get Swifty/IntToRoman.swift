//
//  IntToRoman.swift
//  Get Swifty
//
//  Created by Poorwa Hirve on 2/14/21.
//

import Foundation

class IntToRoman {
    let romanDict: [Int: String] = [
            1 : "I",
            4 : "IV",
            5 : "V",
            9 : "IX",
            10 : "X",
            40 : "XL",
            50 : "L",
            90 : "XC",
            100 : "C",
            400 : "CD",
            500 : "D",
            900 : "CM",
            1000 : "M"
        ]
    func intToRoman(_ num: Int) -> String {
        if num >= 1000 {
            return romanDict[1000]! + intToRoman(num - 1000)
        } else if num >= 900 {
            return romanDict[900]! + intToRoman(num - 900)
        } else if num >= 500 {
            return romanDict[500]! + intToRoman(num - 500)
        } else if num >= 400 {
            return romanDict[400]! + intToRoman(num - 400)
        } else if num >= 100 {
            return romanDict[100]! + intToRoman(num - 100)
        } else if num >= 90 {
            return romanDict[90]! + intToRoman(num - 90)
        } else if num >= 50 {
            return romanDict[50]! + intToRoman(num - 50)
        } else if num >= 40 {
            return romanDict[40]! + intToRoman(num - 40)
        } else if num >= 10 {
            return romanDict[10]! + intToRoman(num - 10)
        } else if num >= 9 {
            return romanDict[9]! + intToRoman(num - 9)
        } else if num >= 5 {
            return romanDict[5]! + intToRoman(num - 5)
        } else if num >= 4 {
            return romanDict[4]! + intToRoman(num - 4)
        } else if num >= 1 {
            return romanDict[1]! + intToRoman(num - 1)
        } else {
            return ""
        }
    }
}
