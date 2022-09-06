//
//  BOJ_1965.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/07.
//  BOJ 1965 - 상자넣기 : DP
import Foundation
let n = Int(readLine()!)!
var boxes = readLine()!.split(separator: " ").map {Int(String($0))!}
var dp = Array(repeating: 1, count: n)

for i in 1..<n {
  for j in 0..<i {
    if boxes[i] > boxes[j] {
      dp[i] = max(dp[i], dp[j]+1)
    }
  }
}

print(dp.max()!)
