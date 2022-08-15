//
//  BOJ_1389.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/16.
//  BOJ 1389 - 케빈 베이컨의 6단계 법칙 : BFS
import Foundation
let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (n, m) = (input[0], input[1])
var graph: [[Int]] = Array(repeating: [], count: n+1)

for _ in 0..<m {
  let input = readLine()!.split(separator: " ").map {Int(String($0))!}
  graph[input[0]].append(input[1])
  graph[input[1]].append(input[0])
}

func BFS(_ v: Int) -> Int {
  var visited = Array(repeating: false, count: n+1)
  var num = Array(repeating: 0, count: n+1)
  var queue: [Int] = [v]
  visited[v] = true
  
  while !queue.isEmpty {
    let node = queue.removeFirst()
    for i in graph[node] {
      if !visited[i] {
        num[i] = num[node] + 1
        queue.append(i)
        visited[i] = true
      }
    }
  }
  return num.reduce(0,+)
}

var minNum = Int.max
var answer = 0
for i in 1...n {
  let num = BFS(i)
  if minNum > num {
    minNum = num
    answer = i
  }
}

print(answer)

