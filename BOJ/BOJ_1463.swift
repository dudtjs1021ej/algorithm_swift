//
//  BOJ_1463.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/22.
//  BOJ 1463 - 1로 만들기 : DP
import Foundation

var n = Int(readLine()!)!
var d = Array(repeating: 0, count: 1000001)
if n == 1 {
  print(0)
}
else {
  for i in 2...n {
    d[i] = d[i-1] + 1
    if i % 3 == 0 {
      d[i] = min(d[i], d[i/3] + 1)
    }
    if i % 2 == 0 {
      d[i] = min(d[i], d[i/2] + 1)
    }
  }
  print(d[n])

}
