//
//  BOJ_2178.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/10.
//  BOJ 2178 - 미로 탐색 : BFS
import Foundation
let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (height, width) = (input[0], input[1])
var graph = [[Int]]()
for _ in 0..<height {
  graph.append(Array(readLine()!.map{Int(String($0))!}))
}

var answer = 0

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
var index = 0
var queue: [(x: Int, y: Int, count: Int)] = [(0,0,1)]

while index<queue.count {
  let node = queue[index]
  index += 1
  
  for i in 0..<4 {
    let nx = dx[i] + node.x
    let ny = dy[i] + node.y
    if nx>=0 && nx<height && ny>=0 && ny<width && graph[nx][ny] == 1 {
      answer = node.count + 1
      // 끝까지 도달했으면
      if nx==height-1 && ny==width-1 {
        index = queue.count
        break
      }
      graph[nx][ny] = 0
      queue.append((nx, ny, node.count+1))
    }
  }
}

print(answer)
