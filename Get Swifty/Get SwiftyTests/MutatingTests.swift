//
//  Get_SwiftyTests.swift
//  Get SwiftyTests
//
//  Created by Poorwa Hirve on 2/12/21.
//

import XCTest
@testable import Get_Swifty

class MutatingTests: XCTestCase {

    func testMutating() {
        var person = Person(name: "John Doe")
        XCTAssertEqual(person.name, "John Doe")
        person.hide()
        XCTAssertEqual(person.name, "****")
    }

}
