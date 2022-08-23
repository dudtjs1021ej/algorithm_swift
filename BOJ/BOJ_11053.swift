//
//  BOJ_11053.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/24.
//  BOJ 11053 - 가장 긴 증가하는 부분 수열 : DP
import Foundation
let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map {Int(String($0))!}
var dp = Array(repeating: 0, count: n)
for i in 0..<n {
  for j in 0..<i {
    if a[i] > a[j] && dp[i] < dp[j] {
      dp[i] = dp[j]
    }
  }
  dp[i] += 1
}
print(dp.max()!)

