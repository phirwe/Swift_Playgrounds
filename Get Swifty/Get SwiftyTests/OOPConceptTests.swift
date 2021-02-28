//
//  OOPConceptTests.swift
//  Get SwiftyTests
//
//  Created by Poorwa Hirve on 2/12/21.
//

import Foundation

import XCTest
@testable import Get_Swifty

class OOPConceptTests: XCTestCase {
    func testLibrary() {
        let fiction = Fiction(title: "Fiction", pages: 100)
        let nonFiction = NonFiction(title: "NonFiction", pages: 100)
        let books = [fiction, nonFiction]
        let sanFranciscoPublicLibrary = SanFranciscoPublicLibrary(volunteers: 1, books: books)
        
        XCTAssertEqual(sanFranciscoPublicLibrary.books.first!, fiction)
        XCTAssertEqual(sanFranciscoPublicLibrary.books.last!, nonFiction)
    }
}
