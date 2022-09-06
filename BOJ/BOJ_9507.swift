//
//  BOJ_9507.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/07.
//  BOJ 9507 - Generations of Tribbles : DP
import Foundation
let t = Int(readLine()!)!
var dp = Array(repeating: 0, count: 68)
dp[0] = 1
dp[1] = 1
dp[2] = 2
dp[3] = 4

for i in 4...67 {
  dp[i] = dp[i-1]+dp[i-2]+dp[i-3]+dp[i-4]
}

for _ in 0..<t {
 let n = Int(readLine()!)!
 print(dp[n])
}
