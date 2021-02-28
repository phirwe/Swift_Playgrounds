//
//  ValidParentheses.swift
//  Get Swifty
//
//  Created by Poorwa Hirve on 2/15/21.
//

import Foundation

enum Parenthesis: String {
    case round = ")"
    case curly = "}"
    case square = "]"
}

struct Paren {
    var type: Parenthesis
    
    init(_ type: Parenthesis) {
        self.type = type
    }
}

class ValidParentheses {
    func isValid(_ s: String) -> Bool {
        var stack = Array<Paren>()
        for character in s {
            if character == "(" {
                stack.append(Paren(.round))
            } else if character == "{" {
                stack.append(Paren(.curly))
            } else if character == "[" {
                stack.append(Paren(.square))
            }
            else {
                if character == ")" {
                    if stack.last?.type == .round {
                        stack.removeLast()
                    } else {
                        return false
                    }
                } else if character == "}" {
                    if stack.last?.type == .curly {
                        stack.removeLast()
                    } else {
                        return false
                    }
                } else if character == "]" {
                    if stack.last?.type == .square {
                        stack.removeLast()
                    } else {
                        return false
                    }
                }
            }
        }
        return stack.count == 0
    }
}
