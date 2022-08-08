//
//  BOJ_1012.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/09.
//  BOJ 1012 - 유기농 배추 : DFS
import Foundation
let t = Int(readLine()!)!
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

for _ in 0..<t {
  let input = readLine()!.split(separator: " ").map {Int(String($0))!}
  let (width, height, k) = (input[0], input[1], input[2])
  let column = Array(repeating: 0, count: width)
  var graph: [[Int]] = Array(repeating: column, count: height)
  
  for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    graph[input[1]][input[0]] = 1
  }
  
  func DFS(_ y: Int, _ x: Int) {
    for i in 0..<4 {
      let x = x + dx[i]
      let y = y + dy[i]
      if x>=0 && x<width && y>=0 && y<height && graph[y][x] == 1{
        graph[y][x] = 0
        DFS(y, x)
      }
    }
  }
  var answer = 0

  for x in 0..<width {
    for y in 0..<height {
      if graph[y][x] == 1 {
        answer += 1
        DFS(y, x)
      }
    }
  }
  print(answer)
}

