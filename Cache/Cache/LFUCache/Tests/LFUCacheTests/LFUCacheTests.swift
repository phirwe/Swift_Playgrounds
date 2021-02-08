//
//  LFUCacheTests.swift
//  LFUCacheTests
//
//  Created by Poorwa Hirve on 2/7/21.
//

import XCTest
@testable import LFUCache

final class LFUCacheTests: XCTestCase {
    fileprivate var cache: IntLFUCache!
    
    override func setUp() {
        cache = IntLFUCache(2)
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
            command == "LFUCache",
            let _ = params.first
        else {
            XCTAssertThrowsError("Could not get capacity")
            return nil
        }
        cache = IntLFUCache(params[0][0])
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
    
    private func cacheMethod(method: CacheMethod) -> Int? {
        switch method {
        case .get(let key):
            return cache.get(key)
        case .put(let key, let value):
            cache.put(key, value)
            return nil
        }
    }
    
    func testLFU() {
        let commands = ["LFUCache","put","put","get","put","get","get","put","get","get","get"]
        let params = [[2],[1,1],[2,2],[1],[3,3],[2],[3],[4,4],[1],[3],[4]]
        
        let methods = try? performCache(commands, params)
        XCTAssertNotNil(methods)
        
        let expectedResult = [nil, nil, 1, nil, -1, 3, nil, -1, 3, 4]
        
        let result = methods?.map({ method in
            cacheMethod(method: method)
        })
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func testLFU2() {
        let commands = ["LFUCache","put","put","put","put","get"]
        let params = [[2],[3,1],[2,1],[2,2],[4,4],[2]]
        
        let methods = try? performCache(commands, params)
        XCTAssertNotNil(methods)
        
        let expectedResult = [nil,nil,nil,nil,2]
        
        let result = methods?.map({ method in
            cacheMethod(method: method)
        })
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func testLFU3() {
        let commands = ["LFUCache","put","get"]
        let params = [[0],[0,0],[0]]
        
        let methods = try? performCache(commands, params)
        XCTAssertNotNil(methods)
        
        let expectedResult = [nil,-1]
        
        let result = methods?.map({ method in
            cacheMethod(method: method)
        })
        
        XCTAssertEqual(result, expectedResult)
        
    }
}

fileprivate class IntLFUCache: LFUCache<Int, Int> {
    override func get(_ key: Int) -> Int {
        let value = super.get(key)
        return value ?? -1
    }
}
