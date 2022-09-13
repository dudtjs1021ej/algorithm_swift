//
//  BOJ_10026.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/13.
//  BOJ 10026 - 적록색약 : DFS
import Foundation

let n = Int(readLine()!)!
var graph1 = [[String]]()
var graph2 = [[String]]()
var visitied1 = Array(repeating: Array(repeating: false, count: n), count: n)
var visitied2 = Array(repeating: Array(repeating: false, count: n), count: n)

for _ in 0..<n {
  let input1 = readLine()!
  let input2 = input1.replacingOccurrences(of: "R", with: "G")
  graph1.append(input1.map{String($0)})
  graph2.append(input2.map{String($0)})
}

var answer1 = 0
var answer2 = 0
let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

func DFS1(x: Int, y: Int, s: String) {
  for i in 0..<4 {
    let nx = x + dx[i]
    let ny = y + dy[i]
    
    if nx>=0 && nx<n && ny>=0 && ny<n && visitied1[ny][nx] == false{
      if graph1[ny][nx] == s {
        visitied1[ny][nx] = true
        DFS1(x: nx, y: ny, s: graph1[ny][nx])
      }
    }
  }
}
func DFS2(x: Int, y: Int, s: String) {
  for i in 0..<4 {
    let nx = x + dx[i]
    let ny = y + dy[i]
    
    if nx>=0 && nx<n && ny>=0 && ny<n && visitied2[ny][nx] == false{
      if graph2[ny][nx] == s {
        visitied2[ny][nx] = true
        DFS2(x: nx, y: ny, s: graph2[ny][nx])
      }
    }
  }
}

for y in 0..<n {
  for x in 0..<n {
    if visitied1[y][x] == false {
      answer1 += 1
      DFS1(x: x, y: y, s: graph1[y][x])
    }
  }
}

for y in 0..<n {
  for x in 0..<n {
    if visitied2[y][x] == false {
      answer2 += 1
      DFS2(x: x, y: y, s: graph2[y][x])
    }
  }
}

print(answer1, answer2)
