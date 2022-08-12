//
//  BOJ_18352.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/13.
//  BOJ 18352 - 특정거리의 도시 찾기 : BFS
import Foundation
let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (n, m, k, x) = (input[0], input[1], input[2], input[3])
var graph: [[Int]] = Array(repeating: [], count: n+1)
var visited: [Bool] = Array(repeating: false, count: n+1)
var distance: [Int] = Array(repeating: 0, count: n+1)
var answer = [Int]()

for _ in 0..<m {
  let input = readLine()!.split(separator: " ").map{Int(String($0))!}
  graph[input[0]].append(input[1])
}

func BFS(v: Int) {
  var queue = [v]
  visited[v] = true
  while !queue.isEmpty {
    let node = queue.removeFirst()
    for i in graph[node] {
      if !visited[i] {
        visited[i] = true
        queue.append(i)
        distance[i] = distance[node] + 1
        if distance[i] == k {
          answer.append(i)
        }
      }
    }
  }
  if answer.count == 0 {
    print(-1)
  }
  else {
    //answer.sort()
    for i in answer {
      print(i)
    }
  }
}

BFS(v: x)


