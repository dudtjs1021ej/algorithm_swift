//
//  BOJ_17204.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/08.
//  BOJ 17204 - 죽음의 게임 : 탐색
import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (n, k) = (input[0], input[1])
var graph = [Int]()
var cur = 0
var visited = Array(repeating: false, count: n)
for _ in 0..<n {
  graph.append(Int(readLine()!)!)
}

var answer = 0
var check = false
while !visited[cur] {
  answer += 1
  visited[cur] = true
  if graph[cur] == k {
    check = true
    break
  }
  cur = graph[cur]
}

if check {
  print(answer)
}
else {
  print(-1)
}
