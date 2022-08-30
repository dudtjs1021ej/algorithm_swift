//
//  BOJ_15624.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/31.
//  BOJ 15624 - 피보나치수 7 : DP
import Foundation
let n = Int(readLine()!)!
var a = 0
var b = 1
var c = 1
for _ in 0..<n {
  let temp = c
  a = b % 1000000007
  b = temp % 1000000007
  c = a + b
}

print(a)
