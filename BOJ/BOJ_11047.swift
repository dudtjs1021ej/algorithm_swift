//
//  BOJ_11047.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/21.
// BOJ 11047 - 동전0 : 그리디
import Foundation
let input = readLine()!.split(separator: " ").map {Int($0)!}
let n = input[0]
var k = input[1]
var coins: [Int] = []
var count = 0

for _ in 0..<n {
  let coin = Int(readLine()!)!
  coins.append(coin)
}

for i in coins.reversed() {
  if i<=k {
    count += Int(k/i)
    k %= i
  }
}

print(count)
