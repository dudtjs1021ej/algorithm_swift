//
//  BOJ_11725.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/09.
//  BOJ 11725 - 트리의 부모 찾기 : DFS
import Foundation
let n = Int(readLine()!)!
var graph: [[Int]] = Array(repeating: [], count: n+1)
var parents: [Int] = Array(repeating: 0, count: n+1)
for _ in 0..<n-1 {
  let input = readLine()!.split(separator: " ").map {Int(String($0))!}
  graph[input[0]].append(input[1])
  graph[input[1]].append(input[0])
}

func DFS(_ v: Int) {
  for i in graph[v] {
    // 부모가 없으면
    if parents[i] == 0 {
      parents[i] = v // 부모 설정
      DFS(i)
    }
  }
}

DFS(1)
for i in 2...n {
  print(parents[i])
}

