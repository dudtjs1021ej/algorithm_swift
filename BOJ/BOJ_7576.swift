//
//  BOJ_7576.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/17.
//  BOJ 7576 - 토마토 : BFS
import Foundation
let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (width, height) = (input[0], input[1])
var graph: [[Int]] = []
for _ in 0..<height {
  graph.append(readLine()!.split(separator: " ").map {Int(String($0))!})
}

var queue: [(Int, Int)] = []
let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
var count = 0
var empty = 0 // 0으로 채워진 자리 개수
func BFS() {
  var index = 0 // 제거하지 않고 인덱스로 찾음
  while index < queue.count {
    let (x, y) = queue[index]
    index += 1
    for i in 0..<4 {
      let nx = x + dx[i]
      let ny = y + dy[i]
      if nx>=0 && nx<height && ny>=0 && ny<width && graph[nx][ny] == 0 {
        queue.append((nx, ny))
        graph[nx][ny] = graph[x][y] + 1
        count += 1
      }
    }
  }
}

for x in 0..<height {
  for y in 0..<width {
    if graph[x][y] == 1{
      queue.append((x,y))
    }
    else if graph[x][y] == 0 {
      empty += 1
    }
  }
}

BFS()
empty == 0 ? print(0) : (empty == count ? print(graph.flatMap({$0}).max()!-1) : print(-1))

