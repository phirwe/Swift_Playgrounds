//
//  BookFactory.swift
//  Get Swifty
//
//  Created by Poorwa Hirve on 2/13/21.
//

import Foundation

protocol BookFactory: class {
    func createBook(title: String, pages: Int) -> Book
}

class FictionFactory: BookFactory {
    func createBook(title: String, pages: Int) -> Book {
        return Fiction(title: title, pages: pages)
    }
}

class NonFictionFactory: BookFactory {
    func createBook(title: String, pages: Int) -> Book {
        return NonFiction(title: title, pages: pages)
    }
}

