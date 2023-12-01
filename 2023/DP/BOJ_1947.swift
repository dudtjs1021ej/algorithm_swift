//
//  BOJ_1947.swift
//  Algorithm
//
//  Created by 임영선 on 2023/12/01.
//

// https://www.acmicpc.net/problem/19539
// BOJ 1947 - DP 선물 전달: 골드3

import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n+1)
let MOD = 1000000000

if n == 1 {
    print(0)
    exit(0)
}
else if n == 2 {
    print(1)
    exit(0)
}

dp[1] = 0
dp[2] = 1

for i in 3...n {
    // i가 짝수면
    if i % 2 == 0 {
        dp[i] = (((dp[i-1])*(i%MOD))%MOD + 1)%MOD
    }
    // i가 홀수면
    else {
        dp[i] = (((dp[i-1])*(i%MOD))%MOD - 1)%MOD
    }
}

print(dp[n])
