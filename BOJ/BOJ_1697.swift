//
//  BOJ_1697.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/16.
//  BOJ 1697 - 숨바꼭질 : BFS
import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (n, k) = (input[0], input[1])
let max = 100000
var distance = Array(repeating: 0, count: max+1)
var visited = Array(repeating: false, count: max+1)

func BFS() {
  var queue = [n]
  visited[n] = true
  while !queue.isEmpty {
    let node = queue.removeFirst()
    if node == k {
      print(distance[node])
      break
    }
    for i in [node-1, node+1, node*2] {
      if i>=0 && i<=max && !visited[i]{
        visited[i] = true
        distance[i] = distance[node] + 1
        queue.append(i)
      }
    }
  }
}

BFS()

