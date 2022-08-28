//
//  BOJ_9461.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/28.
//  BOJ 9461 - 파도반 수열 : DP
import Foundation
var dp = Array(repeating: 0, count: 101)
dp[1] = 1
dp[2] = 1
dp[3] = 1
for i in 0...97 {
  dp[i+3] = dp[i] + dp[i+1]
}

let t = Int(readLine()!)!
for _ in 0..<t {
  let n = Int(readLine()!)!
  print(dp[n])
}


