//
//  BOJ_14852.swift
//  Algorithm
//
//  Created by 임영선 on 2024/01/15.
//

// https://www.acmicpc.net/problem/14852
// BOJ 14852 - DP: 타일 채우기3, 골드4

import Foundation

let n = Int(readLine()!)!
let MOD = 1000000007

var dp = Array(repeating: Array(repeating: 0, count: 2), count: n+1)

if n == 1 {
    print(2)
    exit(0)
}
if n == 2 {
    print(7)
    exit(0)
}

if n == 3 {
    print(22)
    exit(0)
}

dp[1][0] = 2
dp[2][0] = 7
dp[3][0] = 22

for i in 4...n {
    dp[i][1] = (dp[i-3][0] + dp[i-1][1]) % MOD
    dp[i][0] = (dp[i-1][0]*2 + dp[i-2][0]*3 + dp[i][1]*2 + 2) % MOD
}

print(dp[n][0])

