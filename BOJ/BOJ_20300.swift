//
//  BOJ_20300.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/21.
// BOJ 20300 - 서강근육맨 : 그리디
import Foundation
let n = Int(readLine()!)!
var list = readLine()!.split(separator: " ").map {Int($0)!}
var max = -1
list.sort()
if list.count % 2 == 1 {
  max = list.popLast()!
}

for i in 0..<Int(list.count/2) {
  if list[i]+list[list.count-i-1] > max {
    max = list[i]+list[list.count-i-1]
  }
}

print(max)
