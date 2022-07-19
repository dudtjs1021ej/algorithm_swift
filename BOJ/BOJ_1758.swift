//
//  BOJ_1758.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/19.
// BOJ 1758 - 알바생 강호 : 그리디
import Foundation
let n = Int(readLine()!)!
var sum = 0
var tips: [Int] = []
for _ in 0..<n {
  let tip = Int(readLine()!)!
  tips.append(tip)
}
tips = tips.sorted(by: >)
for i in 0..<n {
  let s = tips[i] - i
  if s > 0 {
    sum += s
  }
}

print(sum)
