//
//  RotateImage.swift
//  Get Swifty
//
//  Created by Poorwa Hirve on 2/14/21.
//

import Foundation

class RotateImage {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        for i in 0..<(n/2+n%2) {
            for j in 0..<n/2 {
                let tmp = matrix[n - 1 - j][i]
                matrix[n - 1 - j][i] = matrix[n - 1 - i][n - j - 1]
                matrix[n - 1 - i][n - j - 1] = matrix[j][n - 1 - i]
                matrix[j][n - 1 - i] = matrix[i][j]
                matrix[i][j] = tmp
            }
        }
    }
}
