//
//  BOJ_2636.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/19.
//  BOJ 2636 - 치즈 : BFS
import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (n, m) = (input[0], input[1])
var graph: [[Int]] = []
for _ in 0..<n {
  graph.append(readLine()!.split(separator: " ").map {Int(String($0))!})
}

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]
var answer: [Int] = []

func BFS() -> Int {
  var visited = Array(repeating: Array(repeating: false, count: m), count: n)
  var queue = [(0,0)]
  visited[0][0] = true
  var count = 0
  
  while !queue.isEmpty {
    let (x, y) = queue.removeFirst()
    for i in 0..<4 {
      let nx = dx[i] + x
      let ny = dy[i] + y
      if nx>=0 && nx<n && ny>=0 && ny<m && !visited[nx][ny] {
        // 치즈가 아닌 부분은 큐에 넣음
        if graph[nx][ny] == 0 {
          visited[nx][ny] = true
          queue.append((nx, ny))
        }
        // 공기와 접촉한 칸은 큐에 안넣음
        else if graph[nx][ny] == 1 {
          graph[nx][ny] = 0
          visited[nx][ny] = true
          count += 1
        }
      }
    }
  }
  answer.append(count)
  return count
}

var time = 0
while true {
  time += 1
  let count = BFS()
  if count == 0 {
    break
  }
}

print(time-1)
print(answer[answer.count-2])

