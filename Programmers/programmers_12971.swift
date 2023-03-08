//
//  programmers_12971.swift
//  Algorithm
//
//  Created by 임영선 on 2023/03/08.
//

import Foundation

// 프로그래머스 - 스티커모으기(2): DP

func solution(_ sticker:[Int]) -> Int {
    // 스티커의 개수가 1개나 2개면 큰 수 리턴
    if sticker.count < 3 {
        return sticker.max()!
    }
    // 첫 번째 스티커를 떼었을 경우
    var dp1 = Array(repeating: 0, count: sticker.count)
    dp1[0] = sticker[0]
    dp1[1] = sticker[0]
    
    // 첫번째 스티커를 뗴지 않았을 경우
    var dp2 = Array(repeating: 0, count: sticker.count)
    dp2[0] = 0
    dp2[1] = sticker[1]
    
    for i in 2..<sticker.count {
        // 맨 마지막 스티커인 경우
        if i == sticker.count - 1 {
            dp2[i] = max(dp2[i-2]+sticker[i], dp2[i-1])
        } else {
            dp1[i] = max(dp1[i-2]+sticker[i], dp1[i-1])
            dp2[i] = max(dp2[i-2]+sticker[i], dp2[i-1])
        }
        
    }
    return max(dp1.max()!, dp2.max()!)
}

