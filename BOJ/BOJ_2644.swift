//
//  BOJ_2644.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/09.
//  BOJ 2644 - 촌수계산 : BFS
import Foundation
let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (a, b) = (input[0], input[1])
let m = Int(readLine()!)!
var graph: [[Int]] = Array(repeating: [], count: n+1)
var visited = Array(repeating: false, count: n+1)

for _ in 0..<m {
  let input = readLine()!.split(separator: " ").map {Int(String($0))!}
  let (parent, child) = (input[0], input[1])
  graph[parent].append(child)
  graph[child].append(parent)
}

func BFS() {
  var queue = [(a, 0)]
  var isFind = false
  
  while !queue.isEmpty {
    let node = queue.removeFirst()
    if node.0 == b {
      isFind = true
      print(node.1)
      break
    }
    for i in graph[node.0] {
      if !visited[i] {
        visited[i] = true
        queue.append((i, node.1+1))
      }
    }
  }
  if !isFind {
    print(-1)
  }
}

BFS()
