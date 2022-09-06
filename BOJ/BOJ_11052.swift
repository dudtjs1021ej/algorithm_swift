//
//  BOJ_11052.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/07.
//  BOJ 11052 - 카드 구매하기 : DP
import Foundation
let n = Int(readLine()!)!
var p = readLine()!.split(separator: " ").map {Int(String($0))!}
var dp = Array(repeating: 0, count: n+1)

for i in 1...n {
  for j in 1...i {
    dp[i] = max(dp[i], dp[i-j]+p[j-1])
  }
}
print(dp[n])
