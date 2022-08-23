//
//  BOJ_2579.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/23.
//  BOJ 2579 - 계단 오르기 : DP
import Foundation
let n = Int(readLine()!)!
var dp: [Int] = Array(repeating: 0, count: n)
var s: [Int] = []
for _ in 0..<n {
  s.append(Int(readLine()!)!)
}

if n == 1 {
  print(s[0])
}
else if n == 2 {
  print(s[0] + s[1])
}
else if n == 3 {
  print(max(s[0]+s[2], s[1]+s[2]))
}
else {
  dp[0] = s[0]
  dp[1] = max(s[0]+s[1],s[1])
  dp[2] = max(s[0]+s[2], s[1]+s[2])
  
  for i in 3..<s.count {
    dp[i] = max(s[i]+dp[i-2], s[i]+s[i-1]+dp[i-3])
  }
  print(dp[dp.count-1])
}


