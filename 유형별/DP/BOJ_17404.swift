//
//  BOJ_17404.swift
//  Algorithm
//
//  Created by 임영선 on 2024/01/04.
//

// https://www.acmicpc.net/problem/17404
// BOJ 17404 - DP: RGB 거리2, 골드4

import Foundation

let n = Int(readLine()!)!

var costs: [[Int]] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    costs.append(input)
}

var answer = Int.max

// 처음집 색을 각각 빨, 파, 초로 고정함
for i in 0..<3 {
    var dp = Array(repeating: [0, 0, 0], count: n)
    dp[0] = [1001, 1001, 1001]
    dp[0][i] = costs[0][i] // 고정된 색으로만 칠하게 나머지 색은 1001로 저장
    
    for j in 1..<n {
        dp[j][0] = costs[j][0] + min(dp[j-1][1], dp[j-1][2])
        dp[j][1] = costs[j][1] + min(dp[j-1][0], dp[j-1][2])
        dp[j][2] = costs[j][2] + min(dp[j-1][0], dp[j-1][1])
    }
    
    for j in 0..<3 {
        // 처음집색과 다른 경우만 min값 비교
        if i != j {
            answer = min(dp[n-1][j], answer)
        }
    }
}

print(answer)

