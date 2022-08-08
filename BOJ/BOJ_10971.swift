//
//  BOJ_10971.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/08.
//  BOJ 10971 - 외판원 순회 2 : DFS
import Foundation
let n = Int(readLine()!)!
var graph: [[Int]] = []
for _ in 0..<n {
  graph.append(readLine()!.split(separator: " ").map {Int(String($0))!})
}
var depth = 0
var minCost = Int.max
var sum = 0
var visited = Array(repeating: false, count: n)

func DFS(_ depth: Int, _ start: Int, _ now: Int) {
  if depth == n && now == start {
    minCost = min(minCost, sum)
    return
  }
  for i in 0..<n {
    if !visited[i] && graph[now][i] > 0 {
      visited[i] = true
      sum += graph[now][i]
      if sum <= minCost {
        DFS(depth+1, start, i)
      }
      // 다시 초기화
      visited[i] = false
      sum -= graph[now][i]
    }
  }
}

DFS(0, 0, 0)
print(minCost)

