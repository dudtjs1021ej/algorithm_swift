//
//  BOJ_4963.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/10.
//  BOJ 4963 - 섬의 개수 : DFS
import Foundation
// 상하좌우 대각선
let dx = [-1, 1, 0, 0, 1, 1, -1, -1]
let dy = [0, 0, -1, 1, 1, -1, 1, -1]

while true {
  let input = readLine()!.split(separator: " ").map {Int(String($0))!}
  let (width, height) = (input[0], input[1])
  if width == 0 && height == 0 {
    break
  }
  var graph: [[Int]] = []
  for _ in 0..<height {
    graph.append(readLine()!.split(separator: " ").map {Int(String($0))!})
  }
  
  func DFS(_ y: Int, _ x: Int) {
    for i in 0..<8 {
      let x = x + dx[i]
      let y = y + dy[i]
      if x>=0 && x<width && y>=0 && y<height && graph[y][x] == 1{
        graph[y][x] = 0
        DFS(y, x)
      }
    }
  }
  var answer = 0
  for x in 0..<width {
    for y in 0..<height {
      if graph[y][x] == 1 {
        answer += 1
        DFS(y, x)
      }
    }
  }
  print(answer)
}

