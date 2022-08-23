//
//  BOJ_2193.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/24.
//  BOJ 2193 - 이친수 : DP
import Foundation
let n = Int(readLine()!)!

if n == 1 || n == 2{
  print(1)
}
else if n == 3 {
  print(2)
}
else {
  var dp = Array(repeating: 1, count: n+1)
  dp[3] = 2
  for i in 4...n {
    dp[i] = dp[i-2] + dp[i-1]
  }
  print(dp[n])
}

