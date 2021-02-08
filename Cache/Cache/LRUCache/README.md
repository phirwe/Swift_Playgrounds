# LRUCache

## LRU Cache with example use cases and tests

 ### Problem Definition:
 Create an LRU (Least Recently Used) Cache with the following methods:
 `get(key)` and `put(key, value)`

 All methods must happen in O(1) time.

 ### Theory behind the approach

 Data Structures:
 - Doubly Linked List:
     - Each node contains the key and value of the cache
 - Dictionary:
     - Each entry contains the key and value as the linked list node

 Least recently used element is maintained at the head of the linked list.
 Most recently used element is maintained at the tail of the linked list.
 When you `get` an item, mark it as most recently used.
 When you `put` an item, add it as most recently used.
