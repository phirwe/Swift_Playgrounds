//
//  Node.swift
//  LRUCache
//
//  Created by Poorwa Hirve on 2/7/21.
//

import Foundation

public struct Payload<Key, Value> {
    public var key: Key
    public var value: Value
    
    public init(_ key: Key, _ value: Value) {
        self.key = key
        self.value = value
    }
}

open class Node<Key, Value> {
    public var payload: Payload<Key, Value>?
    public var prev: Node?
    public var next: Node?
    
    public init(_ payload: Payload<Key, Value>? = nil, _ prev: Node<Key, Value>? = nil, _ next: Node<Key, Value>? = nil) {
        self.payload = payload
        self.prev = prev
        self.next = next
    }
}
