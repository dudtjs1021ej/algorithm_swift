//
//  BOJ_15483.swift
//  Algorithm
//
//  Created by 임영선 on 2024/02/16.
//

// https://www.acmicpc.net/problem/2629
// BOJ 15483 - LCS, 최소 편집: 골드3

import Foundation

let a = Array(readLine()!).map {String($0)}
let b = Array(readLine()!).map {String($0)}

var dp = Array(repeating: Array(repeating: 0, count: 1001), count: 1001)

for i in 0...a.count {
    dp[i][0] = i
}

for i in 0...b.count {
    dp[0][i] = i
}

for i in 1...a.count {
    for j in 1...b.count {
        // 같은 문자인 경우
        if a[i-1] == b[j-1] {
            dp[i][j] = dp[i-1][j-1] // 대각선에서 가져옴
        }
        
        // 다른 문자인 경우
        else {
            dp[i][j] = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1 // 왼쪽, 위쪽, 대각선 min + 1
        }
    }
}

print(dp[a.count][b.count])

