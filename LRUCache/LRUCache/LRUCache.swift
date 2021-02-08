//
//  LRUCache.swift
//  LRUCache
//
//  Created by Poorwa Hirve on 2/7/21.
//

import Foundation

class LRUCache<Key: Hashable, Value> {
    let capacity: Int
    var head: Node<Key, Value>
    var tail: Node<Key, Value>
    var map: [Key: Node<Key, Value>]
    var size = 0
    
    init(_ capacity: Int) {
        self.capacity = capacity
        head = Node<Key, Value>()
        tail = Node<Key, Value>()
        head.next = tail
        tail.prev = head
        map = [Key: Node<Key, Value>]()
    }
    
    func get(_ key: Key) -> Value? {
        if let node = map[key] {
            moveToTail(node)
            return node.payload?.value
        }
        return nil
    }
    
    func putNode(_ node: Node<Key, Value>) {
        if
            let key = node.payload?.key,
            let oldNode = map[key] {
            remove(oldNode)
        }
        add(node)
        if size > capacity {
            if let discard = head.next {
                remove(discard)
            }
        }
    }
    
    func put(_ key: Key, _ value: Value) {
        let payload = Payload(key, value)
        let node = Node<Key, Value>(payload)
        if let oldNode = map[key] {
            remove(oldNode)
        }
        add(node)
        if size > capacity {
            if let discard = head.next {
                remove(discard)
            }
        }
    }
    
    func remove(_ node: Node<Key, Value>) {
        let prev = node.prev
        let next = node.next
        prev?.next = next
        next?.prev = prev
        map[node.payload!.key] = nil
        size -= 1
    }
    
    func add(_ node: Node<Key, Value>) {
        let prev = tail.prev
        prev?.next = node
        node.prev = prev
        node.next = tail
        tail.prev = node
        map[node.payload!.key] = node
        size += 1
    }
    
    func moveToTail(_ node: Node<Key, Value>) {
        remove(node)
        add(node)
    }
}
