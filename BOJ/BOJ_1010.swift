//
//  BOJ_1010.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/22.
//  BOJ 1010 - 다리놓기 : DP
import Foundation

var cache = Array(repeating: Array(repeating: -1, count: 31), count: 31)

func f(_ n: Int, _ m: Int) -> Int {
  if n == 1 {
    cache[n][m] = m
  }
  if n == m {
    cache[n][m] = 1
  }
  if cache[n][m] < 0 {
    cache[n][m] = f(n, m - 1) + f(n - 1, m - 1)
  }
  return cache[n][m]
}

let t = Int(readLine()!)!
for _ in 0..<t {
  let input = readLine()!.split(separator: " ").map {Int(String($0))!}
  let (n, m) = (input[0], input[1])
  
  print(f(n, m))
}

