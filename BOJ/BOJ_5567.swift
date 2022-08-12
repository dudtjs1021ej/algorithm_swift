//
//  BOJ_5567.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/13.
//  BOJ 5567 - 결혼식 : BFS
import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph: [[Int]] = Array(repeating: [], count: n+1)
var visited = Array(repeating: 0, count: n+1)
for _ in 0..<m {
  let input = readLine()!.split(separator: " ").map {Int(String($0))!}
  graph[input[0]].append(input[1])
  graph[input[1]].append(input[0])
}

func BFS() {
  var queue = [1]
  visited[1] = 1
  while !queue.isEmpty {
    let node = queue.removeFirst()
    for i in graph[node] {
      if visited[i] == 0 {
        visited[i] = visited[node] + 1
        queue.append(i)
      }
    }
  }
}

BFS()
print(visited.filter{$0>=2 && $0<=3}.count)

