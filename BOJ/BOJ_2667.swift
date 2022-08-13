//
//  BOJ_2667.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/14.
//  BOJ 2667 - 단지번호 붙이기 : DFS
import Foundation
let n = Int(readLine()!)!
var graph = [[Int]]()
var towns: [Int] = []
var visited = Array(repeating: Array(repeating: false, count: n + 1), count: n + 1)

for _ in 0..<n {
  let arr = Array(readLine()!).map {Int(String($0))!}
  graph.append(arr)
}

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
var count = 0

func DFS(y: Int, x: Int) {
  visited[y][x] = true
  count += 1
  for i in 0..<4 {
    let dx = dx[i] + x
    let dy = dy[i] + y
    if dx>=0 && dx<n && dy>=0 && dy<n && graph[dy][dx] == 1 && !visited[dy][dx] {
      DFS(y: dy, x: dx)
    }
  }
}

for x in 0..<n {
  for y in 0..<n {
    if graph[y][x] == 1 && !visited[y][x]{
      count = 0
      DFS(y: y, x: x)
      towns.append(count)
    }
  }
}
towns.sort()
print(towns.count)
for i in towns {
  print(i)
}

