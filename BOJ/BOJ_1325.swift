//
//  BOJ_1325.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/16.
//  BOJ 1325 - 효율적인 해킹 : BFS
import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (n, m) = (input[0], input[1])
var graph: [[Int]] = Array(repeating: [], count: n+1)

for _ in 0..<m {
  let input = readLine()!.split(separator: " ").map {Int(String($0))!}
  graph[input[1]].append(input[0])
}

func BFS(_ v: Int) -> Int {
  var visited = Array(repeating: false, count: n+1)
  var count = 1
  var queue = [v]
  visited[v] = true
  while !queue.isEmpty {
    let node = queue.removeFirst()
    for i in graph[node] {
      if !visited[i] {
        visited[i] = true
        queue.append(i)
        count += 1
      }
    }
  }
  return count
}
var maxCount = Int.min
var answer: [Int] = []
for i in 1...n {
  let count = BFS(i)
  if maxCount <= count {
    maxCount = count
    answer.append(i)
  }
}

for i in answer {
  print(i, terminator: " ")
}

