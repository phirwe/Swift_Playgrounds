//
//  OOPConcepts.swift
//  Get Swifty
//
//  Created by Poorwa Hirve on 2/12/21.
//

import Foundation

/// Explain OOP concepts in Swift

/// Encapsulation
/// The class `Book` encapsulates `pages` as its data
/// We can encapsulate and capture the behavior a `Book` object should be able to do
/// In this, we can control the access to book and limit visibility to outside of `Book`

class Book: Equatable {
    private let title: String
    private let pages: Int
    var currentPage: Int = 0
    func flip() {
        currentPage += 1
    }
    init(title: String, pages: Int) {
        self.title = title
        self.pages = pages
    }
    
    static func == (lhs: Book, rhs: Book) -> Bool {
        return lhs.title == rhs.title
    }
}


/// `Inheritance`
/// Inherit properties from a parent class which you can override as required
/// Base class is `Book`

/// Now we can define a specific type of Book, e.g. Fiction
/// Fiction doesn't require anything in its body as it inherits from Book
class Fiction: Book {}

/// Similarly to Fiction, we have NonFiction
class NonFiction: Book {}

/// `Overriding`
/// Suppose I want to add a new type of Book, one which I have already started at page 10
class PartiallyReadBook: Book {
    override init(title: String, pages: Int) {
        super.init(title: title, pages: pages)
        currentPage = 10
    }
}

/// `Overloading`
/// Suppose I want to be able to flip to a specific page as well as flip one page
class Magazine: Book {
    func flip(to page: Int) {
        currentPage += page
    }
}

/// `Polymorphism`
/// A library can contain any number of books, which can be of numerous types
/// Here, our types of books would be the class e.g. `Fiction` or `Magazine`
/// The ability to specify any of these types as a generic `Book` type is polymorphism
class Library {
    var books: [Book]
    
    func checkOut(book: Book) -> Book {
        fatalError("Override checkOut() in base classes to implement functionality")
    }
    
    func checkIn(book: Book) {
        fatalError("Override checkIn() in base classes to implement functionality")
    }
    
    init(books: [Book]) {
        self.books = books
    }
}

/// `Abstraction`
/// Create a class which forces base classes to override them to implement functionality
/// Library is an Abstract class
/// Let us implement another type of Abstract class, which is inherits from `Library`
/// This can act as an intermediate layer in front of `Library` with added functionality
/// Let's add some `volunteers` who work at the `PublicLibrary`
class PublicLibrary: Library {
    var volunteers: Int
    init(volunteers: Int, books: [Book]) {
        self.volunteers = volunteers
        super.init(books: books)
    }
}

/// Now let's create the concrete class using `Library` and `PublicLibrary`
class SanFranciscoPublicLibrary: PublicLibrary {
    override func checkOut(book: Book) -> Book {
        guard
            let existingBook = books.filter({ $0 == book }).first,
            let index = books.firstIndex(of: existingBook)
        else {
            fatalError("Could not find \(book) in library")
        }
        books.remove(at: index)
        return book
    }
    
    override func checkIn(book: Book) {
        books.append(book)
    }
}

