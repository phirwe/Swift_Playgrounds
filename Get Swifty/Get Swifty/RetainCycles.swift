//
//  RetainCycles.swift
//  Get Swifty
//
//  Created by Poorwa Hirve on 2/12/21.
//

import Foundation

/// What are retain cycles?

/// Here, a customer may or may not own a CreditCard
/// But a credit card must have a Customer - shown by `unowned`
class Customer {
    let name: String
    var card: CreditCard?
    
    init(name: String) {
        self.name = name
    }
}
 
class CreditCard {
    let number: Int
    unowned let customer: Customer
    
    init (number: Int, customer: Customer) {
        self.number = number
        self.customer = customer
    }
}

/// Here, a tenant must be assigned an Apartment
/// But an apartment may be empty - hence it can have  a `weak` Tenant
class Tenant {
    let name: String
    var apartment: Apartment
    
    init(name: String, apartment: Apartment) {
        self.name = name
        self.apartment = apartment
    }
}
 
class Apartment {
    let number: Int
    weak var tenant: Tenant?
    
    init (number: Int) {
        self.number = number
    }
}

/// Usage of `weak` vs `unowned`

/// Use a weak reference whenever it is valid for that reference to become nil at some point during its lifetime.
/// Conversely, use an unowned reference when you know that the reference will never be nil once it has been set during initialization.
