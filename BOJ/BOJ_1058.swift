//
//  BOJ_1058.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/07.
//  BOJ 1058 - 친구 : 탐색
import Foundation

let n = Int(readLine()!)!
var graph = [[Character]](repeating: [Character](), count: n)

for i in 0..<n {
  let input = Array(readLine()!)
  graph[i] = input
}

var answer = 0

for i in 0..<n {
  var count = 0
  for j in 0..<n {
    if i == j {
      continue
    }
    if graph[i][j] == "Y" {
      count += 1
      continue
    }
    
    // i, j와 친구가 아닌 겹지인이 있는지
    for k in 0..<n {
      if graph[i][k] == "Y" && graph[j][k] == "Y" {
        count += 1
        break
      }
    }
  }
  answer = max(answer, count)
}

print(answer)



