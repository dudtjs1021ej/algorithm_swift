//
//  BOJ_11724.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/08.
//  BOJ 11724 - 연결 요소의 개수 : DFS
import Foundation
let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (n, m) = (input[0], input[1])
var graph: [[Int]] = Array(repeating: [], count: n+1)
var visited: [Bool] = Array(repeating: false, count: n+1)

for _ in 0..<m {
  let input = readLine()!.split(separator: " ").map {Int(String($0))!}
  let (a, b) = (input[0], input[1])
  graph[a].append(b)
  graph[b].append(a)
}

func DFS(_ v: Int) {
  visited[v] = true
  for i in graph[v] {
    if !visited[i] {
      DFS(i)
    }
  }
}

var answer = 0
for i in 1...n {
  if !visited[i] {
    DFS(i)
    answer += 1
  }
}
print(answer)

