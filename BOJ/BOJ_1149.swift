//
//  BOJ_1149.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/05.
//  BOJ 1149 - RGB타일 : DP
import Foundation
let n = Int(readLine()!)!
var dp: [[Int]] = []
for _ in 0..<n {
  dp.append(readLine()!.split(separator: " ").map {Int(String($0))!})
}
for i in 1..<n {
  dp[i][0] += min(dp[i-1][1], dp[i-1][2])
  dp[i][1] += min(dp[i-1][0], dp[i-1][2])
  dp[i][2] += min(dp[i-1][0], dp[i-1][1])
}
print(min(dp[n-1][0], dp[n-1][1], dp[n-1][2]))
