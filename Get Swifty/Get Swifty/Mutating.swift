//
//  Mutating.swift
//  Get Swifty
//
//  Created by Poorwa Hirve on 2/12/21.
//

import Foundation

/// Question: Why do we use the mutating keyword?
/// - Swift doesn't allow struct property changing unless we specify the `mutating` keyword
/// - `mutating` can only be used for functions
struct Person {
    var name: String

    mutating func hide() {
        name = "****"
    }
}

/// This code will not even compile
/// ```
/// struct Person {
///     var name: String
///
///     func hide() {
///         self.name = "****"
///     }
/// }
/// ```
