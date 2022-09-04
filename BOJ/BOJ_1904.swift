//
//  BOJ_1904.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/05.
//  BOJ 1904 - 01타일 : DP
import Foundation
let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: 1000001)
dp[1] = 1
dp[2] = 2

if n > 2 {
  for i in 3...n {
    dp[i] = (dp[i-1] + dp[i-2]) % 15746
  }
}

print(dp[n])
