//
//  BOJ_2798.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/07.
//  BOJ 2798 - 블랙잭 : 탐색
import Foundation
let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (n, m) = (input[0], input[1])
let cards = readLine()!.split(separator: " ").map {Int(String($0))!}
var answer = Int.min
for i in 0..<n {
  for j in 0..<i {
    for k in 0..<j {
      let sum = cards[i] + cards[j] + cards[k]
      if sum > m {
        continue
      }
      if answer < sum {
        answer = sum
      }
    }
  }
}
print(answer)
