//
//  FactoryTests.swift
//  Get SwiftyTests
//
//  Created by Poorwa Hirve on 2/13/21.
//

import Foundation
import XCTest
@testable import Get_Swifty

class FactoryTests: XCTestCase {

    func testFactory() {
        let fiction = FictionFactory().createBook(title: "Fiction", pages: 100)
        let nonFiction = NonFictionFactory().createBook(title: "Non Fiction", pages: 100)
        
        XCTAssertNotNil(fiction)
        XCTAssertNotNil(nonFiction)
    }
}
