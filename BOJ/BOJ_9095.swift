//
//  BOJ_9095.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/23.
//  BOJ 9095 - 1,2,3 더하기 : DP
import Foundation
let t = Int(readLine()!)!
for _ in 0..<t {
  let n = Int(readLine()!)!
  print(sol(n))
}

func sol(_ n: Int) -> Int {
  if n == 1 {
    return 1
  }
  else if n == 2 {
    return 2
  }
  else if n == 3 {
    return 4
  }
  else {
    return sol(n-3) + sol(n-2) + sol(n-1)
  }
}

