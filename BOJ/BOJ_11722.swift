//
//  BOJ_11722.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/05.
//  BOJ 11722 - 가장 긴 감소하는 부분 수열 : DP
import Foundation
let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var dp = Array(repeating: 1, count: n)
for i in 0..<n {
  for j in 0..<i {
    if nums[j] > nums[i] {
      dp[i] = max(dp[i], dp[j]+1)
    }
  }
}
print(dp.max()!)
