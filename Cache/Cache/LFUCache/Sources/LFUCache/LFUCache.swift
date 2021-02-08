//
//  LFUCache.swift
//  LFUCache
//
//  Created by Poorwa Hirve on 2/7/21.
//

import Foundation
import LRUCache

class LFUNode<Key, Value> : Node<Key, Value> {
    var frequency = 1
}

class LFUCache<Key: Hashable, Value> {
    let capacity: Int
    var countMap: [Int: LRUCache<Key, Value>]
    var map: [Key: LFUNode<Key, Value>]
    var size: Int
    
    init(_ capacity: Int) {
        self.capacity = capacity
        countMap = [Int: LRUCache<Key, Value>]()
        map = [Key: LFUNode<Key, Value>]()
        size = 0
    }
    
    func get(_ key: Key) -> Value? {
        if let node = map[key] {
            let frequency = node.frequency
            if let lru = countMap[frequency] {
                lru.remove(node)
                if lru.size == 0 {
                    countMap[frequency] = nil
                }
                node.frequency += 1
                if let lru = countMap[node.frequency] {
                    lru.putNode(node)
                } else {
                    let lru = LRUCache<Key, Value>(capacity)
                    countMap[node.frequency] = lru
                    lru.putNode(node)
                }
            }
            return node.payload?.value
        }
        return nil
    }
    
    func put(_ key: Key, _ value: Value) {
        guard capacity > 0 else {
            return
        }
        
        let payload = Payload(key, value)
        let node = LFUNode<Key, Value>(payload)
        
        if let oldNode = map[key] {
            let frequency = oldNode.frequency
            if let lru = countMap[frequency] {
                node.frequency = frequency + 1
                if let lru = countMap[node.frequency] {
                    lru.putNode(node)
                } else {
                    let lru = LRUCache<Key, Value>(capacity)
                    countMap[node.frequency] = lru
                    lru.putNode(node)
                }
                lru.remove(oldNode)
                map[key] = node
                if lru.size == 0 {
                    countMap[frequency] = nil
                }
            }
        } else {
            map[key] = node
            // check least frequently used map to eject
            if let lru = countMap[1] {
                // if this exists and capacity is exceeding, eject using lru
                if
                    size == capacity,
                    let discard = lru.head.next,
                    let key = discard.payload?.key {
                    size -= 1
                    lru.remove(discard)
                    map[key] = nil
                }
                lru.putNode(node)
                size += 1
            } else {
                if size == capacity {
                    size -= 1
                    let minCount = countMap.keys.min()
                    if
                        let minCount = minCount,
                        let minLRU = countMap[minCount],
                        let discard = minLRU.head.next,
                        let key = discard.payload?.key {
                        
                        minLRU.remove(discard)
                        map[key] = nil
                    }
                }
                let lru = LRUCache<Key, Value>(capacity)
                countMap[1] = lru
                lru.putNode(node)
                size += 1
            }
            
        }
    }
}
