//
//  BOJ_11060.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/11.
//  BOJ 11060 - 점프점프 : dp
import Foundation

let n = Int(readLine()!)!
let jump = readLine()!.split(separator: " ").map {Int(String($0))!}
var dp = Array(repeating: n+1, count: n)
dp[0] = 0

for i in 0..<n {
  for j in stride(from: 1, through: jump[i], by: 1) {
    if i+j < n {
      dp[i+j] = min(dp[i]+1, dp[i+j])
    }
  }
}

if dp[n-1] == n+1 {
  print(-1)
}
else {
  print(dp[n-1])
}

