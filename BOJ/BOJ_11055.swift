//
//  BOJ_11055.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/27.
//  BOJ 11055 - 가장 큰 증가 부분 수열 : DP
import Foundation
let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map {Int(String($0))!}
var dp = Array(repeating: 1, count: n)
for i in 0..<n {
  for j in 0..<i {
    if a[i] > a[j] {
      dp[i] = max(dp[i], dp[j] + a[i])
    }
    else{
      dp[i] = max(dp[i], a[i])
    }
  }
}
print(dp.max()!)


