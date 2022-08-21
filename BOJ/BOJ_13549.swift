//
//  BOJ_13549.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/21.
//  BOJ 13549 - 숨바꼭질3 : BFS
import Foundation
let max = 100001
var visited = Array(repeating: false, count: max)
var distance = Array(repeating: -1, count: max)
let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (n, k) = (input[0] , input[1])
var queue: [(Int, Int)] = []
bfs()

func bfs(){
  queue.append((n, 0))
  while !queue.isEmpty{
      let pop = queue.removeFirst()
      if pop.0 == k {
          print(pop.1)
          break
      }
      if pop.0 * 2 < max && !visited[pop.0 * 2]{
          visited[pop.0 * 2] = true
          queue.append((pop.0 * 2, pop.1))
      }
      
      if pop.0 - 1 >= 0 && !visited[pop.0 - 1]{
          visited[pop.0 - 1] = true
          queue.append((pop.0 - 1, pop.1 + 1))
      }
      
      if pop.0 + 1 < max && !visited[pop.0 + 1]{
          visited[pop.0 + 1] = true
          queue.append((pop.0 + 1, pop.1 + 1))
      }
  }
}
