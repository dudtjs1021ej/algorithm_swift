//
//  BOJ_3182.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/08.
//  BOJ 3182 - 한동이는 공부가 하기 싫어! : DFS
import Foundation
let n = Int(readLine()!)!
var graph: [Int] = [0]
var visited = Array(repeating: false, count: n+1)

for _ in 0..<n {
  graph.append(Int(readLine()!)!)
}

// DFS
func DFS(v: Int, count: Int) -> Int {
  var count = count
  visited[v] = true
  count += 1
  if !visited[graph[v]] { // 방문하지 않았으면
    count = DFS(v: graph[v], count: count) // 횟수 계속 더함
  }
  return count
}

var maxCount = -1
var answer = 0
for i in 1...n {
  let count = DFS(v: i, count: 0)
  if count > maxCount {
    answer = i
    maxCount = count
  }
  visited = Array(repeating: false, count: n+1) // 방문 모두 안한걸로 초기화
}
print(answer)

