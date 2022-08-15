//
//  BOJ_2583.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/16.
//  BOJ 2583 - 영역 구하기 : DFS
import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (m, n, k) = (input[0], input[1], input[2])
var points = [[Int]]()
var graph = Array(repeating: Array(repeating: 0, count: n), count: m)
for _ in 0..<k {
  points.append(readLine()!.split(separator: " ").map {Int(String($0))!})
}

for i in 0..<k {
  let left = (points[i][0], points[i][1])
  let right = (points[i][2], points[i][3])
  for j in left.0..<right.0 {
    for k in left.1..<right.1 {
      graph[k][j] = 1
    }
  }
}
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]
var count = 0

func DFS(_ y: Int, _ x: Int) {
  count += 1
  graph[y][x] = 1
  for i in 0..<4 {
    let dx = dx[i] + x
    let dy = dy[i] + y
    if dx>=0 && dx<n && dy>=0 && dy<m && graph[dy][dx] == 0 {
      graph[dy][dx] = 1
      DFS(dy, dx)
    }
  }
}

var result: [Int] = []
for x in 0..<n {
  for y in 0..<m {
    if graph[y][x] == 0 {
      count = 0
      DFS(y, x)
      result.append(count)
    }
  }
}
result.sort()
print(result.count)
for i in result {
  print(i, terminator: " ")
}

