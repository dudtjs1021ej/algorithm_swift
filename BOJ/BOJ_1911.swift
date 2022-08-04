//
//  BOJ_1911.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/04.
// BOJ 1911 - 흙길 보수하기 : 그리디
import Foundation
let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = input[0]; let l = input[1]
var pools: [(start: Int, end: Int)] = []
for _ in 0..<n {
  let input = readLine()!.split(separator: " ").map {Int(String($0))!}
  pools.append((input[0], input[1]))
}

pools.sort(by: {$0.start < $1.start})
var result = 0
var index = 0

for (start, end) in pools {
  if index >= end {
    continue
  }
  index = max(index, start)
  var count: Int
  if (end - index) % l == 0 {
    count = (end-index) / l
  }
  else {
    count = (end-index) / l + 1
  }
  result += count
  index += l * count
}

print(result)
