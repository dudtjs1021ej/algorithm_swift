//
//  BOJ_11727.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/24.
//  BOJ 11727 - 2×n 타일링 2 : DP
import Foundation
let n = Int(readLine()!)!

if n==1 {
  print(1)
}
else if n==2 {
  print(3)
}
else {
  var dp: [Int] = Array(repeating: 0, count: n+1)
  dp[1] = 1
  dp[2] = 3
  for i in 3...n {
    dp[i] = (dp[i-2]*2 + dp[i-1])%10007
  }
  print(dp[n])
}

