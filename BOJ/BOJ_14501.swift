//
//  BOJ_14501.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/29.
//  BOJ 14501 - 퇴사 : DP
import Foundation
let n = Int(readLine()!)!
var t: [Int] = []
var p: [Int] = []
var dp: [Int] = []
for _ in 0..<n {
  let input = readLine()!.split(separator: " ").map {Int(String($0))!}
  t.append(input[0])
  p.append(input[1])
  dp.append(input[1])
}
dp.append(0)
for i in stride(from: n-1, to: -1, by: -1) {
  if t[i] + i > n { //범위를 벗어나면
    dp[i] = dp[i+1]
  }
  else {
    dp[i] = max(dp[i+1], dp[i+t[i]] + p[i])
  }
}

print(dp[0])
