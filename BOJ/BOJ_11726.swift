//
//  BOJ_11726.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/23.
//  BOJ 11726 - 2*n 타일링 : DP
import Foundation
let n = Int(readLine()!)!
var d = Array(repeating: 0, count: n+1)

if n > 2 {
  d[1] = 1
  d[2] = 2
  for i in 3...n {
    d[i] = (d[i-2] + d[i-1]) % 10007
  }
  print(d[n])
}
else {
  print(n)
}


