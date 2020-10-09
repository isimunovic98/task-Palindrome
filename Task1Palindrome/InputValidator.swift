//
//  InputValidator.swift
//  TaskPalindrome
//
//  Created by Ivan Simunovic on 05/10/2020.
//

import Foundation

class InputValidator {
    
    public func isValidExpression(_ value: String) -> Bool{
        return CharacterSet.letters.isSuperset(of: CharacterSet(charactersIn: value))
    }
    
    public func isPalindrome(_ value: String) -> Bool
    {
        let len = value.count / 2

        for i in 0..<len
        {
            let start = value.index(value.startIndex, offsetBy: i)
            let end = value.index(value.endIndex, offsetBy: (i * -1) - 1)

            if value[start] != value[end] {
                return false
            }
        }

        return true
    }
    
}
