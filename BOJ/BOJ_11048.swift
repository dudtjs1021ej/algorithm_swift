//
//  BOJ_11048.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/05.
//  BOJ 11048 - 이동하기 : DP
import Foundation
let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (n,m) = (input[0],input[1])
var s = [[Int]]()
var dp = Array(repeating: Array(repeating: 0, count: m+1), count: n+1)
for _ in 0..<n {
  s.append(readLine()!.split(separator: " ").map {Int(String($0))!})
}

for i in 1...n {
  for j in 1...m {
    dp[i][j] = s[i-1][j-1] + max(dp[i-1][j], dp[i-1][j-1], dp[i][j-1])
  }
}

print(dp[n][m])
