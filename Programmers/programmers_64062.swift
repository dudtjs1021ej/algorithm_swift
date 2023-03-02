//
//  programmers_64062.swift
//  Algorithm
//
//  Created by 임영선 on 2023/03/02.
// 프로그래머스 - 징검다리 건너기
import Foundation


func solution(_ stones:[Int], _ k:Int) -> Int {
    var left = 1, right = 200000000
    
    while left <= right {
        let mid = (left+right)/2
        var zeroCount = 0 // 숫자가 0인 돌의 개수
        for i in 0..<stones.count {
            if stones[i] - mid <= 0 { // (돌의 숫자-친구의수)가 0보다 작을 때
                zeroCount += 1
            } else {
                zeroCount = 0
            }
            if zeroCount >= k {
                break
            }
        }
        if zeroCount >= k {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }

    return left
}

