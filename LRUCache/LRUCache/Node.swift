//
//  Node.swift
//  LRUCache
//
//  Created by Poorwa Hirve on 2/7/21.
//

import Foundation

struct Payload<Key, Value> {
    var key: Key
    var value: Value
    
    init(_ key: Key, _ value: Value) {
        self.key = key
        self.value = value
    }
}

class Node<Key, Value> {
    var payload: Payload<Key, Value>?
    var prev: Node?
    var next: Node?
    
    init(_ payload: Payload<Key, Value>? = nil, _ prev: Node<Key, Value>? = nil, _ next: Node<Key, Value>? = nil) {
        self.payload = payload
        self.prev = prev
        self.next = next
    }
}
