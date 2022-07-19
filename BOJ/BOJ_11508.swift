//
//  BOJ_11508.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/19.
// BOJ 11508 - 2+1 세일 : 그리디
import Foundation
let n = Int(readLine()!)!
var prices: [Int] = []
var k = 2
var sum = 0

for _ in 0..<n {
  let price = Int(readLine()!)!
  prices.append(price)
}

prices = prices.sorted(by: >)

// 오름차순으로 정렬 후 각 세트의 세번째만 제외함
for i in 0..<prices.count {
  if i == k {
    k += 3
    continue
  }
  sum += prices[i]
}
print(sum)
