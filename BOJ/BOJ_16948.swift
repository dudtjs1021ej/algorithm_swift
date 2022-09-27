//
//  BOJ_16948.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/27.
//  BOJ 16948 - 데스 나이트 : BFS

import Foundation

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (y1, x1, y2, x2) = (input[0], input[1], input[2], input[3])

// (r-2, c-1), (r-2, c+1), (r, c-2), (r, c+2), (r+2, c-1), (r+2, c+1)
let dy = [-2, -2, 0, 0, 2, 2]
let dx = [-1, 1, -2, 2, -1, 1]

func BFS(_ y: Int, _ x: Int) -> Int {
  var queue = [(y, x, 0)]
  var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
  var index = 0
  
  while queue.count > index {
    let node = queue[index]
    index += 1
    
    if node.0 == y2 && node.1 == x2 {
      return node.2
    }
    
    for i in 0..<6 {
      let ny = node.0 + dy[i]
      let nx = node.1 + dx[i]
      if ny>=0 && ny<n && nx>=0 && nx<n && !visited[ny][nx] {
        visited[ny][nx] = true
        queue.append((ny, nx, node.2+1))
      }
    }
  }
  return -1
}

print(BFS(y1, x1))
