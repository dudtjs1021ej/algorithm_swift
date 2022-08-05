//
//  BOJ_10451.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/05.
//  BOJ 10451 - 순열 사이클 : DFS
import Foundation
let t = Int(readLine()!)!

for _ in 0..<t {
  let n = Int(readLine()!)!
  let nums = readLine()!.split(separator: " ").map {Int(String($0))!}
  var line = Array(repeating: 0, count: n+1)
  var visited = Array(repeating: false, count: n+1)
  var answer = 0
  
  for j in 0..<nums.count {
    line[j+1] = nums[j]
  }
  
  func dfs(start: Int) {
    var index = 0
    var queue = [start]
    
    while index < queue.count {
      let node = queue[index]
      
      if !visited[node] {
        visited[node] = true
        queue.append(line[node])
      }
      index += 1
    }
  }
  
  for i in 1...n {
    if !visited[i] {
      dfs(start: i)
      answer += 1
    }
  }
  
  print(answer)
  
}
  
 


