//
//  BOJ_1987.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/18.
//  BOJ 1987 - 알파벳 : DFS
//  시간초과...
import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (height, width) = (input[0], input[1])
var map = [[String]]()
for _ in 0..<height {
  map.append(readLine()!.map{String($0)})
}

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]
var answer = Int.min

func DFS(y: Int, x: Int, depth: Int) {
  vistedAlpha.append(map[y][x])
  visited[y][x] = true
  answer = max(answer, depth)
  
  for i in 0..<4 {
    let nx = x + dx[i]
    let ny = y + dy[i]
    
    if nx>=0 && nx<width && ny>=0 && ny<height {
      if !visited[ny][nx] && !vistedAlpha.contains(map[ny][nx]) {

        DFS(y: ny, x: nx, depth: depth+1)
        vistedAlpha = vistedAlpha.filter {$0 != map[ny][nx]}
        visited[ny][nx] = false
      }
    }
    
  }
}

var visited = Array(repeating: Array(repeating: false, count: width), count: height)
var vistedAlpha: [String] = []

DFS(y: 0, x: 0, depth: 1)
print(answer)
