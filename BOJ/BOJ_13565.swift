//
//  BOJ_13565.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/13.
//  BOJ 13565 - 침투 : DFS
import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (height, width) = (input[0], input[1])
var graph = [[Int]]()

for _ in 0..<height {
  graph.append(Array(readLine()!).map{Int(String($0))!})
}

let dx = [1,-1,0,0]
let dy = [0,0,1,-1]

func DFS(x: Int, y: Int) {
  graph[y][x] = 2
  for i in 0..<4 {
    let dx = x + dx[i]
    let dy = y + dy[i]
    
    if dx>0 && dx<width && dy>0 && dy<height && graph[dy][dx] == 0{
      graph[dy][dx] = 1
      DFS(x: dx, y: dy)
    }
  }
}
for i in 0..<width {
  if graph[0][i] == 0 {
    DFS(x: i, y: 0)
  }
}
print(graph)
if graph[height-1].contains(2) {
  print("YES")
}
else {
  print("NO")
}

