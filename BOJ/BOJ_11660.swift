//
//  BOJ_11660.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/05.
//  BOJ 11660 - 구간 합 구하기 : DP
import Foundation
let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (n, m) = (input[0], input[1])
var s: [[Int]] = []
var dp = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
for _ in 0..<n {
  s.append(readLine()!.split(separator: " ").map {Int(String($0))!})
}

for i in 0..<n {
  for j in 0..<n {
    dp[i+1][j+1] = (dp[i][j+1] + dp[i+1][j] - dp[i][j]) + s[i][j]
  }
}

for _ in 0..<m {
  let input = readLine()!.split(separator: " ").map {Int(String($0))!}
  let (x1, y1, x2, y2) = (input[0], input[1], input[2], input[3])
  print(dp[x2][y2] - (dp[x1-1][y2] + dp[x2][y1-1] - dp[x1-1][y1-1]))
}

