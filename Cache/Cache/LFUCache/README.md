# LFUCache

## LFU Cache with example use cases and tests

 ### Problem Definition:
 Create an LFU (Least Frequently Used) Cache with the following methods:
 `get(key)` and `put(key, value)`

 All methods must happen in O(1) time.

 ### Theory behind the approach

 Data Structures:
 - Dictionary:
     - Each node contains the key and value is an LRU Cache
 - Dictionary:
     - Each entry contains the key and value as the linked list node

 When you `get` an item, increase the frequency and move it to the correct LRU in the count map.  
 When you `put` an item, increase the frequency and move it to the correct LRU.  
 When size increases capacity, eject min count from the map and solve ties based on LRU
