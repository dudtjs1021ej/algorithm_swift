//
//  BOJ_1309.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/12.
//  BOJ 1309 - 동물원 : dp
import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n+1)

dp[0] = 1
dp[1] = 3

for i in 2..<n+1 {
  dp[i] = (dp[i-2] + dp[i-1]*2) % 9901
}
print(dp[n])
