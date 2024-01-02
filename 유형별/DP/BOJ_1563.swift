//
//  BOJ_1563.swift
//  Algorithm
//
//  Created by 임영선 on 2023/12/04.
//

// https://www.acmicpc.net/problem/1563
// BOJ 1563 - DP 개근상: 골드4

import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: 3), count: 2), count: n+1)

let MOD = 1000000
/*
 dp[n일][지각개수][출석연속개수]
 dp[n][0][0] -> 지각 0번 / 출석 0번
 dp[n][0][1] -> 지각 0번 / 출석 1번
 dp[n][0][2] -> 지각 0번 / 출석 2번
 dp[n][1][0] -> 지각 1번 / 출석 0번
 dp[n][1][1] -> 지각 1번 / 출석 1번
 dp[n][1][2] -> 지각 1번 / 출석 2번
 */

if n == 0 {
    print(0)
    exit(0)
}

if n == 1 {
    print(3)
    exit(0)
}

dp[1][0][0] = 1; dp[1][0][1] = 1; dp[1][1][0] = 1

for i in 2...n {
    // 지각 0번 / 출석 0번 -> 전에 지각 0번하고 출석 0,1,2번한 경우 더함
    dp[i][0][0] = (dp[i-1][0][0] + dp[i-1][0][1] + dp[i-1][0][2])%MOD
    dp[i][0][1] = (dp[i-1][0][0])%MOD // 지각 0번 / 출석 1번
    dp[i][0][2] = (dp[i-1][0][1])%MOD // 지각 0번 / 출석 2번
    dp[i][1][0] = (dp[i-1][0][0] + dp[i-1][0][1] + dp[i-1][0][2] + dp[i-1][1][0] + dp[i-1][1][1] + dp[i-1][1][2])%MOD //지각 1번 / 출석 0번
    dp[i][1][1] = (dp[i-1][1][0])%MOD // 지각 1번 / 출석 1번
    dp[i][1][2] = (dp[i-1][1][1])%MOD // 지각 1번 / 출석 2번
}

let answer = (dp[n][0][0]+dp[n][0][1]+dp[n][0][2]+dp[n][1][0]+dp[n][1][1]+dp[n][1][2])%MOD
print(answer)
