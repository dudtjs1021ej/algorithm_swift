//
//  BOJ_2293.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/06.
//  BOJ 2293 - 동전 : DP
import Foundation
let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (n,k) = (input[0],input[1])
var dp = Array(repeating: 0, count: k+1)
var c: [Int] = []
for _ in 0..<n {
  c.append(Int(readLine()!)!)
}
dp[0] = 1

for i in c {
  for j in 1...k {
    if j-i >= 0 {
      dp[j] += dp[j-i]
    }
  }
}
print(dp[k])
