//
//  RotatedArraySearch.swift
//  Get Swifty
//
//  Created by Poorwa Hirve on 2/14/21.
//

import Foundation

class RotatedArraySearch {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count-1

        while(low <= high) {
            print (low, high)
            let mid = (high + low) / 2
            let midNum = nums[mid]
            print ("Mid:", midNum)
            if midNum == target {
                return mid
            }
            if target == nums[low] {
                return low
            }
            if target == nums[high] {
                return high
            }
            
            if midNum > nums[low] {
                if target >= nums[low] && target <= midNum {
                    high = mid - 1
                } else {
                    low = mid + 1
                }
            } else {
                if target <= nums[high] && target >= midNum {
                    low = mid + 1
                } else {
                    high = mid - 1
                }
            }
        }
        return -1
    }
}
