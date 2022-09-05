//
//  BOJ_11051.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/05.
//  BOJ 11051 - 이항계수2 : DP
import Foundation
let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (n, k) = (input[0], input[1])
var dp = Array(repeating: [0], count: 1002)
dp[1].append(1)
for i in 2...1001 {
  for j in 1...i {
    // 맨앞 맨뒤는 1
    if j==1 {
      dp[i].append(1)
    }
    
    else if j==i {
      dp[i].append(1)
    }
    
    else {
      dp[i].append((dp[i-1][j-1]+dp[i-1][j]) % 10007)
    }
  }
}

print(dp[n+1][k+1])
