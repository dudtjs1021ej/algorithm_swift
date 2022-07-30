//
//  BOJ_2847.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/30.
// BOJ 2847 - 게임을 만든 동준이 : 그리디
import Foundation
let n = Int(readLine()!)!
var scores: [Int] = []
var count: Int = 0
for _ in 0..<n {
  let score = Int(readLine()!)!
  scores.append(score)
}
// 뒤부터 앞의 수보다 큰지 검사
for i in stride(from: n-2, through: 0, by: -1) {
  // 뒤의 값보다 딱 1보다 작으면 됨
  if scores[i] >= scores[i+1] {
    count += scores[i] - (scores[i+1]-1)
    scores[i] = scores[i+1]-1
  }
}

print(count)

