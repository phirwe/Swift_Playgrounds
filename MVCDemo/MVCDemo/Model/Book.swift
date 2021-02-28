//
//  Fruit.swift
//  MVCDemo
//
//  Created by Poorwa Hirve on 2/13/21.
//

import Foundation

enum BookType {
    case fiction
    case nonfiction
}

/// This class receives the list of books from the fake database `BookDB`
class Book {
    var title: String
    var author: String
    var type: BookType
    
    init(title: String, author: String, type: BookType) {
        self.title = title
        self.author = author
        self.type = type
    }
}

class Library {
    var books: [Book]
    
    init(books: [Book]) {
        self.books = books
    }
}
