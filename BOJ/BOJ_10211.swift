//
//  BOJ_10211.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/04.
//  BOJ 10211 - Maximum Subarray : DP
import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
  let n = Int(readLine()!)!
  var arr = readLine()!.split(separator: " ").map {Int(String($0))!}
  var dp = Array(repeating: 0, count: n)
  dp[0] = arr[0]
  for i in 1..<n {
    dp[i] = max(dp[i-1]+arr[i], arr[i])
  }
  print(dp.max()!)
}
