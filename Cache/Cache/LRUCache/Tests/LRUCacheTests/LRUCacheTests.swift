//
//  LRUCacheTests.swift
//  LRUCacheTeusts
//
//  Created by Poorwa Hirve on 2/7/21.
//

import XCTest
@testable import LRUCache

final class LRUCacheTests: XCTestCase {
    fileprivate var cache: IntLRUCache!
    
    override func setUp() {
        cache = IntLRUCache(2)
        super.setUp()
    }
    
    override func tearDown() {
        cache = nil
        super.tearDown()
    }
    
    private enum CacheMethod {
        case put(Int, Int)
        case get(Int)
    }
    
    private func performCache(_ commands: Array<String>, _ params: Array<Array<Int>>) throws -> Array<CacheMethod>? {
        guard commands.count == params.count else {
            XCTAssertThrowsError("Commands not equal to params")
            return nil
        }
        guard
            let command = commands.first,
            command == "LRUCache",
            let _ = params.first
        else {
            XCTAssertThrowsError("Could not get capacity")
            return nil
        }
        cache = IntLRUCache(params[0][0])
        var cacheMethods = Array<CacheMethod>()
        for (i, command) in commands.enumerated() {
            if i == 0 {
                continue
            }
            switch command {
            case "get":
                cacheMethods.append(.get(params[i][0]))
            case "put":
                cacheMethods.append(.put(params[i][0], params[i][1]))
            default:
                break
            }
        }
        return cacheMethods
    }
    
//    ["LFUCache","put","put","get","put","get","get","put","get","get","get"]
//    [[2],[1,1],[2,2],[1],[3,3],[2],[3],[4,4],[1],[3],[4]]
    
    private func cacheMethod(method: CacheMethod) -> Int? {
        switch method {
        case .get(let key):
            return cache.get(key)
        case .put(let key, let value):
            cache.put(key, value)
            return nil
        }
    }
    
    func testLRU() {
        let commands = ["LRUCache","put","put","get","put","get","put","get","get","get"]
        let params = [[2],[1,1],[2,2],[1],[3,3],[2],[4,4],[1],[3],[4]]
        
        let methods = try? performCache(commands, params)
        XCTAssertNotNil(methods)
        
        let expectedResult = [
            nil,
            nil,
            1,
            nil,
            -1,
            nil,
            -1,
            3,
            4
        ]
        
        let result = methods?.map({ method in
            cacheMethod(method: method)
        })
        
        XCTAssertEqual(result, expectedResult)
        
    }
    
    func testLRUCapacity1() {
        let commands = ["LRUCache","put","get","put","get","get"]
        let params = [[1],[2,1],[2],[3,2],[2],[3]]
        
        let methods = try? performCache(commands, params)
        XCTAssertNotNil(methods)
        
        let expectedResult = [
            nil,
            1,
            nil,
            -1,
            2
        ]
        
        let result = methods?.map({ method in
            cacheMethod(method: method)
        })
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func testLRUCapacity2() {
        let commands = ["LRUCache","put","put","put","put","get","get"]
        let params = [[2],[2,1],[1,1],[2,3],[4,1],[1],[2]]
        
        let expectedResult = [
            nil,
            nil,
            nil,
            nil,
            -1,
            3
        ]
        
        let methods = try? performCache(commands, params)
        XCTAssertNotNil(methods)

        let result = methods?.map({ method in
            cacheMethod(method: method)
        })
        XCTAssertEqual(result, expectedResult)
    }
    
    func testLRUCapacity3() {
        let commands = ["LRUCache","put","put","put","put","get","get","get","get","put","get","get","get","get","get"]
        let params = [[3],[1,1],[2,2],[3,3],[4,4],[4],[3],[2],[1],[5,5],[1],[2],[3],[4],[5]]
        
        let expectedResult = [
            nil,
            nil,
            nil,
            nil,
            4,
            3,
            2,
            -1,
            nil,
            -1,
            2,
            3,
            -1,
            5
        ]
        
        let methods = try? performCache(commands, params)
        XCTAssertNotNil(methods)

        let result = methods?.map({ method in
            cacheMethod(method: method)
        })
        XCTAssertEqual(result, expectedResult)
    }
}

fileprivate class IntLRUCache: LRUCache<Int, Int> {
    override func get(_ key: Int) -> Int? {
        let value = super.get(key)
        return value != nil ? value : -1
    }
}
