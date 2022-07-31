//
//  BOJ_1455.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/31.
// BOJ 1455 - 뒤집기 II : 그리디
import Foundation
func reverseCoin(i: Int, j: Int) {
  for i in 0...i {
    for j in 0...j {
      if coins[i][j] == 0 {
        coins[i][j] = 1
      }
      else {
        coins[i][j] = 0
      }
    }
  }
}

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let i = input[0]; let j = input[1]
var coins: [[Int]] = []
var count: Int = 0

for _ in 0..<i {
  coins.append(Array(readLine()!).map {Int(String($0))!})
}

// 끝에서부터 확인하며 1을 만나면 뒤집어 줌
for i in stride(from: i-1, through: 0, by: -1) {
  for j in stride(from: j-1, through: 0, by: -1) {
    if coins[i][j] == 1 {
      count += 1
      reverseCoin(i: i, j: j)
    }
  }
}
print(count)


