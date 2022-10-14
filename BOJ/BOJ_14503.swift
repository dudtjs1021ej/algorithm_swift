//
//  BOJ_14503.swift
//  Algorithm
//
//  Created by 임영선 on 2022/10/14.
//  BOJ 14503 - 로봇청소기 : 구현

import Foundation

let input1 = readLine()!.split(separator: " ").map {Int(String($0))!}
let (n, m) = (input1[0], input1[1])

let input2 = readLine()!.split(separator: " ").map {Int(String($0))!}
var (r, c, d) = (input2[0], input2[1], input2[2])

var graph = [[Int]]()
for _ in 0..<n {
  graph.append(readLine()!.split(separator: " ").map {Int(String($0))!})
}

let dx = [-1,0,1,0]
let dy = [0,1,0,-1]

var visited = Array(repeating: Array(repeating: false, count: m), count: n)
visited[r][c] = true // 처음 시작 방문처리


var count = 1

while true {
  var checkClean = false
  for _ in 0..<4 {
    // 0, 3, 2, 1 순서로 청소
    let nx = r + dx[(d+3)%4]
    let ny = c + dy[(d+3)%4]
    d = (d+3)%4
    if nx>=0 && nx<n && ny>=0 && ny<m && visited[nx][ny] == false && graph[nx][ny] == 0 {
      visited[nx][ny] = true
      count += 1
      checkClean = true // 청소를 한번이라도 하면 넘어감
      r = nx
      c = ny
      break
    }
  }
  // 4방향 모두 청소되어 있다면
  if !checkClean {
    // 후진해도 벽이라면
    if graph[r-dx[d]][c-dy[d]] == 1 {
      print(count)
      break
    }
    else {
      (r,c) = (r-dx[d],c-dy[d])
    }
  }
}
