//
//  BFS.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/06.
//

import Foundation
// BFS 기본
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
var myQueue = Queue<Int>()
func BFS(v: Int) {
  visited[v] = true // 방문처리
  myQueue.enqueue(v) // 시작노드 큐에 넣음
 
  while !myQueue.isEmpty {
    let node = myQueue.dequeue()!
    print(node, terminator: " ")
    for i in graph[node] {
      if !visited[i] {
        myQueue.enqueue(i)
        visited[i] = true
      }
    }
  }
}

BFS(v: 2)
