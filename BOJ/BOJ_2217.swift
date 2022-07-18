//
//  BOJ_2217.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/18.
// BOJ 2217 - 로프 : 그리디
import Foundation
let n = Int(readLine()!)!
var ropes: [Int] = []
for _ in 0..<n {
  let input = Int(readLine()!)!
  ropes.append(input)
}
ropes = ropes.sorted(by: >)
for i in 0..<n {
  ropes[i] = ropes[i]*(i+1)
}
print(ropes.max()!)
