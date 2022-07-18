//
//  BOJ_13305.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/18.
// BOJ 13305 - 주유소 : 그리디
import Foundation
let n = Int(readLine()!)!
let distance = readLine()!.split(separator: " ").map {Int($0)!}
let price = readLine()!.split(separator: " ").map {Int($0)!}
var result = 0
var minPrice = price[0]
for i in 0..<n-1 {
  // 현재 비용보다 더 싼 비용이 나오면
  if price[i] < minPrice {
    minPrice = price[i]
  }
  result += minPrice * distance[i]
}

print(result)
