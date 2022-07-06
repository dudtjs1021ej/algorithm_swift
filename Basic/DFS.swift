//
//  DFS.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/06.
//
// DFS 기본
import Foundation
let graph = [
    [],
    [2,3,8],
    [1,7],
    [1,4,5],
    [3,5],
    [3,4],
    [7],
    [2,6,8],
    [1,7]
]

var visited = [Bool](repeating: false, count: 9)

func DFS(v: Int) {
  visited[v] = true // 방문처리
  print(v, terminator: "")
  for i in graph[v] {
    if !visited[i] {
      DFS(v: i)
    }
  }
}

DFS(v: 2)
