//
//  BOJ_14889.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/08.
//  BOJ 14889 - 스타트와 링크 : DFS
import Foundation
let n = Int(readLine()!)!
var map: [[Int]] = []
for _ in 0..<n {
  map.append(readLine()!.split(separator: " ").map {Int(String($0))!})
}
var visited = Array(repeating: false, count: n)
var team1 = 0
var team2 = 0
var answer = Int.max
func DFS(_ start: Int, _ depth: Int) {
  // 팀원이 반 나뉘었으면
  if depth == n/2 {
    team1 = 0
    team2 = 0
    for i in 0..<n {
      for j in 0..<n {
        if !visited[i] && !visited[j] {
          team1 += map[i][j]
        }
        if visited[i] && visited[j] {
          team2 += map[i][j]
        }
      }
    }
    if answer > abs(team1-team2) {
      answer = abs(team1-team2)
    }
  }
  for i in start..<n {
    if !visited[i] {
      visited[i] = true
      DFS(i, depth+1)
      visited[i] = false
    }
  }
}

DFS(0, 0)
print(answer)
