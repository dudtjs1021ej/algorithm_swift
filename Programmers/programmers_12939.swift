//
//  programmers_12939.swift
//  Algorithm
//
//  Created by 임영선 on 2023/04/03.
//  prgrammers 12939 - 최댓값 최솟값 : 구현

import Foundation

func solution(_ s:String) -> String {
    let nums = s.split(separator: " ").map { Int(String($0))! }
    var max = Int.min
    var min = Int.max
    
    for num in nums {
        if num > max {
            max = num
        }
        else if num < min {
            min = num
        }
    }
    return "\(min) \(max)"
}
