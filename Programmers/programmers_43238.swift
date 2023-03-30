//
//  programmers_43238.swift
//  Algorithm
//
//  Created by 임영선 on 2023/03/29.
//  Programmers 159994 - 입국 심사 : 이분탐색

import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var left = 1
    var right = times.max()! * n
    
    while left <= right {
        let mid = (left+right) / 2
        var count = 0
        for time in times {
            count += mid/time
        }
        if count >= n {
            right = mid-1
        } else {
            left = mid+1
        }
    }
    return Int64(left)
}
