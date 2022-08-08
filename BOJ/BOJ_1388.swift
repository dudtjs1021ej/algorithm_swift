//
//  BOJ_1388.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/08.
//  BOJ 1388 - 바닥 장식 : DFS
import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (n, m) = (input[0], input[1])
var graph = [[String]]()
for _ in 0..<n {
  graph.append(Array(readLine()!).map{String($0)})
}

var answer = 0

func DFS(x: Int, y: Int) {
  if graph[x][y] == "|" {
    graph[x][y] = "O"
    for i in [1, -1] {
      let dx = x + i
      if (dx>0 && dx<n) && graph[dx][y] == "|" {
        DFS(x: dx, y: y)
      }
    }
  }
  if graph[x][y] == "-" {
    graph[x][y] = "O"
    for i in [-1, 1] {
      let dy = y + i
      if (dy>0 && dy<m) && graph[x][dy] == "-" {
        DFS(x: x, y: dy)
      }
    }
  }
}

for i in 0..<n {
  for j in 0..<m {
    if graph[i][j] == "|" || graph[i][j] == "-" {
      DFS(x: i, y: j)
      answer += 1
    }
  }
}

print(answer)

