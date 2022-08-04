//
//  BOJ_2606.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/05.
// BOJ 2606 - 바이러스 : DFS
import Foundation
let n = Int(readLine()!)!
let m = Int(readLine()!)!
var network = [Int: [Int]]()

for num in 1...n {
  network[num] = []
}
for _ in 0..<m {
  let input = readLine()!.split(separator: " ").map {Int(String($0))!}
  network[input[0]]?.append(input[1])
  network[input[1]]?.append(input[0])
}

var visited: [Int] = []
var stack: [Int] = [1] // 시작점 1

while stack.count != 0 {
  let temp = stack.popLast()!
  if !visited.contains(temp) { // 방문하지 않은 곳 넣음
    visited.append(temp)
    let temp2 = network[temp]!
    stack += temp2
  }
}
print(visited.count-1)


