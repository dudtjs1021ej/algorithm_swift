//
//  BOJ_16956.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/06.
//  BOJ 16956 - 늑대와 양 : 구현
import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (r, c) = (input[0], input[1])
var graph = [[String]]()

for _ in 0..<r {
  graph.append(Array(readLine()!).map {String($0)})
}

// 상하좌우
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]
var check = false // 늑대가 양이 있는 곳으로 갈 수 있으면 true 아니면 false

for i in 0..<r {
  for j in 0..<c {
    if graph[i][j] == "W" {
      for k in 0...3 {
        let x = i + dx[k]
        let y = j + dy[k]

        // 범위를 벗어난 경우
        if x <= -1 || x >= r || y <= -1 || y >= c {
          continue
        }
        // 늑대 바로 근처에 양이 있으면 check를 true로
        if graph[x][y] == "S" {
          check = true
          break
        }
      }
    }
  }
}

if check == true {
  print("0")
}
else {
  print("1")
  for i in 0..<r {
    for j in 0..<c {
      if graph[i][j] == "." {
        graph[i][j] = "D"
      }
    }
  }
  for g in graph {
    print(g.joined())
  }
}

