//
//  basic_DFS1.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/06.
//
// DFS - 음료수 얼려 먹기
import Foundation

func DFS(_ x: Int, _ y: Int) -> Bool {
  // 범위를 벗어나면 종료
  if x<0 || x>=n || y<0 || y>=m {
    return false
  }
  
  // 아직방문하지않은 노드이면
  if graph[x][y] == 0 {
    // 해당 노드 방문 처리
    graph[x][y] = 1
    // 상하좌우 모두 호출
    DFS(x-1, y)
    DFS(x+1, y)
    DFS(x, y-1)
    DFS(x, y+1)
    return true
  }
  return false
}

let size = readLine()!.split(separator: " ").map {Int($0)!}
let n = size[0]
let m = size[1]
var graph: [[Int]] = []
var count = 0

for _ in 0..<n {
  let input = Array(readLine()!).map {Int(String($0))!}
  graph.append(input)
}

for i in 0..<n {
  for j in 0..<m {
    if graph[i][j] == 0 {
      if DFS(i, j) == true {
        count += 1
      }
    }
  }
}

print(count)

