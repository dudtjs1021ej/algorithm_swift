//
//  BOJ_17521.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/25.
// BOJ 17521 - Byte Coin : 그리디
import Foundation
let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = input[0]
var w = input[1]
var coins: [Int] = []
var count = 0
for _ in 0..<n {
  let coin = Int(readLine()!)!
  coins.append(coin)
}

for i in 0..<n-1 {
  // 다음날이 더 비싸면 매수
  if coins[i+1] > coins[i] {
    count += Int(w/coins[i])
    w %= coins[i]
  }
  // 다음날이 더 싸면 매도
  else if coins[i+1] < coins[i] {
    w += coins[i]*count
    count = 0
  }
}
w += coins[coins.count-1]*count
print(w)

