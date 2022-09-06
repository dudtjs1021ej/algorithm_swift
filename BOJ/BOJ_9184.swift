//
//  BOJ_9184.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/07.
//  BOJ 9184 - 신나는 함수 실행 : DP
import Foundation
var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: 21), count: 21), count: 21)

func w(_ a: Int, _ b:Int, _ c: Int) -> Int {
  if a<=0 || b<=0 || c<=0 {
    return 1
  }
  else if a<21 && b<21 && c<21 && dp[a][b][c] != 0 {
    return dp[a][b][c]
  }
  else if a>20 || b>20 || c>20 {
    return w(20, 20, 20)
  }
  else if a<b && b<c {
    dp[a][b][c] = w(a, b, c-1) + w(a, b-1, c-1) - w(a, b-1, c)
    return dp[a][b][c]
  }
  dp[a][b][c] =  w(a-1, b, c) + w(a-1, b-1, c) + w(a-1, b, c-1) - w(a-1, b-1, c-1)
  return dp[a][b][c]
}

while true {
  let input = readLine()!.split(separator: " ").map {Int(String($0))!}
  let (a,b,c) = (input[0],input[1],input[2])
  if a == -1 && b == -1 && c == -1 {
    break
  }
  print("w(\(a), \(b), \(c)) = \(w(a, b, c))")
}
